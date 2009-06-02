/* Script Data Start
SDName: Boss drakos
SDAuthor: LordVanMartin
SD%Complete: 
SDComment: 
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = '' where entry = '';
*** SQL END ***/
#include "precompiled.h"

//Spells
enum Spells
{
	SPELL_MAGIC_PULL			= 51336,
	SPELL_THUNDERING_STOMP_N	= 50774,
	SPELL_THUNDERING_STOMP_H	= 59370
};

//Yell
enum Yell
{
	SAY_AGGRO			= -1999769,
	SAY_KILL_1			= -1999768,
	SAY_KILL_2			= -1999767,
	SAY_KILL_3			= -1999766,
	SAY_DEATH			= -1999765,
	SAY_PULL_1			= -1999764,
	SAY_PULL_2			= -1999763,
	SAY_PULL_3			= -1999762,
	SAY_PULL_4			= -1999761,
	SAY_STOMP_1			= -1999760,
	SAY_STOMP_2			= -1999759,
	SAY_STOMP_3			= -1999758
};

struct MANGOS_DLL_DECL boss_drakosAI : public ScriptedAI
{
    boss_drakosAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
		Reset();
		HeroicMode = m_creature->GetMap()->IsHeroic();
	}

	bool HeroicMode;

	uint32 StompTimer;
	uint32 PullTimer;

    void Reset() 
	{
		StompTimer = 10000; // Timer may be not blizzlike
		PullTimer = 15000;	// Timer may be not blizzlike
	}
    void Aggro(Unit* who) 
    {
		m_creature->CastSpell(m_creature, SPELL_MAGIC_PULL, true);
        DoScriptText(SAY_AGGRO, m_creature);
    }
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

		if (StompTimer < diff)
		{
			if (HeroicMode)
				m_creature->CastSpell(m_creature->getVictim(), SPELL_THUNDERING_STOMP_H, true);
			else
				m_creature->CastSpell(m_creature->getVictim(), SPELL_THUNDERING_STOMP_N, true);

			switch(rand()%3)
			{
				case 0: DoScriptText(SAY_STOMP_1, m_creature); break;
				case 1: DoScriptText(SAY_STOMP_2, m_creature); break;
				case 2: DoScriptText(SAY_STOMP_3, m_creature); break;
			}
			StompTimer = 7000;
		}else StompTimer -=diff;

		if (PullTimer < diff)
		{
			m_creature->CastSpell(m_creature, SPELL_MAGIC_PULL, true);

			switch(rand()%4)
			{
				case 0: DoScriptText(SAY_PULL_1, m_creature); break;
				case 1: DoScriptText(SAY_PULL_2, m_creature); break;
				case 2: DoScriptText(SAY_PULL_3, m_creature); break;
				case 3: DoScriptText(SAY_PULL_4, m_creature); break;
			}
		}else PullTimer -=diff;

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
            case 0: DoScriptText(SAY_KILL_1, m_creature);break;
            case 1: DoScriptText(SAY_KILL_2, m_creature);break;
            case 2: DoScriptText(SAY_KILL_3, m_creature);break;
        }
    }
};

CreatureAI* GetAI_boss_drakos(Creature* pCreature)
{
    return new boss_drakosAI(pCreature);
}

void AddSC_boss_drakos()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_drakos";
    newscript->GetAI = GetAI_boss_drakos;
    newscript->RegisterSelf();
}
