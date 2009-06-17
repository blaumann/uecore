/* Script Data Start
SDName: Boss erekem
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
    SPELL_BLOODLUST                           = 54516,
    SPELL_BREAK_BONDS                         = 59463,
    SPELL_CHAIN_HEAL                          = 54481,
    SPELL_EARTH_SHIELD                        = 54479,
    SPELL_EARTH_SHOCK                         = 54511,
    SPELL_LIGHTNING_BOLT                      = 53044,
    SPELL_STORMSTRIKE                         = 51876,

    //Yells
    SAY_AGGRO                                 = -1999612,
    SAY_SLAY_1                                = -1999611,
    SAY_SLAY_2                                = -1999610,
    SAY_SLAY_3                                = -1999609,
    SAY_DEATH                                 = -1999608,
    SAY_SPAWN                                 = -1999607,
    SAY_ADD_KILED                             = -1999606,
    SAY_BOTH_ADDS_KILED                       = -1999605
};

struct MANGOS_DLL_DECL boss_erekemAI : public ScriptedAI
{
    boss_erekemAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        //pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
		Reset();
		HeroicMode = m_creature->GetMap()->IsHeroic();
	}

    bool HeroicMode;

    uint32 BLOODLUST_Timer;
	uint32 BREAK_BONDS_Timer; 
    uint32 CHAIN_HEAL_Timer;
    uint32 EARTH_SHIELD_Timer;
    uint32 EARTH_SHOCK_Timer;
    uint32 LIGHTNING_BOLT_Timer;
    uint32 STORMSTRIKE_Timer;

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

CreatureAI* GetAI_boss_erekem(Creature* pCreature)
{
    return new boss_erekemAI(pCreature);
}

void AddSC_boss_erekem()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_erekem";
    newscript->GetAI = GetAI_boss_erekem;
    newscript->RegisterSelf();
}
