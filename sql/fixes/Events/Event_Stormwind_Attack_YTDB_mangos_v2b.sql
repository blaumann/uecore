/*
Patch crée : Mathew
Corrigé par : Cadelion
Emulateur : Mangos
Version : 3.0.9 pour YTDB
Version Event : Version 2bis
Description : La capitales Hurlevent est attaqué par la Hordes aidez votre Faction !
*/

/* Création Gobjects */


DELETE FROM `gameobject_template` WHERE (`entry`=2001000);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `castBarCaption`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES (2001000, 5, 131, 'Catapulte', '', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

/* Création PNJs */


DELETE FROM `creature_template` WHERE (`entry`=1000300);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000300, 0, 4259, 4602, 4260, 4601, 'Grunt d\'orgrimmar', '', '', 70, 75, 20000, 20000, 20000, 20000, 7500, 85, 85, 268435457, 1, 1, 0, 300, 500, 0, 595, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 162.5, 227.5, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 295, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=1000302);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000302, 0, 23033, 23033, 23033, 23033, 'Chef de Guerre', 'Chef de l\'invasion', '', 80, 80, 30000, 30000, 30000, 30000, 7500,  85,  85, 268435457, 1, 1, 2, 600, 900, 0, 595, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 162.5, 227.5, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 10004, 0, 0, '');


DELETE FROM `creature_template` WHERE (`entry`=1000303);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000303, 0, 21741, 21741, 21741, 21741, 'Arché de la Horde', '', '', 70, 75, 20000, 20000, 20000, 20000, 7500,  85,  85, 268435457, 1, 1, 0, 300, 500, 0, 595, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 162.5, 227.5, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 10003, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=1000304);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000304, 0, 17122, 17122, 17122, 17122, 'Tueur de la Horde', '', '', 73, 75, 20000, 20000, 30000, 20000, 7500, 85, 85, 268435457, 1, 1, 0, 600, 1000, 0, 595, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 600, 1000, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 60000, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=1000305);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000305, 0, 27754, 0, 27754, 0, 'Mitrailleuse de la Horde', '', '', 100, 100, 900000, 900000, 900000, 900000, 7, 35, 35, 0, 1, 2, 2, 0, 0, 0, 1750, 2000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 0, 0, 0, '');

DELETE FROM `creature_template` WHERE (`entry`=1000306);
REPLACE INTO `creature_template` (`entry`, `heroic_entry`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (1000306, 0, 25331, 0, 25331, 0, 'Mitrailleuse de l\'alliance', '', '', 100, 100, 900000, 900000, 900000, 900000, 7, 35, 35, 0, 1, 2, 2, 0, 0, 0, 1750, 2000, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 1, 0, 0, 0, '');




/* Armes,Emotes PNJS */

DELETE FROM `creature_equip_template` WHERE (`entry`=10004);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10004, 42943, 0, 0);

DELETE FROM `creature_equip_template` WHERE (`entry`=10003);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (10003, 0, 40265, 0);

DELETE FROM `creature_template_addon` WHERE (`entry`=1000303);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES (1000303, '', '', '', '', 48, '', '');

DELETE FROM `creature_equip_template` WHERE (`entry`=60000);
REPLACE INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (60000, 37401, 37401, 0);

DELETE FROM `creature_template_addon` WHERE (`entry`=1000303);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES (1000303, 0, 0, 0, 0, 45, 0, '');


/* Spawn des Creatures , Gobjects */

