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
SDName: Durotar
SD%Complete: 0
SDComment: Not tested, not blizzlike
SDCategory: Durotar
EndScriptData */

#include "precompiled.h"

//Variables
#define	SPELL_HIT       19938
#define	NPC_LAZY_PEON   10556

struct MANGOS_DLL_DECL mob_lazy_peonAI : public ScriptedAI
{
	mob_lazy_peonAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

	void Reset()
	{
		m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
	}

	void SpellHit(Unit *pCaster, const SpellEntry *pSpell)
	{
		if ( !m_creature->isInCombat() && (pSpell->Id == SPELL_HIT) )
			m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE); 
	}
};

CreatureAI* GetAI_mob_lazy_peon(Creature* pCreature)
{
    return new mob_lazy_peonAI(pCreature); 
};

void AddSC_mob_lazy_peon()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="mob_lazy_peon";
    newscript->GetAI = &GetAI_mob_lazy_peon;
    newscript->RegisterSelf();
}
