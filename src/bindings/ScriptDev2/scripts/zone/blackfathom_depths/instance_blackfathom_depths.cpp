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
SDName: Instance_Blackfathom_depths
SD%Complete: 50
SDComment:
SDCategory: Blackfathom_depths
EndScriptData */

#include "precompiled.h"
#include "def_blackfathom_depths.h"

#define ENCOUNTERS 2
/*Encounter 1 = Twilight Lord Kelris
Encounter 2 = Shrine event
Must kill twilight lord for shrine event to be possible*/

struct MANGOS_DLL_DECL instance_blackfathom_depths : public ScriptedInstance
{
    instance_blackfathom_depths(Map *map) : ScriptedInstance(map) {Initialize();};

    uint64 TwilightLordKelrisGUID;
    uint64 Shrine1GUID;
    uint64 Shrine2GUID;
    uint64 Shrine3GUID;
    uint64 Shrine4GUID;
    uint64 ShrineOfGelihastGUID;
    uint64 AltarOfTheDeepsGUID;
    uint64 MainDoorGUID;

    uint32 Encounter[ENCOUNTERS];

    void Initialize()
    {
        TwilightLordKelrisGUID = 0;
        Shrine1GUID = 0;
        Shrine2GUID = 0;
        Shrine3GUID = 0;
        Shrine4GUID = 0;
        ShrineOfGelihastGUID = 0;
        AltarOfTheDeepsGUID = 0;
        MainDoorGUID = 0;

        for(uint8 i = 0; i < ENCOUNTERS; i++)
            Encounter[i] = NOT_STARTED;
    }

    void OnCreatureCreate(Creature *creature, uint32 creature_entry)
    {
        if (creature->GetEntry() == 4832) 
            TwilightLordKelrisGUID = creature->GetGUID();
    }

    void OnObjectCreate(GameObject *go)
    {
        switch (go->GetEntry())
        {
        case 21118:     Shrine1GUID = go->GetGUID();            break;
        case 21119:     Shrine2GUID = go->GetGUID();            break;
        case 21120:     Shrine3GUID = go->GetGUID();            break;
        case 21121:     Shrine4GUID = go->GetGUID();            break;
        case 103015:    ShrineOfGelihastGUID = go->GetGUID();   break;
        case 103016:    AltarOfTheDeepsGUID = go->GetGUID();    break;
        case 21117:     MainDoorGUID = go->GetGUID();           break;
        }
    }

    uint64 GetData64(uint32 data)
    {
        switch(data)
        {
            case DATA_TWILIGHT_LORD_KELRIS:
                return TwilightLordKelrisGUID;
            case DATA_SHRINE1:
                return Shrine1GUID;
            case DATA_SHRINE2:
                return Shrine2GUID;
            case DATA_SHRINE3:
                return Shrine3GUID;
            case DATA_SHRINE4:
                return Shrine4GUID;
            case DATA_SHRINE_OF_GELIHAST:
                return ShrineOfGelihastGUID;
            case DATA_MAINDOOR:
                return MainDoorGUID;
        }

        return 0;
    }

    void SetData(uint32 type, uint32 data)
    {
        if (type == TYPE_SHRINE_ENCOUNTER)
            Encounter[1] = data;
    }

    uint32 GetData(uint32 data)
    {
        if (data == TYPE_SHRINE_ENCOUNTER)
            return Encounter[1];

        return 0;
    }
};

InstanceData* GetInstanceData_instance_blackfathom_depths(Map* map)
{
    return new instance_blackfathom_depths(map);
}

void AddSC_instance_blackfathom_depths()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_blackfathom_depths";
    newscript->GetInstanceData = &GetInstanceData_instance_blackfathom_depths;
    newscript->RegisterSelf();
}