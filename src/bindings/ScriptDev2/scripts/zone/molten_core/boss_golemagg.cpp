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
SDName: Boss_Golemagg
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"


#define EMOTE_GOLEMAGGHELP              -1409002

#define SPELL_MAGMASPLASH               13879 
#define SPELL_PYROBLAST                 20228
#define SPELL_EARTHQUAKE                19798

//-- CoreRager Spells --
#define SPELL_MANGLE                    19820    
#define SPELL_GOLEMAGGSTRUST			20553		//wenn golemagg 20 meter in der nähe ist

struct MANGOS_DLL_DECL boss_golemaggAI : public ScriptedAI
{
    boss_golemaggAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }
    ScriptedInstance *pInstance;

    uint32 Pyroblast_Timer;
    uint32 EarthQuake_Timer;

	bool HasPerformedAggro;

    void Reset()
    {
		pInstance->SetData(DATA_GOLEMAGG_PROGRESS, NOT_STARTED);

        Pyroblast_Timer = 7000;      //These times are probably wrong
        EarthQuake_Timer = 3000;

		HasPerformedAggro = false;
    }

    void Aggro(Unit *who)
    {
		pInstance->SetData(DATA_GOLEMAGG_PROGRESS, IN_PROGRESS);
    }

	void DamageTaken(Unit* done_by, uint32 &damage)
    {
		if(rand()%100 + 1 < 25)
			DoCast(done_by,SPELL_MAGMASPLASH);
	}

    void JustDied(Unit* Killer)
    {
		pInstance->SetData(DATA_GOLEMAGG_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 11)
        {
			if(!HasPerformedAggro)
			{
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 90);
				HasPerformedAggro = true;
			}

            if (EarthQuake_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_EARTHQUAKE);

                EarthQuake_Timer = 3000;
            }else EarthQuake_Timer -= diff;
        }

        if (Pyroblast_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_PYROBLAST);

            Pyroblast_Timer = 7000;
        }else Pyroblast_Timer -= diff;

        DoMeleeAttackIfReady();
    }
}; 

struct MANGOS_DLL_DECL mob_core_ragerAI : public ScriptedAI
{
    mob_core_ragerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;

	Unit *pGolemagg;

    uint32 Mangle_Timer;
    uint32 Check_Timer;

	bool HasPerformedAggro;

    void Reset()
    {
		pGolemagg = Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_GOLEMAGG));

        Mangle_Timer = 7000;      //These times are probably wrong 
        Check_Timer = 1000;

		HasPerformedAggro = false;
    }


    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

		if(m_creature->IsWithinDistInMap(pGolemagg, 20.0f) && !m_creature->HasAura(20553))
			DoCast(m_creature, 20553);

        if (Mangle_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_MANGLE);

            Mangle_Timer = 10000;
        }else Mangle_Timer -= diff;

        if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)
        {
			m_creature->SetHealth(m_creature->GetMaxHealth());
            DoScriptText(EMOTE_GOLEMAGGHELP, m_creature);
        }

		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 11)
        {
			if(!HasPerformedAggro)
			{
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 90);
				HasPerformedAggro = true;
			}
		}

        if (Check_Timer < diff)
        {
            if (pInstance && (!pGolemagg || !pGolemagg->isAlive()))
				m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, true);

            Check_Timer = 1000;
        }else Check_Timer -= diff;

        DoMeleeAttackIfReady();
	}
}; 
CreatureAI* GetAI_boss_golemagg(Creature* pCreature)
{
    return new boss_golemaggAI(pCreature);
}

CreatureAI* GetAI_mob_core_rager(Creature* pCreature)
{
    return new mob_core_ragerAI(pCreature);
}
void AddSC_boss_golemagg()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_golemagg";
    newscript->GetAI = &GetAI_boss_golemagg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_core_rager";
    newscript->GetAI = &GetAI_mob_core_rager;
    newscript->RegisterSelf();
}
