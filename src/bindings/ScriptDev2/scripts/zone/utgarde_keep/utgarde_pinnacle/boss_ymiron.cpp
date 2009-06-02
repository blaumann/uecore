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
SDName: Boss Ymiron
SD%Complete: 80
SDComment: Need's Test
SDCategory: Utgarde Keep: Utgarde Pinnacle
Script Data End */

#include "precompiled.h"

enum Spells
{
    SPELL_BANE                              = 48294&59301,
    SPELL_DARK_SLASH                        = 48292,
    SPELL_FETID_ROT                         = 48291&59300,
    SPELL_SCREAMS_OF_THE_DEAD               = 51750,
    SPELL_SPIRIT_BURST                      = 48529&59305,
    SPELL_SPIRIT_STRIKE                     = 48423&59304
};

enum Yells
{
    SAY_AGGRO                               = -1999632,
    SAY_SLAY_1                              = -1999631,
    SAY_SLAY_2                              = -1999630,
    SAY_SLAY_3                              = -1999629,
    SAY_SLAY_4                              = -1999628,
    SAY_DEATH                               = -1999627,
    SAY_SUMMON_BJORN                        = -1999626,
    SAY_SUMMON_HALDOR                       = -1999625,
    SAY_SUMMON_RANULF                       = -1999624,
    SAY_SUMMON_TORGYN                       = -1999623
};

struct MANGOS_DLL_DECL boss_ymironAI : public ScriptedAI
{
    boss_ymironAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        HeroicMode = m_creature->GetMap()->IsHeroic();
    }
	
    bool HeroicMode;

    uint32 SPELL_BANE_Timer;
    uint32 SPELL_DARK_SLASH_Timer;
    uint32 SPELL_FETID_ROT_Timer;
    uint32 SPELL_SCREAMS_OF_THE_DEAD_Timer;
    uint32 SPELL_SPIRIT_BURST_Timer;
    uint32 SPELL_SPIRIT_STRIKE_Timer;

    void Reset() 
    {
       //These times are probably wrong
       SPELL_BANE_Timer = 10000;                         
       SPELL_DARK_SLASH_Timer = 18000;
       SPELL_FETID_ROT_Timer = 12000;
       SPELL_SCREAMS_OF_THE_DEAD_Timer = 20000;
       SPELL_SPIRIT_BURST_Timer = 15000;          
       SPELL_SPIRIT_STRIKE_Timer = 22000;
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

        if (SPELL_BANE_Timer < diff)
		{
            if (HeroicMode)
                m_creature->CastSpell(m_creature, SPELL_BANE, true);
            else 
                m_creature->CastSpell(m_creature, SPELL_BANE, true);

            SPELL_BANE_Timer = 22000;
        }else SPELL_BANE_Timer -=diff;
		
        if (SPELL_DARK_SLASH_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_DARK_SLASH);
			
            SPELL_DARK_SLASH_Timer = 18000;
        }else SPELL_DARK_SLASH_Timer -=diff;
		
        if (SPELL_SCREAMS_OF_THE_DEAD_Timer < diff)
        {
            m_creature->CastSpell(m_creature, SPELL_SCREAMS_OF_THE_DEAD, true);
			
            SPELL_SCREAMS_OF_THE_DEAD_Timer = 20000;
        }else SPELL_SCREAMS_OF_THE_DEAD_Timer  -=diff;
		
        if (SPELL_FETID_ROT_Timer < diff)
        {
            if (HeroicMode)
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_FETID_ROT);
                else
                    if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                        DoCast(target,SPELL_FETID_ROT);

            SPELL_FETID_ROT_Timer = 12000;
        }else SPELL_FETID_ROT_Timer -=diff;

        if (SPELL_SPIRIT_BURST_Timer < diff)
        {
            if (HeroicMode)
                m_creature->CastSpell(m_creature, SPELL_SPIRIT_BURST, true);
            else
                m_creature->CastSpell(m_creature, SPELL_SPIRIT_BURST, true);

            SPELL_SPIRIT_BURST_Timer = 15000;
        }else SPELL_SPIRIT_BURST_Timer -= diff;

        if (SPELL_SPIRIT_STRIKE_Timer < diff)
        {if (HeroicMode)
        if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0))
            DoCast(target, SPELL_SPIRIT_STRIKE);
        else
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0))
                DoCast(target, SPELL_SPIRIT_STRIKE);

        SPELL_SPIRIT_STRIKE_Timer = 22000;
        }else SPELL_SPIRIT_STRIKE_Timer -= diff;

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

        switch(rand()%4)
        {
            case 0:
                DoScriptText(SAY_SLAY_1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_SLAY_2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_SLAY_3, m_creature);
                break;
            case 3:
                DoScriptText(SAY_SLAY_4, m_creature);
                break;
        }
    }
};

CreatureAI* GetAI_boss_ymiron(Creature *pCreature)
{
    return new boss_ymironAI(pCreature);
}

void AddSC_boss_ymiron()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_ymiron";
    newscript->GetAI = GetAI_boss_ymiron;
    newscript->RegisterSelf();
}