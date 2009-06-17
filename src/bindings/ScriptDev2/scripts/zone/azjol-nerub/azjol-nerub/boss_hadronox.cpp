/* Script Data Start
SDName: Boss hadronox
SDAuthor: LordVanMartin
SD%Complete: 
SDComment: 
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = 'boss_hadronox' where entry = '';
*** SQL END ***/
#include "precompiled.h"

//Spells
#define SPELL_LEECH_POISON                            53030
#define SPELL_ACID_CLOUD                              53400
//#define SPELL_PIERCE_ARMOR                            
#define SPELL_WEB_GRAB                                53406

struct MANGOS_DLL_DECL boss_hadronoxAI : public ScriptedAI
{
    boss_hadronoxAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    void Reset() {}
    void Aggro(Unit* who) {}
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;
            
        DoMeleeAttackIfReady();
    }
    void JustDied(Unit* killer)  {}
};

CreatureAI* GetAI_boss_hadronox(Creature* pCreature)
{
    return new boss_hadronoxAI(pCreature);
}

void AddSC_boss_hadronox()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_hadronox";
    newscript->GetAI = GetAI_boss_hadronox;
    newscript->RegisterSelf();
}
