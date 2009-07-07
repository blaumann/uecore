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
SDName: Boss_Baron_Geddon
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

enum
{
	EMOTE_SERVICE		=	-1409000,

	SPELL_INFERNO		=	19695,	//he can't move
	SPELL_IGNITE_MANA	=	19659,	//35 yard radius
	SPELL_LIVING_BOMB	=	20475,
	SPELL_ARMAGEDDON	=	20479	//at 2% helath there is the emote and after 5 seconds he casts this spell
};

struct MANGOS_DLL_DECL boss_baron_geddonAI : public ScriptedAI
{
    boss_baron_geddonAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
		m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
	}
	ScriptedInstance* m_pInstance;

    uint32 uiInferno_Timer;
    uint32 uiIgniteMana_Timer;
    uint32 uiLivingBomb_Timer;
	uint32 uiArmageddon_Timer;

	bool bHasPerformedService;

    void Reset()
    {
		if(m_pInstance)
		{
			m_pInstance->SetData(DATA_GEDDON_PROGRESS, NOT_STARTED);

			uiInferno_Timer = 45000;      //These times are probably wrong
			uiIgniteMana_Timer = 30000;
			uiLivingBomb_Timer = 35000;
			uiArmageddon_Timer = 5000;

			bHasPerformedService = false;
		}
    }

    void Aggro(Unit* pWho)
	{
		if(m_pInstance)
			m_pInstance->SetData(DATA_GEDDON_PROGRESS, IN_PROGRESS);
	}

	void JustDied(Unit* Killer)
    {	
		if(m_pInstance)
		{
			m_pInstance->SetData(DATA_GEDDON_PROGRESS, DONE);

			if(m_pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
				m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
		}
    }

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim() || !m_pInstance)
            return;

        //If geddon's hp below 2% , cast Ammageddon
        if(m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 2)
        {
            m_creature->InterruptNonMeleeSpells(true);
			m_creature->StopMoving();
			if(!bHasPerformedService)
			{
				DoScriptText(EMOTE_SERVICE, m_creature);
				bHasPerformedService = true;
			}

			if(uiArmageddon_Timer < diff)
			{
				DoCast(m_creature,SPELL_ARMAGEDDON);
				uiArmageddon_Timer = 5000;
			}
			else 
				uiArmageddon_Timer -= diff;
            
            return;
        }

        if(uiInferno_Timer < diff)
        {
            DoCast(m_creature, SPELL_INFERNO);

            uiInferno_Timer = 45000;
        }
		else 
			uiInferno_Timer -= diff;

        if(uiIgniteMana_Timer < diff)
        {
			DoCast(m_creature, SPELL_IGNITE_MANA);

            uiIgniteMana_Timer = 30000;
        }
		else 
			uiIgniteMana_Timer -= diff;

        if(uiLivingBomb_Timer < diff)
        {
            if(Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                DoCast(pTarget, SPELL_LIVING_BOMB);

            uiLivingBomb_Timer = 35000;
        }
		else 
			uiLivingBomb_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_baron_geddon(Creature* pCreature)
{
    return new boss_baron_geddonAI(pCreature);
}

void AddSC_boss_baron_geddon()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "boss_baron_geddon";
    newscript->GetAI = &GetAI_boss_baron_geddon;
    newscript->RegisterSelf();
}