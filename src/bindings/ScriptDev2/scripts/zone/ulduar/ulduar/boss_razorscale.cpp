/* Script Data Start
SDName: Boss Razorscale
SDAuthor: Thyros
SD%Complete: 0
SDComment: Placeholder
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = 'boss_ionar' where entry = '';
*** SQL END ***/
#include "precompiled.h"

//Spells
#define SPELL_BALL_LIGHTNING                      52780
#define SPELL_BALL_LIGHTNING_2                    59800 
#define SPELL_DISPERSE                            52770 //Disperse into Sparks of Ionar.
#define SPELL_STATIC_OVERLOAD                     52658 //Effect    Apply Aura: Periodic Trigger Interval: 2 seconds Spell 52659    
#define SPELL_STATIC_OVERLOAD_2                   52658 //Effect    Apply Aura: Periodic Trigger Interval: 2 seconds Spell 59796

//Spark of Ionar spells
#define NPC_SPARK_OF_IONAR                        28962 //invulnerable
#define SPELL_ARCING_BURN                         52617
#define SPELL_ARCING_BURN_2                       59834

//Yell
#define SAY_AGGRO                              -1999731
#define SAY_SLAY_1                             -1999730
#define SAY_SLAY_2                             -1999729
#define SAY_SLAY_3                             -1999728
#define SAY_DEATH                              -1999727
#define SAY_SPLIT_1                            -1999726
#define SAY_SPLIT_2                            -1999725

//he does "morph" every about 25% into 4 sparks of ionar that chase people around, they r slow and easily avoidable.

struct MANGOS_DLL_DECL boss_razorscaleAI : public ScriptedAI
{
    boss_razorscaleAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    void Reset() {}
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

CreatureAI* GetAI_boss_razorscale(Creature* pCreature)
{
    return new boss_razorscaleAI(pCreature);
}

void AddSC_boss_razorscale()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="example_boss_razorscale";
    newscript->GetAI = GetAI_boss_razorscale;
    newscript->RegisterSelf();
}
