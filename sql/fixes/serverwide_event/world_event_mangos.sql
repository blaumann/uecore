
DROP TABLE IF EXISTS `game_event_battleground_holiday`;
CREATE TABLE `game_event_battleground_holiday` (
 `event` int(10) unsigned NOT NULL,
 `bgflag` int(10) unsigned NOT NULL default '0',
 PRIMARY KEY  (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_npc_vendor`;
CREATE TABLE `game_event_npc_vendor` (
  `event` mediumint(8) unsigned NOT NULL default '0',
  `guid` mediumint(8) unsigned NOT NULL default '0',
  `item` mediumint(8) unsigned NOT NULL default '0',
  `maxcount` mediumint(8) unsigned NOT NULL default '0',
  `incrtime` mediumint(8) unsigned NOT NULL default '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guid`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP PROCEDURE IF EXISTS tmp_add_column;
delimiter //
CREATE PROCEDURE tmp_add_column()
BEGIN
  IF NOT EXISTS (SELECT 1 FROM `INFORMATION_SCHEMA`.COLUMNS
                WHERE TABLE_NAME = 'game_event' AND COLUMN_NAME = 'world_event')
  THEN
	ALTER IGNORE TABLE game_event ADD COLUMN world_event tinyint(3) unsigned not null default 0 comment '0 if normal event, 1 if world event';
  END IF;
end//
delimiter ;
CALL tmp_add_column();
DROP PROCEDURE tmp_add_column;



DROP TABLE IF EXISTS `game_event_quest_condition`;
CREATE TABLE `game_event_quest_condition` (
                              `quest` mediumint(8) unsigned NOT NULL default '0',
                              `event_id` mediumint(8) unsigned NOT NULL default '0',
                              `condition_id` mediumint(8) unsigned NOT NULL default '0',
                              `num` float default '0',
                              PRIMARY KEY (`quest`)
                            ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_condition`;
CREATE TABLE `game_event_condition` (
                        `event_id` mediumint(8) unsigned NOT NULL default '0',
                        `condition_id` mediumint(8) unsigned NOT NULL default '0',
                        `req_num` float default '0',
                        `max_world_state_field` smallint(5) unsigned NOT NULL default '0',
                        `done_world_state_field` smallint(5) unsigned NOT NULL default '0',
                        `description` varchar(25) NOT NULL default '',
                        PRIMARY KEY (`event_id`,`condition_id`)
                      ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_npcflag`;
CREATE TABLE `game_event_npcflag` (
                      `guid` mediumint(8) unsigned NOT NULL default '0',
                      `event_id` mediumint(8) unsigned NOT NULL default '0',
                      `npcflag` int(10) unsigned NOT NULL default '0',
                      PRIMARY KEY (`guid`,`event_id`)
                    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_prerequisite`;
CREATE TABLE `game_event_prerequisite` (
                           `event_id` mediumint(8) unsigned NOT NULL,
                           `prerequisite_event` mediumint(8) unsigned NOT NULL,
                           PRIMARY KEY (`event_id`,`prerequisite_event`)
                         ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_npc_gossip`;
CREATE TABLE `game_event_npc_gossip` (
                         `guid` int(10) unsigned NOT NULL,
                         `event_id` mediumint(8) unsigned NOT NULL default '0',
                         `textid` mediumint(8) unsigned NOT NULL default '0',
                         PRIMARY KEY (`guid`)
                       ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `game_event_gameobject_quest`;
CREATE TABLE `game_event_gameobject_quest` (
                               `id` mediumint(8) unsigned NOT NULL default '0',
                               `quest` mediumint(8) unsigned NOT NULL default '0',
                               `event` smallint(5) unsigned NOT NULL default '0',
                               PRIMARY KEY (`quest`,`event`,`id`)
                             ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE game_event_creature_quest DROP PRIMARY KEY, ADD PRIMARY KEY (quest, event, id);

ALTER TABLE game_event_creature DROP PRIMARY KEY, ADD PRIMARY KEY (guid, event);

ALTER TABLE game_event_gameobject DROP PRIMARY KEY, ADD PRIMARY KEY (guid, event);
