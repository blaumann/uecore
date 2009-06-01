/* Copyright (C) 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* Script Data Start
SDName: Boss Skadi
SD%Complete: 80
SDComment: Need's Test
SDCategory: Utgarde Keep: Utgarde Pinnacle
Script Data End */

#include "precompiled.h"

//Phase 0 "gauntlet even" Skadi on a flying mount, waves of adds charging to the group periodicaly carrying harpoons
//Phase 1 Kill the Skadi drake mount with harppons launcher
//Phase 2 Kill the Skadi

enum Spells
{
    SPELL_CRUSH                            = 50234,
    SPELL_CRUSH_H                          = 59330,
    SPELL_POISONED_SPEAR                   = 50225,
    SPELL_POISONED_SPEAR_H                 = 59331,
    SPELL_WHIRLWIND                        = 50228, //random target,  but not the tank approx. every 20s
    SPELL_WHIRLWIND_H                      = 59322
};

enum Yell
{
    SAY_AGGRO                              = -1999656,
    SAY_KILL_1                             = -1999655,
    SAY_KILL_2                             = -1999654,
    SAY_KILL_3                             = -1999653,
    SAY_DEATH                              = -1999652,
    SAY_DRAKE_DEATH                        = -1999651,
    SAY_DRAKE_HIT_1                        = -1999650,
    SAY_DRAKE_HIT_2                        = -1999649,
    SAY_DRAKE_BREATH_1                     = -1999648,
    SAY_DRAKE_BREATH_2                     = -1999647,
    SAY_DRAKE_BREATH_3                     = -1999646
};

struct MANGOS_DLL_DECL boss_skadiAI : public ScriptedAI
{
    boss_skadiAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        HeroicMode = m_creature->GetMap()->IsHeroic();
    } 
    
    bool HeroicMode;

    uint32 SPELL_CRUSH_Timer;
    uint32 SPELL_POISONED_SPEAR_Timer;
    uint32 SPELL_WHIRLWIND_Timer;

    void Reset() 
    {
       //These times are probably wrong
       SPELL_CRUSH_Timer = 8000;                         
       SPELL_POISONED_SPEAR_Timer = 12000;
       SPELL_WHIRLWIND_Timer = 20000;
    }

    void Aggro(Unit* who) 
    {
        DoScriptText(SAY_AGGRO, m_creature);
    }

    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;        
		
        if (SPELL_CRUSH_Timer < diff)
        {if (HeroicMode)
        m_creature->CastSpell(m_creature, SPELL_CRUSH_H, true);
        else
            m_creature->CastSpell(m_creature, SPELL_CRUSH, true);
		
        SPELL_CRUSH_Timer = 8000;
        }else SPELL_CRUSH_Timer -=diff;
		
        if (SPELL_POISONED_SPEAR_Timer < diff)
        {
            if (HeroicMode)
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_POISONED_SPEAR_H);
                else
                    if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                        DoCast(target,SPELL_POISONED_SPEAR);
			
            SPELL_POISONED_SPEAR_Timer = 12000;
        }else SPELL_POISONED_SPEAR_Timer -=diff;

        if (SPELL_WHIRLWIND_Timer < diff)
        {if (HeroicMode)
        m_creature->CastSpell(m_creature, SPELL_WHIRLWIND_H, true);
        else
            m_creature->CastSpell(m_creature, SPELL_WHIRLWIND, true);

        SPELL_WHIRLWIND_Timer = 20000;
        }else SPELL_WHIRLWIND_Timer -=diff;
		
        DoMeleeAttackIfReady();    
    }

    void JustDied(Unit* killer)  
    {
        DoScriptText(SAY_DEATH, m_creature);
    }

    void KilledUnit(Unit *victim)
    {
        if(victim == m_creature)
            return;
        switch(rand()%3)
        {
            case 0: DoScriptText(SAY_KILL_1, m_creature);break;
            case 1: DoScriptText(SAY_KILL_2, m_creature);break;
            case 2: DoScriptText(SAY_KILL_3, m_creature);break;
        }
    }
};

CreatureAI* GetAI_boss_skadi(Creature *pCreature)
{
    return new boss_skadiAI(pCreature);
}

void AddSC_boss_skadi()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_skadi";
    newscript->GetAI = &GetAI_boss_skadi;
    newscript->RegisterSelf();
}