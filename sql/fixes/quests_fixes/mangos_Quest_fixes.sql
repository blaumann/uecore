UPDATE `creature_template` SET `ScriptName`= 'npc_clintar_dreamwalker' WHERE `entry`='22834';
UPDATE `creature_template` SET `ScriptName`= 'npc_clintar_spirit' WHERE `entry`='22916';
UPDATE `creature_template` SET `ScriptName`= 'npc_deathstalker_erland' where `entry`='1978';
UPDATE `gameobject_template` SET `ScriptName`='go_cat_figurine' WHERE `entry`='13359';

-- Whizzlecrank's Shredder
UPDATE `creature_template` SET `ScriptName`='npc_wizzlecrank_shredder' WHERE `entry`='3439';

-- Nestlewood Owlkin (16518)
UPDATE `creature_template` SET `ScriptName`='mob_nestlewood_owlkin' WHERE `entry`='16518';

-- Ruul Snowhoof (12818)
UPDATE `creature_template` SET `ScriptName` = 'npc_ruul_snowhoof' WHERE `entry` = '12818';

UPDATE `quest_template` SET `specialflags` = `specialflags`|2 WHERE `entry` = '665';
UPDATE `creature_template` SET `ScriptName` = 'npc_professor_phizzlethorpe' WHERE `entry` = '2768';

-- Khadgar's Servant
UPDATE `creature_template` SET  `speed` = '1.7', `ScriptName` = 'npc_kservant' WHERE `entry` = '19685';
-- DELETE FROM `quest_start_scripts` WHERE `id`='10211';
-- UPDATE `quest_template` SET `StartScript`='0' WHERE entry=10211;

-- Khadgar
UPDATE `creature_template` SET `ScriptName`='npc_khadgar' WHERE `entry` = '18166';

-- Quest: The Endless Hunger
-- set the scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_unworthy_initiate' WHERE `entry`  IN (29519, 29520, 29565, 29566, 29567);
UPDATE `creature_template` SET `ScriptName`='npc_unworthy_initiate_trigger' WHERE `name`='unworthy initiate anchor';
UPDATE `gameobject_template` SET `ScriptName`='go_acherus_soul_prison' WHERE `name` = 'Acherus Soul Prison';

-- Delete all preexisting auras from creature addon
UPDATE `creature_addon` SET auras='' WHERE auras='54612 0';

DELETE FROM `script_texts` WHERE `entry` IN (-1999926, -1999927, -1999928, -1999929, -1999930, -1999931);
INSERT INTO `script_texts`(`entry`, `content_default`, `type`, `emote`) VALUES
-- 1
(-1999926, 'You have made a grave error, fiend!', 1, 0),
(-1999927, 'Unworthy Initiate says: To battle!', 1, 0), 
-- 2
(-1999928, 'I was a soldier of the Light once... Look at what I have become... ', 1, 0),
(-1999929, 'Let your fears consume you!', 1, 0),
-- 3
(-1999930, 'You are hopelessly outmatched\, $R.', 1, 0),
(-1999931, 'And now you die!', 1, 0);


