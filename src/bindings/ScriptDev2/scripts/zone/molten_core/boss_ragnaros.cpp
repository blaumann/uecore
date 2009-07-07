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
SDName: Boss_Ragnaros
SD%Complete: 99
SDComment: Ready for test
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

enum
{
	SAY_ARRIVAL_1_RAG			=	-1409009,
	SAY_ARRIVAL_3_RAG			=	-1409011,
	SAY_ARRIVAL_5_RAG			=	-1409012,

	SAY_REINFORCEMENTS1			=	-1409013,
	SAY_REINFORCEMENTS2			=	-1409014,
	SAY_HAND					=	-1409015,
	SAY_WRATH					=	-1409016,
	SAY_KILL					=	-1409017,
	SAY_MAGMA_BURST				=	-1409018,
	
	SPELL_HAND_OF_RAGNAROS		=	19780,
	SPELL_WRATH_OF_RAGNAROS		=	20566,

	SPELL_MAGMA_BURST			=	20565,

	//SPELL_SONS_OF_FLAME_DUMMY	=	21108,
	SPELL_RAG_SUBMERGE			=	21107,
	SPELL_RAG_SUBMERGE_VISUAL	=	20567,
	SPELL_RAGE_MERGE			=	20568,
	SPELL_MELT_WEAPON			=	21388,
	SPELL_ELEMENTAL_FIRE		=	20564,
	SPELL_ERRUPTION				=	17731

};
/*
float PositionOfAdds[8][4]=
{	
    {848.740356, -816.103455, -229.743270, 2.615287},
    {852.560791, -849.861511, -228.560974, 2.836073},
	{808.710632, -852.845764, -227.914963, 0.964207},
	{786.597107, -821.132874, -226.350128, 0.949377},
    {796.219116, -800.948059, -226.010361, 0.560603},
    {821.602539, -782.744109, -226.023575, 6.157440},
	{844.924744, -769.453735, -225.521698, 4.4539958},
	{839.823364, -810.869385, -229.683182, 4.693108},
};
Not used - why it was defined with #define??
*/
struct MANGOS_DLL_DECL boss_ragnarosAI : public Scripted_NoMovementAI
{
    boss_ragnarosAI(Creature *pCreature) : Scripted_NoMovementAI(pCreature)
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}

	ScriptedInstance* m_pInstance;
	Unit* Domo;

    uint32 uiWrathOfRagnaros_Timer;
    uint32 uiHandOfRagnaros_Timer;
    uint32 uiMagmaBurst_Timer;
    uint32 uiElementalFire_Timer;
    uint32 uiErruption_Timer;
    uint32 uiSubmerge_Timer;
    uint32 uiAttack_Timer;
    bool bHasYelledMagmaBurst;
    bool bHasSubmergedOnce;
    bool bWasBanished; 
    bool bHasAura;

	//Intro handling
	uint32 uiIntro_Timer;
	bool bIntroDone;

    void Reset()
    {
		if(m_pInstance)
		{
			m_pInstance->SetData(DATA_RAGNAROS_PROGRESS, NOT_STARTED);
			Domo = Unit::GetUnit(*m_creature, m_pInstance->GetData64(DATA_MAJORDOMO));

			uiWrathOfRagnaros_Timer = 25000;
			uiHandOfRagnaros_Timer = 20000;
			uiMagmaBurst_Timer = 2000;
			uiErruption_Timer = 15000;
			uiElementalFire_Timer = 3000;
			uiSubmerge_Timer = 180000;
			uiAttack_Timer = 90000;
			bHasYelledMagmaBurst = false;
			bHasSubmergedOnce = false;
			bWasBanished = false; 

			m_creature->CastSpell(m_creature,SPELL_MELT_WEAPON,true);
			bHasAura = true;

			//Intro handling
			uiIntro_Timer = 9000;
			bIntroDone = false;
		}
    }

    void KilledUnit(Unit* pVictim)
    {
        if(rand()%5)
            return;

        DoScriptText(SAY_KILL, m_creature);
    }

	void MoveInLineOfSight(Unit* pWho)
	{
		if(m_pInstance && m_pInstance->GetData(DATA_VARRAGNAROSINTRO) == 10 && m_creature->IsWithinDistInMap(pWho, m_creature->GetAttackDistance(pWho)))
			AttackStart(pWho);
	}

    void Aggro(Unit* pWho)
	{
		if(m_pInstance)
			m_pInstance->SetData(DATA_RAGNAROS_PROGRESS, IN_PROGRESS);
	}

	void JustDied(Unit* pKiller)
    {
		if(m_pInstance)
			m_pInstance->SetData(DATA_RAGNAROS_PROGRESS, DONE);
    }

    void UpdateAI(const uint32 diff)
    {
		if(m_pInstance)
		{
			if(!bIntroDone)
			{
				switch(m_pInstance->GetData(DATA_VARRAGNAROSINTRO))
				{
					case 4:
						if(uiIntro_Timer < diff)
						{
							m_creature->SetVisibility(VISIBILITY_ON);
							DoCast(m_creature,SPELL_RAGE_MERGE);

							m_pInstance->SetData(DATA_VARRAGNAROSINTRO,5);
							uiIntro_Timer = 5000;
						}
						else 
							uiIntro_Timer -= diff;

						break;

					case 5:
						if(uiIntro_Timer<diff)
						{
							DoScriptText(SAY_ARRIVAL_1_RAG, m_creature);

							m_pInstance->SetData(DATA_VARRAGNAROSINTRO,6);
							uiIntro_Timer = 9000;
						}
						else 
							uiIntro_Timer -=diff;

						break;

					case 7:
						if(uiIntro_Timer < diff)
						{
							DoScriptText(SAY_ARRIVAL_3_RAG, m_creature);

							m_pInstance->SetData(DATA_VARRAGNAROSINTRO,8);
							uiIntro_Timer = 16000;
						}
						else 
							uiIntro_Timer -= diff;

						break;

					case 8:
						if(uiIntro_Timer < diff)
						{
							DoCast(Domo,SPELL_WRATH_OF_RAGNAROS);
							Domo->DealDamage(Domo, Domo->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

							m_pInstance->SetData(DATA_VARRAGNAROSINTRO,9);
							uiIntro_Timer = 6000;
						}
						else 
							uiIntro_Timer -= diff;

						break;

					case 9:
						if(uiIntro_Timer < diff)
						{
							DoScriptText(SAY_ARRIVAL_5_RAG, m_creature);

							m_pInstance->SetData(DATA_VARRAGNAROSINTRO,10);
							bIntroDone = true;
						}
						else 
							uiIntro_Timer -= diff;
				}
				return;
			}

			if(bWasBanished && uiAttack_Timer < diff)
			{
				//Become unbanished again 
				//m_creature->setFaction(14);
				m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				DoCast(m_creature,SPELL_RAGE_MERGE);
				bWasBanished = false;
			}
			else if(bWasBanished)
			{
				uiAttack_Timer -= diff;
				return;
			}

			if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
				return;

			if(uiWrathOfRagnaros_Timer < diff)
			{
				DoCast(m_creature,SPELL_WRATH_OF_RAGNAROS);
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 70);

				if (rand()%2 == 0)            
					DoScriptText(SAY_WRATH, m_creature);            

				uiWrathOfRagnaros_Timer = 25000;
			}
			else 
				uiWrathOfRagnaros_Timer -= diff;

			if(uiHandOfRagnaros_Timer < diff)
			{
				DoCast(m_creature,SPELL_HAND_OF_RAGNAROS);

				if (rand()%2 == 0)
					DoScriptText(SAY_HAND, m_creature);

				uiHandOfRagnaros_Timer = 20000 + rand()%10000;
			}
			else 
				uiHandOfRagnaros_Timer -= diff;

			if(uiErruption_Timer < diff)
			{
				DoCast(m_creature,SPELL_ERRUPTION);

				uiErruption_Timer = 20000 + rand()%25000;
			}
			else 
				uiErruption_Timer -= diff;

			if(uiElementalFire_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_ELEMENTAL_FIRE);

				uiElementalFire_Timer = 9000 + rand()%4000;
			}
			else 
				uiElementalFire_Timer -= diff;

			if(!bWasBanished && uiSubmerge_Timer < diff)
			{
				//Creature spawning and ragnaros becomming unattackable
				//is not very well supported in the core
				//so added normaly spawning and banish workaround and attack again after 90 secs.

				m_creature->InterruptNonMeleeSpells(false);
				//Root self
				//DoCast(m_creature,23973);
				//m_creature->setFaction(35);
				m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				m_creature->CastSpell(m_creature,SPELL_RAG_SUBMERGE_VISUAL,true);
				m_creature->HandleEmoteCommand(EMOTE_ONESHOT_SUBMERGE);

				if (!bHasSubmergedOnce)
				{
					DoScriptText(SAY_REINFORCEMENTS1, m_creature);
					bHasSubmergedOnce = true;
				}
				else
					DoScriptText(SAY_REINFORCEMENTS2, m_creature);

				// summon 10 elementals
				Unit* ptarget = NULL;
				for(int i = 0; i < 9; i++)
				{
					ptarget = SelectUnit(SELECT_TARGET_RANDOM,0);
					Creature* Summoned = m_creature->SummonCreature(12143,ptarget->GetPositionX(), ptarget->GetPositionY(), ptarget->GetPositionZ(),0,TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN,900000);
					if(Summoned)
						Summoned->AI()->AttackStart(ptarget);
				}
	                
				bWasBanished = true;
				DoCast(m_creature,SPELL_RAG_SUBMERGE);
				uiAttack_Timer = 90000;

				uiSubmerge_Timer = 180000;
			}
			else 
				uiSubmerge_Timer -= diff;

			if(m_creature->IsWithinDistInMap(m_creature->getVictim(), ATTACK_DISTANCE))        
				DoMeleeAttackIfReady();
	        
			else
			{
				if(uiMagmaBurst_Timer < diff)
				{
					//Wenn niemand in der Nähe ist!
					if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
						DoCast(pTarget,SPELL_MAGMA_BURST);

					if(!bHasYelledMagmaBurst)
					{
						DoScriptText(SAY_MAGMA_BURST, m_creature);
						bHasYelledMagmaBurst = true;
					}

					uiMagmaBurst_Timer = 2500;
				}
				else 
					uiMagmaBurst_Timer -= diff;
			}
		}
	}
};

CreatureAI* GetAI_boss_ragnaros(Creature* pCreature)
{
    return new boss_ragnarosAI(pCreature);
}

void AddSC_boss_ragnaros()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_ragnaros";
    newscript->GetAI = &GetAI_boss_ragnaros;
    newscript->RegisterSelf();
}