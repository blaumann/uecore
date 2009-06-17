/* Script Data Start
SDName: Boss cyanigosa
SDAuthor: LordVanMartin
SD%Complete: 
SDComment: 
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = '' where entry = '';
*** SQL END ***/
#include "precompiled.h"

enum
{
    //Spells
    SPELL_ARCANE_VACUM                        = 58694,
    SPELL_BLIZZARD                            = 58693,
    SPELL_MANA_DESTRUCTION                    = 59374,
    SPELL_TAIL_SWEEP                          = 58690,
    SPELL_UNCONTROLLABLE_ENERGY               = 58688,

    //Yells
    SAY_AGGRO                                 = -1999622,
    SAY_SLAY_1                                = -1999621,
    SAY_SLAY_2                                = -1999620,
    SAY_SLAY_3                                = -1999619,
    SAY_DEATH                                 = -1999618,
    SAY_SPAWN                                 = -1999617,
    SAY_DISRUPTION                            = -1999616,
    SAY_BREATH_ATTACK                         = -1999615,
    SAY_SPECIAL_ATTACK_1                      = -1999614,
    SAY_SPECIAL_ATTACK_2                      = -1999613
};

struct MANGOS_DLL_DECL boss_cyanigosaAI : public ScriptedAI
{
    boss_cyanigosaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        //pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
        HeroicMode = m_creature->GetMap()->IsHeroic();
    }

    bool HeroicMode;

    //Timer
    uint32 ARCANE_VACUM_Timer;
    uint32 BLIZZARD_Timer;
    uint32 MANA_DESTRUCTION_Timer;
    uint32 TAIL_SWEEP_Timer;
    uint32 UNCONTROLLABLE_ENERGY_Timer;

    void Reset()
    {
       //Timers
       ARCANE_VACUM_Timer = 6000;
       BLIZZARD_Timer = 60000;
	   MANA_DESTRUCTION_Timer = 2000;
       TAIL_SWEEP_Timer = 1000;
       UNCONTROLLABLE_ENERGY_Timer = 20000;

       //if(pInstance)
           //pInstance->SetData(DATA_BOSS_CYANIGOSA, NOT_STARTED);
    }

    void Aggro(Unit* who) 
    {
        DoScriptText(SAY_AGGRO, m_creature);
    }
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;
                
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
            case 0: DoScriptText(SAY_SLAY_1, m_creature);break;
            case 1: DoScriptText(SAY_SLAY_2, m_creature);break;
            case 2: DoScriptText(SAY_SLAY_3, m_creature);break;
        }
    }
};

CreatureAI* GetAI_boss_cyanigosa(Creature* pCreature)
{
    return new boss_cyanigosaAI(pCreature);
}

void AddSC_boss_cyanigosa()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_cyanigosa";
    newscript->GetAI = &GetAI_boss_cyanigosa;
    newscript->RegisterSelf();
}
