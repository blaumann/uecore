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

#define EMOTE_SERVICE               -1409000

#define SPELL_INFERNO               19695	//Macht ihn bewegungsunfähig
#define SPELL_IGNITEMANA            19659	//35 meter radius
#define SPELL_LIVINGBOMB            20475
#define SPELL_ARMAGEDDOM            20479	//Bei 2% Health kommt emote und 5 senkunden danach der spell

struct MANGOS_DLL_DECL boss_baron_geddonAI : public ScriptedAI
{
    boss_baron_geddonAI(Creature *pCreature) : ScriptedAI(pCreature) 
	{
		pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
	}
	ScriptedInstance *pInstance;

    uint32 Inferno_Timer;
    uint32 IgniteMana_Timer;
    uint32 LivingBomb_Timer;
	uint32 Armageddon_Timer;

	bool HasPerformedService;

    void Reset()
    {
		pInstance->SetData(DATA_GEDDON_PROGRESS, NOT_STARTED);

        Inferno_Timer = 45000;      //These times are probably wrong
        IgniteMana_Timer = 30000;
        LivingBomb_Timer = 35000;
		Armageddon_Timer = 5000;

		HasPerformedService = false;
    }

    void Aggro(Unit *who)
	{
		pInstance->SetData(DATA_GEDDON_PROGRESS, IN_PROGRESS);
	}

	void JustDied(Unit* Killer)
    {
		pInstance->SetData(DATA_GEDDON_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        //If we are <2% hp cast Armageddom
        if(m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 2)
        {
            m_creature->InterruptNonMeleeSpells(true);
			m_creature->StopMoving();
			if(!HasPerformedService)
			{
				DoScriptText(EMOTE_SERVICE, m_creature);
				HasPerformedService = true;
			}

			if(Armageddon_Timer < diff)
			{
				DoCast(m_creature,SPELL_ARMAGEDDOM);
				Armageddon_Timer = 5000;
			}else Armageddon_Timer -= diff;
            
            return;
        }

        if(Inferno_Timer < diff)
        {
            DoCast(m_creature, SPELL_INFERNO);

            Inferno_Timer = 45000;
        }else Inferno_Timer -= diff;

        if(IgniteMana_Timer < diff)
        {
			Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0);

			while(!m_creature->IsWithinDistInMap(target, 35.0f))
			{
				target = SelectUnit(SELECT_TARGET_RANDOM, 0);
			}

            DoCast(target, SPELL_IGNITEMANA);

            IgniteMana_Timer = 30000;
        }else IgniteMana_Timer -= diff;

        if(LivingBomb_Timer < diff)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0))
                DoCast(target, SPELL_LIVINGBOMB);

            LivingBomb_Timer = 35000;
        }else LivingBomb_Timer -= diff;

        DoMeleeAttackIfReady();
    }
}; 

CreatureAI* GetAI_boss_baron_geddon(Creature* pCreature)
{
    return new boss_baron_geddonAI(pCreature);
}


void AddSC_boss_baron_geddon()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_baron_geddon";
    newscript->GetAI = &GetAI_boss_baron_geddon;
    newscript->RegisterSelf();
}