DELETE FROM `creature` WHERE `id`=1000300;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4499827, 1000300, 0, 1, 1, 0, 295, -8801.77, 765.447, 96.3383, 2.73908, 25, 0, 0, 20000, 20000, 0, 0),
(4499829, 1000300, 0, 1, 1, 0, 295, -8731.99, 694.227, 98.7002, 2.6684, 25, 0, 0, 20000, 20000, 0, 0),
(4499824, 1000300, 0, 1, 1, 0, 295, -8855.95, 654.084, 96.3863, 0.0600867, 25, 0, 0, 20000, 20000, 0, 0),
(4499825, 1000300, 0, 1, 1, 0, 295, -8841.25, 713.412, 97.5672, 2.03615, 25, 0, 0, 20000, 20000, 0, 0),
(4498404, 1000300, 0, 1, 1, 0, 295, -9120.04, 403.212, 92.5965, 0.692859, 25, 0, 0, 20000, 20000, 0, 0),
(4498458, 1000300, 0, 1, 1, 0, 295, -8496.83, 401.329, 108.386, 5.40127, 25, 0, 0, 20000, 20000, 0, 0),
(4498457, 1000300, 0, 1, 1, 0, 295, -8495.38, 402.516, 108.386, 5.40127, 25, 0, 0, 20000, 20000, 0, 0),
(4498452, 1000300, 0, 1, 1, 0, 295, -8491.2, 401.132, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498453, 1000300, 0, 1, 1, 0, 295, -8492.36, 402.554, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498454, 1000300, 0, 1, 1, 0, 295, -8497.67, 398.25, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498455, 1000300, 0, 1, 1, 0, 295, -8499.15, 400.113, 108.386, 5.37771, 25, 0, 0, 20000, 20000, 0, 0),
(4498456, 1000300, 0, 1, 1, 0, 295, -8493.64, 404.431, 108.386, 5.37771, 25, 0, 0, 20000, 20000, 0, 0),
(4498451, 1000300, 0, 1, 1, 0, 295, -8496.58, 396.778, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498449, 1000300, 0, 1, 1, 0, 295, -8489.59, 399.13, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498450, 1000300, 0, 1, 1, 0, 295, -8494.96, 394.78, 108.386, 5.39342, 25, 0, 0, 20000, 20000, 0, 0),
(4498440, 1000300, 0, 1, 1, 0, 295, -8889.59, 567.749, 92.4942, 5.6364, 25, 0, 0, 20000, 20000, 0, 0),
(4498441, 1000300, 0, 1, 1, 0, 295, -8827.72, 626.729, 93.9648, 0.971132, 25, 0, 0, 20000, 20000, 0, 0),
(4498406, 1000300, 0, 1, 1, 0, 295, -9114.79, 390.311, 92.1854, 0.688928, 25, 0, 0, 20000, 20000, 0, 0),
(4498407, 1000300, 0, 1, 1, 0, 295, -9121.74, 400.458, 92.4131, 0.688928, 25, 0, 0, 20000, 20000, 0, 0),
(4498408, 1000300, 0, 1, 1, 0, 295, -9160.59, 424.207, 94.3091, 5.45629, 25, 0, 0, 20000, 20000, 0, 0),
(4498409, 1000300, 0, 1, 1, 0, 295, -9134.33, 348.073, 92.8931, 1.1798, 25, 0, 0, 20000, 20000, 0, 0),
(4498410, 1000300, 0, 1, 1, 0, 295, -9125.71, 353.556, 93.3901, 1.03371, 25, 0, 0, 20000, 20000, 0, 0),
(4498437, 1000300, 0, 1, 1, 0, 295, -8962.42, 517.417, 96.3551, 0.700175, 25, 0, 0, 20000, 20000, 0, 0),
(4498416, 1000300, 0, 1, 1, 0, 295, -9116.79, 346.573, 93.8323, 1.34395, 25, 0, 0, 20000, 20000, 0, 0),
(4498419, 1000300, 0, 1, 1, 0, 295, -9084.89, 343.283, 93.2662, 0.880563, 25, 0, 0, 20000, 20000, 0, 0),
(4498429, 1000300, 0, 1, 1, 0, 295, -9083.81, 412.355, 92.2807, 0.177889, 25, 0, 0, 20000, 20000, 0, 0),
(4498430, 1000300, 0, 1, 1, 0, 295, -9080.8, 439.735, 93.296, 1.35599, 25, 0, 0, 20000, 20000, 0, 0),
(4498431, 1000300, 0, 1, 1, 0, 295, -9044.43, 434.192, 93.296, 0.386015, 25, 0, 0, 20000, 20000, 0, 0),
(4498432, 1000300, 0, 1, 1, 0, 295, -9027.62, 462.867, 93.8956, 0.684466, 25, 0, 0, 20000, 20000, 0, 0),
(4498433, 1000300, 0, 1, 1, 0, 295, -8958.4, 512.647, 96.3551, 0.700175, 25, 0, 0, 20000, 20000, 0, 0),
(4498434, 1000300, 0, 1, 1, 0, 295, -8959.55, 514.013, 96.3551, 0.700175, 25, 0, 0, 20000, 20000, 0, 0),
(4498435, 1000300, 0, 1, 1, 0, 295, -8963.51, 518.707, 96.3551, 0.700175, 25, 0, 0, 20000, 20000, 0, 0),
(4498439, 1000300, 0, 1, 1, 0, 295, -8896.62, 573.048, 92.6642, 1.01433, 25, 0, 0, 20000, 20000, 0, 0),
(4498403, 1000300, 0, 1, 1, 0, 295, -9118.55, 401.418, 92.5115, 0.692859, 25, 0, 0, 20000, 20000, 0, 0),
(4498401, 1000300, 0, 1, 1, 0, 295, -9112.29, 393.883, 92.4151, 0.692859, 25, 0, 0, 20000, 20000, 0, 0),
(4498402, 1000300, 0, 1, 1, 0, 295, -9110.51, 391.729, 92.4065, 0.692859, 25, 0, 0, 20000, 20000, 0, 0),
(4500061, 1000300, 0, 1, 1, 0, 295, -8757.37, 636.69, 103.238, 4.72221, 25, 0, 0, 20000, 20000, 0, 0),
(4500143, 1000300, 0, 1, 1, 0, 295, -8821.98, 557.564, 94.7237, 4.01928, 25, 0, 0, 20000, 20000, 0, 0),
(4500148, 1000300, 0, 1, 1, 0, 295, -8868.43, 583.37, 92.6704, 1.08581, 25, 0, 0, 20000, 20000, 0, 0);


