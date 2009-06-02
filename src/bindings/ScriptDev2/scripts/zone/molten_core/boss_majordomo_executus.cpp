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

#define SAY_AGGRO           -1409003
#define SAY_SPAWN           -1409004
#define SAY_SLAY            -1409005
#define SAY_SPECIAL         -1409006
#define SAY_DEFEAT          -1409007

//Majordomo Speech at Ragnaros
#define SAY_SUMMON_MAJ      -1409008		//Seht Ragnaros den Feuerfürsten
#define SAY_ARRIVAL2_MAJ    -1409010		//Diese ungläubigen Sterblichen

//Majordomo Spells
#define SPELL_MAGIC_REFLECTION      20619
#define SPELL_DAMAGE_REFLECTION     21075
#define SPELL_BLASTWAVE             20229
#define SPELL_AEGIS                 20620                   //This is self casted whenever we are below 50%
#define SPELL_SUMMON_RAGNAROS       19774

//Fiery Pit Spell
#define SPELL_FIERYPIT				20623

#define ENTRY_FLAMEWALKER_HEALER    11663
#define ENTRY_FLAMEWALKER_ELITE     11664

//Majordomo Adds
//ADDS right site
#define ADD_PRIEST_R1_X 761.088
#define ADD_PRIEST_R1_Y -1174.606
#define ADD_PRIEST_R1_Z -119.181
#define ADD_PRIEST_R1_O 3.541

#define ADD_PRIEST_R2_X 756.907
#define ADD_PRIEST_R2_Y -1191.007
#define ADD_PRIEST_R2_Z -119.181
#define ADD_PRIEST_R2_O 3.541

#define ADD_ELITE_R1_X 760.444
#define ADD_ELITE_R1_Y -1183.175
#define ADD_ELITE_R1_Z -119.181
#define ADD_ELITE_R1_O 3.541

#define ADD_ELITE_R2_X 753.009
#define ADD_ELITE_R2_Y -1198.237
#define ADD_ELITE_R2_Z -118.346
#define ADD_ELITE_R2_O 3.541

//ADDS left site
#define ADD_PRIEST_L1_X 753.748
#define ADD_PRIEST_L1_Y -1159.354
#define ADD_PRIEST_L1_Z -119.181
#define ADD_PRIEST_L1_O 3.541

#define ADD_PRIEST_L2_X 738.322
#define ADD_PRIEST_L2_Y -1152.389
#define ADD_PRIEST_L2_Z -119.181
#define ADD_PRIEST_L2_O 3.541

#define ADD_ELITE_L1_X 746.649
#define ADD_ELITE_L1_Y -1154.512
#define ADD_ELITE_L1_Z -119.181
#define ADD_ELITE_L1_O 3.541

#define ADD_ELITE_L2_X 729.771
#define ADD_ELITE_L2_Y -1153.243
#define ADD_ELITE_L2_Z -119.181
#define ADD_ELITE_L2_O 3.541
//End Majordomo Adds

#define GOSSIP_ITEM_DOMO   "Lass mich eine Unteredung mit deinem Herrn führen"

