-- // Permet de preparer les tables `locales_*` a l'application d'un patch de traduction
-- // IMPORTANT : A re-appliquer apres chaque mise a jour d'UDB.

INSERT IGNORE INTO `locales_item` (`entry`) SELECT `entry` FROM `item_template`;
INSERT IGNORE INTO `locales_creature` (`entry`) SELECT `entry` FROM `creature_template`;
INSERT IGNORE INTO `locales_gameobject` (`entry`) SELECT `entry` FROM `gameobject_template`;
INSERT IGNORE INTO `locales_quest`(`entry`) SELECT `entry` FROM `quest_template`;
INSERT IGNORE INTO `locales_page_text`(`entry`) SELECT `entry` FROM `page_text`;
INSERT IGNORE INTO `locales_npc_text` (`entry`) SELECT `ID` FROM `npc_text`;
INSERT IGNORE INTO `locales_points_of_interest` (`entry`) SELECT `entry` FROM `points_of_interest`;
INSERT IGNORE INTO `locales_achievement_reward` (`entry`) SELECT `entry` FROM `achievement_reward`;
INSERT IGNORE INTO `locales_npc_option` (`entry`) SELECT `id` FROM `npc_option`;