DELETE FROM `creature` WHERE `id`=1000303;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4498461, 1000303, 0, 1, 1, 0, 10003, -9132.98, 393.033, 91.2825, 0.645163, 25, 0, 0, 20000, 20000, 0, 0),
(4498464, 1000303, 0, 1, 1, 0, 10003, -9131.09, 390.522, 91.1328, 0.645163, 25, 0, 0, 20000, 20000, 0, 0),
(4498465, 1000303, 0, 1, 1, 0, 10003, -9128.78, 387.451, 91.0308, 0.645163, 25, 0, 0, 20000, 20000, 0, 0),
(4498466, 1000303, 0, 1, 1, 0, 10003, -9126.11, 383.905, 90.9386, 0.645163, 25, 0, 0, 20000, 20000, 0, 0),
(4508916, 1000303, 0, 1, 1, 0, 10003, -8895.71, 582.794, 93.0965, 0.360238, 25, 0, 0, 20000, 20000, 0, 0),
(4508917, 1000303, 0, 1, 1, 0, 10003, -8870.7, 564.292, 94.7728, 1.64306, 25, 0, 0, 20000, 20000, 0, 0),
(4508918, 1000303, 0, 1, 1, 0, 10003, -8829.64, 795.097, 96.7797, 0.699016, 25, 0, 0, 20000, 20000, 0, 0),
(4508919, 1000303, 0, 1, 1, 0, 10003, -8832.19, 800.21, 97.1595, 0.416273, 25, 0, 0, 20000, 20000, 0, 0),
(4508920, 1000303, 0, 1, 1, 0, 10003, -8825.85, 790.968, 96.6301, 1.13884, 25, 0, 0, 20000, 20000, 0, 0),
(4508921, 1000303, 0, 1, 1, 0, 10003, -8646.93, 946.466, 100.478, 1.2056, 25, 0, 0, 20000, 20000, 0, 0),
(4508922, 1000303, 0, 1, 1, 0, 10003, -8634.73, 932.603, 100.139, 6.20858, 25, 0, 0, 20000, 20000, 0, 0),
(4508923, 1000303, 0, 1, 1, 0, 10003, -8587.5, 1020.96, 96.0216, 5.11295, 25, 0, 0, 20000, 20000, 0, 0),
(4508924, 1000303, 0, 1, 1, 0, 10003, -8560.39, 1022.7, 90.1889, 1.78679, 25, 0, 0, 20000, 20000, 0, 0),
(4508925, 1000303, 0, 1, 1, 0, 10003, -8540.89, 1017.9, 89.731, 0.624404, 25, 0, 0, 20000, 20000, 0, 0),
(4508926, 1000303, 0, 1, 1, 0, 10003, -8482.82, 1028.62, 59.742, 1.51976, 25, 0, 0, 20000, 20000, 0, 0),
(4508927, 1000303, 0, 1, 1, 0, 10003, -8424.56, 1060.98, 36.3671, 0.616551, 25, 0, 0, 20000, 20000, 0, 0),
(4508928, 1000303, 0, 1, 1, 0, 10003, -8540.1, 1000.81, 89.7306, 5.61167, 25, 0, 0, 20000, 20000, 0, 0),
(4508930, 1000303, 0, 1, 1, 0, 10003, -8492.03, 1046.27, 59.9246, 1.95172, 25, 0, 0, 20000, 20000, 0, 0),
(4508931, 1000303, 0, 1, 1, 0, 10003, -8517.42, 1048.78, 59.9604, 3.29082, 25, 0, 0, 20000, 20000, 0, 0);

