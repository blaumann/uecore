/* Script Data Start
SDName: Boss urom
SDAuthor: LordVanMartin / Edited by Filipper
SD%Complete: Timers may be not blizzlike
SDComment: 
SDCategory: 
Script Data End */

/*** SQL START *** 
update creature_template set scriptname = 'boss_urom' where entry = '27655';
*** SQL END ***/
#include "precompiled.h"

//Spells
enum Spells
{
	SPELL_ARCANE_SHIELD						= 53813, //Dummy --> Channeled, shields the caster from damage.
	SPELL_EMPOWERED_ARCANE_EXPLOSION_N		= 51110, //Normal
	SPELL_EMPOWERED_ARCANE_EXPLOSION_H		= 59377, //Heroic
	SPELL_FROSTBOMB							= 51103,
	SPELL_SUMMON_MENAGERIE					= 50476, //Summons an assortment of creatures and teleports the caster to safety.
	SPELL_SUMMON_MENAGERIE_2				= 50495,
	SPELL_SUMMON_MENAGERIE_3				= 50496,
	SPELL_TELEPORT							= 51112, //Teleports to the center of Oculus
	SPELL_TIME_BOMB_N						= 51121, //Normal
	SPELL_TIME_BOMB_H						= 59376  //Heroic
};

enum Yell
{
	SAY_AGGRO			= -1999757,
	SAY_KILL_1			= -1999756,
	SAY_KILL_2			= -1999755,
	SAY_KILL_3			= -1999754,
	SAY_DEATH			= -1999753,
	SAY_EXPLOSION_1		= -1999752,
	SAY_EXPLOSION_2		= -1999751,
	SAY_SUMMON_1		= -1999750,
	SAY_SUMMON_2		= -1999739,
	SAY_SUMMON_3		= -1999748
};  

struct MANGOS_DLL_DECL boss_uromAI : public ScriptedAI
{
    boss_uromAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		Reset();
		HeroicMode = m_creature->GetMap()->IsHeroic();
	}

	bool HeroicMode;

	uint32 ShieldTimer;
	uint32 FrostbombTimer;
	uint32 TeleportTimer;
	uint32 ExplosionTimer;
	uint32 TimebombTimer;

	uint32 Attacked;

    void Reset() 
	{
		FrostbombTimer = 8000; // Timer may be not blizzlike
		TeleportTimer = 45000; // Timer may be not blizzlike
		TimebombTimer = 25000; // Timer may be not blizzlike

		Attacked = 0;
	}
    void Aggro(Unit* who) 
    {
		if (Attacked == 3)
			DoScriptText(SAY_AGGRO, m_creature);
		if (Attacked < 3)
		{
			if (Attacked == 2)
			{
				m_creature->CastSpell(m_creature, SPELL_SUMMON_MENAGERIE_3, true);
				DoScriptText(SAY_SUMMON_1, m_creature);
			}
			if (Attacked == 1)
			{
				m_creature->CastSpell(m_creature, SPELL_SUMMON_MENAGERIE, true);
				DoScriptText(SAY_SUMMON_2, m_creature);
			}
			if (Attacked == 0)
			{
				m_creature->CastSpell(m_creature, SPELL_SUMMON_MENAGERIE, true);
				DoScriptText(SAY_SUMMON_3, m_creature);
			}
			Attacked++;
		}
    }
    void AttackStart(Unit* who) {}
    void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

		if (Attacked == 3)
		{
			if (FrostbombTimer < diff)
			{
				m_creature->CastSpell(m_creature->getVictim(), SPELL_FROSTBOMB, true);
				FrostbombTimer = 8000;
			}else FrostbombTimer -=diff;

			if (TeleportTimer < diff)
			{
				m_creature->CastSpell(m_creature, SPELL_TELEPORT, true);
				m_creature->CastSpell(m_creature, SPELL_ARCANE_SHIELD, true);
				ExplosionTimer = 2500;
				if (ExplosionTimer < diff)
				{
					if (HeroicMode)
						m_creature->CastSpell(m_creature, SPELL_EMPOWERED_ARCANE_EXPLOSION_H, true);
					else m_creature->CastSpell(m_creature, SPELL_EMPOWERED_ARCANE_EXPLOSION_N, true); 
					switch(rand()%3)
					{
						case 0: DoScriptText(SAY_EXPLOSION_1, m_creature); break;
						case 1: DoScriptText(SAY_EXPLOSION_2, m_creature); break;
					}
				}else ExplosionTimer -=diff;
			}

			if (TimebombTimer < diff)
			{
				if (Unit *target = SelectUnit(SELECT_TARGET_RANDOM, 0))
				{
					if (HeroicMode)
						m_creature->CastSpell(target, SPELL_TIME_BOMB_H, true);
					else m_creature->CastSpell(target, SPELL_TIME_BOMB_N, true);
				}
				TimebombTimer = 20000;
			}else TimebombTimer -=diff;

		}
                
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

CreatureAI* GetAI_boss_urom(Creature* pCreature)
{
    return new boss_uromAI(pCreature);
}

void AddSC_boss_urom()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_urom";
    newscript->GetAI = GetAI_boss_urom;
    newscript->RegisterSelf();
}
