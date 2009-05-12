-- Aspect of the Viper
REPLACE INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(34074, 0, 9, 522819, 8917121, 513, 0, 0, 0, 0, 0);

-- Sonic Booster
UPDATE spell_proc_event SET ppmRate='1' WHERE entry='55018';

-- Noise Machine
UPDATE spell_proc_event SET ppmRate='1' WHERE entry='55019';

-- Sonic Shield
REPLACE INTO `spell_proc_event` VALUES ('54808', '0', '0', '0', '0', '0', '0', '0', '0', '0', '60');

-- Sonic Awareness (DND)
REPLACE INTO `spell_proc_event` VALUES ('54707', '0', '0', '0', '0', '0', '0', '0', '0', '0', '60');

-- Invigorating Earthsiege Diamond Passive
REPLACE INTO `spell_proc_event` VALUES ('61356', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Darkmoon Card: Greatness
REPLACE INTO `spell_proc_event` VALUES ('57345', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Bandit's Insignia
REPLACE INTO `spell_proc_event` VALUES ('60442', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Titanium Shield Spike
REPLACE INTO `spell_proc_event` VALUES ('56355', '0', '0', '0', '0', '0', '64', '0', '0', '0', '5');

-- Thundering Skyflare Diamond
REPLACE INTO `spell_proc_event` VALUES ('55380', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Swordguard Embroidery
REPLACE INTO `spell_proc_event` VALUES ('55776', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Darkglow Embroidery
REPLACE INTO `spell_proc_event` VALUES ('55768', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Lightweave Embroidery
REPLACE INTO `spell_proc_event` VALUES ('55640', '0', '0', '0', '0', '0', '0', '0', '0', '0', '45');

-- Ferocious Inspiration
REPLACE INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(34457, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0);

-- Frenzy
REPLACE INTO `spell_proc_event` (`entry` ,`SchoolMask` ,`SpellFamilyName` ,`SpellFamilyMask0` ,`SpellFamilyMask1` ,`SpellFamilyMask2` ,`procFlags` ,`procEx` ,`ppmRate` ,`CustomChance` ,`Cooldown`)VALUES 
('20784', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0'); 

-- Master Tactician
REPLACE INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(34506, 0, 9, 522753, 8392833, 513, 0, 0, 0, 0, 0),
(34507, 0, 9, 522753, 8392833, 513, 0, 0, 0, 0, 0),
(34508, 0, 9, 522753, 8392833, 513, 0, 0, 0, 0, 0),
(34838, 0, 9, 522753, 8392833, 513, 0, 0, 0, 0, 0),
(34839, 0, 9, 522753, 8392833, 513, 0, 0, 0, 0, 0); 

-- Hunting Party
DELETE FROM spell_proc_event WHERE entry IN (53290, 53291, 53292, 53293, 53294);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(53290, 0, 9, 0x800, 0x1, 0x200, 0, 0x2, 0, 0, 0),
(53291, 0, 9, 0x800, 0x1, 0x200, 0, 0x2, 0, 0, 0),
(53292, 0, 9, 0x800, 0x1, 0x200, 0, 0x2, 0, 0, 0),
(53293, 0, 9, 0x800, 0x1, 0x200, 0, 0x2, 0, 0, 0),
(53294, 0, 9, 0x800, 0x1, 0x200, 0, 0x2, 0, 0, 0); 

-- Infusion of Light
DELETE FROM `spell_proc_event` WHERE `entry` IN ('53569','53576'); 
INSERT INTO spell_proc_event VALUES ('53569','0','10','2097152','327680','0','0','2','0','0','0'); 
INSERT INTO spell_proc_event VALUES ('53576','0','10','2097152','327680','0','0','2','0','0','0'); 

-- Arcane Potency
DELETE FROM `spell_proc_event` WHERE `entry` IN (31571, 31572);
INSERT INTO `spell_proc_event` VALUES
(31571, 0x00, 3, 0x00000000, 0x00000022, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 0),
(31572, 0x00, 3, 0x00000000, 0x00000022, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 0);

-- (48492) King of the Jungle (Rank 1) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (48492); 
INSERT INTO `spell_proc_event` VALUES (48492, 0x00, 7, 0x00080000, 0x00000000, 0x00000800, 0x00004000, 0x00000000, 0.000000, 0.000000, 0); 

-- (48494) King of the Jungle (Rank 2) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (48494); 
INSERT INTO `spell_proc_event` VALUES (48494, 0x00, 7, 0x00080000, 0x00000000, 0x00000800, 0x00004000, 0x00000000, 0.000000, 0.000000, 0); 

-- (48495) King of the Jungle (Rank 3) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (48495); 
INSERT INTO `spell_proc_event` VALUES (48495, 0x00, 7, 0x00080000, 0x00000000, 0x00000800, 0x00004000, 0x00000000, 0.000000, 0.000000, 0);

DELETE FROM spell_proc_event WHERE entry IN(49632,49631,49032,51099,51160,51161);
INSERT INTO spell_proc_event VALUES(49632,0,15,0,2048,2,82192,0,0,0,0);
INSERT INTO spell_proc_event VALUES(49631,0,15,0,2048,2,82192,0,0,0,0);
INSERT INTO spell_proc_event VALUES(49032,0,15,0,2048,2,82192,0,0,0,0);
INSERT INTO spell_proc_event VALUES(51099,0,15,0,2048,2,82192,0,0,0,0);
INSERT INTO spell_proc_event VALUES(51160,0,15,0,2048,2,82192,0,0,0,0);
INSERT INTO spell_proc_event VALUES(51161,0,15,0,2048,2,82192,0,0,0,0);

REPLACE INTO spell_proc_event VALUES (60442,0,0,0,0,0,0,0x0000001,1.5,0,45);

-- 20166 Seal of wisdom () 
DELETE FROM `spell_proc_event` WHERE `entry` IN (20166); 
INSERT INTO `spell_proc_event` VALUES (20166, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 12.000000, 0.000000, 0); 

-- 32385 Shadow embrace (Rank 1) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (32385); 
INSERT INTO `spell_proc_event` VALUES (32385, 0x00, 5, 0x00000001, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0); 

-- 32387 Shadow embrace (Rank 2) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (32387); 
INSERT INTO `spell_proc_event` VALUES (32387, 0x00, 5, 0x00000001, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0); 

-- 32392 Shadow embrace (Rank 3) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (32392); 
INSERT INTO `spell_proc_event` VALUES (32392, 0x00, 5, 0x00000001, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0); 

-- 32393 Shadow embrace (Rank 4) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (32393); 
INSERT INTO `spell_proc_event` VALUES (32393, 0x00, 5, 0x00000001, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0); 

-- 32394 Shadow embrace (Rank 5) 
DELETE FROM `spell_proc_event` WHERE `entry` IN (32394); 
INSERT INTO `spell_proc_event` VALUES (32394, 0x00, 5, 0x00000001, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0);

-- Darkmoon Card: Death ()
DELETE FROM spell_proc_event WHERE entry=57352;
INSERT INTO spell_proc_event VALUES (57352,0,0,0,0,0,0,0,0,35,45);

-- 55198 Tidial Force ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (55198);
INSERT INTO `spell_proc_event` VALUES (55198, 0x00, 11, 0x000001C0, 0x00000000, 0x00000000, 0x00004000, 0x00000002, 0.000000, 0.000000, 0);

-- Improved Divine Spirit ()
delete from `spell_proc_event` where `entry` ='33182';
insert into `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) values('33182','2','6','32','1024','0','16384','0','0','0','0');
delete from `spell_proc_event` where `entry` ='33174';
insert into `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) values('33174','2','6','32','1024','0','16384','0','0','0','0');