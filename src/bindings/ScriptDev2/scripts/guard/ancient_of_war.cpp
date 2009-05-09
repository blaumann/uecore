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
SDName: Guards
SD%Complete: 100
SDComment:
SDCategory: Guards
EndScriptData */

#include "precompiled.h"

#define GENERIC_CREATURE_COOLDOWN 5000

struct MANGOS_DLL_DECL ancient_of_warAI : public ScriptedAI
{
    ancient_of_warAI(Creature *c) : ScriptedAI(c) {Reset(); ZoneAttackMsgTimer = 0;}

    uint32 GlobalCooldown;      //This variable acts like the global cooldown that players have (1.5 seconds)
    uint32 Help;
    uint32 ZoneAttackMsgTimer;
    Unit* enemy;
    Creature* Helper;

void Reset()
{
    GlobalCooldown = 0;
    Help = 45000 + rand()%30000;

    if(m_creature->GetEntry() == 3469)
       m_creature->SetMaxHealth(167000);
     else m_creature->SetMaxHealth(250000);
    if(m_creature->GetEntry() == 3469)
       m_creature->SetHealth(167000);
     else m_creature->SetMaxHealth(250000);
    m_creature->SetArmor(19200);
    m_creature->SetResistance(SPELL_SCHOOL_NORMAL,810);
    m_creature->SetResistance(SPELL_SCHOOL_NATURE,1620);
    m_creature->SetResistance(SPELL_SCHOOL_HOLY,810);
    m_creature->SetResistance(SPELL_SCHOOL_FIRE,270);
    m_creature->SetResistance(SPELL_SCHOOL_FROST,810);
    m_creature->SetResistance(SPELL_SCHOOL_SHADOW,810);
    m_creature->SetResistance(SPELL_SCHOOL_ARCANE,810);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SLEEP, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SILENCE, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DAZE, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_KNOCKOUT, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
    m_creature->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND,BASE_VALUE,+3500,true);
}

void Aggro(Unit *who)
{
    //Send Zone Under Attack message to the LocalDefense and WorldDefense Channels
    if (who->GetTypeId() == TYPEID_PLAYER && !ZoneAttackMsgTimer)
    {
        m_creature->SendZoneUnderAttackMessage((Player*)who);
        ZoneAttackMsgTimer = 30000;
    }
}

void wood()
{
       float x;
       float y;
       float z;
       float X;
       float Y;
       float Z;
       m_creature->GetPosition(x,y,z);
       m_creature->getVictim()->GetPosition(X,Y,Z);
       if(x > X)
           X = x + 20 + 10 - rand()%20;
       else
           X = x - 20 + 10 - rand()%20;
       if(y > Y)
           Y = y + 20 + 10 - rand()%20;
       else
           Y = y - 20 + 10 - rand()%20;
       m_creature->GetRespawnCoord(x,y,z);        
       Helper = DoSpawnCreature(4423, (float) (X - x), (float) (Y - y), (float) (Z -z), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
       if(Helper && enemy)
          ((CreatureAI*)Helper->AI())->AttackStart(enemy); 
}

void UpdateAI(const uint32 diff)
{
    //Always decrease our global cooldown first
    if (GlobalCooldown > diff)
        GlobalCooldown -= diff;
    else GlobalCooldown = 0;

    //Always decrease ZoneAttackMsgTimer
    if (ZoneAttackMsgTimer > diff)
        ZoneAttackMsgTimer -= diff;
    else ZoneAttackMsgTimer = 0;

    if(!m_creature->isAlive())
        return;

    //Return since we have no target
    if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
        return;

    Unit *target = m_creature->getVictim();

       if(target == SelectUnit(SELECT_TARGET_TOPAGGRO,0) && !target->isAlive() && !m_creature->IsNonMeleeSpellCasted(false))
       {
          Unit* target2 = NULL;
          target2 = SelectUnit(SELECT_TARGET_TOPAGGRO,1);
          m_creature->getThreatManager().modifyThreatPercent(target,-100);
          if(target2 && target2->isAlive())
              {
                 m_creature->AddThreat(target2,1);
                 m_creature->Attack(target2,true);
                 AttackStart(target2);
                 return;
              }
          else
          {
              Reset();
              return;
          }
       }

    if(m_creature->IsHostileTo(target))
           enemy = target;

    if(enemy)
        if(!enemy->isAlive())
            enemy = NULL;


    //Always decrease Help when in combat
    if (Help > diff)
        Help -= diff;
    else Help = 0;

    if(!Help && m_creature->GetEntry() == 3469)
    {
       for(int i = 0; i < 5;i++)
       {
            wood();
       }
       Help = 60000 + rand()%45000;
    }

    //If we are within range melee the target
    if( m_creature->IsWithinDistInMap(m_creature->getVictim(), ATTACK_DISTANCE))
    {
        //Make sure our attack is ready and we arn't currently casting
        if( m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
        {
           int Change = 0;
           int info = NULL;

            if(!m_creature->HasAura(25640,0))
            {
                info = 25640;
                Change = 1;
            }
            else
            {
                 if(enemy)
                  {
                   switch(rand()%5)
                   {
               case 0:
                  info = 22924;
                  break;
               case 1:
                    info = 35244;
                    break;
               case 2:
                    info = 24648;
                    break;
               case 3:
                    info = 40434;
                    break;
               case 4:
                    info = 37592;
                    break;
               }//switch
            }//if rage
            }
            if(m_creature->GetEntry() == 3468)
                info = NULL;
            //65% chance to replace our white hit with a spell
            if (info && rand() % 2 == 0 && !GlobalCooldown)
            {
                //Cast the spell   
                if (Change == 1)DoCast(m_creature, info);
                else DoCast(enemy, info);

                //Set our global cooldown
                GlobalCooldown = GENERIC_CREATURE_COOLDOWN;
            }//end 50% change
            else m_creature->AttackerStateUpdate(m_creature->getVictim());

            m_creature->resetAttackTimer();
        }//end attack ready
    }// end attack distance
/*    else 
    { 
     if(!m_creature->IsNonMeleeSpellCasted(false))
     {
         if ((*m_creature).GetMotionMaster()->top()->GetMovementGeneratorType()!=TARGETED_MOTION_TYPE)
         {
            (*m_creature).GetMotionMaster()->Clear(false);
            (*m_creature).GetMotionMaster()->MoveChase(m_creature->getVictim());
         }
     }
    }//end else */
}
};
CreatureAI* GetAI_ancient_of_war(Creature *_Creature)
{
    return new ancient_of_warAI (_Creature);
}

void AddSC_ancient_of_war()
{   
    Script *newscript;

    newscript = new Script;
    newscript->Name = "ancient_of_war";
    newscript->GetAI = &GetAI_ancient_of_war;
    newscript->RegisterSelf();
}
