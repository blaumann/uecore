-- updated start time for event Fishing Extra
update `game_event` set start_time='2009-03-29 14:00:00' where entry=15;
-- Jang
DELETE FROM `creature` WHERE `id`=15078;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(54687, 15078, 0, 1, 1, 0, 1711, -14438, 473.661, 15.3137, 3.65362, 25, 0, 0, 3200, 0, 0, 0);
-- Fishbot 5000
DELETE FROM `creature` WHERE `id`=15079;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(54688, 15079, 0, 1, 1, 0, 0, -14440, 477.446, 15.25, 3.71802, 25, 0, 0, 2600, 0, 0, 0);
-- Riggle Bassbait
DELETE FROM `creature` WHERE `id`=15077;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(3849539, 15077, 0, 1, 1, 0, 13, -14439.3, 475.42, 15.892, 3.68503, 25, 0, 0, 3700, 0, 0, 0);
-- Soapbox gameobject
DELETE FROM `gameobject` WHERE `id`=180403;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(100391, 180403, 0, 1, 1, -14439.3, 475.42, 15.2791, 3.68503, 0, 0, 0.963311, -0.268388, 25, 0, 1);
 
-- new event - Fishing Extravaganza Questgivers
DELETE FROM `game_event_creature` WHERE `guid` IN (54687,54688,3849539);
DELETE FROM `game_event_gameobject`WHERE `guid`=100391;
 
DELETE FROM `game_event` WHERE `entry`=35;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES (35, '2009-03-29 12:00:00', '2020-12-31 00:00:00', 10080, 300, 0, 'Fishing Extravaganza Questgivers');
DELETE FROM `game_event_creature` WHERE abs(`event`) = 35;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(54687,35),
(54688,35),
(3849539,35);
DELETE FROM `game_event_gameobject` WHERE abs(`event`) = 35;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(100391,35);