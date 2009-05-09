/* 
##############################
 Archbishop Benedictus v 2.0
##############################

by Myav 
*/

#include "precompiled.h"
#include "../creature/simple_ai.h"

#define GENERIC_CREATURE_COOLDOWN 5000

struct MANGOS_DLL_DECL archbishop_benedictusAI : public ScriptedAI
{
    archbishop_benedictusAI(Creature *c) : ScriptedAI(c) {Reset(); ZoneAttackMsgTimer = 0;}

    uint32 GlobalCooldown;      //This variable acts like the global cooldown that players have (1.5 seconds)
    uint32 Help;
    uint32 ZoneAttackMsgTimer;
    uint32 InnerTimer;
    Unit* enemy;
    Creature* Helper;

void Reset()
{
    GlobalCooldown = 0;
    Help = 45000 + rand()%30000;

    m_creature->SetMaxHealth(255000);
    m_creature->SetHealth(255000);
    m_creature->SetMaxPower(POWER_MANA,180000);
    m_creature->SetPower(POWER_MANA,180000);
    m_creature->SetArmor(5720);
    m_creature->SetResistance(SPELL_SCHOOL_NORMAL,810);
    m_creature->SetResistance(SPELL_SCHOOL_NATURE,810);
    m_creature->SetResistance(SPELL_SCHOOL_HOLY,810);
    m_creature->SetResistance(SPELL_SCHOOL_FIRE,810);
    m_creature->SetResistance(SPELL_SCHOOL_FROST,810);
    m_creature->SetResistance(SPELL_SCHOOL_SHADOW,810);
    m_creature->SetResistance(SPELL_SCHOOL_ARCANE,810);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISARM, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, true);
    //m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CONFUSED, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM , true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR , true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SILENCE, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DAZE, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SLEEP, true);
    m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_BANISH, true);
    m_creature->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND,BASE_VALUE,+3000,true);
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

    if (InnerTimer > diff)
        InnerTimer -= diff;
    else InnerTimer = 0;

    if(!m_creature->isAlive())
        return;

    if(!m_creature->HasAura(25431,0) && InnerTimer < diff && !m_creature->HasAura(27173,0) && !m_creature->HasAura(20924,0))
    {
     InnerTimer = 5000;
     DoCast(m_creature, 25431);
     return;
    }
    if(!m_creature->HasAura(25312,0))
    {
     DoCast(m_creature, 25312);
     return;
    }
    if(!m_creature->HasAura(25431,0))
    {
     DoCast(m_creature, 25431);
     return;
    }
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

    //If we are within range melee the target
    if( m_creature->IsWithinDistInMap(m_creature->getVictim(), ATTACK_DISTANCE))
    {
        //Make sure our attack is ready and we arn't currently casting
        if( m_creature->isAttackReady() && !m_creature->IsNonMeleeSpellCasted(false))
        {
           int Change = 0;
           int info = NULL;

                 if(enemy)
                  {
                   switch(rand()%9)
                   {
               case 0:
                  info = 32375;
                  break;
               case 1:
                    info = 33206;
                    Change = 1;
                    break;
               case 2:
                    info = 10060;
                    Change = 1;
                    break;
               case 3:
                    info = 41373;
                    Change = 1;
                    break;
               case 4:
                    info = 34866;
                    Change = 1;
                    break;
               case 5:
                    info = 41380;
                    break;
               case 6:
                    info = 37260;
                    Change = 1;
                    break;
               case 7:
                    info = 41471;
                    break;
               case 8:
                    info = 39013;
                    Change = 1;
                    break;
               }//switch
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
CreatureAI* GetAI_cathedral_of_light(Creature *_Creature)
{
    SimpleAI* ai = new SimpleAI (_Creature);

    uint32 CreatureID = _Creature->GetEntry();

    ai->m_creature->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_INTERRUPT_CAST, true);
    ai->m_creature->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);

    switch (CreatureID) 
    {
        //Duthorian Rall
    case 6171: 
        ai->Spell[0].Enabled = true;               
        ai->Spell[0].Spell_Id = 27155;      //Seal     
        ai->Spell[0].Cooldown = 30000;                 
        ai->Spell[0].First_Cast = 500;             
        ai->Spell[0].Cast_Target_Type = CAST_SELF;  

        ai->Spell[1].Enabled = true;               
        ai->Spell[1].Spell_Id = 10308;      //Hammer     
        ai->Spell[1].Cooldown = 45000;                 
        ai->Spell[1].First_Cast = 10000;             
        ai->Spell[1].Cast_Target_Type = CAST_HOSTILE_TARGET;  

        ai->Spell[2].Enabled = true;               
        ai->Spell[2].Spell_Id = 27141;      //Bless     
        ai->Spell[2].Cooldown = 120000;                 
        ai->Spell[2].First_Cast = 5000;             
        ai->Spell[2].Cast_Target_Type = CAST_SELF;  

        ai->Spell[3].Enabled = true;               
        ai->Spell[3].Spell_Id = 33072;      //Shock     
        ai->Spell[3].Cooldown = 20000;                 
        ai->Spell[3].First_Cast = 15000;             
        ai->Spell[3].Cast_Target_Type = CAST_HOSTILE_TARGET;  

        ai->Spell[4].Enabled = true;               
        ai->Spell[4].Spell_Id = 27136;      //Heal     
        ai->Spell[4].Cooldown = 15000;                 
        ai->Spell[4].First_Cast = 20000;             
        ai->Spell[4].Cast_Target_Type = CAST_SELF;

        ai->Spell[5].Enabled = true;               
        ai->Spell[5].Spell_Id = 35396;      //Strike     
        ai->Spell[5].Cooldown = 15000;                 
        ai->Spell[5].First_Cast = 30000;             
        ai->Spell[5].Cast_Target_Type = CAST_HOSTILE_TARGET;
        break;

        //High Priestess Laurena
    case 376: 
        ai->Spell[0].Enabled = true;               
        ai->Spell[0].Spell_Id = 25431;      //Inner     
        ai->Spell[0].Cooldown = 120000;                 
        ai->Spell[0].First_Cast = 500;             
        ai->Spell[0].Cast_Target_Type = CAST_SELF;  

        ai->Spell[1].Enabled = true;               
        ai->Spell[1].Spell_Id = 27801;      //Holy Nova     
        ai->Spell[1].Cooldown = 30000;                 
        ai->Spell[1].First_Cast = 10000;             
        ai->Spell[1].Cast_Target_Type = CAST_HOSTILE_TARGET;  

        ai->Spell[2].Enabled = true;               
        ai->Spell[2].Spell_Id = 25218;      //Shield     
        ai->Spell[2].Cooldown = 15000;                 
        ai->Spell[2].First_Cast = 5000;             
        ai->Spell[2].Cast_Target_Type = CAST_SELF;  

        ai->Spell[3].Enabled = true;               
        ai->Spell[3].Spell_Id = 25364;      //Smite     
        ai->Spell[3].Cooldown = 20000;                 
        ai->Spell[3].First_Cast = 15000;             
        ai->Spell[3].Cast_Target_Type = CAST_HOSTILE_TARGET;  

        ai->Spell[4].Enabled = true;               
        ai->Spell[4].Spell_Id = 34866;      //Circle Heal     
        ai->Spell[4].Cooldown = 15000;                 
        ai->Spell[4].First_Cast = 20000;             
        ai->Spell[4].Cast_Target_Type = CAST_SELF;

        ai->Spell[5].Enabled = true;               
        ai->Spell[5].Spell_Id = 25222;      //Renew     
        ai->Spell[5].Cooldown = 25000;                 
        ai->Spell[5].First_Cast = 25000;             
        ai->Spell[5].Cast_Target_Type = CAST_SELF;

        ai->Spell[6].Enabled = true;               
        ai->Spell[6].Spell_Id = 25314;      //Heal     
        ai->Spell[6].Cooldown = 15000;                 
        ai->Spell[6].First_Cast = 30000;             
        ai->Spell[6].Cast_Target_Type = CAST_SELF;

        ai->Spell[7].Enabled = true;               
        ai->Spell[7].Spell_Id = 25308;      //Prayer of Healing     
        ai->Spell[7].Cooldown = 25000;                 
        ai->Spell[7].First_Cast = 35000;             
        ai->Spell[7].Cast_Target_Type = CAST_SELF;
        break;
    }

    ai->Reset();

    return ai;
}
CreatureAI* GetAI_archbishop_benedictus(Creature *_Creature)
{
    return new archbishop_benedictusAI (_Creature);
}

void AddSC_archbishop_benedictus()
{   
    Script *newscript;

    newscript = new Script;
    newscript->Name = "archbishop_benedictus";
    newscript->GetAI = &GetAI_archbishop_benedictus;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "cathedral_of_light";
    newscript->GetAI = &GetAI_cathedral_of_light;
    newscript->RegisterSelf();
}
