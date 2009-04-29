/* ScriptData
SDName: Boss_Eredar_Twins
SD%Complete: 100
SDComment:
    - Blaze Spell doenst Work
    - Some trigger Spells are only (good) workarounds
EndScriptData */

#include "precompiled.h"
#include "def_sunwell_plateau.h"

// Lady Sacrolash
#define SAY_INTRO                                -1580044
#define SAY_SACROLASH_SHADOW_NOVA                -1580045 //only if Alythess is not dead
#define SAY_SACROLASH_SISTER_ALYTHESS_DEAD       -1580046
#define SAY_SACROLASH_SAC_KILL_1                 -1580047
#define SAY_SACROLASH_SAC_KILL_2                 -1580048
#define SAY_SAC_DEAD                             -1580049
#define SAY_SACROLASH_ENRAGE                     -1580050

#define LADY_SACROLASH                  25165

#define SPELL_DARK_TOUCHED              45347
#define SPELL_SHADOW_BLADES             45248//10 secs
#define SPELL_DARK_STRIKE               45271
#define SPELL_SHADOW_NOVA               45329//30-35 secs
#define SPELL_CONFOUNDING_BLOW          45256//25 secs

#define MOB_SHADOW_IMAGE				25214
#define SPELL_SHADOW_FURY               45270
#define SPELL_IMAGE_VISUAL              45263

//enrage 6 minutes
#define SPELL_ENRAGE                    46587
//empower after sister is death
#define SPELL_EMPOWER                   45366

//Grand Warlock Alythess
#define SAY_ALYTHESS_CANFLAGRATION              -1580051 //only if Sacrolash is not dead
#define SAY_ALYTHESS_SISTER_SACROLASH_DEAD      -1580052
#define SAY_ALYTHESS_ALY_KILL_1                 -1580053
#define SAY_ALYTHESS_ALY_KILL_2                 -1580054
#define SAY_ALYTHESS_ALY_DEAD                   -1580055
#define SAY_ALYTHESS_BERSERK                    -1580056

// Don't move only spamm spells ...
#define GRAND_WARLOCK_ALYTHESS          25166

#define SPELL_PYROGENICS                45230//15secs
#define SPELL_FLAME_TOUCHED             45348
#define SPELL_CONFLAGRATION             45342//30-35 secs
#define SPELL_BLAZE                     45235//on main target every 3 secs
#define SPELL_FLAME_SEAR                46771
#define SPELL_BLAZE_SUMMON              45236 //187366
#define SPELL_BLAZE_BURN                45246 

/*######
## Boss Lady Sacrolash
######*/
struct MANGOS_DLL_DECL boss_sacrolashAI : public ScriptedAI
{
    boss_sacrolashAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;
    bool InCombat;
    bool sisterdeath;
    bool blades;

    uint32 darkstrike_timer;
    uint32 shadowblades_timer;
    uint32 shadownova_timer;
    uint32 confoundingblow_timer;
    uint32 shadowimage_timer;

    uint32 conflagration_timer;

    uint32 enrage_timer;

    void Reset() 
    {
        if(pInstance)
        {
            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_ALYTHESS));
            if (Temp)
                if (Temp->isDead())
                {
                    Temp->setDeathState(ALIVE);
                    ((Creature*)Temp)->AI()->EnterEvadeMode();
                }

