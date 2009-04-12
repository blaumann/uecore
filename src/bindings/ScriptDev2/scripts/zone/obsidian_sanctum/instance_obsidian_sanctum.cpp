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
SDName: Instance_Obsidian_Sanctum
SDAuthor: ckegg
SD%Complete: 90%
SDComment: 
SDCategory: Obsidian Sanctum
EndScriptData */

/* SQL
UPDATE `instance_template` SET `script`='instance_obsidian_sanctum' WHERE `map`=615;
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`='28860';
UPDATE `creature_template` SET `ScriptName`='mob_vesperon', `unit_flags`=2, `type_flags`=100, `InhabitType`=5 WHERE `entry`='30449';
UPDATE `creature_template` SET `ScriptName`='mob_shadron', `unit_flags`=2, `type_flags`=100, `InhabitType`=5 WHERE `entry`='30451';
UPDATE `creature_template` SET `ScriptName`='mob_tenebron', `unit_flags`=2, `type_flags`=100, `InhabitType`=5 WHERE `entry`='30452';
UPDATE `creature_template` SET `ScriptName`='mob_twilight_eggs' WHERE entry =30882;
UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry in (30890, 31214);
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE entry =31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE entry =31219;
-- **** DB fix ****
DELETE FROM `spell_script_target` WHERE `entry` in (60639, 58766, 57835, 57988, 58835);
insert into spell_script_target values (60639, 1, 28860);
insert into spell_script_target values (58766, 1, 28860);
insert into spell_script_target values (57835, 1, 30451);
insert into spell_script_target values (57988, 1, 30449);
insert into spell_script_target values (58835, 1, 31219);
-- **** If your creatures have no status, use these for temporary. ****
-- UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `minhealth` = 81900, `maxhealth` = 81900, `faction_A`=16, `faction_H`=16 WHERE entry =30882;
-- UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `minhealth` = 156396, `maxhealth` = 156396, `faction_A`=16, `faction_H`=16 WHERE entry in (30890, 31214);
-- UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `minhealth` = 325825, `maxhealth` = 325825, `minmana` = 4081, `minmana` = 4081, `faction_A`=16, `faction_H`=16 WHERE entry =31218;
-- UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `minhealth` = 325825, `maxhealth` = 325825, `minmana` = 4081, `minmana` = 4081, `faction_A`=16, `faction_H`=16 WHERE entry =31219;
-- UPDATE `creature_template` SET `minlevel` = 81, `maxlevel` = 81, `minhealth` = 4000, `maxhealth` = 65165, `faction_A`=16, `faction_H`=16 WHERE entry =30643;
-- UPDATE `creature_template` SET `mindmg`=`minlevel` * 15 * `maxlevel` / 60 * `maxlevel` / 60, `minrangedmg`=`minlevel` * 15 * `maxlevel` / 60 * `maxlevel` / 60 WHERE entry in (30890, 31214, 31218, 31219, 30643);
-- UPDATE `creature_template` SET `maxdmg`=`maxlevel` * 25 * `maxlevel` / 60 * `maxlevel` / 60, `maxrangedmg`=`maxlevel` * 25 * `maxlevel` / 60 * `maxlevel` / 60 WHERE entry in (30890, 31214, 31218, 31219, 30643);
-- UPDATE `creature_template` SET `attackpower` = ROUND((`mindmg` + `maxdmg`) / 4 * 7), `rangedattackpower` = ROUND((`minrangedmg` + `maxrangedmg`) / 4 * 7) WHERE entry in (30890, 31214, 31218, 31219, 30643);
-- **** If you have short creature view distance, you can run this to make 3 drakes closer ****
-- UPDATE `creature` SET `position_x`=3248.00, `position_y`=588.95, `position_z`=86 WHERE `id`=30452;
-- UPDATE `creature` SET `position_x`=3214.05, `position_y`=554.90, `position_z`=86 WHERE `id`=30449;
-- UPDATE `creature` SET `position_x`=3288.59, `position_y`=545.75, `position_z`=86 WHERE `id`=30451;
-- **** Spawn portal ****
-- DELETE FROM `gameobject` WHERE `id` in (193988);
-- INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
-- ('193988','615','1','1','3246.67','518.52','58.72','0.95993','0.0','0.0','0.0','1.0','180','0','1');
*/

#include "precompiled.h"
#include "def_obsidian_sanctum.h"

#define ENCOUNTERS     1
/* Obsidian Sanctum encounters:
0 - Sartharion
*/

struct MANGOS_DLL_DECL instance_obsidian_sanctum : public ScriptedInstance
{
    instance_obsidian_sanctum(Map *Map) : ScriptedInstance(Map) {Initialize();};

    uint32 Encounters[ENCOUNTERS];
    std::string str_data;
    uint64 Sartharion;
    uint64 Tenebron;
    uint64 Shadron;
    uint64 Vesperon;
    uint64 oTwilightPortal;

    void Initialize()
    {
	    Sartharion = 0;
	    Tenebron   = 0;
	    Shadron    = 0;
	    Vesperon   = 0;
	    oTwilightPortal = 0;

        for(uint8 i = 0; i < ENCOUNTERS; ++i)
            Encounters[i] = NOT_STARTED;
    }

    bool IsEncounterInProgress() const
    {
        for(uint8 i = 0; i < ENCOUNTERS; ++i)
            if(Encounters[i] == IN_PROGRESS) return true;

        return false;
    }

    void OnCreatureCreate(Creature* creature, uint32 entry)
    {
        switch(entry)
        {
            case 28860: Sartharion        = creature->GetGUID(); break;
            case 30452: Tenebron          = creature->GetGUID(); break;
            case 30451: Shadron           = creature->GetGUID(); break;
            case 30449: Vesperon          = creature->GetGUID(); break;
        }
    }

    void OnObjectCreate(GameObject* gobj)
    {
        switch(gobj->GetEntry())
        {
            case 193988: oTwilightPortal           = gobj->GetGUID(); break;
        }
    }

    uint64 GetData64(uint32 id)
    {
        switch(id)
        {
            case DATA_SARTHARION:                  return Sartharion;            break;
            case DATA_TENEBRON:                    return Tenebron;              break;
            case DATA_SHADRON:                     return Shadron;               break;
            case DATA_VESPERON:                    return Vesperon;              break;
            case DATA_GO_TWILIGHT_PORTAL:          return oTwilightPortal;       break;
        }
        return 0;
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
        case DATA_SARTHARION_EVENT:           return Encounters[0];
        }
        return 0;
    }

    void SetData(uint32 type, uint32 data)
    {
        switch(type)
        {
            case DATA_SARTHARION_EVENT:       Encounters[0] = data; break;
        }

    }


   const char* Save()
    {
        return str_data.c_str();
    }
};

InstanceData* GetInstanceData_instance_obsidian_sanctum(Map* map)
{
    return new instance_obsidian_sanctum(map);
}

void AddSC_instance_obsidian_sanctum()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_obsidian_sanctum";
    newscript->GetInstanceData = GetInstanceData_instance_obsidian_sanctum;
    newscript->RegisterSelf();
}
