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
SDName: Instance_Wailing_Caverns
SD%Complete: 0
SDComment: Placeholder
SDCategory: Wailing Caverns
EndScriptData */

#include "precompiled.h"
#include "def_wailing_caverns.h"

struct MANGOS_DLL_DECL  instance_wailing_caverns : public ScriptedInstance
{
    instance_wailing_caverns(Map *Map) : ScriptedInstance(Map) {Initialize();};

	uint64 Anacondra; // ID: 3671
	uint64 Cobrahn; // ID: 3669
	uint64 Pythas; // ID: 3670
	uint64 Serpentis; // ID: 3673

	bool AllBossesDead;

	void Initialize()
	{
		Anacondra = 0;
		Cobrahn = 0;
		Pythas = 0;
		Serpentis = 0;

		AllBossesDead = false;
	}

    Player* GetPlayerInMap()
    {
        Map::PlayerList const& players = instance->GetPlayers();

        if (!players.isEmpty())
        {
            for(Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            {
                if (Player* plr = itr->getSource())
                return plr;
            }
        }

        debug_log("SD2: Instance Wailing Caverns: GetPlayerInMap, but PlayerList is empty!");
        return NULL;
    }

    void OnCreatureCreate(Creature *creature, uint32 creature_entry)
    {
        switch(creature->GetEntry())
        { 
            case 3671:    Anacondra = creature->GetGUID();             break;
            case 3669:    Cobrahn = creature->GetGUID();              break;
            case 3670:    Pythas = creature->GetGUID();             break;
            case 3673:    Serpentis = creature->GetGUID();               break;
        }
    }
};

InstanceData* GetInstanceData_instance_wailing_caverns(Map* map)
{
   return new instance_wailing_caverns(map);
}

void AddSC_instance_wailing_caverns()
{
   Script *newscript;
   newscript = new Script;
   newscript->Name = "instance_wailing_caverns";
   newscript->GetInstanceData = &GetInstanceData_instance_wailing_caverns;
   newscript->RegisterSelf();
}