            pInstance->SetData(DATA_SACROLASH_EVENT, NOT_STARTED);
        }

        InCombat = false;

        shadowblades_timer = 10000;
        shadownova_timer = 30000;
        confoundingblow_timer = 25000;
        shadowimage_timer = 30000;    
        conflagration_timer = 30000;
        sisterdeath = false;

        blades = false;
        darkstrike_timer = 5000;

        enrage_timer = 360000;

    }

    void Aggro(Unit *who) 
    {
        DoZoneInCombat();
        if(pInstance)
        {
            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_ALYTHESS));
            if (Temp)
            {
                Temp->getThreatManager().addThreat(who,0.0f);
                ((Creature*)Temp)->AI()->AttackStart(who);
            }

            pInstance->SetData(DATA_SACROLASH_EVENT, IN_PROGRESS);
        }
    }

    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        if (who == m_creature || who->GetTypeId() != TYPEID_PLAYER)
            return;

        if (m_creature->Attack(who, true))
        {
            m_creature->AddThreat(who, 0.0f);
            m_creature->SetInCombatWith(who);
            who->SetInCombatWith(m_creature);
            DoStartMovement(who);
        }
    }

    void KilledUnit(Unit *victim)
    {
        if(rand()%4 == 0)
        {
            switch (rand()%2)
            {
            case 0: DoScriptText(SAY_SACROLASH_SAC_KILL_1,m_creature); break;
            case 1: DoScriptText(SAY_SACROLASH_SAC_KILL_2,m_creature); break;
            }
        }
    }

    void JustDied(Unit* Killer)
    {
         // only if ALY death
        if (sisterdeath)
            DoScriptText(SAY_SAC_DEAD,m_creature);
        else
        {
            m_creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
            if(pInstance)
                pInstance->SetData(DATA_SACROLASH_EVENT, DONE);
        }
    }

    void UpdateAI(const uint32 diff) 
    {
        if(!sisterdeath)
        {
            if (pInstance)
            {
                Unit* Temp = NULL; 
                Temp = Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_ALYTHESS));
                if (Temp && Temp->isDead())
                {
                    DoScriptText(SAY_SACROLASH_SISTER_ALYTHESS_DEAD,m_creature);
                    sisterdeath = true;

                    m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                    DoCast(m_creature,SPELL_EMPOWER);
                } else if(Temp && Temp->isAlive())
                    Temp->AddThreat(m_creature->getVictim(), 0.0f);
            }
        }

        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if(sisterdeath)
        {
            if (conflagration_timer < diff)
            {
                if (!m_creature->IsNonMeleeSpellCasted(false))
                {
                    m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                    DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0),SPELL_CONFLAGRATION);
                    conflagration_timer = 30000+(rand()%5000);
                }
            }else conflagration_timer -= diff;
        }
        else
        {
            if(shadownova_timer < diff)
            {
                if (!m_creature->IsNonMeleeSpellCasted(false))
                {
                    DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0),SPELL_SHADOW_NOVA);

                    if(!sisterdeath)
                    {
                        //DoTextEmote("directs Shadow Nova at $N",target);
                        DoScriptText(SAY_SACROLASH_SHADOW_NOVA,m_creature);
                    }

                    shadownova_timer= 30000+(rand()%5000);
                }
            }else shadownova_timer -=diff;
        }

        if(confoundingblow_timer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0),SPELL_CONFOUNDING_BLOW);
                confoundingblow_timer = 20000 + (rand()%5000);
            }
        }else confoundingblow_timer -=diff;

        if(shadowimage_timer < diff)
        {
            Unit* target = NULL;
            Creature* temp = NULL;
            for(int i = 0;i<3;i++)
            {
                target = SelectUnit(SELECT_TARGET_RANDOM, 0);
                temp = DoSpawnCreature(MOB_SHADOW_IMAGE,0,0,0,0,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,10000);
                temp->AI()->AttackStart(target);
            }
            shadowimage_timer = 30000;
        }else shadowimage_timer -=diff;

        if(shadowblades_timer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                DoCast(m_creature,SPELL_SHADOW_BLADES);
                shadowblades_timer = 10000;
                blades = true;
                darkstrike_timer = 1000;
            }
        }else shadowblades_timer -=diff;

        if(blades && !m_creature->IsNonMeleeSpellCasted(false))
        {
            if (darkstrike_timer < diff)
            {
                Unit* Temp = NULL;
                std::list<HostilReference*>::iterator i = m_creature->getThreatManager().getThreatList().begin();
                for (; i != m_creature->getThreatManager().getThreatList().end(); ++i)
                {
                    Temp = Unit::GetUnit((*m_creature),(*i)->getUnitGuid());
                    if (Temp && Temp->GetTypeId() == TYPEID_PLAYER && m_creature->IsWithinDistInMap(Temp, 20))
                         DoCast(Temp,SPELL_DARK_STRIKE);
                }    
                blades = false;
                darkstrike_timer = 5000;
            }else darkstrike_timer -= diff;
        }

        if (enrage_timer < diff)
        {
            m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
            DoScriptText(SAY_SACROLASH_ENRAGE,m_creature);
            DoCast(m_creature,SPELL_ENRAGE);
            enrage_timer = 300000;
        }else enrage_timer -= diff;

        DoMeleeAttackIfReady();
    }
};

