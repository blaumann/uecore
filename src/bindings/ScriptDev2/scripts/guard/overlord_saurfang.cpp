/* 
##############################
 High Overlord Saurfang v 1.0
 (Orgrimmar protector)
##############################

by Myav 
*/

#include "precompiled.h"

#define GENERIC_CREATURE_COOLDOWN 5000

struct MANGOS_DLL_DECL overlord_saurfangAI : public ScriptedAI
{
    overlord_saurfangAI(Creature *c) : ScriptedAI(c) {Reset(); ZoneAttackMsgTimer = 0;}

    uint32 GlobalCooldown;      //This variable acts like the global cooldown that players have (1.5 seconds)
    uint32 Help;
    uint32 ZoneAttackMsgTimer;
    Unit* enemy;
    Creature* Helper;

void Reset()
{
    GlobalCooldown = 0;
    Help = 45000 + rand()%30000;
    m_creature->SetMaxHealth(98000);
    m_creature->SetHealth(98000);
    m_creature->SetArmor(11520);
    m_creature->SetResistance(SPELL_SCHOOL_NORMAL,810);
    m_creature->SetResistance(SPELL_SCHOOL_NATURE,810);
    m_creature->SetResistance(SPELL_SCHOOL_HOLY,810);
    m_creature->SetResistance(SPELL_SCHOOL_FIRE,810);
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
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_KNOCKOUT, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
    m_creature->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND,BASE_VALUE,+2000,true);
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

void grunts()
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
       Helper = DoSpawnCreature(3296, (float) (X - x), (float) (Y - y), (float) (Z -z), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000);
       if(Helper && enemy)
          ((CreatureAI*)Helper->AI())->AttackStart(enemy); 
}

void JustDied(Unit*)
{
    GlobalCooldown = 0;
    Help = 45000 + rand()%30000;
    m_creature->RemoveAllAttackers();
    m_creature->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND,BASE_VALUE,+2000,false);
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

    if(!Help)
    {

       for(int i = 0; i < 4;i++)
       {
            grunts();
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

            if(!m_creature->HasAura(8269,0))
            {
                info = 8269;
                Change = 1;
            }
            else
            {
                 if(enemy)
                  {
                   switch(rand()%5)
                   {
               case 0:
                  info = 11430;
                  break;
               case 1:
                    info = 31955;
                    break;
               case 2:
                    info = 5164;
                    break;
               case 3:
                    info = 41400;
                    break;
               case 4:
                    info = 41197;
                    break;
               }//switch
            }//if rage
            }

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
CreatureAI* GetAI_overlord_saurfang(Creature *_Creature)
{
    return new overlord_saurfangAI (_Creature);
}

void AddSC_overlord_saurfang()
{   
    Script *newscript;

    newscript = new Script;
    newscript->Name = "overlord_saurfang";
    newscript->GetAI = &GetAI_overlord_saurfang;
    newscript->RegisterSelf();
}