DELETE FROM `creature` WHERE `id`=1000302;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4498448, 1000302, 0, 1, 1, 0, 295, -8490.82, 395.228, 108.386, 5.39342, 25, 0, 0, 30000, 30000, 0, 0),
(4498438, 1000302, 0, 1, 1, 0, 295, -8961.1, 515.843, 96.3551, 0.700175, 25, 0, 0, 30000, 30000, 0, 0),
(4498428, 1000302, 0, 1, 1, 0, 295, -9112.91, 400.777, 92.551, 0.66091, 25, 0, 0, 30000, 30000, 0, 0);

DELETE FROM `creature_movement` WHERE `id`=4498428;
REPLACE INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
(4498428, 1, -9099.34, 411.821, 92.4273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.62946, 0, 0),
(4498428, 2, -9094.8, 415.126, 92.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.62946, 0, 0),
(4498428, 3, -9085.66, 421.704, 92.3457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.643587, 0, 0),
(4498428, 4, -9078.66, 426.955, 93.0561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.643587, 0, 0),
(4498428, 5, -9114.44, 400.119, 92.5141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.643587, 0, 0);



DELETE FROM `gameobject` WHERE `id`=2001000;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(799339, 2001000, 0, 1, 1, -9119.73, 395.022, 92.1512, 0.674285, 0, 0, 0.330792, 0.943704, 25, 0, 1),
(799334, 2001000, 0, 1, 1, -9078.98, 343.405, 92.8662, 0.751188, 0, 0, 0.366825, 0.93029, 25, 0, 1),
(799336, 2001000, 0, 1, 1, -9156.99, 421.186, 94.4878, 6.18663, 0, 0, 0.0482597, -0.998835, 25, 0, 1),
(799337, 2001000, 0, 1, 1, -9128.58, 346.119, 93.9299, 1.05935, 0, 0, 0.505253, 0.862971, 25, 0, 1);

DELETE FROM `gameobject` WHERE `id`=178946;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(801156, 178946, 0, 1, 1, -9018.39, 352.301, 120.383, 3.78177, 0, 0, 0.949208, -0.314649, 25, 0, 1),
(801157, 178946, 0, 1, 1, -9026.04, 361.532, 120.382, 3.81318, 0, 0, 0.944149, -0.32952, 25, 0, 1),
(801158, 178946, 0, 1, 1, -9006.45, 327.244, 129.579, 3.63254, 0, 0, 0.970022, -0.243017, 25, 0, 1),
(801159, 178946, 0, 1, 1, -9104.8, 457.069, 121.341, 3.82497, 0, 0, 0.942191, -0.335077, 25, 0, 1),
(801160, 178946, 0, 1, 1, -9109.45, 472.481, 137.26, 3.82497, 0, 0, 0.942191, -0.335077, 25, 0, 1),
(801161, 178946, 0, 1, 1, -9138.19, 392.65, 91.0807, 3.82496, 0, 0, 0.942191, -0.335076, 25, 0, 1),
(801162, 178946, 0, 1, 1, -9107.02, 378.128, 93.728, 0.608761, 0, 0, 0.299702, 0.954033, 25, 0, 1),
(801163, 178946, 0, 1, 1, -9060.9, 339.189, 93.8312, 0.657455, 0, 0, 0.322839, 0.946454, 25, 0, 1);


