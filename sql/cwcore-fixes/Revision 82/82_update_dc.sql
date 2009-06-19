-- The Endless Hunger --
-- gameobgect scriptname
UPDATE `gameobject_template` set `ScriptName` = "go_acherus_soul_prison" where `name` = "Acherus Soul Prison";
-- creature scriptname
UPDATE `creature_template` set `ScriptName`= "npc_unworthy_initiate" where `name` ="Unworthy Initiate";
UPDATE `creature_template` set `ScriptName` = "npc_unworthy_initiate_anchor" where name="Unworthy Initiate Anchor";
-- delete auras
DELETE FROM `creature_addon` WHERE auras="54612 0";
-- EquipmentID
UPDATE `creature_template` set `equipment_id` = 363 where name="Unworthy Initiate";

-- Death's Challenge --
update `creature_template` set `ScriptName` = "npc_death_knight_initiate" where `name` = "Death Knight Initiate";

-- Parametrs
REPLACE INTO `creature_template` VALUES (28406, 0, 25375, 25426, 25424, 25412, 'Death Knight Initiate', '', 'Speak', 55, 55, 3268, 3268, 0, 0, 0, 2084, 2084, 1, 1, 1, 0, 138, 202, 0, 146, 1, 2000, 0, 0, 32768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52372, 52373, 52374, 52375, 0, 0, 0, '', 0, 3, 1.25, 1, 0, 1, 363, 0, 0, 'npc_death_knight_initiate');