/*######
## Boss Grand Warlock Alythess
######*/
struct MANGOS_DLL_DECL boss_alythessAI : public ScriptedAI
{
    boss_alythessAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;
    bool InCombat;
    bool sisterdeath;
    bool blazesummon;
    uint64 blazetarget;

    uint32 conflagration_timer;
    uint32 blaze_timer;
    uint32 pyrogenics_timer;
    uint32 blazesummon_timer;

    uint32 shadownova_timer;
    uint32 flamesear_timer;

    uint32 enrage_timer;

    void Reset()
    {
        if(pInstance)
        {
            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SACROLASH));
            if (Temp)
                if (Temp->isDead())
                {
                    Temp->setDeathState(ALIVE);
                    ((Creature*)Temp)->AI()->EnterEvadeMode();
                }

            pInstance->SetData(DATA_ALYTHESS_EVENT, NOT_STARTED);
        }

        InCombat = false;
        conflagration_timer = 45000;
        blaze_timer = 1000;
        pyrogenics_timer = 15000;
        shadownova_timer = 40000;
        sisterdeath = false;
        enrage_timer = 360000;
        flamesear_timer = 15000;
    }

    void Aggro(Unit *who) 
    {
        DoScriptText(SAY_INTRO,m_creature);
        DoZoneInCombat();
        if(pInstance)
        {
            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SACROLASH));
            if (Temp && Temp->isAlive())
            {
                Temp->getThreatManager().addThreat(who,0.0f);
                ((Creature*)Temp)->AI()->AttackStart(who);
            }

            pInstance->SetData(DATA_ALYTHESS_EVENT, IN_PROGRESS);
        }
    }

    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        if (who == m_creature || who->GetTypeId() != TYPEID_PLAYER)
            return;

        if (m_creature->Attack(who, true))
        {
            m_creature->AddThreat(who, 0.0f);
            m_creature->SetInCombatWith(who);
            who->SetInCombatWith(m_creature);
            DoStartMovement(who);
        }
    }

    void KilledUnit(Unit *victim)
    {
        if(rand()%4 == 0)
        {
            switch (rand()%2)
            {
            case 0: DoScriptText(SAY_ALYTHESS_ALY_KILL_1,m_creature); break;
            case 1: DoScriptText(SAY_ALYTHESS_ALY_KILL_2,m_creature); break;
            }
        }
    }

    void JustDied(Unit* Killer)
    {
        if (sisterdeath)
            DoScriptText(SAY_ALYTHESS_ALY_DEAD,m_creature);
        else
        {
            m_creature->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE); 
            if(pInstance)
                pInstance->SetData(DATA_ALYTHESS_EVENT, DONE);
        }
    }

    void UpdateAI(const uint32 diff) 
    {
        if(!sisterdeath)
        {
            if (pInstance)
            {
                Unit* Temp = NULL; 
                Temp = Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SACROLASH));
                if (Temp && Temp->isDead())
                {
                    DoScriptText(SAY_ALYTHESS_SISTER_SACROLASH_DEAD,m_creature);
                    sisterdeath = true;

                    m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                    DoCast(m_creature,SPELL_EMPOWER);
                } else if(Temp && Temp->isAlive())
                    Temp->AddThreat(m_creature->getVictim(), 0.0f);
            }
        }

        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if(sisterdeath)
        {
            if(shadownova_timer < diff)
            {
                if (!m_creature->IsNonMeleeSpellCasted(false))
                {
                    DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0),SPELL_SHADOW_NOVA);
                    shadownova_timer= 30000+(rand()%5000);
                }
            }else shadownova_timer -=diff;
        }
        else 
        {
            if (conflagration_timer < diff)
            {
                if (!m_creature->IsNonMeleeSpellCasted(false))
                {
                    m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
                    DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0),SPELL_CONFLAGRATION);
                    conflagration_timer = 30000+(rand()%5000);

                    if(!sisterdeath)
                    {
                        //DoTextEmote("directs Conflagration at $N",target);
                        DoScriptText(SAY_ALYTHESS_CANFLAGRATION,m_creature);
                    }

                    blaze_timer = 4000;
                }
            }else conflagration_timer -= diff;
        }

        if (flamesear_timer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                DoCast(m_creature,SPELL_FLAME_SEAR);
                flamesear_timer = 15000;
            }
        }else flamesear_timer -=diff;

        if (pyrogenics_timer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                DoCast(m_creature,SPELL_PYROGENICS,true);
                pyrogenics_timer = 15000;
            }
        }else pyrogenics_timer -= diff;

        if (blaze_timer < diff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                blazetarget = m_creature->getVictim()->GetGUID();
                DoCast(m_creature->getVictim(),SPELL_BLAZE);
                blazesummon = false;

                blaze_timer = 3800;
                blazesummon_timer = 2600;
            }
        }else blaze_timer -= diff;

        if(!blazesummon)
        {
            if (blazesummon_timer < diff)
            {
                Unit* Temp = NULL;
                Temp = Unit::GetUnit((*m_creature),blazetarget);
                //if(Temp && Temp->isAlive())
                    //m_creature->SummonCreature(187366,Temp->GetPositionX(),Temp->GetPositionY(),Temp->GetPositionZ(),0,TEMPSUMMON_TIMED_DESPAWN,10000);
                Temp = SelectUnit(SELECT_TARGET_RANDOM, 0);
                if (rand()%2 == 0)
                    Temp->CastSpell(Temp,SPELL_FLAME_TOUCHED,true);
                blazesummon = true;
                blazesummon_timer = 2500;
            }else blazesummon_timer -= diff;
        }

        if (enrage_timer < diff)
        {
            m_creature->InterruptSpell(CURRENT_GENERIC_SPELL);
            DoScriptText(SAY_ALYTHESS_BERSERK,m_creature);
            DoCast(m_creature,SPELL_ENRAGE);
            enrage_timer = 300000;
        }else enrage_timer -= diff;
    }
};

