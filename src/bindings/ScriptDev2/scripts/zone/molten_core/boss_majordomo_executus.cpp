/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: Boss_Majordomo_Executus
SD%Complete: 100
SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

enum
{
	SAY_AGGRO					=	-1409003,
	SAY_SPAWN					=	-1409004,
	SAY_SLAY					=	-1409005,
	SAY_SPECIAL					=	-1409006,
	SAY_DEFEAT					=	-1409007,

	//Majordomo Speech at Ragnaros
	SAY_SUMMON_MAJOR			=	-1409008,
	SAY_ARRIVAL_MAJOR			=	-1409010,

	//Majordomo Spells
	SPELL_MAGIC_REFLECTION		=	20619,
	SPELL_DAMAGE_REFLECTION		=	21075,
	SPELL_BLAST_WAVE			=	20229,
	SPELL_AEGIS					=	20620,	//This is self casted whenever we are below 50%
	SPELL_SUMMON_RAGNAROS		=	19774,

	//Fiery Pit Spell
	SPELL_FIRE_BLAST			=	20623,

	ENTRY_FLAMEWALKER_PRIEST	=	11663,
	ENTRY_FLAMEWALKER_ELITE		=	11664
};

#define GOSSIP_ITEM_DOMO   "Lass mich eine Unteredung mit deinem Herrn führen"

//Orientation	= 3.541
float PositionOfAdds[8][3]=
{	
    {760.444, -1183.175, -119.181},		//First Elite, right Side
    {753.009, -1198.237, -118.346},		//Second Elite, right Side
	{746.649, -1154.512, -119.181},		//Third Elite, left Side		
	{729.771, -1153.243, -119.181},		//Fourth Elite, left side
    {761.088, -1174.606, -119.181},		//First Priest, right Side
    {756.907, -1191.007, -119.181},		//Second Priest, right Side
	{753.748, -1159.354, -119.181},		//Third Priest , left Side
	{738.322, -1152.389, -119.181},		//Fourth Pirest, left Side
};

