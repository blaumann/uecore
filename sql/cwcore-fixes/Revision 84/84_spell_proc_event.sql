DELETE FROM `spell_proc_event` WHERE `entry` IN (51698, 51700, 51701);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 51698, 0x00,   0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   1), -- Honor Among Thieves
( 51700, 0x00,   0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   1), -- Honor Among Thieves
( 51701, 0x00,   0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   1); -- Honor Among Thieves

DELETE FROM `spell_proc_event` WHERE `entry` IN (51521, 51522);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
( 51521, 0x00,   11, 0x00000000, 0x01000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0), -- Improved Stormspike
( 51522, 0x00,   11, 0x00000000, 0x01000000, 0x00000000, 0x00000000, 0x00000000,   0,   0,   0); -- Improved Stormspike

insert into spell_bonus_data values (53601,0.75,0,0,'Paladin - Sacred Shield');
