/* Script Data Start
SDName: Boss Zuramat 
SDAuthor: Thyros, Klappstuhl
SD%Complete: 50
SDComment: Need´s Test
SDCategory: The Violet Hold
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = '' where entry = '';
*** SQL END ***/
#include "precompiled.h"

enum
{
    //Spells
    SPELL_SHROUD_OF_DARKNESS                   = 54524,
    SPELL_SUMMON_VOID_SENTRY                   = 54524,
    SPELL_VOID_SHIFT                           = 54524,

    NPC_VOID_SENTRY                            = 29364,

    //Yells
    SAY_AGGRO                                  = -1999585,
    SAY_SLAY_1                                 = -1999584,
    SAY_SLAY_2                                 = -1999583,
    SAY_SLAY_3                                 = -1999582,
    SAY_DEATH                                  = -1999581,
    SAY_SPAWN                                  = -1999580,
    SAY_SHIELD                                 = -1999579,
    SAY_WHISPER                                = -1999578
};

struct MANGOS_DLL_DECL boss_zuramatAI : public ScriptedAI
{
    boss_zuramatAI(Creature* pCreature) : ScriptedAI(pCreature)
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

CreatureAI* GetAI_boss_zuramat(Creature* pCreature)
{
    return new boss_zuramatAI(pCreature);
}

void AddSC_boss_zuramat()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_zuramat";
    newscript->GetAI = GetAI_boss_zuramat;
    newscript->RegisterSelf();
}
