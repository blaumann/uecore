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
SDName: Dead's Breach
SD%Complete: 100
SDComment: Quest Support: 12720, 12687
SDCategory: Dead's Breach
EndScriptData */

#include "precompiled.h"

//UPDATE `creature_template` SET `ScriptName`='npc_crusade_persuaded' WHERE (`entry`='3');

struct MANGOS_DLL_DECL npc_crusade_persuadedAI : public ScriptedAI
{
    npc_crusade_persuadedAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
    void Reset(){}
    void Aggro(Unit* who)
    {
    } 
	
    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
		if ((caster->GetTypeId() == TYPEID_PLAYER )&& m_creature->isAlive() && spell->Id == 52781)
		{
			//DoScriptText(EMOTE_CLUCK_TEXT2, m_creature);
			if((((Player*)caster)->GetQuestStatus(12720) == QUEST_STATUS_INCOMPLETE))
			{ 
				((Player*)caster)->AreaExploredOrEventHappens(12720); 
			}
		}
	}
};
//UPDATE `creature_template` SET `ScriptName`='npc_Death_Race' WHERE (`entry`='28782') ;
//also you need customize an item for cast the sqell 52361,and set the quest scritemID=your customized itme.
//for example:the sql
//UPDATE `quest_template` SET `SrcItemId`='900007' WHERE (`entry`='12687') ;
//and customize the spell1id=52361,spellcharges_1`=-1 for item 900007 
struct MANGOS_DLL_DECL npc_Death_RaceAI : public ScriptedAI
{
	npc_Death_RaceAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}
	void Reset(){}
	void Aggro(Unit* who)
	{ 
	} 

	void SpellHit(Unit *caster, const SpellEntry *spell)
	{
		//DoScriptText(EMOTE_A_HELLO, m_creature);
		if ((caster->GetTypeId() == TYPEID_PLAYER )&& m_creature->isAlive() && spell->Id == 52361)
		{
			if((((Player*)caster)->GetQuestStatus(12687) == QUEST_STATUS_INCOMPLETE))
			{ 
				((Player*)caster)->AreaExploredOrEventHappens(12687); 
			}
		}
	}
};

/*CreatureAI* GetAI_npc_snake_trap_serpents(Creature* pCreature)
{
    return new npc_snake_trap_serpentsAI(pCreature);
}*/

CreatureAI* GetAI_npc_Death_Race(Creature* pCreature)
{
    return new npc_Death_RaceAI(pCreature);
}

CreatureAI* GetAI_npc_crusade_persuaded(Creature* pCreature)
{
    return new npc_crusade_persuadedAI(pCreature);
}

void AddSC_deadsbreach()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "npc_crusade_persuaded";
    newscript->GetAI = &GetAI_npc_crusade_persuaded;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_Death_Race";
    newscript->GetAI = &GetAI_npc_Death_Race;
    newscript->RegisterSelf();
}
