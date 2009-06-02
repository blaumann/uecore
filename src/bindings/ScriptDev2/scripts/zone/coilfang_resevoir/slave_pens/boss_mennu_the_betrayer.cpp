/* Copyright © 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.* See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA* 02111-1307* USA
*/

/* ScriptData
SDName: Boss Mennu the Betrayer
SD%Complete: 100
SDComment:
Author: Klappstuhl, Thyros
SDCategory: Coilfang Resevoir, Slave Pens
EndScriptData */

#include "precompiled.h"
#include "sc_creature.h"

enum Spells
{
    //Spells
    SPELL_MENNUS_HEALING_WARD                 = 34977,
    SPELL_TAINTED_EARTHGRAB_TOTEM             = 31981,
    SPELL_TAINTED_STONESKIN_TOTEM             = 31985,
    SPELL_CORRUPTED_NOVA_TOTEM                = 23419,
    SPELL_LIGHTNING_BOLT                      = 36152 
};

struct MANGOS_DLL_DECL boss_mennu_the_betrayerAI : public ScriptedAI
{
    boss_mennu_the_betrayerAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        Reset();
	}
    
    uint32 m_uiHealing_Ward_Timer;
    uint32 m_uiTainted_Earthgrab_Timer;
    uint32 m_uiTainted_Stoneskin_Timer;
    uint32 m_uiCorrupted_Nova_Timer;
    uint32 m_uiLightning_Bolt_Timer;
    uint32 CheckTether;
    bool OneTime;

    void Reset()
    {
        m_uiHealing_Ward_Timer = 1000;
        m_uiTainted_Stoneskin_Timer = 1500;
        m_uiTainted_Earthgrab_Timer = 2000;
        m_uiCorrupted_Nova_Timer = 2500;
        m_uiLightning_Bolt_Timer = 7000;
        CheckTether;
        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop();
  
        OneTime = true;
    }

    void AttackStart(Unit *who)
    {
        if (!who)
            return;
        if (who->isTargetableForAttack() && who != m_creature)
          AttackStart(who);
        
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;

        if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
         {
            float attackRadius = m_creature->GetAttackDistance(who);
            if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= CREATURE_Z_ATTACK_RANGE && m_creature->IsWithinLOSInMap(who))
            {
                if(who->HasStealthAura())
                    who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH) ;
                
                  if (OneTime)
                    switch (rand()%3)
                    {
                    case 0:
                      // The work must continue!
                      DoPlaySoundToSet(m_creature,10376);
                      break;
                    case 1:
                      //You brought this on yourselves!
                      DoPlaySoundToSet(m_creature,10378);
                      break;
                    case 2:
                      //Don't make me kill you!
                      DoPlaySoundToSet(m_creature,10379);
                      break;
                    }
               OneTime = false;
               
               AttackStart(who);
            }
        }
     }

    void UpdateAI(const uint32 diff)
    { 
         //Return since we have no target 
         if (!m_creature->SelectHostilTarget())
            return;

         //Check if we have a current target
         if( m_creature->getVictim() && m_creature->isAlive())
         {  
            if (m_uiCorrupted_Nova_Timer < diff)
              {
                DoCast(m_creature, SPELL_CORRUPTED_NOVA_TOTEM);
                m_uiCorrupted_Nova_Timer = (rand()%10000) + 20000;
              }
             else m_uiCorrupted_Nova_Timer -= diff;
              
            if (m_uiTainted_Earthgrab_Timer < diff)
              {
                DoCast(m_creature, SPELL_TAINTED_EARTHGRAB_TOTEM);
                m_uiTainted_Earthgrab_Timer = (rand()%10000) + 20000;
              }
             else m_uiTainted_Earthgrab_Timer -= diff;
           
            if (m_uiHealing_Ward_Timer < diff)
             {
               DoCast(m_creature, SPELL_MENNUS_HEALING_WARD);
               m_uiHealing_Ward_Timer = (rand()%10000) + 20000;
             }
            else m_uiHealing_Ward_Timer -= diff;

             if (m_uiTainted_Stoneskin_Timer < diff)
              {
                DoCast(m_creature, SPELL_TAINTED_STONESKIN_TOTEM);
                m_uiTainted_Stoneskin_Timer = (rand()%10000) + 20000;;
              }
             else m_uiTainted_Stoneskin_Timer -= diff;
              
             if (m_uiLightning_Bolt_Timer < diff)
              {
                DoCast(m_creature, SPELL_LIGHTNING_BOLT);
                m_uiTainted_Stoneskin_Timer = (rand()%10000) + 5000;;
              }
             else m_uiLightning_Bolt_Timer -= diff;
            }
            DoMeleeAttackIfReady();
      }
}; 

CreatureAI* GetAI_boss_mennu_the_betrayer(Creature* pCreature)
{
    return new boss_mennu_the_betrayerAI(pCreature);
}

void AddSC_boss_mennu_the_betrayer()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_mennu_the_betrayer";
    newscript->GetAI = &GetAI_boss_mennu_the_betrayer;
    newscript->RegisterSelf();
}