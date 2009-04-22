/* Script Data Start
SDName: Boss Mimiron
SDAuthor: Thyros
SD%Complete: 0
SDComment: Placeholder
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = 'boss_volkhan' where entry = '';
*** SQL END ***/
#include "precompiled.h"

//Spells
#define SPELL_HEAT                                  52387
#define SPELL_HEAT_2                                59528
#define SPELL_SHATTERING_STOMP                      52237
#define SPELL_SHATTERING_STOMP_2                    59529
#define SPELL_TEMPER                                52238 //Dummy ---> Strikes Volkhan's Anvil, creating a number of Molten Golems.

#define NPC_VOLKHANS_ANVIL                          28823
#define MOB_MOLTEN_GOLEM                            28695

//Yells
#define SAY_AGGRO                                -1999711
#define SAY_SLAY_1                               -1999710
#define SAY_SLAY_2                               -1999709
#define SAY_SLAY_3                               -1999708
#define SAY_DEATH                                -1999707
#define SAY_STOMP_1                              -1999706
#define SAY_STOMP_2                              -1999705
#define SAY_FORGE_1                              -1999703
#define SAY_FORGE_2                              -1999702

struct MANGOS_DLL_DECL boss_mimironAI : public ScriptedAI
{
    boss_mimironAI(Creature *c) : ScriptedAI(c) { Reset(); }

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

CreatureAI* GetAI_boss_mimiron(Creature *_Creature)
{
    return new boss_mimironAI (_Creature);
}

void AddSC_boss_mimiron()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_mimiron";
    newscript->GetAI = GetAI_boss_mimiron;
    newscript->RegisterSelf();
}