/*######
## Mob shadow image
######*/
struct MANGOS_DLL_DECL mob_shadow_imageAI : public ScriptedAI
{
    mob_shadow_imageAI(Creature *c) : ScriptedAI(c) {Reset();}

    uint32 shadowfury_timer;
    uint32 touched_timer;
    uint32 kill_timer;

    void Reset() 
    {
        shadowfury_timer = 5000 + (rand()%15000);
        touched_timer = 1000;
        kill_timer = 15000;
        DoCast(m_creature,SPELL_IMAGE_VISUAL);
    }

    void UpdateAI(const uint32 diff) 
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if(touched_timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_DARK_TOUCHED,true);
            touched_timer = 3000;
        }else touched_timer -= diff;

        if(shadowfury_timer < diff)
        {
            DoCast(m_creature,SPELL_SHADOW_FURY);
            shadowfury_timer = 10000;
        }else shadowfury_timer -=diff;

        if(kill_timer < diff)
        {
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            kill_timer = 9999999;
        }else kill_timer -=diff;

        DoMeleeAttackIfReady();
    }
};

/*######
## Mob blaze fire
######*/
struct MANGOS_DLL_DECL mob_blaze_fireAI : public ScriptedAI
{
    mob_blaze_fireAI(Creature *c) : ScriptedAI(c) {Reset();}

    uint32 burn_timer;
    
    void Reset() 
    {
        burn_timer = 3000;

    }

    void AttackStart(Unit *who) {}
    void MoveInLineOfSight(Unit *who){}

    void UpdateAI(const uint32 diff) 
    {
        if(burn_timer < diff)
        {
            DoCast(m_creature,SPELL_BLAZE_BURN);
            burn_timer = 3000;
        }else burn_timer -=diff;
    }
};

CreatureAI* GetAI_boss_sacrolash(Creature *_Creature)
{
    return new boss_sacrolashAI (_Creature);
};

CreatureAI* GetAI_boss_alythess(Creature *_Creature)
{
    return new boss_alythessAI (_Creature);
};

CreatureAI* GetAI_mob_shadow_image(Creature *_Creature)
{
    return new mob_shadow_imageAI (_Creature);
};

CreatureAI* GetAI_mob_blaze_fire(Creature *_Creature)
{
    return new mob_blaze_fireAI (_Creature);
};

void AddSC_boss_eredar_twins()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_sacrolash";
    newscript->GetAI = &GetAI_boss_sacrolash;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_alythess";
    newscript->GetAI = &GetAI_boss_alythess;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shadow_image";
    newscript->GetAI = &GetAI_mob_shadow_image;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_blaze_fire";
    newscript->GetAI = &GetAI_mob_blaze_fire;
    newscript->RegisterSelf();
}
