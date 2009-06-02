/* Script Data Start
SDName: Boss Lavanthor
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
    SPELL_CAUTERIZING_FLAMES                   = 59466,
    SPELL_FIREBOLT                             = 54235,
    SPELL_FLAME_BREATH                         = 54282,
    SPELL_LAVA_BURN                            = 54249
};

struct MANGOS_DLL_DECL boss_lavanthorAI : public ScriptedAI
{
    boss_lavanthorAI(Creature* pCreature) : ScriptedAI(pCreature)
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

CreatureAI* GetAI_boss_lavanthor(Creature* pCreature)
{
    return new boss_lavanthorAI(pCreature);
}

void AddSC_boss_lavanthor()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_lavanthor";
    newscript->GetAI = GetAI_boss_lavanthor;
    newscript->RegisterSelf();
}
