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
SDName: Boss Palehoof
SD%Complete: 80
SDComment: Need's Test
SDCategory: Utgarde Keep: Utgarde Pinnacle
Script Data End */

#include "precompiled.h"

enum Spells
{
    SPELL_ARCING_SMASH                        = 48260,
    SPELL_IMPALE                              = 48261,
    SPELL_IMPALE_H                            = 59268,
    SPELL_WITHERING_ROAR                      = 48256,
    SPELL_WITHERING_ROAR_H                    = 59267
};

enum Yells
{
    SAY_AGGRO                                 = -1999660,
    SAY_SLAY_1                                = -1999659,
    SAY_SLAY_2                                = -1999658,
    SAY_DEATH                                 = -1999657
};

struct MANGOS_DLL_DECL boss_palehoofAI : public ScriptedAI
{
    boss_palehoofAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
	    Reset();
	    HeroicMode = m_creature->GetMap()->IsHeroic();
    }

    bool HeroicMode;

    uint32 SPELL_ARCING_SMASH_Timer;
    uint32 SPELL_IMPALE_Timer;
    uint32 SPELL_WITHERING_ROAR_Timer;

    void Reset() 
    {
       //These times are probably wrong
       SPELL_ARCING_SMASH_Timer = 8000;                         
       SPELL_IMPALE_Timer = 12000;
       SPELL_WITHERING_ROAR_Timer = 7000;
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

        if (SPELL_ARCING_SMASH_Timer < diff)
        {
            m_creature->CastSpell(m_creature, SPELL_ARCING_SMASH, true);
		
            SPELL_ARCING_SMASH_Timer = 8000;
        }else SPELL_ARCING_SMASH_Timer -=diff;

        if (SPELL_IMPALE_Timer < diff)
        {
            if (HeroicMode)
                if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                    DoCast(target,SPELL_IMPALE_H);
                else
                    if (Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
                        DoCast(target,SPELL_IMPALE);
            SPELL_IMPALE_Timer = 12000;
        }else SPELL_IMPALE_Timer -=diff;
		
        if (SPELL_WITHERING_ROAR_Timer < diff)
        {
            if (HeroicMode)
                m_creature->CastSpell(m_creature, SPELL_WITHERING_ROAR_H, true);
            else
                m_creature->CastSpell(m_creature, SPELL_WITHERING_ROAR, true);
            SPELL_WITHERING_ROAR_Timer = 7000;
        }else SPELL_WITHERING_ROAR_Timer -=diff;
		
        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)  
    {
        DoScriptText(SAY_DEATH, m_creature);
    }

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%2)
        {
            case 0:
                DoScriptText(SAY_SLAY_1, m_creature);
                break;
            case 1:
                DoScriptText(SAY_SLAY_2, m_creature);
                break;
        }
    }
};

CreatureAI* GetAI_boss_palehoof(Creature *pCreature)
{
    return new boss_palehoofAI(pCreature);
}

void AddSC_boss_palehoof()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_palehoof";
    newscript->GetAI = &GetAI_boss_palehoof;
    newscript->RegisterSelf();
}