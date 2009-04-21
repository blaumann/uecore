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
SDName: Boss_Chrono_Lord_Epoch
SD%Complete: 100
SDComment: 
SDCategory: Caverns of Time, Culling of Stratholme
EndScriptData */

#include "precompiled.h"

#define SAY_ONSPAWN				-2500003 // "Prinz Arthas Menethil, eine große Finsternis hat sich heute Eurer Seele bemächtigt. Der Tod, den Ihr über andere bringen wollte, wird Euch heute selbst ereilen."
#define SAY_AGGRO				-2500004 // "Das werden wir noch sehen, junger Prinz."
#define SAY_TIME1				-2500005 // "Tick tack, tick tack..."
#define SAY_TIME2				-2500006 // "Nicht schnell genug!"
#define SAY_TIME3				-2500007 // "Bringen wir es zu Ende."
#define SAY_SLAY1				-2500008 // "Für Euch gibt es keine Zukunft."
#define SAY_SLAY2				-2500009 // "Dies ist die Stunde unseres größten Triumphes!"
#define SAY_SLAY3				-2500010 // "You would destined to fail." Übersetzung fehlt

#define SPELL_TIME_WARP			52766 // Die Zeit wird verlangsamt, verringert 6 Sek. lang das Angriffs-, Bewegungs- und Zaubertempo um 70%.
#define SPELL_CURSE_OF_EXERTION	52772 // Erhöht 10 Sek. lang die Kosten von Zaubern und Fähigkeiten um 100%.
#define SPELL_WOUNDING_STRIKE	52771 // Verletzt das Ziel schwer, verursacht 100% Waffenschaden, verringert seine erhaltenen Heileffekte um 25% und lässt es alle 1 Sek. 750 körperlichen Schaden erleiden. Hält 4 Sek. lang an.

struct MANGOS_DLL_DECL boss_chrono_lord_epochAI : public ScriptedAI
{
	boss_chrono_lord_epochAI(Creature *c) : ScriptedAI(c) {Reset();}

	uint32 TimeWarp_Timer;
	uint32 Curse_Timer;
	uint32 Strike_Timer;

	void Reset()
	{
		TimeWarp_Timer = 18000;
		Curse_Timer = 16000;
		Strike_Timer = 8000;
	}

	void MoveInLineOfSight(Unit *who)
	{
		DoScriptText(SAY_ONSPAWN, m_creature);
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
				DoScriptText(SAY_SLAY3, m_creature);
				break;
		}
	}

	void UpdateAI(const uint32 diff)
	{
		// Return since we have no target
		if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
			return;

		// TimeWarp_Timer
		if(TimeWarp_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_TIME_WARP);
			TimeWarp_Timer = 18000;
			switch (rand()%3)
			{
				case 0:
					DoScriptText(SAY_TIME1, m_creature);
					break;
				case 1:
					DoScriptText(SAY_TIME2, m_creature);
					break;
				case 2: 
					DoScriptText(SAY_TIME3, m_creature);
					break;
			}
		}

		if(Curse_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_CURSE_OF_EXERTION);
			Curse_Timer = 16000;
		}

		if(Strike_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_WOUNDING_STRIKE);
			Strike_Timer = 8000;
		}

		DoMeleeAttackIfReady();
	}
};

CreatureAI* GetAI_boss_chrono_lord_epoch(Creature *_Creature)
{
    return new boss_chrono_lord_epochAI (_Creature);
}

void AddSC_boss_chrono_lord_epoch()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_chrono_lord_epoch";
    newscript->GetAI = &GetAI_boss_chrono_lord_epoch;
    newscript->RegisterSelf();
}