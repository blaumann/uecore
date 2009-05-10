ALTER TABLE npc_spellclick_spells
  ADD COLUMN quest_status tinyint(1) unsigned NOT NULL default '0' AFTER quest_id;

INSERT INTO `npc_spellclick_spells` VALUES ('29488', '54568', '12670', '1', '3');
INSERT INTO `npc_spellclick_spells` VALUES ('29501', '54575', '12670', '1', '3');