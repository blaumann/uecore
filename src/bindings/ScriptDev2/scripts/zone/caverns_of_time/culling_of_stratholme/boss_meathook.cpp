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
SDName: Boss_Meathook
SD%Complete: 100
SDComment:
SDCategory: Caverns of Time, Culling of Stratholme
EndScriptData */

#include "precompiled.h"

#define SAY_SIGHT		-2500018
#define SAY_AGGRO		-2500019
#define	SAY_SLAY1		-2500020
#define SAY_SLAY2		-2500021
#define SAY_SLAY3		-2500022
#define SAY_DIED		-2500023

#define SPELL_CHAINS	52696 // Umschlingt das Ziel mit Ketten, verursacht alle 1 Sek. 1000 körperlichen Schaden und betäubt das Ziel 5 Sek. lang.
#define SPELL_EXPLUSION	52666 // Fleischhaken stößt eine Krankheitswolke aus, verursacht 713 bis 787 Naturschaden und unterbricht 4 Sek. lang das Wirken von Zaubern naher Gegner.

struct MANGOS_DLL_DECL boss_meathookAI : public ScriptedAI
{
	boss_meathookAI(Creature *c) : ScriptedAI(c) {Reset();}

	uint32 Chains_Timer;
	uint32 Explusion_Timer;

	void Reset()
	{
		Chains_Timer = 11000;
		Explusion_Timer = 6000;
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
				DoScriptText(SAY_SLAY3, m_creature);
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

		if(Chains_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_CHAINS);
			Chains_Timer = 11000;
		}

		if(Explusion_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_EXPLUSION);
			Explusion_Timer = 6000;
		}
	}
};

CreatureAI* GetAI_boss_meathook(Creature *_Creature)
{
    return new boss_meathookAI (_Creature);
}

void AddSC_boss_meathook()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_meathook";
    newscript->GetAI = &GetAI_boss_meathook;
    newscript->RegisterSelf();
}