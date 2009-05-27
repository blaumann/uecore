DROP PROCEDURE IF EXISTS tmp_add_column;
delimiter //
CREATE PROCEDURE tmp_add_column()
BEGIN
  IF NOT EXISTS (SELECT 1 FROM `INFORMATION_SCHEMA`.COLUMNS
                WHERE TABLE_NAME = 'npc_spellclick_spells' AND COLUMN_NAME = 'quest_status')
  THEN
    ALTER TABLE npc_spellclick_spells
      ADD COLUMN testtest tinyint(1) unsigned NOT NULL default '0';
  END IF;
end//
delimiter ;
CALL tmp_add_column();
DROP PROCEDURE tmp_add_column;

REPLACE INTO `npc_spellclick_spells` VALUES ('29488', '54568', '12670', '1', '3');
REPLACE INTO `npc_spellclick_spells` VALUES ('29501', '54575', '12670', '1', '3');

-- Quest 12680
DELETE FROM npc_spellclick_spells WHERE `npc_entry` IN (28605,28606,28607);
INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `quest_id`, `quest_status`, `cast_flags`) VALUES
(28605, 52263, 12680, 3, 1),
(28606, 52263, 12680, 3, 1),
(28607, 52263, 12680, 3, 1);