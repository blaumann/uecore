/* Script Data Start
SDName: Boss ichoron
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
    SPELL_DRAINED                           = 59820,
    SPELL_FRENZY                            = 54312,
    SPELL_PROTECTIVE_BUBBLE                 = 54306,
    SPELL_WATER_BLAST                       = 54237,
    SPELL_WATER_BOLT_VOLLEY                 = 54241,          

    //Yells
    SAY_AGGRO                               = -1999604,
    SAY_SLAY_1                              = -1999603,
    SAY_SLAY_2                              = -1999602,
    SAY_SLAY_3                              = -1999601,
    SAY_DEATH                               = -1999600,
    SAY_SPAWN                               = -1999599,
    SAY_ENRAGE                              = -1999598,
    SAY_SHATTER                             = -1999597,
    SAY_BUBBLE                              = -1999596
};

struct MANGOS_DLL_DECL boss_ichoronAI : public ScriptedAI
{
    boss_ichoronAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
        //pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
		HeroicMode = m_creature->GetMap()->IsHeroic();
	}
    
    bool HeroicMode;

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

CreatureAI* GetAI_boss_ichoron(Creature* pCreature)
{
    return new boss_ichoronAI(pCreature);
}

void AddSC_boss_ichoron()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_ichoron";
    newscript->GetAI = GetAI_boss_ichoron;
    newscript->RegisterSelf();
}