struct MANGOS_DLL_DECL boss_majordomoAI : public ScriptedAI
{
    boss_majordomoAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
    }
    ScriptedInstance *pInstance;

	Creature *EliteR1, *EliteR2, *EliteL1, *EliteL2, *PriestR1, *PriestR2, *PriestL1, *PriestL2;

    uint32 MagicReflection_Timer;
    uint32 DamageReflection_Timer;
    uint32 Blastwave_Timer;
	uint32 Teleport_Timer;

	uint32 CheckFlamewaker_Timer;

	uint32 TeleportDomo_Timer;
	uint32 SehtRag_Timer;
	uint32 Unglaeubigen_Timer;
	uint8 WPdone;

	bool SaySpawn;
	bool Death;
	bool IntroDone;
	bool Moving;

    void Reset()
    {
		if(pInstance->GetData(DATA_MAJORDOMO_PROGRESS) != SPECIAL)
		{
			pInstance->SetData(DATA_DOMO_RESETCOUNT,0);
			pInstance->SetData(DATA_MAJORDOMO_PROGRESS, NOT_STARTED);

			MagicReflection_Timer =  30000;      //Damage reflection first so we alternate
			DamageReflection_Timer = 15000;
			Blastwave_Timer = 10000;
			Teleport_Timer = 20000;

			CheckFlamewaker_Timer = 2000;
			SaySpawn = false;

			if(pInstance->GetData(DATA_DOMO_RESETCOUNT) == 1)
			{
				EliteR1 = EliteR2 = EliteL1 = EliteL2 = PriestR1 = PriestR2 = PriestL1 = PriestL2 = NULL;

				EliteR1 = m_creature->SummonCreature(11664,ADD_ELITE_R1_X,ADD_ELITE_R1_Y,ADD_ELITE_R1_Z,ADD_ELITE_R1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				EliteR2 = m_creature->SummonCreature(11664,ADD_ELITE_R2_X,ADD_ELITE_R2_Y,ADD_ELITE_R2_Z,ADD_ELITE_R2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				EliteL1 = m_creature->SummonCreature(11664,ADD_ELITE_L1_X,ADD_ELITE_L1_Y,ADD_ELITE_L1_Z,ADD_ELITE_L1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				EliteL2 = m_creature->SummonCreature(11664,ADD_ELITE_L2_X,ADD_ELITE_L2_Y,ADD_ELITE_L2_Z,ADD_ELITE_L2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				PriestR1 = m_creature->SummonCreature(11662,ADD_PRIEST_R1_X,ADD_PRIEST_R1_Y,ADD_PRIEST_R1_Z,ADD_PRIEST_R1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				PriestR2 = m_creature->SummonCreature(11662,ADD_PRIEST_R2_X,ADD_PRIEST_R2_Y,ADD_PRIEST_R2_Z,ADD_PRIEST_R2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				PriestL1 = m_creature->SummonCreature(11662,ADD_PRIEST_L1_X,ADD_PRIEST_L1_Y,ADD_PRIEST_L1_Z,ADD_PRIEST_L1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				PriestL2 = m_creature->SummonCreature(11662,ADD_PRIEST_L2_X,ADD_PRIEST_L2_Y,ADD_PRIEST_L2_Z,ADD_PRIEST_L2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
			}
			else if(pInstance->GetData(DATA_DOMO_RESETCOUNT) > 1)
			{
				//Check Adds
				if(EliteR1->isDead())
					EliteR1 = m_creature->SummonCreature(11664,ADD_ELITE_R1_X,ADD_ELITE_R1_Y,ADD_ELITE_R1_Z,ADD_ELITE_R1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(EliteR2->isDead())
					EliteR2 = m_creature->SummonCreature(11664,ADD_ELITE_R2_X,ADD_ELITE_R2_Y,ADD_ELITE_R2_Z,ADD_ELITE_R2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(EliteL1->isDead())
					EliteL1 = m_creature->SummonCreature(11664,ADD_ELITE_L1_X,ADD_ELITE_L1_Y,ADD_ELITE_L1_Z,ADD_ELITE_L1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(EliteL2->isDead())
					EliteL2 = m_creature->SummonCreature(11664,ADD_ELITE_L2_X,ADD_ELITE_L2_Y,ADD_ELITE_L2_Z,ADD_ELITE_L2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(PriestR1->isDead())
					PriestR1 = m_creature->SummonCreature(11662,ADD_PRIEST_R1_X,ADD_PRIEST_R1_Y,ADD_PRIEST_R1_Z,ADD_PRIEST_R1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(PriestR2->isDead())
					PriestR2 = m_creature->SummonCreature(11662,ADD_PRIEST_R2_X,ADD_PRIEST_R2_Y,ADD_PRIEST_R2_Z,ADD_PRIEST_R2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(PriestL1->isDead())
					PriestL1 = m_creature->SummonCreature(11662,ADD_PRIEST_L1_X,ADD_PRIEST_L1_Y,ADD_PRIEST_L1_Z,ADD_PRIEST_L1_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
				if(PriestL2->isDead())
					PriestL2 = m_creature->SummonCreature(11662,ADD_PRIEST_L2_X,ADD_PRIEST_L2_Y,ADD_PRIEST_L2_Z,ADD_PRIEST_L2_O,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,1200000);
			}
		}
		else if(pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
		{
			//Intro handling
			TeleportDomo_Timer = 36000;
			SehtRag_Timer = 16000;
			Unglaeubigen_Timer = 14000;
			WPdone = 0;

			Death = false;
			IntroDone = false;
			Moving = false;
		}
    }

	void BeginEvent(Player* target)
    {
		pInstance->SetData(DATA_VARRAGNAROSINTRO,2);
    }

	void MoveInLineOfSight(Unit *who)
    {
		if(pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
			return;

        if( !m_creature->getVictim() && who->isTargetableForAttack() && ( m_creature->IsHostileTo( who )) && who->isInAccessablePlaceFor(m_creature) && !SaySpawn)
        {
			DoScriptText(SAY_SPAWN, m_creature);
			SaySpawn = true;
        }

		float attackRadius = m_creature->GetAttackDistance(who);
		if( m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->IsWithinLOSInMap(who))
        {
			if(who->getFaction()== 54 || who->getFaction() == 14)
				return;
			who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
            AttackStart(who);
        }
    }


    void KilledUnit(Unit* victim)
    {
        if(rand()%5)
            return;

        DoScriptText(SAY_SLAY, m_creature);
    }

    void Aggro(Unit *who)
    {
		pInstance->SetData(DATA_MAJORDOMO_PROGRESS, IN_PROGRESS);

		DoScriptText(SAY_AGGRO, m_creature);
    }

	void MovementInform(uint32 type, uint32 id)
    {
		if(type != POINT_MOTION_TYPE)
			return;

		if(id == 1)
		{
			DoCast(m_creature,SPELL_SUMMON_RAGNAROS);
			WPdone = 1;
			Moving = false;
		}

        if(id == 2)
		{
			WPdone = 2;
			Moving = false;
		}
    }

    void UpdateAI(const uint32 diff)
    {
		if(!IntroDone)
		{
			switch(pInstance->GetData(DATA_VARRAGNAROSINTRO))
			{
				case 1:
					if(TeleportDomo_Timer < diff && pInstance->GetData(DATA_DOMO_PORTED) != 1)
					{
						Creature *Domo = m_creature->SummonCreature(12018, 854.975, -827.593, -228.504, 4.99008, TEMPSUMMON_TIMED_DESPAWN,3600000);
						Domo->setFaction(35);
						Domo->SetUInt32Value(UNIT_NPC_FLAGS,1);
						m_creature->SetVisibility(VISIBILITY_OFF);

						pInstance->SetData(DATA_DOMO_PORTED, 1);
					}else TeleportDomo_Timer -= diff;
					break;

				case 2:
					if(WPdone == 0 && !Moving)
					{
						m_creature->GetMotionMaster()->Clear();
						m_creature->GetMotionMaster()->MovePoint(1,851.266,-816.847,-229.358);
						Moving = true;
					}

					if(WPdone == 1)
					{
						m_creature->GetMotionMaster()->Clear();
						m_creature->GetMotionMaster()->MovePoint(2,843.145,-813.479,-230.067);
						Moving = true;
						pInstance->SetData(DATA_VARRAGNAROSINTRO,3);
					}
					break;

				case 3:
					if (SehtRag_Timer < diff)
					{
						DoScriptText(SAY_SUMMON_MAJ, m_creature);
						m_creature->SummonCreature(11502, 839.380066 ,-833.359558, -229.358, 1.380336, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,7200000);

						pInstance->SetData(DATA_VARRAGNAROSINTRO,4);
					}else SehtRag_Timer -= diff;
					break;

				case 6:
					if (Unglaeubigen_Timer <diff)
					{
						DoScriptText(SAY_ARRIVAL2_MAJ, m_creature);

						pInstance->SetData(DATA_VARRAGNAROSINTRO,7);
						IntroDone = true;
					}else Unglaeubigen_Timer -= diff;
					break;
			}
		}		

        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

		if(pInstance->GetData(DATA_MAJORDOMO_PROGRESS) == SPECIAL)
			return;

		if(CheckFlamewaker_Timer < diff)
		{
			if(EliteR1->isDead() && EliteR2->isDead() && EliteL1->isDead() && EliteL2->isDead() &&
				PriestR1->isDead() && PriestR2->isDead() && PriestL1->isDead() && PriestL2->isDead())
			{
				pInstance->SetData(DATA_MAJORDOMO_PROGRESS, SPECIAL);

				CheckFlamewaker_Timer=600000;

				DoScriptText(SAY_DEFEAT, m_creature);
				pInstance->SetData(DATA_VARRAGNAROSINTRO, 1);

				m_creature->setFaction(35);
				EnterEvadeMode();
			}
			CheckFlamewaker_Timer = 2000;
		}else CheckFlamewaker_Timer -= diff;

        if(m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)
        {
            DoCast(m_creature,SPELL_AEGIS);
        }

        if (MagicReflection_Timer < diff)
        {
            DoCast(m_creature, SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)EliteR1,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)EliteR2,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)EliteL1,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)EliteL2,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)PriestR1,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)PriestR2,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)PriestL1,SPELL_MAGIC_REFLECTION);
			DoCast((Unit*)PriestL2,SPELL_MAGIC_REFLECTION);

            MagicReflection_Timer = 30000;
        }else MagicReflection_Timer -= diff;

        if(DamageReflection_Timer < diff)
        {
            DoCast(m_creature, SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)EliteR1,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)EliteR2,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)EliteL1,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)EliteL2,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)PriestR1,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)PriestR2,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)PriestL1,SPELL_DAMAGE_REFLECTION);
			DoCast((Unit*)PriestL2,SPELL_DAMAGE_REFLECTION);

            DamageReflection_Timer = 30000;
        }else DamageReflection_Timer -= diff;

        if(Blastwave_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_BLASTWAVE);

            Blastwave_Timer = 10000;
        }else Blastwave_Timer -= diff;

		if(Teleport_Timer < diff)
		{
			Unit* target;
			if(rand()%10 + 1 < 6)
			{
				target = m_creature->getVictim();
				m_creature->getThreatManager().modifyThreatPercent(target, 80);
			}
			else
				target = SelectUnit(SELECT_TARGET_RANDOM,0);

			if(target)
			{
				target->NearTeleportTo(736.466, -1177.063, -119.181, target->GetOrientation());
				DoCast(target,SPELL_FIERYPIT);
			}

			Teleport_Timer = 20000 + rand()%5000;
		}else Teleport_Timer -= diff;

		DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_majordomo(Creature *pCreature)
{
    return new boss_majordomoAI(pCreature);
}

bool GossipHello_boss_majordomo(Player *player, Creature *_Creature)
{
    player->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_DOMO , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
    player->SEND_GOSSIP_MENU(68,_Creature->GetGUID());
    return true;
}

bool GossipSelect_boss_majordomo(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    switch (action)
    {
        case GOSSIP_ACTION_INFO_DEF+1:

            player->CLOSE_GOSSIP_MENU();
			
			((boss_majordomoAI*)_Creature->AI())->BeginEvent(player);
            break;
    }
    return true;
}

void AddSC_boss_majordomo()
{
    Script *newscript;
    newscript = new Script;

    newscript->Name = "boss_majordomo";
    newscript->GetAI = &GetAI_boss_majordomo;
	newscript->pGossipHello = &GossipHello_boss_majordomo;
    newscript->pGossipSelect = &GossipSelect_boss_majordomo;
    newscript->RegisterSelf();
}
