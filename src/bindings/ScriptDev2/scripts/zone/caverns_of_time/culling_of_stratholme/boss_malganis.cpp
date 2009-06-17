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
SDName: Boss_Malganis
SD%Complete: 90
SDComment: Gameobject Spawning is missing
SDCategory: Caverns of Time, Culling of Stratholme
EndScriptData */

#include "precompiled.h"

#define SAY_SIGHT	-2500011
#define SAY_AGGRO	-2500012
#define SAY_SLEEP1	-2500013
#define SAY_SLEEP2	-2500014 
#define SAY_SLAY1	-2500015
#define SAY_SLAY2	-2500016
#define SAY_SLAY3	-2500017
#define SAY_VANISH	-2500018

#define SPELL_SWARM	52720 // 3230 - 3570 Schattenschaden, 15 Sek. lang alle 3 Sek. 380 - 420 Schattenschaden
#define SPELL_BLAST 52722 // 4163 - 4837 Schattenschaden
#define SPELL_SLEEP 52721 // bis zu 10 Sek. Schlaf

struct MANGOS_DLL_DECL boss_malganisAI : public ScriptedAI
{
	boss_malganisAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

	uint32 Attackable_Timer;
	uint32 Swarm_Timer;
	uint32 Blast_Timer;
	uint32 Sleep_Timer;
	bool NonAttackable;

	void Reset()
	{
		Attackable_Timer = 9000;
		Swarm_Timer = 16000;
		Blast_Timer = 12000;
		Sleep_Timer = 21000;
		m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		NonAttackable = false;
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

	void UpdateAI(const uint32 diff)
	{

		if(!m_creature->SelectHostilTarget() || !m_creature->getVictim())
			return;

		if(m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 2)
		{
			m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			NonAttackable = true;
			DoScriptText(SAY_VANISH, m_creature);
		}

		if(Attackable_Timer < diff)
		{
			if(NonAttackable == false)
				m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		}

		if(Swarm_Timer < diff)
		{
			DoCast(m_creature, SPELL_SWARM);
			Swarm_Timer = 16000;
		}

		if(Blast_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_BLAST);
			Blast_Timer = 12000;
		}

		if(Sleep_Timer < diff)
		{
			DoCast(m_creature->getVictim(), SPELL_SLEEP);
			Sleep_Timer = 21000;
			switch (rand()%2)
			{
				case 0:
					DoScriptText(SAY_SLEEP1, m_creature);
					break;
				case 1:
					DoScriptText(SAY_SLEEP2, m_creature);
					break;
			}
		}
	}
};

CreatureAI* GetAI_boss_malganis(Creature* pCreature)
{
    return new boss_malganisAI(pCreature);
}

void AddSC_boss_malganis()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_malganis";
    newscript->GetAI = &GetAI_boss_malganis;
    newscript->RegisterSelf();
}