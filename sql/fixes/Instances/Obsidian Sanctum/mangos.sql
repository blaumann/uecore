UPDATE `instance_template` SET `script`='instance_obsidian_sanctum' WHERE `map`=615;
UPDATE `creature_template` SET `ScriptName`='boss_sartharion' WHERE `entry`='28860';
UPDATE `creature_template` SET `ScriptName`='mob_vesperon' WHERE `entry`='30449';
UPDATE `creature_template` SET `ScriptName`='mob_shadron' WHERE `entry`='30451';
UPDATE `creature_template` SET `ScriptName`='mob_tenebron' WHERE `entry`='30452';
UPDATE `creature_template` SET `ScriptName`='mob_twilight_eggs' WHERE entry =30882;
UPDATE `creature_template` SET `ScriptName`='mob_twilight_whelp' WHERE entry in (30890, 31214);
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_shadron' WHERE entry =31218;
UPDATE `creature_template` SET `ScriptName`='mob_acolyte_of_vesperon' WHERE entry =31219;
-- **** DB fix ****
DELETE FROM `spell_script_target` WHERE `entry` in (60639, 58766, 57835, 57988, 58835);
insert into spell_script_target values (60639, 1, 28860); -- Twilight Revenge
insert into spell_script_target values (58766, 1, 28860); -- Twilight Torment on Shadron
insert into spell_script_target values (57835, 1, 30451); -- Twilight Torment on Sartharion
insert into spell_script_target values (57988, 1, 30449); -- Twilight Torment used by Vesperon
insert into spell_script_target values (58835, 1, 31219); -- Twilight Torment used by Acolyte of Vesperon
-- **** Spawn portal ****
DELETE FROM `gameobject` WHERE `id` in (193988);
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('193988','615','1','1','3246.67','518.52','58.72','0.95993','0.0','0.0','0.0','1.0','180','0','1');

-- Below is extra

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
