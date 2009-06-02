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
SDName: Boss_Garr
SD%Complete: 90
SDComment: Adds respawn after wipe not implemented
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

// Garr spells
#define SPELL_ANTIMAGICPULSE        19492
#define SPELL_MAGMASHACKLES         19496
#define SPELL_FRENZY                19516   //Stacking enrage (stacks to 10 times)

//Add spells
#define SPELL_ERUPTION              19497
#define SPELL_IMMOLATE              20294
#define SPELL_SEPERATIONANXIETY		23492	//wenn adds mehr als 50 meter entfernt sind

struct MANGOS_DLL_DECL boss_garrAI : public ScriptedAI
{
    boss_garrAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
		pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
	}
	ScriptedInstance *pInstance;

    uint32 AntiMagicPulse_Timer;
    uint32 MagmaShackles_Timer;

    uint8 FrenzyCount;

    void Reset()
    {
		pInstance->SetData(DATA_GARR_PROGRESS, NOT_STARTED);

		m_creature->RemoveAllAuras();

        AntiMagicPulse_Timer = 25000;      //These times are probably wrong
        MagmaShackles_Timer = 15000;

		FrenzyCount = 0;
    }

    void Aggro(Unit *who)
    {
		pInstance->SetData(DATA_GARR_PROGRESS, IN_PROGRESS);
    }

	void JustDied(Unit* Killer)
    {
		pInstance->SetData(DATA_GARR_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if (AntiMagicPulse_Timer < diff)
        {
            DoCast(m_creature,SPELL_ANTIMAGICPULSE);

            //14-18 seconds until we should cast this agian
            AntiMagicPulse_Timer = 14000 + rand()%4000;
        }else AntiMagicPulse_Timer -= diff;

        if (MagmaShackles_Timer < diff)
        {
            DoCast(m_creature,SPELL_MAGMASHACKLES);

            MagmaShackles_Timer = 8000 + rand()%4000;
        }else MagmaShackles_Timer -= diff;

        DoMeleeAttackIfReady();
    }
}; 


struct MANGOS_DLL_DECL mob_fireswornAI : public ScriptedAI
{
    mob_fireswornAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
		pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
	}
	ScriptedInstance *pInstance;

	Unit *Garr;

    uint32 Immolate_Timer;

	bool Erruption;

    void Reset()
    {
		Garr = Unit::GetUnit(*m_creature, pInstance->GetData64(DATA_GARR));

        Immolate_Timer = 4000;      //These times are probably wrong

		Erruption = true;
    }

    void MoveInLineOfSight(Unit *who){}

	void JustDied(Unit* Killer)
    {
		DoCast(Garr, SPELL_FRENZY);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if (Immolate_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_IMMOLATE);

            Immolate_Timer = 5000 + rand()%5000;
        }else Immolate_Timer -= diff;

        //Cast Erruption and let them die
        if (m_creature->GetHealth() <= m_creature->GetMaxHealth() * 0.10 && Erruption)
        {
			if(rand()%100 + 1 < 50)
			{
				DoCast(m_creature->getVictim(),SPELL_ERUPTION);
				m_creature->setDeathState(JUST_DIED);
				m_creature->RemoveCorpse();
			}else Erruption = false;
        }

		if(!m_creature->IsWithinDistInMap(Garr, 70.0f) && !m_creature->HasAura(23492))
			DoCast(m_creature,23492);

		if(m_creature->IsWithinDistInMap(Garr, 70.0f) && m_creature->HasAura(23492))
			m_creature->RemoveAllAuras();

        DoMeleeAttackIfReady();
    }
}; 
CreatureAI* GetAI_boss_garr(Creature* pCreature)
{
    return new boss_garrAI(pCreature);
}
CreatureAI* GetAI_mob_firesworn(Creature* pCreature)
{
    return new mob_fireswornAI(pCreature);
}



void AddSC_boss_garr()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_garr";
    newscript->GetAI = &GetAI_boss_garr;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_firesworn";
    newscript->GetAI = &GetAI_mob_firesworn;
    newscript->RegisterSelf();

}