DELETE FROM `gameobject` WHERE `id`=176546;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(801170, 176546, 0, 1, 1, -9080.06, 403.447, 113.909, 5.25024, 0, 0, 0.493815, -0.869567, 25, 0, 1),
(801171, 176546, 0, 1, 1, -9079.01, 404.471, 111.998, 3.82082, 0, 0, 0.942884, -0.333122, 25, 0, 1),
(801172, 176546, 0, 1, 1, -9081.48, 402.096, 110.978, 5.35627, 0, 0, 0.447045, -0.894512, 25, 0, 1),
(801175, 176546, 0, 1, 1, -9081.8, 401.765, 114.208, 5.17169, 0, 0, 0.527577, -0.849507, 25, 0, 1),
(801176, 176546, 0, 1, 1, -9077.72, 405.812, 116.052, 4.5316, 0, 0, 0.768052, -0.640388, 25, 0, 1),
(801177, 176546, 0, 1, 1, -9078.74, 404.722, 112.639, 5.98065, 0, 0, 0.15069, -0.988581, 25, 0, 1),
(801178, 176546, 0, 1, 1, -9073.86, 408.301, 105.627, 5.39946, 0, 0, 0.427625, -0.903956, 25, 0, 1),
(801179, 176546, 0, 1, 1, -9072.2, 409.19, 105.315, 5.28165, 0, 0, 0.4801, -0.877214, 25, 0, 1),
(801180, 176546, 0, 1, 1, -9073.95, 408.277, 103.309, 4.40593, 0, 0, 0.806748, -0.590896, 25, 0, 1),
(801181, 176546, 0, 1, 1, -9072.43, 409.102, 102.61, 0.30615, 0, 0, 0.152478, 0.988307, 25, 0, 1),
(801264, 176546, 0, 1, 1, -9070.52, 410.096, 103.637, 5.10101, 0, 0, 0.557266, -0.830334, 25, 0, 1),
(801265, 176546, 0, 1, 1, -9075.87, 407.202, 101.811, 5.54083, 0, 0, 0.362714, -0.931901, 25, 0, 1),
(801266, 176546, 0, 1, 1, -9079.07, 404.491, 100.251, 5.11671, 0, 0, 0.550728, -0.834685, 25, 0, 1),
(801267, 176546, 0, 1, 1, -9081.33, 402.434, 99.0559, 5.4937, 0, 0, 0.38457, -0.923096, 25, 0, 1),
(801268, 176546, 0, 1, 1, -9079.23, 404.299, 103.002, 6.25554, 0, 0, 0.0138239, -0.999904, 25, 0, 1),
(801269, 176546, 0, 1, 1, -9080.39, 403.193, 104.514, 6.01992, 0, 0, 0.131254, -0.991349, 25, 0, 1),
(801270, 176546, 0, 1, 1, -9072.54, 408.951, 110.601, 5.89293, 0, 0, 0.193891, -0.981023, 25, 0, 1),
(801271, 176546, 0, 1, 1, -9073.82, 408.355, 116.008, 5.61804, 0, 0, 0.326476, -0.945206, 25, 0, 1),
(801272, 176546, 0, 1, 1, -9073.74, 408.394, 116.126, 5.61804, 0, 0, 0.326476, -0.945206, 25, 0, 1),
(801273, 176546, 0, 1, 1, -9071.68, 410.287, 116.126, 5.28425, 0, 0, 0.478959, -0.877837, 25, 0, 1),
(801274, 176546, 0, 1, 1, -9076.07, 407.204, 117.367, 5.21356, 0, 0, 0.509678, -0.860365, 25, 0, 1),
(801275, 176546, 0, 1, 1, -9076.03, 407.091, 108.346, 5.11146, 0, 0, 0.552917, -0.833236, 25, 0, 1);

