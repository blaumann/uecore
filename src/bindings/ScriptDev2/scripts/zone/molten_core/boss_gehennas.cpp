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
SDName: Boss_Gehennas
SD%Complete: 100
SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

#define SPELL_SHADOWBOLT            19728
#define SPELL_RAINOFFIRE            19717
#define SPELL_GEHENNASCURSE         19716

struct MANGOS_DLL_DECL boss_gehennasAI : public ScriptedAI
{
    boss_gehennasAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }
    ScriptedInstance *pInstance;

    uint32 ShadowBolt_Timer;
    uint32 RainOfFire_Timer;
    uint32 GehennasCurse_Timer;

    void Reset()
    {
		if(pInstance)
			pInstance->SetData(DATA_GEHENNAS_PROGRESS, NOT_STARTED);

        ShadowBolt_Timer = 6000;
        RainOfFire_Timer = 10000;
        GehennasCurse_Timer = 12000;
    }

    void Aggro(Unit *who)
	{
		if(pInstance)
			pInstance->SetData(DATA_GEDDON_PROGRESS, IN_PROGRESS);
	}

	void JustDied(Unit* Killer)
    {
		if(pInstance)
			pInstance->SetData(DATA_GEHENNAS_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        //ShadowBolt_Timer
        if (ShadowBolt_Timer < diff)
        {
            if (Unit* bTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
                DoCast(bTarget,SPELL_SHADOWBOLT);
            ShadowBolt_Timer = 7000;
        }else ShadowBolt_Timer -= diff;

        //RainOfFire_Timer
        if (RainOfFire_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_RAINOFFIRE);

            RainOfFire_Timer = 4000 + rand()%8000;
        }else RainOfFire_Timer -= diff;

        //GehennasCurse_Timer
        if (GehennasCurse_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_GEHENNASCURSE);

            GehennasCurse_Timer = 22000 + rand()%8000;
        }else GehennasCurse_Timer -= diff;

        DoMeleeAttackIfReady();
    }
}; 
CreatureAI* GetAI_boss_gehennas(Creature* pCreature)
{
    return new boss_gehennasAI(pCreature);
}

void AddSC_boss_gehennas()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_gehennas";
    newscript->GetAI = &GetAI_boss_gehennas;
    newscript->RegisterSelf();
}