REPLACE INTO `npc_spellclick_spells` VALUES ('29488', '54568', '12670', '1', '3');
REPLACE INTO `npc_spellclick_spells` VALUES ('29501', '54575', '12670', '1', '3');

-- Quest 12680
DELETE FROM npc_spellclick_spells WHERE `npc_entry` IN (28605,28606,28607);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_id`, `quest_status`, `cast_flags`) VALUES
(28605, 52263, 12680, 3, 1),
(28606, 52263, 12680, 3, 1),
(28607, 52263, 12680, 3, 1);

-- Quest 12641
update creature_template set spell4=51890 where entry = 28511; -- Eye of Acherus flight

DELETE FROM `spell_script_target` WHERE entry IN
(51859);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(51859, 1, 28525), -- siphon of archerus
(51859, 1, 28542),
(51859, 1, 28543),
(51859, 1, 28544);

update creature_template set minlevel=50,maxlevel=52,minhealth=2215,maxhealth=2317,faction_A=2084,faction_H=2084,mindmg=50,maxdmg=50 where entry=28528; -- ghoul
UPDATE `creature_template` SET `npcflag` = 16777216 WHERE `entry` IN (29501, 29488);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN ('29501', '29488');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_id`, `quest_status`, `cast_flags`) VALUES
('29488', '54568', '12670', '1', '3'),
('29501', '54575', '12670', '1', '3');

-- Spellclick spell to mount deathcharger
DELETE FROM npc_spellclick_spells WHERE `npc_entry`=28782;
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_id`, `quest_status`, `cast_flags`) VALUES
(28782, 52280, 12687, 3, 1);

UPDATE creature_template SET `ScriptName`='npc_salanar_the_horseman' WHERE `entry`=28653;