DELETE FROM `creature` WHERE `id`=1000304;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4528444, 1000304, 0, 1, 1, 0, 60000, -8596.86, 658.395, 98.3699, 0.189635, 25, 0, 0, 30000, 30000, 0, 0),
(4528445, 1000304, 0, 1, 1, 0, 60000, -8569.08, 685.299, 97.0158, 2.31806, 25, 0, 0, 20000, 20000, 0, 0),
(4528446, 1000304, 0, 1, 1, 0, 60000, -8521.69, 669.798, 102.758, 5.31436, 25, 0, 0, 30000, 30000, 0, 0),
(4528447, 1000304, 0, 1, 1, 0, 60000, -8560.25, 606.184, 104.6, 2.20026, 25, 0, 0, 20000, 20000, 0, 0),
(4528448, 1000304, 0, 1, 1, 0, 60000, -8578.23, 544.282, 101.781, 4.8981, 25, 0, 0, 25000, 25000, 0, 0),
(4528449, 1000304, 0, 1, 1, 0, 60000, -8519.73, 417.86, 107.498, 0.684442, 25, 0, 0, 30000, 30000, 0, 0),
(4528450, 1000304, 0, 1, 1, 0, 60000, -8506.83, 428.485, 107.469, 3.75928, 25, 0, 0, 25000, 25000, 0, 0),
(4528451, 1000304, 0, 1, 1, 0, 60000, -8488.55, 378.629, 110.445, 0.708006, 25, 0, 0, 25000, 25000, 0, 0),
(4528452, 1000304, 0, 1, 1, 0, 60000, -8475.54, 389.773, 110.292, 3.88415, 25, 0, 0, 30000, 30000, 0, 0),
(4528453, 1000304, 0, 1, 1, 0, 60000, -8477.3, 365.103, 114.843, 0.680519, 25, 0, 0, 20000, 20000, 0, 0),
(4528454, 1000304, 0, 1, 1, 0, 60000, -8464.62, 375.388, 114.804, 3.80413, 25, 0, 0, 25000, 25000, 0, 0),
(4528443, 1000304, 0, 1, 1, 0, 60000, -8684.19, 726.705, 97.0173, 3.73178, 25, 0, 0, 30000, 30000, 0, 0),
(4528438, 1000304, 0, 1, 1, 0, 60000, -8999.11, 500.195, 97.2232, 5.3929, 25, 0, 0, 20000, 20000, 0, 0),
(4528439, 1000304, 0, 1, 1, 0, 60000, -8984.11, 481.758, 97.2207, 2.23559, 25, 0, 0, 30000, 30000, 0, 0),
(4528440, 1000304, 0, 1, 1, 0, 60000, -8913.09, 487.945, 94.0962, 2.27094, 25, 0, 0, 25000, 25000, 0, 0),
(4528441, 1000304, 0, 1, 1, 0, 60000, -8978.3, 569.266, 94.0926, 5.32614, 25, 0, 0, 25000, 25000, 0, 0),
(4528442, 1000304, 0, 1, 1, 0, 60000, -8728.96, 725.449, 101.247, 3.92421, 25, 0, 0, 25000, 25000, 0, 0);

DELETE FROM `creature` WHERE `id`=1000305;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4528456, 1000305, 0, 1, 1, 0, 0, -9045.09, 459.296, 93.2947, 0.207693, 25, 0, 0, 900000, 900000, 0, 0),
(4528457, 1000305, 0, 1, 1, 0, 0, -9035.58, 446.785, 93.2963, 1.13446, 25, 0, 0, 900000, 900000, 0, 0),
(4528458, 1000305, 0, 1, 1, 0, 0, -9031.08, 301.901, 109.109, 1.64497, 25, 0, 0, 900000, 900000, 0, 0),
(4528459, 1000305, 0, 1, 1, 0, 0, -9167.98, 463.107, 104.379, 5.99214, 25, 0, 0, 900000, 900000, 0, 0);

DELETE FROM `creature` WHERE `id`=1000306;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(4528460, 1000306, 0, 1, 1, 0, 0, -9049.96, 392.072, 120.382, 4.10786, 25, 0, 0, 900000, 900000, 0, 0),
(4528462, 1000306, 0, 1, 1, 0, 0, -9021.8, 356.381, 120.382, 3.8212, 25, 0, 0, 900000, 900000, 0, 0),
(4528463, 1000306, 0, 1, 1, 0, 0, -8939.24, 532.62, 116.183, 3.81334, 25, 0, 0, 900000, 900000, 0, 0),
(4528464, 1000306, 0, 1, 1, 0, 0, -8859.71, 490.051, 109.596, 3.29498, 25, 0, 0, 900000, 900000, 0, 0),
(4528465, 1000306, 0, 1, 1, 0, 0, -8954.85, 608.136, 141.069, 4.49271, 25, 0, 0, 900000, 900000, 0, 0);


