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
SDName: Boss_Magmadar
SD%Complete: 100
SDComment: 
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

#define EMOTE_FRENZY                -1409001

#define SPELL_FRENZY                19451
#define SPELL_MAGMASPIT             19450
#define SPELL_PANIC                 19408       
#define SPELL_LAVABOMB              19411

struct MANGOS_DLL_DECL boss_magmadarAI : public ScriptedAI
{
    boss_magmadarAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;

    uint32 Frenzy_Timer;
    uint32 Panic_Timer;
    uint32 Lavabomb_Timer;
	uint32 MagmaSpit_Timer;

    void Reset()
    {
		pInstance->SetData(DATA_MAGMADAR_PROGRESS, NOT_STARTED);

        Frenzy_Timer = 15000;
        Panic_Timer = 20000;
        Lavabomb_Timer = 12000;
		MagmaSpit_Timer = 20000;
    }

    void Aggro(Unit *who)
    {
		pInstance->SetData(DATA_MAGMADAR_PROGRESS, IN_PROGRESS);
    }

	void JustDied(Unit* Killer)
    {
		pInstance->SetData(DATA_MAGMADAR_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        //Frenzy_Timer
        if (Frenzy_Timer < diff)
        {
            DoScriptText(EMOTE_FRENZY, m_creature);

            DoCast(m_creature,SPELL_FRENZY);
            Frenzy_Timer = 15000;
        }else Frenzy_Timer -= diff;

        //Panic_Timer
        if (Panic_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_PANIC);
            Panic_Timer = 35000;
        }else Panic_Timer -= diff;

        //Lavabomb_Timer
        if (Lavabomb_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_LAVABOMB);

            Lavabomb_Timer = 12000;
        }else Lavabomb_Timer -= diff;

		if (MagmaSpit_Timer < diff)
		{
			DoCast(m_creature->getVictim(),SPELL_MAGMASPIT);

            MagmaSpit_Timer = 12000;
        }else MagmaSpit_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_magmadar(Creature* pCreature)
{
    return new boss_magmadarAI(pCreature);
}

void AddSC_boss_magmadar()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_magmadar";
    newscript->GetAI = &GetAI_boss_magmadar;
    newscript->RegisterSelf();
}
