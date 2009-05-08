/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: Boss_Salramm
SD%Complete: 100
SDComment: 
SDCategory: Caverns of Time, Culling of Stratholme
EndScriptData */

#include "precompiled.h"

#define SAY_SIGHT		-2500024
#define SAY_AGGRO		-2500025
#define SAY_SLAY1		-2500026
#define SAY_SLAY2		-2500027
#define SAY_SLAY3		-2500028
#define SAY_DIED		-2500029
#define SAY_STEAL1		-2500030
#define SAY_STEAL2		-2500031
#define SAY_STEAL3		-2500032
#define SAY_EXPLODE1	-2500033
#define SAY_EXPLODE2	-2500034
#define SAY_SUMMON1		-2500035
#define SAY_SUMMON2		-2500036

#define SPELL_BOLT		15232 // Schleudert einen Blitz aus dunkler Magie auf einen Feind und verursacht Schattenschaden.
#define SPELL_STEAL		52708 // Stiehlt das Fleisch des feindlichen Ziels, verringert seinen verursachten Schaden um 75% und erhöht den verursachten Schaden des Zaubernden um 75%.
#define SPELL_EXPLODE	52480 // Lässt einen nahen Ghul explodieren, verursacht bei feindlichen Zielen innerhalb von 10 Metern 3800 - 4200 Feuerschaden.
#define SPELL_SUMMON	52451 // Beschwört nahe des Zaubernden zwei Ghuldiener.

struct MANGOS_DLL_DECL boss_salrammAI : public ScriptedAI
{
	boss_salrammAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

	uint32 Steal_Timer;
	uint32 Bolt_Timer;
	uint32 Explode_Timer;
	uint32 Summon_Timer;

	void Reset()
	{
		Steal_Timer = 11000;
		Bolt_Timer = 3000;
		Explode_Timer = 21000;
		Summon_Timer = 7000;
	}

	void MoveInLineOfSight(Unit *who)
	{
		DoScriptText(SAY_SIGHT, m_creature);
	}

	void Aggro(Unit *who)
	{
		DoScriptText(SAY_AGGRO, m_creature);
	}

	void KilledUnit()
	{
		switch(rand()%3)
		{
			case 0:
				DoScriptText(SAY_SLAY1, m_creature);
				break;
			case 1:
				DoScriptText(SAY_SLAY2, m_creature);
				break;
			case 2:
				DoScriptText(SAY_SLAY2, m_creature);
				break;
		}
	}

	void JustDied(Unit *killer)
	{
		DoScriptText(SAY_DIED, m_creature);
	}

	void UpdateAI(const uint32 diff)
	{
		if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
			return;

		if(Steal_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_STEAL);
			switch(rand()%3)
			{
				case 0:
					DoScriptText(SAY_STEAL1, m_creature);
					break;
				case 1:
					DoScriptText(SAY_STEAL2, m_creature);
					break;
				case 2:
					DoScriptText(SAY_STEAL3, m_creature);
					break;
			}
			Steal_Timer = 11000;
		}

		if(Bolt_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_BOLT);
			Bolt_Timer = 3000;
		}

		if(Explode_Timer < diff)
		{
			DoCast(m_creature, SPELL_EXPLODE);
			switch(rand()%2)
			{
				case 0:
					DoScriptText(SAY_EXPLODE1, m_creature);
					break;
				case 1:
					DoScriptText(SAY_EXPLODE2, m_creature);
			}
			Explode_Timer = 21000;
		}

		if(Summon_Timer < diff)
		{
			DoCast(m_creature, SPELL_SUMMON);
			switch(rand()%2)
			{
				case 0:
					DoScriptText(SAY_SUMMON1, m_creature);
					break;
				case 1:
					DoScriptText(SAY_SUMMON2, m_creature);
			}
			Summon_Timer = 7000;
		}
	}
};

CreatureAI* GetAI_boss_salramm(Creature* pCreature)
{
    return new boss_salrammAI(pCreature);
}

void AddSC_boss_salramm()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_salramm";
    newscript->GetAI = &GetAI_boss_salramm;
    newscript->RegisterSelf();
}