DELETE FROM `gameobject` WHERE `id`=188450;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(801398, 188450, 0, 1, 1, -9081.58, 403.691, 101.384, 5.90707, 0, 0, 0.186951, -0.982369, 25, 0, 1),
(801399, 188450, 0, 1, 1, -9072.94, 408.842, 102.062, 4.90176, 0, 0, 0.637085, -0.770794, 25, 0, 1),
(801401, 188450, 0, 1, 1, -9076.47, 406.847, 108.056, 4.74861, 0, 0, 0.694185, -0.719796, 25, 0, 1),
(801402, 188450, 0, 1, 1, -9073.15, 408.68, 113.37, 5.23163, 0, 0, 0.501885, -0.864934, 25, 0, 1),
(801403, 188450, 0, 1, 1, -9079.6, 403.888, 113.71, 5.73978, 0, 0, 0.268372, -0.963315, 25, 0, 1),
(801404, 188450, 0, 1, 1, -9076.84, 406.618, 97.1267, 5.43257, 0, 0, 0.4126, -0.910912, 25, 0, 1);

DELETE FROM `gameobject` WHERE `id`=142191;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(801164, 142191, 0, 1, 1, -9108.09, 378.603, 93.7407, 5.31486, 0, 0, 0.465466, -0.885066, 25, 0, 1),
(801165, 142191, 0, 1, 1, -9108.35, 376.943, 93.8246, 0.637816, 0, 0, 0.31353, 0.949578, 25, 0, 1);


DELETE FROM `gameobject` WHERE `id`=1730;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(801167, 1730, 0, 1, 1, -9107.18, 377.293, 93.755, 2.74661, 0, 0, 0.980562, 0.19621, 25, 0, 1);

/* Automatique */

DELETE FROM `game_event` WHERE (`entry`=51);
REPLACE INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (51, '2008-16-04 17:00:00', '2020-12-31 00:00:00', 1440, 180, 0, 'Attaque d\'Hurlevent');
DELETE FROM `game_event_creature` WHERE abs(`event`) = 51;
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES
(4528459,51),
(4528458,51),
(4528457,51),
(4528456,51),
(4528453,51),
(4528438,51),
(4528440,51),
(4528454,51),
(4528448,51),
(4528450,51),
(4528451,51),
(4528449,51),
(4528452,51),
(4528443,51),
(4528439,51),
(4528441,51),
(4528442,51),
(4508931,51),
(4508930,51),
(4508927,51),
(4508926,51),
(4508925,51),
(4508924,51),
(4508923,51),
(4508922,51),
(4508921,51),
(4508920,51),
(4508919,51),
(4508918,51),
(4508917,51),
(4508916,51),
(4498406,51),
(4500148,51),
(4500143,51),
(4500061,51),
(4499829,51),
(4499827,51),
(4499825,51),
(4499824,51),
(4498466,51),
(4498465,51),
(4498464,51),
(4498461,51),
(4498401,51),
(4498402,51),
(4498403,51),
(4498439,51),
(4498435,51),
(4498434,51),
(4498433,51),
(4498432,51),
(4498431,51),
(4498430,51),
(4498429,51),
(4498419,51),
(4498416,51),
(4498437,51),
(4498410,51),
(4498409,51),
(4498408,51),
(4498407,51),
(4498404,51),
(4498458,51),
(4498457,51),
(4498452,51),
(4498453,51),
(4498454,51),
(4498455,51),
(4498456,51),
(4498451,51),
(4528465,51),
(4528464,51),
(4528463,51),
(4528462,51),
(4528460,51),
(4498449,51),
(4498450,51),
(4498440,51),
(4498441,51),
(4498448,51),
(4498438,51),
(4498428,51),
(4528444,51),
(4528445,51),
(4528446,51),
(4528447,51);
DELETE FROM `game_event_gameobject` WHERE abs(`event`) = 51;
REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES
(801272,51),
(801267,51),
(801266,51),
(801268,51),
(801269,51),
(801265,51),
(801264,51),
(801275,51),
(801270,51),
(801273,51),
(801271,51),
(801274,51),
(801162,51),
(801167,51),
(801165,51),
(801161,51),
(801160,51),
(801159,51),
(801157,51),
(801156,51),
(801158,51),
(801404,51),
(801403,51),
(801402,51),
(801401,51),
(799339,51),
(799334,51),
(799336,51),
(799337,51),
(801170,51),
(801171,51),
(801172,51),
(801175,51),
(801176,51),
(801177,51),
(801178,51),
(801179,51),
(801180,51),
(801181,51),
(801398,51),
(801399,51),
(801163,51),
(801164,51);