struct MANGOS_DLL_DECL boss_majordomoAI : public ScriptedAI
{
    boss_majordomoAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
    }
    ScriptedInstance* m_pInstance;

	Creature* pAdds[8]; //First four elite, second four priests

    uint32 uiMagicReflection_Timer;
    uint32 uiDamageReflection_Timer;
    uint32 uiBlastwave_Timer;
	uint32 uiTeleport_Timer;

	uint32 uiCheckFlamewaker_Timer;

	uint32 uiIntro_Timer;
	uint8 uiWPdone;

	bool bSaySpawn;
	bool bIntroDone;
	bool bMoving;

    void Reset()
    {
		if (m_pInstance)
		{
			if (m_pInstance->GetData(DATA_MAJORDOMO_PROGRESS) != SPECIAL)
			{
				m_pInstance->SetData(DATA_DOMO_RESETCOUNT,0);
				m_pInstance->SetData(DATA_MAJORDOMO_PROGRESS, NOT_STARTED);

				uiMagicReflection_Timer =  30000;      //Damage reflection first so we alternate
				uiDamageReflection_Timer = 15000;
				uiBlastwave_Timer = 10000;
				uiTeleport_Timer = 20000;

				uiCheckFlamewaker_Timer = 2000;
				bSaySpawn = false;

				if (m_pInstance->GetData(DATA_DOMO_RESETCOUNT) == 1)
				{
					for(int i = 0; i < 8 ; ++i)
					{
						if(i<4)
							pAdds[i] = m_creature->SummonCreature(ENTRY_FLAMEWALKER_ELITE,PositionOfAdds[i][0],PositionOfAdds[i][1],PositionOfAdds[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
						else
							pAdds[i] = m_creature->SummonCreature(ENTRY_FLAMEWALKER_PRIEST,PositionOfAdds[i][0],PositionOfAdds[i][1],PositionOfAdds[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
					}
				}
				else if (m_pInstance->GetData(DATA_DOMO_RESETCOUNT) > 1)
				{
					//Check Adds
					for(int i = 0; i < 8 ; ++i)
					{
						if(!pAdds[i]->isAlive())
						{
							if(i<4)
								pAdds[i] = m_creature->SummonCreature(ENTRY_FLAMEWALKER_ELITE,PositionOfAdds[i][0],PositionOfAdds[i][1],PositionOfAdds[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
							else
								pAdds[i] = m_creature->SummonCreature(ENTRY_FLAMEWALKER_PRIEST,PositionOfAdds[i][0],PositionOfAdds[i][1],PositionOfAdds[i][2],3.541,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
					
						}
					}
				}
			}
			else if (m_pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
			{
				//Intro handling
				uiIntro_Timer = 36000;
				uiWPdone = 0;

				bIntroDone = false;
				bMoving = false;
			}
		}
    }

	void BeginEvent(Player* pTarget)
    {
		if(m_pInstance)
			m_pInstance->SetData(DATA_VARRAGNAROSINTRO,2);
    }

	void MoveInLineOfSight(Unit* pWho)
    {
		if (m_pInstance)
		{
			if (m_pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
				return;

			if (!bSaySpawn && !m_creature->getVictim() && pWho->isTargetableForAttack() && ( m_creature->IsHostileTo( pWho )) && pWho->isInAccessablePlaceFor(m_creature))
			{
				DoScriptText(SAY_SPAWN, m_creature);
				bSaySpawn = true;
			}

			if (m_creature->IsWithinDistInMap(pWho, m_creature->GetAttackDistance(pWho)) && m_creature->IsWithinLOSInMap(pWho))
			{
				if(pWho->getFaction()== 54 || pWho->getFaction() == 14)
					return;
				pWho->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
				AttackStart(pWho);
			}
		}
    }

    void KilledUnit(Unit* pVictim)
    {
        if (rand()%5)
            return;

        DoScriptText(SAY_SLAY, m_creature);
    }

    void Aggro(Unit* pWho)
    {
		if (m_pInstance)
		{
			m_pInstance->SetData(DATA_MAJORDOMO_PROGRESS, IN_PROGRESS);

			DoScriptText(SAY_AGGRO, m_creature);
		}
    }

	void MovementInform(uint32 uitype, uint32 uiid)
    {
		if (uitype != POINT_MOTION_TYPE)
			return;

		if (uiid == 1)
		{
			DoCast(m_creature,SPELL_SUMMON_RAGNAROS);
			uiWPdone = 1;
			bMoving = false;
		}

        if (uiid == 2)
		{
			uiWPdone = 2;
			bMoving = false;
		}
    }
	
	bool CheckAddsAreDead()
	{
		for(int i = 0; i < 8 ; ++i)
		{
			if (!pAdds[i]->isDead())
				return false;
		}
		return true;

	}

    void UpdateAI(const uint32 diff)
    {
		if (!m_pInstance)
			return;

		if (!bIntroDone)
		{
			switch(m_pInstance->GetData(DATA_VARRAGNAROSINTRO))
			{
				case 1:
					if(uiIntro_Timer < diff && m_pInstance->GetData(DATA_DOMO_PORTED) != 1)
					{
						Creature* Domo = m_creature->SummonCreature(12018, 854.975, -827.593, -228.504, 4.99008, TEMPSUMMON_TIMED_DESPAWN,3600000);
						Domo->setFaction(35);
						Domo->SetUInt32Value(UNIT_NPC_FLAGS,1);
						m_creature->SetVisibility(VISIBILITY_OFF);

						m_pInstance->SetData(DATA_DOMO_PORTED, 1);
						uiIntro_Timer = 16000;
					}
					else 
						uiIntro_Timer -= diff;

					break;

				case 2:
					if (!bMoving && uiWPdone == 0 )
					{
						m_creature->GetMotionMaster()->Clear();
						m_creature->GetMotionMaster()->MovePoint(1,851.266,-816.847,-229.358);
						bMoving = true;
					}

					if (uiWPdone == 1)
					{
						m_creature->GetMotionMaster()->Clear();
						m_creature->GetMotionMaster()->MovePoint(2,843.145,-813.479,-230.067);
						bMoving = true;
						m_pInstance->SetData(DATA_VARRAGNAROSINTRO,3);
					}

					break;

				case 3:
					if (uiIntro_Timer < diff)
					{
						DoScriptText(SAY_SUMMON_MAJOR, m_creature);
						m_creature->SummonCreature(11502, 839.380066 ,-833.359558, -229.358, 1.380336, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,7200000);

						m_pInstance->SetData(DATA_VARRAGNAROSINTRO,4);
						uiIntro_Timer = 14000;
					}
					else 
						uiIntro_Timer -= diff;

					break;

				case 6:
					if (uiIntro_Timer < diff)
					{
						DoScriptText(SAY_ARRIVAL_MAJOR, m_creature);

						m_pInstance->SetData(DATA_VARRAGNAROSINTRO,7);
						bIntroDone = true;
					}
					else 
						uiIntro_Timer -= diff;

					break;
			}
		}		

        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() || m_pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
            return;

		if (uiCheckFlamewaker_Timer < diff)
		{
			if(CheckAddsAreDead())
			{
				m_pInstance->SetData(DATA_MAJORDOMO_PROGRESS, SPECIAL);

				uiCheckFlamewaker_Timer = 600000;

				DoScriptText(SAY_DEFEAT, m_creature);
				m_pInstance->SetData(DATA_VARRAGNAROSINTRO, 1);

				m_creature->setFaction(35);
				EnterEvadeMode();
			}
			uiCheckFlamewaker_Timer = 2000;
		}
		else 
			uiCheckFlamewaker_Timer -= diff;

        if(m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)        
            DoCast(m_creature,SPELL_AEGIS);        

        if (uiMagicReflection_Timer < diff)
        {
            DoCast(m_creature, SPELL_MAGIC_REFLECTION);
			for(int i = 0 ; i < 8 ; ++i)			
				DoCast(pAdds[i],SPELL_MAGIC_REFLECTION);
						
            uiMagicReflection_Timer = 30000;
        }
		else 
			uiMagicReflection_Timer -= diff;

        if (uiDamageReflection_Timer < diff)
        {
            DoCast(m_creature, SPELL_DAMAGE_REFLECTION);
			for(int i = 0 ; i < 8 ; ++i)			
				DoCast(pAdds[i],SPELL_DAMAGE_REFLECTION);

            uiDamageReflection_Timer = 30000;
        }
		else 
			uiDamageReflection_Timer -= diff;

        if (uiBlastwave_Timer < diff)
        {
            DoCast(m_creature,SPELL_BLAST_WAVE);

            uiBlastwave_Timer = 10000;
        }
		else 
			uiBlastwave_Timer -= diff;

		if (uiTeleport_Timer < diff)
		{
			Unit* pTarget;
			if(rand()%10 + 1 < 6)
			{
				pTarget = m_creature->getVictim();
				m_creature->getThreatManager().modifyThreatPercent(pTarget, 80);
			}
			else
				pTarget = SelectUnit(SELECT_TARGET_RANDOM,0);

			if(pTarget)
			{
				pTarget->NearTeleportTo(736.466, -1177.063, -119.181, pTarget->GetOrientation());
				DoCast(pTarget,SPELL_FIRE_BLAST);
			}

			uiTeleport_Timer = 20000 + rand()%5000;
		}
		else 
			uiTeleport_Timer -= diff;

		DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_majordomo(Creature* pCreature)
{
    return new boss_majordomoAI(pCreature);
}

bool GossipHello_boss_majordomo(Player* pPlayer, Creature* pCreature)
{
    pPlayer->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_DOMO , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    pPlayer->SEND_GOSSIP_MENU(68,pCreature->GetGUID());
    return true;
}

bool GossipSelect_boss_majordomo(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction )
{
	if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
	{
		pPlayer->CLOSE_GOSSIP_MENU();
		((boss_majordomoAI*)pCreature->AI())->BeginEvent(pPlayer);
	}
    return true;
}

void AddSC_boss_majordomo()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
	newscript->pGossipHello = &GossipHello_boss_majordomo;
    newscript->pGossipSelect = &GossipSelect_boss_majordomo;
    newscript->RegisterSelf();
}