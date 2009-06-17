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
SDName: Boss Svala
SD%Complete: 80
SDComment: Needs Test
SDCategory: Utgarde Keep: Utgarde Pinnacle
Script Data End */

#include "precompiled.h"

enum Spells
{
    SPELL_CALL_FLAMES                    = 48258,
    SPELL_RITUAL_OF_THE_SWORD            = 48276, //Effect #1 Teleport,  Effect #2 Dummy
    SPELL_SINSTER_STRIKE                 = 15667,
    SPELL_SINSTER_STRIKE_H               = 59409
};

enum Yells
{
    SAY_DIALOG_WITH_ARTHAS_1             = -1999635,
    SAY_DIALOG_WITH_ARTHAS_2             = -1999634,
    SAY_DIALOG_WITH_ARTHAS_3             = -1999633,
    SAY_AGGRO                            = -1999645,
    SAY_SLAY_1                           = -1999644,
    SAY_SLAY_2                           = -1999643,
    SAY_SLAY_3                           = -1999642,
    SAY_DEATH                            = -1999641,
    SAY_SACRIFICE_PLAYER_1               = -1999640,
    SAY_SACRIFICE_PLAYER_2               = -1999639,
    SAY_SACRIFICE_PLAYER_3               = -1999638,
    SAY_SACRIFICE_PLAYER_4               = -1999637,
    SAY_SACRIFICE_PLAYER_5               = -1999636
};

struct MANGOS_DLL_DECL boss_svalaAI : public ScriptedAI
{
    boss_svalaAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        Reset();
        HeroicMode = m_creature->GetMap()->IsHeroic();
    } 
    
    bool HeroicMode;

    uint32 SPELL_CALL_FLAMES_Timer;
    uint32 SPELL_RITUAL_OF_THE_SWORD_Timer;
    uint32 SPELL_SINSTER_STRIKE_Timer;

    void Reset() 
    {
       //These times are probably wrong
       SPELL_CALL_FLAMES_Timer = 8000;                         
       SPELL_RITUAL_OF_THE_SWORD_Timer = 18000;
       SPELL_SINSTER_STRIKE_Timer = 12000;
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
		
        if (SPELL_CALL_FLAMES_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_CALL_FLAMES);

            SPELL_CALL_FLAMES_Timer =8000;
        }else SPELL_CALL_FLAMES_Timer -=diff;
		
        if (SPELL_RITUAL_OF_THE_SWORD_Timer < diff)
        {
            if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(target,SPELL_RITUAL_OF_THE_SWORD);

            SPELL_RITUAL_OF_THE_SWORD_Timer =18000;
        }else SPELL_RITUAL_OF_THE_SWORD_Timer -=diff;
		
        if (SPELL_SINSTER_STRIKE_Timer < diff)
        {
            if (HeroicMode)
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_SINSTER_STRIKE_H);
                else
                    if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                        DoCast(target,SPELL_SINSTER_STRIKE);
            SPELL_SINSTER_STRIKE_Timer = 12000;
        }else SPELL_SINSTER_STRIKE_Timer -=diff;

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
            case 0:
                DoScriptText(SAY_SLAY_1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_SLAY_2, m_creature);
                break;
            case 2:
                DoScriptText(SAY_SLAY_3, m_creature);
                break;
        }
    }
};

CreatureAI* GetAI_boss_svala(Creature *pCreature)
{
    return new boss_svalaAI(pCreature);
}

void AddSC_boss_svala()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_svala";
    newscript->GetAI = &GetAI_boss_svala;
    newscript->RegisterSelf();
}