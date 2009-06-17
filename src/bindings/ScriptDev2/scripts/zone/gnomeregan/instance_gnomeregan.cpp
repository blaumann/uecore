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
SDName: Instance_Gnomeregan
SD%Complete: 0
SDComment: Placeholder
SDCategory: Gnomeregan
EndScriptData */

#include "precompiled.h"

struct MANGOS_DLL_DECL  instance_gnomeregan : public ScriptedInstance
{
    instance_gnomeregan(Map *Map) : ScriptedInstance(Map) {Initialize();};

	void Initialize() { }

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

        debug_log("SD2: Instance Gnomeregan: GetPlayerInMap, but PlayerList is empty!");
        return NULL;
    }

    void OnCreatureCreate(Creature *creature, uint32 creature_entry) { }
};

InstanceData* GetInstanceData_instance_gnomeregan(Map* map)
{
   return new instance_gnomeregan(map);
}

void AddSC_instance_gnomeregan()
{
   Script *newscript;
   newscript = new Script;
   newscript->Name = "instance_gnomeregan";
   newscript->GetInstanceData = &GetInstanceData_instance_gnomeregan;
   newscript->RegisterSelf();
}