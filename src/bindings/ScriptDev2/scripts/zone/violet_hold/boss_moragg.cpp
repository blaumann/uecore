/* Script Data Start
SDName: Boss moragg
SDAuthor: Thyros, Klappstuhl
SD%Complete: 50
SDComment: Need's Test
SDCategory: The Violet Hold
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = '' where entry = '';
*** SQL END ***/
#include "precompiled.h"

enum
{
    //Spells
    SPELL_CORROSICE_SALIVA                   = 54527,
    SPELL_OPTIC_LINK                         = 54396
};

struct MANGOS_DLL_DECL boss_moraggAI : public ScriptedAI
{
    boss_moraggAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        //pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
		HeroicMode = m_creature->GetMap()->IsHeroic();
	}
    
    bool HeroicMode;

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
    void JustDied(Unit* killer) {}
};

CreatureAI* GetAI_boss_moragg(Creature* pCreature)
{
    return new boss_moraggAI(pCreature);
}

void AddSC_boss_moragg()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_moragg";
    newscript->GetAI = GetAI_boss_moragg;
    newscript->RegisterSelf();
}
