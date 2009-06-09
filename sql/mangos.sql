-- MySQL dump 10.13  Distrib 6.0.10-alpha, for Win32 (ia32)
--
-- Host: localhost    Database: mangos
-- ------------------------------------------------------
-- Server version	6.0.10-alpha-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--

-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
CREATE TABLE `db_version` (
  `version` varchar(120) default NULL,
  `creature_ai_version` varchar(120) default NULL,
  `required_7980_01_mangos_item_required_target` bit(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES
('Mangos default database.','Creature EventAI not provided.',NULL);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievement_criteria_data`
--

DROP TABLE IF EXISTS `achievement_criteria_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `achievement_criteria_data` (
  `criteria_id` mediumint(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Achievment system';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `achievement_criteria_data`
--

LOCK TABLES `achievement_criteria_data` WRITE;
/*!40000 ALTER TABLE `achievement_criteria_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_criteria_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievement_reward`
--

DROP TABLE IF EXISTS `achievement_reward`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Achievment system';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `achievement_reward`
--

LOCK TABLES `achievement_reward` WRITE;
/*!40000 ALTER TABLE `achievement_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areatrigger_involvedrelation`
--

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `areatrigger_involvedrelation`
--

LOCK TABLES `areatrigger_involvedrelation` WRITE;
/*!40000 ALTER TABLE `areatrigger_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_involvedrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areatrigger_scripts`
--

DROP TABLE IF EXISTS `areatrigger_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `areatrigger_scripts`
--

LOCK TABLES `areatrigger_scripts` WRITE;
/*!40000 ALTER TABLE `areatrigger_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areatrigger_tavern`
--

DROP TABLE IF EXISTS `areatrigger_tavern`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `areatrigger_tavern`
--

LOCK TABLES `areatrigger_tavern` WRITE;
/*!40000 ALTER TABLE `areatrigger_tavern` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_tavern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areatrigger_teleport`
--

DROP TABLE IF EXISTS `areatrigger_teleport`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `required_level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required_item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_key` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_key2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `required_quest_done` int(11) unsigned NOT NULL DEFAULT '0',
  `required_quest_done_heroic` int(11) unsigned NOT NULL DEFAULT '0',
  `required_failed_text` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `areatrigger_teleport`
--

LOCK TABLES `areatrigger_teleport` WRITE;
/*!40000 ALTER TABLE `areatrigger_teleport` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatrigger_teleport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battleground_template`
--

DROP TABLE IF EXISTS `battleground_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `battleground_template`
--

LOCK TABLES `battleground_template` WRITE;
/*!40000 ALTER TABLE `battleground_template` DISABLE KEYS */;
INSERT INTO `battleground_template` VALUES (1,0,0,0,0,611,2.72532,610,2.27452),(2,0,0,0,0,769,3.14159,770,3.14159),(4,0,2,10,70,929,0,936,3.14159),(3,0,0,0,0,890,3.40156,889,0.263892),(5,0,2,10,70,939,0,940,3.14159),(6,0,2,10,70,0,0,0,0),(7,0,0,0,0,1103,3.40156,1104,0.263892),(8,0,2,10,70,1258,0,1259,3.14159),(9,0,0,0,0,1367,0,1368,0),(10,5,5,10,80,1362,0,1363,0),(11,5,5,10,80,1364,0,1365,0);
/*!40000 ALTER TABLE `battleground_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlemaster_entry`
--

DROP TABLE IF EXISTS `battlemaster_entry`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `battlemaster_entry`
--

LOCK TABLES `battlemaster_entry` WRITE;
/*!40000 ALTER TABLE `battlemaster_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlemaster_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES
('account',0,'Syntax: .account\r\n\r\nDisplay the access level of your account.'),
('account create',4,'Syntax: .account create $account $password\r\n\r\nCreate account and set password to it.'),
('account delete',4,'Syntax: .account delete $account\r\n\r\nDelete account with all characters.'),
('account lock',0,'Syntax: .account lock [on|off]\r\n\r\nAllow login from account only from current used IP or remove this requirement.'),
('account onlinelist',4,'Syntax: .account onlinelist\r\n\r\nShow list of online accounts.'),
('account password',0,'Syntax: .account password $old_password $new_password $new_password\r\n\r\nChange your account password.'),
('account set addon',3,'Syntax: .account set addon [$account] #addon\r\n\r\nSet user (possible targeted) expansion addon level allowed. Addon values: 0 - normal, 1 - tbc, 2 - wotlk.'),
('account set gmlevel',4,'Syntax: .account set gmlevel [$account] #level\r\n\r\nSet the security level for targeted player (can''t be used at self) or for account $name to a level of #level.\r\n\r\n#level may range from 0 to 3.'),
('account set password',4,'Syntax: .account set password $account $password $password\r\n\r\nSet password for account.'),
('additem',3,'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount\r\n\r\nAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added.\r\n.'),
('additemset',3,'Syntax: .additemset #itemsetid\r\n\r\nAdd items from itemset of id #itemsetid to your or selected character inventory. Will add by one example each item from itemset.'),
('announce',1,'Syntax: .announce $MessageToBroadcast\r\n\r\nSend a global message to all players online in chat log.'),
('aura',3,'Syntax: .aura #spellid\r\n\r\nAdd the aura from spell #spellid to the selected Unit.'),
('ban account',3,'Syntax: .ban account $Name $bantime $reason\r\nBan account kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('ban character',3,'Syntax: .ban character $Name $bantime $reason\r\nBan account and kick player.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('ban ip',3,'Syntax: .ban ip $Ip $bantime $reason\r\nBan IP.\r\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".'),
('baninfo account',3,'Syntax: .baninfo account $accountid\r\nWatch full information about a specific ban.'),
('baninfo character',3,'Syntax: .baninfo character $charactername \r\nWatch full information about a specific ban.'),
('baninfo ip',3,'Syntax: .baninfo ip $ip\r\nWatch full information about a specific ban.'),
('bank',3,'Syntax: .bank\r\n\r\nShow your bank inventory.'),
('banlist account',3,'Syntax: .banlist account [$Name]\r\nSearches the banlist for a account name pattern or show full list account bans.'),
('banlist character',3,'Syntax: .banlist character $Name\r\nSearches the banlist for a character name pattern. Pattern required.'),
('banlist ip',3,'Syntax: .banlist ip [$Ip]\r\nSearches the banlist for a IP pattern or show full list of IP bans.'),
('cast',3,'Syntax: .cast #spellid [triggered]\r\n  Cast #spellid to selected target. If no target selected cast to self. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast back',3,'Syntax: .cast back #spellid [triggered]\r\n  Selected target will cast #spellid to your character. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast dist',3,'Syntax: .cast dist #spellid [#dist [triggered]]\r\n  You will cast spell to pint at distance #dist. If \'trigered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.'),
('cast self',3,'Syntax: .cast self #spellid [triggered]\r\nCast #spellid by target at target itself. If \'trigered\' or part provided then spell casted with triggered flag.'),
('cast target',3,'Syntax: .cast target #spellid [triggered]\r\n  Selected target will cast #spellid to his victim. If \'trigered\' or part provided then spell casted with triggered flag.'),
('character customize',2,'Syntax: .character customize [$name]\r\n\r\nMark selected in game or by $name in command character for customize at next login.'),
('character delete',4,'Syntax: .character delete $name\r\n\r\nDelete character $name.'),
('character level',3,'Syntax: .character level [$playername] [#level]\r\n\r\nSet the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent values recalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.'),
('character rename',2,'Syntax: .character rename [$name]\r\n\r\nMark selected in game or by $name in command character for rename at next login.'),
('character reputation',2,'Syntax: .character reputation [$player_name]\r\n\r\nShow reputation information for selected player or player find by $player_name.'),
('combatstop',2,'Syntax: .combatstop [$playername]\r\nStop combat for selected character. If selected non-player then command applied to self. If $playername provided then attempt applied to online player $playername.'),
('commands',0,'Syntax: .commands\r\n\r\nDisplay a list of available commands for your account level.'),
('cooldown',3,'Syntax: .cooldown [#spell_id]\r\n\r\nRemove all (if spell_id not provided) or #spel_id spell cooldown from selected character or you (if no selection).'),
('damage',3,'Syntax: .damage $damage_amount [$school [$spellid]]\r\n\r\nApply $damage to target. If not $school and $spellid provided then this flat clean melee damage without any modifiers. If $school provided then damage modified by armor reduction (if school physical), and target absorbing modifiers and result applied as melee damage to target. If spell provided then damage modified and applied as spell damage. $spellid can be shift-link.'),
('debug anim',2,'Syntax: .debug anim #emoteid\r\n\r\nPlay emote #emoteid for your character.'),
('debug arena',3,'Syntax: .debug arena\r\n\r\nToggle debug mode for arenas. In debug mode GM can start arena with single player.'),
('debug bg',3,'Syntax: .debug bg\r\n\r\nToggle debug mode for battlegrounds. In debug mode GM can start battleground with single player.'),
('debug getvalue',3,'Syntax: .debug getvalue #field #isInt\r\n\r\nGet the field #field of the selected creature. If no creature is selected, get the content of your field.\r\n\r\nUse a #isInt of value 1 if the expected field content is an integer.'),
('debug play cinematic',1,'Syntax: .debug play cinematic #cinematicid\r\n\r\nPlay cinematic #cinematicid for you. You stay at place while your mind fly.\r\n'),
('debug play movie',1,'Syntax: .debug play movie #movieid\r\n\r\nPlay movie #movieid for you.'),
('debug play sound',1,'Syntax: .debug play sound #soundid\r\n\r\nPlay sound with #soundid.\r\nSound will be play only for you. Other players do not hear this.\r\nWarning: client may have more 5000 sounds...'),
('debug setvalue',3,'Syntax: .debug setvalue #field #value #isInt\r\n\r\nSet the field #field of the selected creature with value #value. If no creature is selected, set the content of your field.\r\n\r\nUse a #isInt of value 1 if #value is an integer.'),
('debug update',3,'Syntax: .debug update #field #value\r\n\r\nUpdate the field #field of the selected character or creature with value #value.\r\n\r\nIf no #value is provided, display the content of field #field.'),
('debug Mod32Value',3,'Syntax: .debug Mod32Value #field #value\r\n\r\nAdd #value to field #field of your character.'),
('delticket',2,'Syntax: .delticket all\r\n        .delticket #num\r\n        .delticket $character_name\r\n\rall to dalete all tickets at server, $character_name to delete ticket of this character, #num to delete ticket #num.'),
('demorph',2,'Syntax: .demorph\r\n\r\nDemorph the selected player.'),
('die',3,'Syntax: .die\r\n\r\nKill the selected player. If no player is selected, it will kill you.'),
('dismount',0,'Syntax: .dismount\r\n\r\nDismount you, if you are mounted.'),
('distance',3,'Syntax: .distance [$name/$link]\r\n\r\nDisplay the distance from your character to the selected creature/player, or player with name $name, or player/creature/gameobject pointed to shift-link with guid.'),
('event',2,'Syntax: .event #event_id\r\nShow details about event with #event_id.'),
('event activelist',2,'Syntax: .event activelist\r\nShow list of currently active events.'),
('event start',2,'Syntax: .event start #event_id\r\nStart event #event_id. Set start time for event to current moment (change not saved in DB).'),
('event stop',2,'Syntax: .event stop #event_id\r\nStop event #event_id. Set start time for event to time in past that make current moment is event stop time (change not saved in DB).'),
('explorecheat',3,'Syntax: .explorecheat #flag\r\n\r\nReveal  or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.\r\n\r\nUse a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.'),
('flusharenapoints','3','Syntax: .flusharenapoints\r\n\r\nUse it to distribute arena points based on arena team ratings, and start a new week.'),
('gm',1,'Syntax: .gm [on/off]\r\n\r\nEnable or Disable in game GM MODE or show current state of on/off not provided.'),
('gm chat',1,'Syntax: .gm chat [on/off]\r\n\r\nEnable or disable chat GM MODE (show gm badge in messages) or show current state of on/off not provided.'),
('gm fly',3,'Syntax: .gm fly [on/off]\r\nEnable/disable gm fly mode.'),
('gm ingame',0,'Syntax: .gm ingame\r\n\r\nDisplay a list of available in game Game Masters.'),
('gm list',3,'Syntax: .gm list\r\n\r\nDisplay a list of all Game Masters accounts and security levels.'),
('gm online',0,'Syntax: .gm online\r\n\r\nDisplay a list of available Game Masters.'),
('gm visible',1,'Syntax: .gm visible on/off\r\n\r\nOutput current visibility state or make GM visible(on) and invisible(off) for other players.'),
('go creature',1,'Syntax: .go creature #creature_guid\r\nTeleport your character to creature with guid #creature_guid.\r\n.gocreature #creature_name\r\nTeleport your character to creature with this name.\r\n.gocreature id #creature_id\r\nTeleport your character to a creature that was spawned from the template with this entry.\r\n*If* more than one creature is found, then you are teleported to the first that is found inside the database.'),
('go graveyard',1,'Syntax: .go graveyard #graveyardId\r\n Teleport to graveyard with the graveyardId specified.'),
('go grid',1,'Syntax: .go grid #gridX #gridY [#mapId]\r\n\r\nTeleport the gm to center of grid with provided indexes at map #mapId (or current map if it not provided).'),
('go object',1,'Syntax: .go object #object_guid\r\nTeleport your character to gameobject with guid #object_guid'),
('go taxinode',1,'Syntax: .go taxinode #taxinode\r\n\r\nTeleport player to taxinode coordinates. You can look up zone using .lookup taxinode $namepart'),
('go trigger',1,'Syntax: .go trigger #trigger_id\r\n\r\nTeleport your character to areatrigger with id #trigger_id. Character will be teleported to trigger target if selected areatrigger is telporting trigger.'),
('go xy',1,'Syntax: .go xy #x #y [#mapid]\r\n\r\nTeleport player to point with (#x,#y) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.'),
('go xyz',1,'Syntax: .go xyz #x #y #z [#mapid]\r\n\r\nTeleport player to point with (#x,#y,#z) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.'),
('go zonexy',1,'Syntax: .go zonexy #x #y [#zone]\r\n\r\nTeleport player to point with (#x,#y) client coordinates at ground(water) level in zone #zoneid or current zone if #zoneid not provided. You can look up zone using .lookup area $namepart'),
('gobject add',2,'Syntax: .gobject add #id <spawntimeSecs>\r\n\r\nAdd a game object from game object templates to the world at your current location using the #id.\r\nspawntimesecs sets the spawntime, it is optional.\r\n\r\nNote: this is a copy of .gameobject.'),
('gobject delete',2,'Syntax: .gobject delete #go_guid\r\nDelete gameobject with guid #go_guid.'),
('gobject move',2,'Syntax: .gobject move #goguid [#x #y #z]\r\n\r\nMove gameobject #goguid to character coordinates (or to (#x,#y,#z) coordinates if its provide).'),
('gobject near',2,'Syntax: .gobject near  [#distance]\r\n\r\nOutput gameobjects at distance #distance from player. Output gameobject guids and coordinates sorted by distance from character. If #distance not provided use 10 as default value.'),
('gobject setphase',2,'Syntax: .gobject setphase #guid #phasemask\r\n\r\nGameobject with DB guid #guid phasemask changed to #phasemask with related world vision update for players. Gameobject state saved to DB and persistent.'),
('gobject turn',2,'Syntax: .gobject turn #goguid \r\n\r\nSet for gameobject #goguid orientation same as current character orientation.'),
('gobject target',2,'Syntax: .gobject target [#go_id|#go_name_part]\r\n\r\nLocate and show position nearest gameobject. If #go_id or #go_name_part provide then locate and show position of nearest gameobject with gameobject template id #go_id or name included #go_name_part as part.'),
('goname',1,'Syntax: .goname [$charactername]\r\n\r\nTeleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group. Character can be offline.'),
('gps',1,'Syntax: .gps [$name|$shift-link]\r\n\r\nDisplay the position information for a selected character or creature (also if player name $name provided then for named player, or if creature/gameobject shift-link provided then pointed creature/gameobject if it loaded). Position information includes X, Y, Z, and orientation, map Id and zone Id'),
('groupgo',1,'Syntax: .groupgo [$charactername]\r\n\r\nTeleport the given character and his group to you. Teleported only online characters but original selected group member can be offline.'),
('guid',2,'Syntax: .guid\r\n\r\nDisplay the GUID for the selected character.'),
('guild create',2,'Syntax: .guild create [$GuildLeaderName] "$GuildName"\r\n\r\nCreate a guild named $GuildName with the player $GuildLeaderName (or selected) as leader.  Guild name must in quotes.'),
('guild delete',2,'Syntax: .guild delete "$GuildName"\r\n\r\nDelete guild $GuildName. Guild name must in quotes.'),
('guild invite',2,'Syntax: .guild invite [$CharacterName] "$GuildName"\r\n\r\nAdd player $CharacterName (or selected) into a guild $GuildName. Guild name must in quotes.'),
('guild rank',2,'Syntax: .guild rank $CharacterName #Rank\r\n\r\nSet for $CharacterName rank #Rank in a guild.'),
('guild uninvite',2,'Syntax: .guild uninvite [$CharacterName]\r\n\r\nRemove player $CharacterName (or selected) from a guild.'),
('help',0,'Syntax: .help [$command]\r\n\r\nDisplay usage instructions for the given $command. If no $command provided show list available commands.'),
('hidearea',3,'Syntax: .hidearea #areaid\r\n\r\nHide the area of #areaid to the selected character. If no character is selected, hide this area to you.'),
('honor add',2,'Syntax: .honor add $amount\r\n\r\nAdd a certain amount of honor (gained today) to the selected player.'),
('honor addkill',2,'Syntax: .honor addkikll\r\n\r\nAdd the targeted unit as one of your pvp kills today (you only get honor if it\'s a racial leader or a player)'),
('honor update',2,'Syntax: .honor update\r\n\r\nForce the yesterday\'s honor fields to be updated with today\'s data, which will get reset for the selected player.'),
('hover',3,'Syntax: .hover #flag\r\n\r\nEnable or disable hover mode for your character.\r\n\r\nUse a #flag of value 1 to enable, use a #flag value of 0 to disable hover.'),
('instance unbind',3,'Syntax: .instance unbind all\r\n  All of the selected player\'s binds will be cleared.'),
('instance listbinds',3,'Syntax: .instance listbinds\r\n  Lists the binds of the selected player.'),
('instance stats',3,'Syntax: .instance stats\r\n  Shows statistics about instances.'),
('instance savedata',3,'Syntax: .instance savedata\r\n  Save the InstanceData for the current player\'s map to the DB.'),
('itemmove',2,'Syntax: .itemmove #sourceslotid #destinationslotid\r\n\r\nMove an item from slots #sourceslotid to #destinationslotid in your inventory\r\n\r\nNot yet implemented'),
('kick',2,'Syntax: .kick [$charactername]\r\n\r\nKick the given character name from the world. If no character name is provided then the selected player (except for yourself) will be kicked.'),
('learn',3,'Syntax: .learn #spell [all]\r\n\r\nSelected character learn a spell of id #spell. If \'all\' provided then all ranks learned.'),
('learn all',3,'Syntax: .learn all\r\n\r\nLearn all big set different spell maybe useful for Administaror.'),
('learn all_crafts',2,'Syntax: .learn crafts\r\n\r\nLearn all professions and recipes.'),
('learn all_default',1,'Syntax: .learn all_default [$playername]\r\n\r\nLearn for selected/$playername player all default spells for his race/class and spells rewarded by completed quests.'),
('learn all_gm',2,'Syntax: .learn all_gm\r\n\r\nLearn all default spells for Game Masters.'),
('learn all_lang',1,'Syntax: .learn all_lang\r\n\r\nLearn all languages'),
('learn all_myclass',3,'Syntax: .learn all_myclass\r\n\r\nLearn all spells and talents available for his class.'),
('learn all_mypettalents',3,'Syntax: .learn all_mypettalents\r\n\r\nLearn all talents for your pet available for his creature type (only for hunter pets).'),
('learn all_myspells',3,'Syntax: .learn all_myspells\r\n\r\nLearn all spells (except talents and spells with first rank learned as talent) available for his class.'),
('learn all_mytalents',3,'Syntax: .learn all_mytalents\r\n\r\nLearn all talents (and spells with first rank learned as talent) available for his class.'),
('learn all_recipes',2,'Syntax: .learn all_recipes [$profession]\r\rLearns all recipes of specified profession and sets skill level to max.\rExample: .learn all_recipes enchanting'),
('levelup',3,'Syntax: .levelup [$playername] [#numberoflevels]\r\n\r\nIncrease/decrease the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent VALUESrecalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.'),
('linkgrave',3,'Syntax: .linkgrave #graveyard_id [alliance|horde]\r\n\r\nLink current zone to graveyard for any (or alliance/horde faction ghosts). This let character ghost from zone teleport to graveyard after die if graveyard is nearest from linked to zone and accept ghost of this faction. Add only single graveyard at another map and only if no graveyards linked (or planned linked at same map).'),
('list creature',3,'Syntax: .list creature #creature_id [#max_count]\r\n\r\nOutput creatures with creature id #creature_id found in world. Output creature guids and coordinates sorted by distance from character. Will be output maximum #max_count creatures. If #max_count not provided use 10 as default value.'),
('list item',3,'Syntax: .list item #item_id [#max_count]\r\n\r\nOutput items with item id #item_id found in all character inventories, mails, auctions, and guild banks. Output item guids, item owner guid, owner account and owner name (guild name and guid in case guild bank). Will be output maximum #max_count items. If #max_count not provided use 10 as default value.'),
('list object',3,'Syntax: .list object #gameobject_id [#max_count]\r\n\r\nOutput gameobjects with gameobject id #gameobject_id found in world. Output gameobject guids and coordinates sorted by distance from character. Will be output maximum #max_count gameobject. If #max_count not provided use 10 as default value.'),
('loadscripts',3,'Syntax: .loadscripts $scriptlibraryname\r\n\r\nUnload current and load the script library $scriptlibraryname or reload current if $scriptlibraryname omitted, in case you changed it while the server was running.'),
('lookup area',1,'Syntax: .lookup area $namepart\r\n\r\nLooks up an area by $namepart, and returns all matches with their area ID\'s.'),
('lookup creature',3,'Syntax: .lookup creature $namepart\r\n\r\nLooks up a creature by $namepart, and returns all matches with their creature ID\'s.'),
('lookup event',2,'Syntax: .lookup event $name\r\nAttempts to find the ID of the event with the provided $name.'),
('lookup faction',3,'Syntax: .lookup faction $name\r\nAttempts to find the ID of the faction with the provided $name.'),
('lookup item',3,'Syntax: .lookup item $itemname\r\n\r\nLooks up an item by $itemname, and returns all matches with their Item ID\'s.'),
('lookup itemset',3,'Syntax: .lookup itemset $itemname\r\n\r\nLooks up an item set by $itemname, and returns all matches with their Item set ID\'s.'),
('lookup object',3,'Syntax: .lookup object $objname\r\n\r\nLooks up an gameobject by $objname, and returns all matches with their Gameobject ID\'s.'),
('lookup player account',2,'Syntax: .lookup player account $account ($limit) \r\n\r\n Searchs players, which account username is $account with optional parametr $limit of results.'),
('lookup player ip',2,'Syntax: .lookup player ip $ip ($limit) \r\n\r\n Searchs players, which account ast_ip is $ip with optional parametr $limit of results.'),
('lookup player email',2,'Syntax: .lookup player email $email ($limit) \r\n\r\n Searchs players, which account email is $email with optional parametr $limit of results.'),
('lookup quest',3,'Syntax: .lookup quest $namepart\r\n\r\nLooks up a quest by $namepart, and returns all matches with their quest ID\'s.'),
('lookup skill',3,'Syntax: .lookup skill $$namepart\r\n\r\nLooks up a skill by $namepart, and returns all matches with their skill ID\'s.'),
('lookup spell',3,'Syntax: .lookup spell $namepart\r\n\r\nLooks up a spell by $namepart, and returns all matches with their spell ID\'s.'),
('lookup taxinode',3,'Syntax: .lookup taxinode $substring\r\n\r\nSearch and output all taxinodes with provide $substring in name.'),
('lookup tele',1,'Syntax: .lookup tele $substring\r\n\r\nSearch and output all .tele command locations with provide $substring in name.'),
('maxskill',3,'Syntax: .maxskill\r\nSets all skills of the targeted player to their maximum VALUESfor its current level.'),
('modify arena',1,'Syntax: .modify arena #value\r\nAdd $amount arena points to the selected player.'),
('modify aspeed',1,'Syntax: .modify aspeed #rate\r\n\r\nModify all speeds -run,swim,run back,swim back- of the selected player to \"normalbase speed for this move type\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),
('modify bit',1,'Syntax: .modify bit #field #bit\r\n\r\nToggle the #bit bit of the #field field for the selected player. If no player is selected, modify your character.'),
('modify bwalk',1,'Syntax: .modify bwalk #rate\r\n\r\nModify the speed of the selected player while running backwards to \"normal walk back speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),
('modify drunk',1,'Syntax: .modify drunk #value\r\n Set drunk level to #value (0..100). Value 0 remove drunk state, 100 is max drunked state.'),
('modify energy',1,'Syntax: .modify energy #energy\r\n\r\nModify the energy of the selected player. If no player is selected, modify your energy.'),
('modify faction',1,'Syntax: .modify faction #factionid #flagid #npcflagid #dynamicflagid\r\n\r\nModify the faction and flags of the selected creature. Without arguments, display the faction and flags of the selected creature.'),
('modify gender',2,'Syntax: .modify gender male/female\r\n\r\nChange gender of selected player.'),
('modify honor',1,'Syntax: .modify honor $amount\r\n\r\nAdd $amount honor points to the selected player.'),
('modify hp',1,'Syntax: .modify hp #newhp\r\n\r\nModify the hp of the selected player. If no player is selected, modify your hp.'),
('modify mana',1,'Syntax: .modify mana #newmana\r\n\r\nModify the mana of the selected player. If no player is selected, modify your mana.'),
('modify money',1,'Syntax: .modify money #money\r\n.money #money\r\n\r\nAdd or remove money to the selected player. If no player is selected, modify your money.\r\n\r\n #gold can be negative to remove money.'),
('modify morph',2,'Syntax: .modify morph #displayid\r\n\r\nChange your current model id to #displayid.'),
('modify mount',1,'Syntax: .modify mount #id #speed\r\nDisplay selected player as mounted at #id creature and set speed to #speed value.'),
('modify phase',3,'Syntax: .modify phase #phasemask\r\n\r\nSelected character phasemask changed to #phasemask with related world vision update. Change active until in game phase changed, or GM-mode enable/disable, or re-login. Character pts pasemask update to same value.'),
('modify rage',1,'Syntax: .modify rage #newrage\r\n\r\nModify the rage of the selected player. If no player is selected, modify your rage.'),
('modify rep',2,'Syntax: .modify rep #repId (#repvalue | $rankname [#delta])\r\nSets the selected players reputation with faction #repId to #repvalue or to $reprank.\r\nIf the reputation rank name is provided, the resulting reputation will be the lowest reputation for that rank plus the delta amount, if specified.\r\nYou can use \'.pinfo rep\' to list all known reputation ids, or use \'.lookup faction $name\' to locate a specific faction id.'),
('modify runicpower',1,'Syntax: .modify runicpower #newrunicpower\r\n\r\nModify the runic power of the selected player. If no player is selected, modify your runic power.'),
('modify scale',1,''),
('modify speed',1,'Syntax: .modify speed #rate\r\n.speed #rate\r\n\r\nModify the running speed of the selected player to \"normal base run speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),
('modify spell',1,''),
('modify standstate',2,'Syntax: .modify standstate #emoteid\r\n\r\nChange the emote of your character while standing to #emoteid.'),
('modify swim',1,'Syntax: .modify swim #rate\r\n\r\nModify the swim speed of the selected player to \"normal swim speed\"*rate. If no player is selected, modify your speed.\r\n\r\n #rate may range from 0.1 to 10.'),
('modify titles',1,'Syntax: .modify titles #mask\r\n\r\nAllows user to use all titles from #mask.\r\n\r\n #mask=0 disables the title-choose-field'),
('movegens',3,'Syntax: .movegens\r\n  Show movement generators stack for selected creature or player.'),
('mute',1,'Syntax: .mute [$playerName] $timeInMinutes\r\n\r\nDisible chat messaging for any character from account of character $playerName (or currently selected) at $timeInMinutes minutes. Player can be offline.'),
('namego',1,'Syntax: .namego [$charactername]\r\n\r\nTeleport the given character to you. Character can be offline.'),
('neargrave',3,'Syntax: .neargrave [alliance|horde]\r\n\r\nFind nearest graveyard linked to zone (or only nearest from accepts alliance or horde faction ghosts).'),
('notify',1,'Syntax: .notify $MessageToBroadcast\r\n\r\nSend a global message to all players online in screen.'),
('npc add',2,'Syntax: .npc add #creatureid\r\n\r\nSpawn a creature by the given template id of #creatureid.'),
('npc additem',2,'Syntax: .npc additem #itemId <#maxcount><#incrtime><#extendedcost>r\r\n\r\nAdd item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring and items ExtendedCost.'),
('npc addmove',2,'Syntax: .npc addmove #creature_guid [#waittime]\r\n\r\nAdd your current location as a waypoint for creature with guid #creature_guid. And optional add wait time.'),
('npc addweapon',3,'Not yet implemented.'),
('npc allowmove',3,'Syntax: .npc allowmove\r\n\r\nEnable or disable movement creatures in world. Not implemented.'),
('npc changelevel',2,'Syntax: .npc changelevel #level\r\n\r\nChange the level of the selected creature to #level.\r\n\r\n#level may range from 1 to 63.'),
('npc delete',2,'Syntax: .npc delete [#guid]\r\n\r\nDelete creature with guid #guid (or the selected if no guid is provided)'),
('npc delitem',2,'Syntax: .npc delitem #itemId\r\n\r\nRemove item #itemid from item list of selected vendor.'),
('npc factionid',2,'Syntax: .npc factionid #factionid\r\n\r\nSet the faction of the selected creature to #factionid.'),
('npc flag',2,'Syntax: .npc flag #npcflag\r\n\r\nSet the NPC flags of creature template of the selected creature and selected creature to #npcflag. NPC flags will applied to all creatures of selected creature template after server restart or grid unload/load.'),
('npc follow',2,'Syntax: .npc follow\r\n\r\nSelected creature start follow you until death/fight/etc.'),
('npc info',3,'Syntax: .npc info\r\n\r\nDisplay a list of details for the selected creature.\r\n\r\nThe list includes:\r\n- GUID, Faction, NPC flags, Entry ID, Model ID,\r\n- Level,\r\n- Health (current/maximum),\r\n\r\n- Field flags, dynamic flags, faction template, \r\n- Position information,\r\n- and the creature type, e.g. if the creature is a vendor.'),
('npc move',2,'Syntax: .npc move [#creature_guid]\r\n\r\nMove the targeted creature spawn point to your coordinates.'),
('npc name',2,'Syntax: .npc name $name\r\n\r\nChange the name of the selected creature or character to $name.\r\n\r\nCommand disabled.'),
('npc setphase',3,'Syntax: .npc setphase #phasemask\r\n\r\nSelected unit or pet phasemask changed to #phasemask with related world vision update for players. In creature case state saved to DB and persistent. In pet case change active until in game phase changed for owner, owner re-login, or GM-mode enable/disable..'),
('npc playemote',3,'Syntax: .npc playemote #emoteid\r\n\r\nMake the selected creature emote with an emote of id #emoteid.'),
('npc setdeathstate',2,'Syntax: .npc setdeathstate on/off\r\n\r\nSet default death state (dead/alive) for npc at spawn.'),
('npc setmodel',2,'Syntax: .npc setmodel #displayid\r\n\r\nChange the model id of the selected creature to #displayid.'),
('npc setmovetype',2,'Syntax: .npc setmovetype [#creature_guid] stay/random/way [NODEL]\r\n\r\nSet for creature pointed by #creature_guid (or selected if #creature_guid not provided) movement type and move it to respawn position (if creature alive). Any existing waypoints for creature will be removed from the database if you do not use NODEL. If the creature is dead then movement type will applied at creature respawn.\r\nMake sure you use NODEL, if you want to keep the waypoints.'),
('npc spawndist',2,'Syntax: .npc spawndist #dist\r\n\r\nAdjust spawndistance of selected creature to dist.'),
('npc spawntime',2,'Syntax: .npc spawntime #time \r\n\r\nAdjust spawntime of selected creature to time.'),
('npc subname',2,'Syntax: .npc subname $Name\r\n\r\nChange the subname of the selected creature or player to $Name.\r\n\r\nCommand disabled.'),
('npc tame',2,'Syntax: .npc tame\r\n\r\nTame selected creature (tameable non pet creature). You don''t must have pet.'),
('npc textemote',1,'Syntax: .npc textemote #emoteid\r\n\r\nMake the selected creature to do textemote with an emote of id #emoteid.'),
('npc whisper',1,'Syntax: .npc whisper #playerguid #text\r\nMake the selected npc whisper #text to  #playerguid.'),
('npc unfollow',2,'Syntax: .npc unfollow\r\n\r\nSelected creature (non pet) stop follow you.'),
('pdump write',3,'Syntax: .pdump write $filename $playerNameOrGUID\r\nWrite character dump with name/guid $playerNameOrGUID to file $filename.'),
('pdump load',3,'Syntax: .pdump load $filename $account [$newname] [$newguid]\r\nLoad character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.'),
('pinfo',2,'Syntax: .pinfo [$player_name]\r\n\r\nOutput account information for selected player or player find by $player_name.'),
('quest add',3,'Syntax: .quest add #quest_id\r\n\r\nAdd to character quest log quest #quest_id. Quest started from item can\'t be added by this command but correct .additem call provided in command output.'),
('quest complete',3,'Syntax: .quest complete #questid\r\nMark all quest objectives as completed for target character active quest. After this target character can go and get quest reward.'),
('quest remove',3,'Syntax: .quest remove #quest_id\r\n\r\nSet quest #quest_id state to not completed and not active (and remove from active quest list) for selected player.'),
('recall',1,'Syntax: .recall [$playername]\r\n\r\nTeleport $playername or selected player to the place where he has been before last use of a teleportation command. If no $playername is entered and no player is selected, it will teleport you.'),
('reload all',3,'Syntax: .reload all\r\n\r\nReload all tables with reload support added and that can be _safe_ reloaded.'),
('reload all_area',3,'Syntax: .reload all_area\r\n\r\nReload all `areatrigger_*` tables if reload support added for this table and this table can be _safe_ reloaded.'),
('reload all_loot',3,'Syntax: .reload all_loot\r\n\r\nReload all `*_loot_template` tables. This can be slow operation with lags for server run.'),
('reload all_quest',3,'Syntax: .reload all_quest\r\n\r\nReload all quest related tables if reload support added for this table and this table can be _safe_ reloaded.'),
('reload all_spell',3,'Syntax: .reload all_spell\r\n\r\nReload all `spell_*` tables with reload support added and that can be _safe_ reloaded.'),
('reload all_locales',3,'Syntax: .reload all_locales\r\n\r\nReload all `locales_*` tables with reload support added and that can be _safe_ reloaded.'),
('reload config',3,'Syntax: .reload config\r\n\r\nReload config settings (by default stored in mangosd.conf). Not all settings can be change at reload: some new setting values will be ignored until restart, some values will applied with delay or only to new objects/maps, some values will explicitly rejected to change at reload.'),
('repairitems',2,'Syntax: .repairitems\r\n\r\nRepair all selected player''s items.'),
('reset achievements',3,'Syntax: .reset achievements [$playername]\r\n\r\nReset achievements data for selected or named (online or offline) character. Achievements for persistance progress data like completed quests/etc re-filled at reset. Achievements for events like kills/casts/etc will lost.'),
('reset all',3,'Syntax: .reset all spells\r\n\r\nSyntax: .reset all talents\r\n\r\nRequest reset spells or talents at next login each existed character.'),
('reset honor',3,'Syntax: .reset honor [Playername]\r\n  Reset all honor data for targeted character.'),
('reset level',3,'Syntax: .reset level [Playername]\r\n  Reset level to 1 including reset stats and talents.  Equipped items with greater level requirement can be lost.'),
('reset spells',3,'Syntax: .reset spells [Playername]\r\n  Removes all non-original spells from spellbook.\r\n. Playername can be name of offline character.'),
('reset stats',3,'Syntax: .reset stats [Playername]\r\n  Resets(recalculate) all stats of the targeted player to their original VALUESat current level.'),
('reset talents',3,'Syntax: .reset talents [Playername]\r\n  Removes all talents of the targeted player. Playername can be name of offline character.'),
('respawn',3,'Syntax: .respawn\r\n\r\nRespawn selected creature or respawn all nearest creatures (if none selected) and GO without waiting respawn time expiration.'),
('revive',3,'Syntax: .revive\r\n\r\nRevive the selected player. If no player is selected, it will revive you.'),
('save',0,'Syntax: .save\r\n\r\nSaves your character.'),
('saveall',1,'Syntax: .saveall\r\n\r\nSave all characters in game.'),
('send items',3,'Syntax: .send items #playername "#subject" "#text" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\r\n\r\nSend a mail to a player. Subject and mail text must be in "". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.'),
('send mail',1,'Syntax: .send mail #playername "#subject" "#text"\r\n\r\nSend a mail to a player. Subject and mail text must be in "".'),
('send message',3,'Syntax: .send message $playername $message\r\n\r\nSend screen message to player from ADMINISTRATOR.'),
('send money','3','Syntax: .send money #playername "#subject" "#text" #money\r\n\r\nSend mail with money to a player. Subject and mail text must be in "".'),
('server corpses',2,'Syntax: .server corpses\r\n\r\nTriggering corpses expire check in world.'),
('server exit',4,'Syntax: .server exit\r\n\r\nTerminate mangosd NOW. Exit code 0.'),
('server info',0,'Syntax: .server info\r\n\r\nDisplay server version and the number of connected players.'),
('server idleshutdown',3,'Syntax: .server idleshutdown #delay [#exist_code]\r\n\r\nShut the server down after #delay seconds if no active connections are present (no players). Use #exist_code or 0 as program exist code.'),
('server idleshutdown cancel',3,'Syntax: .server idleshutdown cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server idlerestart',3,'Syntax: .server idlerestart #delay\r\n\r\nRestart the server after #delay seconds if no active connections are present (no players). Use #exist_code or 2 as program exist code.'),
('server idlerestart cancel',3,'Syntax: .server idlerestart cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server motd',0,'Syntax: .server motd\r\n\r\nShow server Message of the day.'),
('server plimit',3,'Syntax: .server plimit [#num|-1|-2|-3|reset|player|moderator|gamemaster|administrator]\r\n\r\nWithout arg show current player amount and security level limitations for login to server, with arg set player linit ($num > 0) or securiti limitation ($num < 0 or security leme name. With `reset` sets player limit to the one in the config file'),
('server restart',3,'Syntax: .server restart #delay\r\n\r\nRestart the server after #delay seconds. Use #exist_code or 2 as program exist code.'),
('server restart cancel',3,'Syntax: .server restart cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('server set loglevel',4,'Syntax: .server set loglevel #level\r\n\r\nSet server log level (0 - errors only, 1 - basic, 2 - detail, 3 - debug).'),
('server set motd',3,'Syntax: .server set motd $MOTD\r\n\r\nSet server Message of the day.'),
('server shutdown',3,'Syntax: .server shutdown #delay [#exist_code]\r\n\r\nShut the server down after #delay seconds. Use #exist_code or 0 as program exist code.'),
('server shutdown cancel',3,'Syntax: .server shutdown cancel\r\n\r\nCancel the restart/shutdown timer if any.'),
('setskill',3,'Syntax: .setskill #skill #level [#max]\r\n\r\nSet a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the selected character. If no character is selected, you learn the skill.'),
('showarea',3,'Syntax: .showarea #areaid\r\n\r\nReveal the area of #areaid to the selected character. If no character is selected, reveal this area to you.'),
('start',0,'Syntax: .start\r\n\r\nTeleport you to the starting area of your character.'),
('taxicheat',1,'Syntax: .taxicheat on/off\r\n\r\nTemporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.\r\n\r\nVisited taxi nodes sill accessible after removing access.'),
('tele',1,'Syntax: .tele #location\r\n\r\nTeleport player to a given location.'),
('tele add',3,'Syntax: .tele add $name\r\n\r\nAdd current your position to .tele command target locations list with name $name.'),
('tele del',3,'Syntax: .tele del $name\r\n\r\nRemove location with name $name for .tele command locations list.'),
('tele group',1,'Syntax: .tele group#location\r\n\r\nTeleport a selected player and his group members to a given location.'),
('tele name',1,'Syntax: .tele name [#playername] #location\r\n\r\nTeleport the given character to a given location. Character can be offline.'),
('ticket',2,'Syntax: .ticket on\r\n        .ticket off\r\n        .ticket #num\r\n        .ticket $character_name\r\n\r\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num.'),
('unaura',3,'Syntax: .unaura #spellid\r\n\r\nRemove aura due to spell #spellid from the selected Unit.'),
('unban account',3,'Syntax: .unban account $Name\r\nUnban accounts for account name pattern.'),
('unban character',3,'Syntax: .unban character $Name\r\nUnban accounts for character name pattern.'),
('unban ip',3,'Syntax : .unban ip $Ip\r\nUnban accounts for IP pattern.'),
('unlearn',3,'Syntax: .unlearn #spell [all]\r\n\r\nUnlearn for selected player a spell #spell.  If \'all\' provided then all ranks unlearned.'),
('unmute',1,'Syntax: .unmute $playerName\r\n\r\nRestore chat messaging for any character from account of character $playerName.'),
('waterwalk',2,'Syntax: .waterwalk on/off\r\n\r\nSet on/off waterwalk state for selected player.'),
('wchange',3,'Syntax: .wchange #weathertype #status\r\n\r\nSet current weather to #weathertype with an intensity of #status.\r\n\r\n#weathertype can be 1 for rain, 2 for snow, and 3 for sand. #status can be 0 for disabled, and 1 for enabled.'),
('whispers',1,'Syntax: .whispers on|off\r\nEnable/disable accepting whispers by GM from players. By default use mangosd.conf setting.'),
('wp',2,'Using WP Command:\r\nEach Waypoint Command has it\'s own description!'),
('wp add',2,'Syntax: .wp add [#creature_guid or Select a Creature]'),
('wp export',3,'Syntax: .wp export [#creature_guid or Select a Creature] $filename'),
('wp import',3,'Syntax: .wp import $filename'),
('wp modify',2,'Syntax: .wp modify [#creature_guid or Select a Creature]\r\nadd - Add a waypoint after the selected visual\r\nwaittime $time\r\nemote ID\r\nspell ID\r\ntext1| text2| text3| text4| text5 <text>\r\nmodel1 ID\r\nmodel2 ID\r\nmove(moves wp to player pos)\r\ndel (deletes the wp)\r\n\r\nOnly one parameter per time!'),
('wp show',2,'Syntax: .wp show [#creature_guid or Select a Creature]\r\non\r\nfirst\r\nlast\r\noff\r\ninfo\r\n\r\nFor using info you have to do first show on and than select a Visual-Waypoint and do the show info!');
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature`
--

DROP TABLE IF EXISTS `creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(9) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '5',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `index_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature`
--

LOCK TABLES `creature` WRITE;
/*!40000 ALTER TABLE `creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_addon`
--

DROP TABLE IF EXISTS `creature_addon`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_addon` (
  `guid` int(11) NOT NULL default '0',
  `mount` mediumint(8) unsigned NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote` int(10) unsigned NOT NULL default '0',
  `moveflags` int(10) unsigned NOT NULL default '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_addon`
--

LOCK TABLES `creature_addon` WRITE;
/*!40000 ALTER TABLE `creature_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_ai_scripts`
--

DROP TABLE IF EXISTS `creature_ai_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_scripts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `creature_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` int(3) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(11) NOT NULL DEFAULT '0',
  `event_param2` int(11) NOT NULL DEFAULT '0',
  `event_param3` int(11) NOT NULL DEFAULT '0',
  `event_param4` int(11) NOT NULL DEFAULT '0',
  `action1_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int(11) NOT NULL DEFAULT '0',
  `action1_param2` int(11) NOT NULL DEFAULT '0',
  `action1_param3` int(11) NOT NULL DEFAULT '0',
  `action2_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int(11) NOT NULL DEFAULT '0',
  `action2_param2` int(11) NOT NULL DEFAULT '0',
  `action2_param3` int(11) NOT NULL DEFAULT '0',
  `action3_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int(11) NOT NULL DEFAULT '0',
  `action3_param2` int(11) NOT NULL DEFAULT '0',
  `action3_param3` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_ai_scripts`
--

LOCK TABLES `creature_ai_scripts` WRITE;
/*!40000 ALTER TABLE `creature_ai_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_ai_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_ai_summons`
--

DROP TABLE IF EXISTS `creature_ai_summons`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_summons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_ai_summons`
--

LOCK TABLES `creature_ai_summons` WRITE;
/*!40000 ALTER TABLE `creature_ai_summons` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_ai_summons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_ai_texts`
--

DROP TABLE IF EXISTS `creature_ai_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_ai_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_ai_texts`
--

LOCK TABLES `creature_ai_texts` WRITE;
/*!40000 ALTER TABLE `creature_ai_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_ai_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_equip_template`
--

DROP TABLE IF EXISTS `creature_equip_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_equip_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipentry1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipentry3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_equip_template`
--

LOCK TABLES `creature_equip_template` WRITE;
/*!40000 ALTER TABLE `creature_equip_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_equip_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_involvedrelation`
--

DROP TABLE IF EXISTS `creature_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_involvedrelation`
--

LOCK TABLES `creature_involvedrelation` WRITE;
/*!40000 ALTER TABLE `creature_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_involvedrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_loot_template`
--

DROP TABLE IF EXISTS `creature_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_loot_template`
--

LOCK TABLES `creature_loot_template` WRITE;
/*!40000 ALTER TABLE `creature_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_model_info`
--

DROP TABLE IF EXISTS `creature_model_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_model_info`
--

LOCK TABLES `creature_model_info` WRITE;
/*!40000 ALTER TABLE `creature_model_info` DISABLE KEYS */;
INSERT INTO `creature_model_info` VALUES (10045,1,1.5,2,0);
/*!40000 ALTER TABLE `creature_model_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_movement`
--

DROP TABLE IF EXISTS `creature_movement`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_movement` (
  `id` int(10) unsigned NOT NULL COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0',
  `textid1` int(11) NOT NULL DEFAULT '0',
  `textid2` int(11) NOT NULL DEFAULT '0',
  `textid3` int(11) NOT NULL DEFAULT '0',
  `textid4` int(11) NOT NULL DEFAULT '0',
  `textid5` int(11) NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `wpguid` int(11) NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `model1` mediumint(9) NOT NULL DEFAULT '0',
  `model2` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_movement`
--

LOCK TABLES `creature_movement` WRITE;
/*!40000 ALTER TABLE `creature_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_onkill_reputation`
--

DROP TABLE IF EXISTS `creature_onkill_reputation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_onkill_reputation`
--

LOCK TABLES `creature_onkill_reputation` WRITE;
/*!40000 ALTER TABLE `creature_onkill_reputation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_onkill_reputation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_questrelation`
--

DROP TABLE IF EXISTS `creature_questrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_questrelation`
--

LOCK TABLES `creature_questrelation` WRITE;
/*!40000 ALTER TABLE `creature_questrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_questrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_respawn`
--

DROP TABLE IF EXISTS `creature_respawn`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_respawn`
--

LOCK TABLES `creature_respawn` WRITE;
/*!40000 ALTER TABLE `creature_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_template`
--

DROP TABLE IF EXISTS `creature_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `heroic_entry` mediumint(8) unsigned NOT NULL default '0',
  `modelid_A` mediumint(8) unsigned NOT NULL default '0',
  `modelid_A2` mediumint(8) unsigned NOT NULL default '0',
  `modelid_H` mediumint(8) unsigned NOT NULL default '0',
  `modelid_H2` mediumint(8) unsigned NOT NULL default '0',
  `name` char(100) NOT NULL default '0',
  `subname` char(100) default NULL,
  `IconName` char(100) default NULL,
  `minlevel` tinyint(3) unsigned NOT NULL default '1',
  `maxlevel` tinyint(3) unsigned NOT NULL default '1',
  `minhealth` int(10) unsigned NOT NULL default '0',
  `maxhealth` int(10) unsigned NOT NULL default '0',
  `minmana` int(10) unsigned NOT NULL default '0',
  `maxmana` int(10) unsigned NOT NULL default '0',
  `armor` mediumint(8) unsigned NOT NULL default '0',
  `faction_A` smallint(5) unsigned NOT NULL default '0',
  `faction_H` smallint(5) unsigned NOT NULL default '0',
  `npcflag` int(10) unsigned NOT NULL default '0',
  `speed` float NOT NULL default '1',
  `scale` float NOT NULL default '1',
  `rank` tinyint(3) unsigned NOT NULL default '0',
  `mindmg` float NOT NULL default '0',
  `maxdmg` float NOT NULL default '0',
  `dmgschool` tinyint(4) NOT NULL default '0',
  `attackpower` int(10) unsigned NOT NULL default '0',
  `dmg_multiplier` float NOT NULL default '1',
  `baseattacktime` int(10) unsigned NOT NULL default '0',
  `rangeattacktime` int(10) unsigned NOT NULL default '0',
  `unit_class` tinyint(3) unsigned NOT NULL default '0',
  `unit_flags` int(10) unsigned NOT NULL default '0',
  `dynamicflags` int(10) unsigned NOT NULL default '0',
  `family` tinyint(4) NOT NULL default '0',
  `trainer_type` tinyint(4) NOT NULL default '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL default '0',
  `trainer_class` tinyint(3) unsigned NOT NULL default '0',
  `trainer_race` tinyint(3) unsigned NOT NULL default '0',
  `minrangedmg` float NOT NULL default '0',
  `maxrangedmg` float NOT NULL default '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL default '0',
  `type` tinyint(3) unsigned NOT NULL default '0',
  `type_flags` int(10) unsigned NOT NULL default '0',
  `lootid` mediumint(8) unsigned NOT NULL default '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL default '0',
  `skinloot` mediumint(8) unsigned NOT NULL default '0',
  `resistance1` smallint(5) NOT NULL default '0',
  `resistance2` smallint(5) NOT NULL default '0',
  `resistance3` smallint(5) NOT NULL default '0',
  `resistance4` smallint(5) NOT NULL default '0',
  `resistance5` smallint(5) NOT NULL default '0',
  `resistance6` smallint(5) NOT NULL default '0',
  `spell1` mediumint(8) unsigned NOT NULL default '0',
  `spell2` mediumint(8) unsigned NOT NULL default '0',
  `spell3` mediumint(8) unsigned NOT NULL default '0',
  `spell4` mediumint(8) unsigned NOT NULL default '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL default '0',
  `mingold` mediumint(8) unsigned NOT NULL default '0',
  `maxgold` mediumint(8) unsigned NOT NULL default '0',
  `AIName` char(64) NOT NULL default '',
  `MovementType` tinyint(3) unsigned NOT NULL default '0',
  `InhabitType` tinyint(3) unsigned NOT NULL default '3',
  `unk16` float NOT NULL default '1',
  `unk17` float NOT NULL default '1',
  `RacialLeader` tinyint(3) unsigned NOT NULL default '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL default '1',
  `equipment_id` mediumint(8) unsigned NOT NULL default '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL default '0',
  `flags_extra` int(10) unsigned NOT NULL default '0',
  `ScriptName` char(64) NOT NULL default '',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_template`
--

LOCK TABLES `creature_template` WRITE;
/*!40000 ALTER TABLE `creature_template` DISABLE KEYS */;
INSERT INTO `creature_template` VALUES
(1,0,10045,0,10045,0,'Waypoint(Only GM can see it)','Visual',NULL,1,1,64,64,0,0,0,35,35,0,0.91,1,0,14,15,0,100,1,2000,2200,8,4096,0,0,0,0,0,0,1.76,2.42,100,8,5242886,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1.0,1.0,0,1,0,0,0x82,'');
/*!40000 ALTER TABLE `creature_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_template_addon`
--

DROP TABLE IF EXISTS `creature_template_addon`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `mount` mediumint(8) unsigned NOT NULL default '0',
  `bytes1` int(10) unsigned NOT NULL default '0',
  `bytes2` int(10) unsigned NOT NULL default '0',
  `emote` mediumint(8) unsigned NOT NULL default '0',
  `moveflags` int(10) unsigned NOT NULL default '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `creature_template_addon`
--

LOCK TABLES `creature_template_addon` WRITE;
/*!40000 ALTER TABLE `creature_template_addon` DISABLE KEYS */;
/*!40000 ALTER TABLE `creature_template_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_texts`
--

DROP TABLE IF EXISTS `custom_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `custom_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom Texts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `custom_texts`
--

LOCK TABLES `custom_texts` WRITE;
/*!40000 ALTER TABLE `custom_texts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_script_string`
--

DROP TABLE IF EXISTS `db_script_string`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `db_script_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `db_script_string`
--

LOCK TABLES `db_script_string` WRITE;
/*!40000 ALTER TABLE `db_script_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_script_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `db_version` (
  `version` varchar(120) DEFAULT NULL,
  `creature_ai_version` varchar(120) DEFAULT NULL,
  `required_7796_02_mangos_mangos_string` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES ('Mangos default database.','Creature EventAI not provided.',NULL);
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disenchant_loot_template`
--

DROP TABLE IF EXISTS `disenchant_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `disenchant_loot_template`
--

LOCK TABLES `disenchant_loot_template` WRITE;
/*!40000 ALTER TABLE `disenchant_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `disenchant_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_scripts`
--

DROP TABLE IF EXISTS `event_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `event_scripts`
--

LOCK TABLES `event_scripts` WRITE;
/*!40000 ALTER TABLE `event_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exploration_basexp`
--

DROP TABLE IF EXISTS `exploration_basexp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `exploration_basexp` (
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `basexp` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `exploration_basexp`
--

LOCK TABLES `exploration_basexp` WRITE;
/*!40000 ALTER TABLE `exploration_basexp` DISABLE KEYS */;
INSERT INTO `exploration_basexp` VALUES (0,0),(1,5),(2,15),(3,25),(4,35),(5,45),(6,55),(7,65),(8,70),(9,80),(10,85),(11,90),(12,90),(13,90),(14,100),(15,105),(16,115),(17,125),(18,135),(19,145),(20,155),(21,165),(22,175),(23,185),(24,195),(25,200),(26,210),(27,220),(28,230),(29,240),(30,245),(31,250),(32,255),(33,265),(34,270),(35,275),(36,280),(37,285),(38,285),(39,300),(40,315),(41,330),(42,345),(43,360),(44,375),(45,390),(46,405),(47,420),(48,440),(49,455),(50,470),(51,490),(52,510),(53,530),(54,540),(55,560),(56,580),(57,600),(58,620),(59,640),(60,660),(61,970),(62,1000),(63,1050),(64,1080),(65,1100),(66,1130),(67,1160),(68,1200),(69,1230),(70,1250);
/*!40000 ALTER TABLE `exploration_basexp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fishing_loot_template`
--

DROP TABLE IF EXISTS `fishing_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `fishing_loot_template`
--

LOCK TABLES `fishing_loot_template` WRITE;
/*!40000 ALTER TABLE `fishing_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `fishing_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event`
--

DROP TABLE IF EXISTS `game_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '86400' COMMENT 'Delay in hours between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '43200' COMMENT 'Length in hours of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event`
--

LOCK TABLES `game_event` WRITE;
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_battleground_holiday`
--

DROP TABLE IF EXISTS `game_event_battleground_holiday`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_battleground_holiday` (
  `event` int(10) unsigned NOT NULL,
  `bgflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_battleground_holiday`
--

LOCK TABLES `game_event_battleground_holiday` WRITE;
/*!40000 ALTER TABLE `game_event_battleground_holiday` DISABLE KEYS */;
INSERT INTO `game_event_battleground_holiday` VALUES (18,2),(19,4),(20,8),(21,128);
/*!40000 ALTER TABLE `game_event_battleground_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_condition`
--

DROP TABLE IF EXISTS `game_event_condition`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_condition` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_condition`
--

LOCK TABLES `game_event_condition` WRITE;
/*!40000 ALTER TABLE `game_event_condition` DISABLE KEYS */;
INSERT INTO `game_event_condition` VALUES (35,1,100,0,3244,''),(36,1,1,0,0,''),(37,1,100,0,3233,''),(38,1,1,0,0,''),(39,1,100,0,0,''),(40,1,1,0,0,''),(41,1,100,0,0,''),(42,1,1,0,0,''),(43,1,100,0,0,''),(44,1,1,0,0,''),(45,1,100,0,0,''),(46,1,1,0,0,''),(47,1,1000000,0,0,''),(48,1,1,0,0,''),(49,1,1,0,0,'');
/*!40000 ALTER TABLE `game_event_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_creature`
--

DROP TABLE IF EXISTS `game_event_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_creature` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_creature`
--

LOCK TABLES `game_event_creature` WRITE;
/*!40000 ALTER TABLE `game_event_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_creature_quest`
--

DROP TABLE IF EXISTS `game_event_creature_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_creature_quest` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_creature_quest`
--

LOCK TABLES `game_event_creature_quest` WRITE;
/*!40000 ALTER TABLE `game_event_creature_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_creature_quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_gameobject`
--

DROP TABLE IF EXISTS `game_event_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_gameobject` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_gameobject`
--

LOCK TABLES `game_event_gameobject` WRITE;
/*!40000 ALTER TABLE `game_event_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_gameobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_gameobject_quest`
--

DROP TABLE IF EXISTS `game_event_gameobject_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_gameobject_quest` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest`,`event`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_gameobject_quest`
--

LOCK TABLES `game_event_gameobject_quest` WRITE;
/*!40000 ALTER TABLE `game_event_gameobject_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_gameobject_quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_model_equip`
--

DROP TABLE IF EXISTS `game_event_model_equip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_model_equip` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_model_equip`
--

LOCK TABLES `game_event_model_equip` WRITE;
/*!40000 ALTER TABLE `game_event_model_equip` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_model_equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_npc_gossip`
--

DROP TABLE IF EXISTS `game_event_npc_gossip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npc_gossip` (
  `guid` int(10) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_npc_gossip`
--

LOCK TABLES `game_event_npc_gossip` WRITE;
/*!40000 ALTER TABLE `game_event_npc_gossip` DISABLE KEYS */;
INSERT INTO `game_event_npc_gossip` VALUES (53965,35,12260),(53979,35,12240),(93950,37,12255),(93951,37,12257),(96655,39,12226),(93955,41,12319),(93957,41,12339),(93964,43,12285),(94384,47,12322),(94385,47,12322);
/*!40000 ALTER TABLE `game_event_npc_gossip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_npc_vendor`
--

DROP TABLE IF EXISTS `game_event_npc_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npc_vendor` (
  `event` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_npc_vendor`
--

LOCK TABLES `game_event_npc_vendor` WRITE;
/*!40000 ALTER TABLE `game_event_npc_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_npc_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_npcflag`
--

DROP TABLE IF EXISTS `game_event_npcflag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_npcflag` (
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_npcflag`
--

LOCK TABLES `game_event_npcflag` WRITE;
/*!40000 ALTER TABLE `game_event_npcflag` DISABLE KEYS */;
INSERT INTO `game_event_npcflag` VALUES (93964,44,4224);
/*!40000 ALTER TABLE `game_event_npcflag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_pool`
--

DROP TABLE IF EXISTS `game_event_pool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_pool` (
  `pool_entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_pool`
--

LOCK TABLES `game_event_pool` WRITE;
/*!40000 ALTER TABLE `game_event_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_prerequisite`
--

DROP TABLE IF EXISTS `game_event_prerequisite`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_prerequisite` (
  `event_id` mediumint(8) unsigned NOT NULL,
  `prerequisite_event` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`event_id`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_prerequisite`
--

LOCK TABLES `game_event_prerequisite` WRITE;
/*!40000 ALTER TABLE `game_event_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_event_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_event_quest_condition`
--

DROP TABLE IF EXISTS `game_event_quest_condition`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_event_quest_condition` (
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_event_quest_condition`
--

LOCK TABLES `game_event_quest_condition` WRITE;
/*!40000 ALTER TABLE `game_event_quest_condition` DISABLE KEYS */;
INSERT INTO `game_event_quest_condition` VALUES (11524,35,1,100),(11496,35,1,100),(11538,37,1,100),(11532,37,1,100),(11513,39,1,100),(11542,41,1,100),(11539,41,1,100),(11535,43,1,100),(11520,45,1,100),(11545,47,1,10),(11549,47,1,1000);
/*!40000 ALTER TABLE `game_event_quest_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_graveyard_zone`
--

DROP TABLE IF EXISTS `game_graveyard_zone`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_graveyard_zone`
--

LOCK TABLES `game_graveyard_zone` WRITE;
/*!40000 ALTER TABLE `game_graveyard_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_graveyard_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_tele`
--

DROP TABLE IF EXISTS `game_tele`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_tele`
--

LOCK TABLES `game_tele` WRITE;
/*!40000 ALTER TABLE `game_tele` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_tele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_weather`
--

DROP TABLE IF EXISTS `game_weather`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `game_weather`
--

LOCK TABLES `game_weather` WRITE;
/*!40000 ALTER TABLE `game_weather` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_weather` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject`
--

DROP TABLE IF EXISTS `gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `phaseMask` smallint(5) unsigned NOT NULL DEFAULT '1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject`
--

LOCK TABLES `gameobject` WRITE;
/*!40000 ALTER TABLE `gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_involvedrelation`
--

DROP TABLE IF EXISTS `gameobject_involvedrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_involvedrelation`
--

LOCK TABLES `gameobject_involvedrelation` WRITE;
/*!40000 ALTER TABLE `gameobject_involvedrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_involvedrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_loot_template`
--

DROP TABLE IF EXISTS `gameobject_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_loot_template`
--

LOCK TABLES `gameobject_loot_template` WRITE;
/*!40000 ALTER TABLE `gameobject_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_questrelation`
--

DROP TABLE IF EXISTS `gameobject_questrelation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_questrelation`
--

LOCK TABLES `gameobject_questrelation` WRITE;
/*!40000 ALTER TABLE `gameobject_questrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_questrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_respawn`
--

DROP TABLE IF EXISTS `gameobject_respawn`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_respawn`
--

LOCK TABLES `gameobject_respawn` WRITE;
/*!40000 ALTER TABLE `gameobject_respawn` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_respawn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_scripts`
--

DROP TABLE IF EXISTS `gameobject_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_scripts`
--

LOCK TABLES `gameobject_scripts` WRITE;
/*!40000 ALTER TABLE `gameobject_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameobject_template`
--

DROP TABLE IF EXISTS `gameobject_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `data0` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(10) unsigned NOT NULL DEFAULT '0',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `gameobject_template`
--

LOCK TABLES `gameobject_template` WRITE;
/*!40000 ALTER TABLE `gameobject_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gameobject_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guildhouses`
--

DROP TABLE IF EXISTS `guildhouses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `guildhouses` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `guildId` bigint(20) NOT NULL DEFAULT '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `guildhouses`
--

LOCK TABLES `guildhouses` WRITE;
/*!40000 ALTER TABLE `guildhouses` DISABLE KEYS */;
INSERT INTO `guildhouses` VALUES (1,0,16222,16266,14.2,1,'GM Island'),(2,0,-10711,2483,8,1,'Tauren village at Veiled Sea (Silithus)'),(3,1,-8323,-343,146,0,'Fishing outside an Northshire Abbey (Elwynn Forest'),(4,0,7368,-1560,163,1,'Troll Village in mountains (Darkshore)'),(5,0,-4151,-1400,198,0,'Dwarven village outside Ironforge (Wetlands)'),(6,0,-1840,-4233,2.14,0,'Dwarven village (Arathi Highlands, Forbidding Sea)'),(7,0,-4151,-1400,198,0,'Crashed zeppelin (Wetlands, Dun Modr)'),(8,0,-723,-1076,179,1,'Tauren camp (Mulgore, Red Rock)'),(9,0,-206,1666,80,0,'Shadowfang Keep an outside instance (Silverpine Forest)'),(10,0,-6374,1262,7,0,'Harbor house outside Stormwind (Elwynn Forest)'),(11,0,-8640,580,96,0,'Empty jail between canals (Stormwind)'),(12,0,-4844,-1066,502,0,'Old Ironforge'),(13,0,-4863,-1658,503.5,0,'Ironforge Airport'),(14,0,1146,-165,313,37,'Azshara Crater instance (Alliance entrance)'),(15,0,-123,858,298,37,'Azshara Crater instance (Horde entrance)'),(16,0,4303,-2760,16.8,0,'Quel\'Thalas Tower'),(17,0,-6161,-790,423,0,'Crashed gnome airplane (between Dun Morogh and Searing Gorge)'),(18,0,-11790,-1640,54.7,0,'Zul\'Gurub an outside instance (Stranglethorn Vale)'),(19,0,-11805,-4754,6,1,'Goblin village (Tanaris, South Seas)'),(20,0,-9296,670,132,0,'Villains camp outside an Stormwind (Elwynn Forest)'),(21,0,3414,-3380,142.2,0,'Stratholm an outside instance');
/*!40000 ALTER TABLE `guildhouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance_template`
--

DROP TABLE IF EXISTS `instance_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `levelMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `levelMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `maxPlayersHeroic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reset_delay` int(10) unsigned NOT NULL DEFAULT '0',
  `startLocX` float DEFAULT NULL,
  `startLocY` float DEFAULT NULL,
  `startLocZ` float DEFAULT NULL,
  `startLocO` float DEFAULT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `instance_template`
--

LOCK TABLES `instance_template` WRITE;
/*!40000 ALTER TABLE `instance_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `instance_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_enchantment_template`
--

DROP TABLE IF EXISTS `item_enchantment_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ench` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_enchantment_template`
--

LOCK TABLES `item_enchantment_template` WRITE;
/*!40000 ALTER TABLE `item_enchantment_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_enchantment_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_loot_template`
--

DROP TABLE IF EXISTS `item_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_loot_template`
--

LOCK TABLES `item_loot_template` WRITE;
/*!40000 ALTER TABLE `item_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_required_target`
--

DROP TABLE IF EXISTS `item_required_target`;
CREATE TABLE `item_required_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `targetEntry` mediumint(8) unsigned NOT NULL default '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `item_required_target`
--

LOCK TABLES `item_required_target` WRITE;
/*!40000 ALTER TABLE `item_required_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_required_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_template`
--

DROP TABLE IF EXISTS `item_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unk0` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` mediumint(9) NOT NULL DEFAULT '-1',
  `AllowableRace` mediumint(9) NOT NULL DEFAULT '-1',
  `ItemLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` smallint(5) NOT NULL DEFAULT '-1',
  `stackable` smallint(5) NOT NULL DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `StatsCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `ScalingStatDistribution` smallint(6) NOT NULL DEFAULT '0',
  `ScalingStatValue` int(6) unsigned NOT NULL default '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min3` float NOT NULL DEFAULT '0',
  `dmg_max3` float NOT NULL DEFAULT '0',
  `dmg_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min4` float NOT NULL DEFAULT '0',
  `dmg_max4` float NOT NULL DEFAULT '0',
  `dmg_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min5` float NOT NULL DEFAULT '0',
  `dmg_max5` float NOT NULL DEFAULT '0',
  `dmg_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `block` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(9) NOT NULL DEFAULT '0',
  `TotemCategory` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_1` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_1` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_2` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_2` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_3` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_3` mediumint(9) NOT NULL DEFAULT '0',
  `socketBonus` mediumint(9) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` smallint(6) NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `Duration` int(11) NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  `ItemLimitCategory` smallint(6) NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_template`
--

LOCK TABLES `item_template` WRITE;
/*!40000 ALTER TABLE `item_template` DISABLE KEYS */;
INSERT INTO `item_template` VALUES (25,2,7,-1,'Worn Shortsword',1542,1,0,1,35,7,21,32767,511,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,1,0,0,0,1,3,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(35,2,10,-1,'Bent Staff',472,1,0,1,47,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,2,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(36,2,4,-1,'Worn Mace',5194,1,0,1,38,7,21,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,3,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(37,2,0,-1,'Worn Axe',14029,1,0,1,38,7,21,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,3,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(38,4,0,-1,'Recruit\'s Shirt',9891,1,0,1,1,1,4,-1,-1,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(39,4,1,-1,'Recruit\'s Pants',9892,0,0,1,5,1,7,32767,511,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(40,4,0,-1,'Recruit\'s Boots',10141,1,0,1,4,1,8,32767,511,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(43,4,0,-1,'Squire\'s Boots',9938,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(44,4,1,-1,'Squire\'s Pants',9937,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(45,4,0,-1,'Squire\'s Shirt',3265,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(47,4,0,-1,'Footpad\'s Shoes',9915,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(48,4,1,-1,'Footpad\'s Pants',9913,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(49,4,0,-1,'Footpad\'s Shirt',9906,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(51,4,0,-1,'Neophyte\'s Boots',9946,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(52,4,1,-1,'Neophyte\'s Pants',9945,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(53,4,0,-1,'Neophyte\'s Shirt',9944,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(55,4,0,-1,'Apprentice\'s Boots',9929,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(56,4,1,-1,'Apprentice\'s Robe',12647,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(57,4,1,-1,'Acolyte\'s Robe',12645,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(59,4,0,-1,'Acolyte\'s Shoes',3261,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(117,0,0,-1,'Tough Jerky',2473,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,-1,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(120,4,1,-1,'Thug Pants',10006,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(121,4,0,-1,'Thug Boots',10008,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(127,4,0,-1,'Trapper\'s Shirt',9996,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(139,4,1,-1,'Brawler\'s Pants',9988,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(140,4,0,-1,'Brawler\'s Boots',9992,1,0,1,4,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(147,4,1,-1,'Rugged Trapper\'s Pants',9975,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(148,4,0,-1,'Rugged Trapper\'s Shirt',9976,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(153,4,2,-1,'Primitive Kilt',10050,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,8,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(154,4,0,-1,'Primitive Mantle',10058,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(159,0,0,-1,'Refreshing Spring Water',18084,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,430,0,-1,0,-1,59,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(1395,4,1,-1,'Apprentice\'s Pants',9924,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(1396,4,1,-1,'Acolyte\'s Pants',3260,0,0,1,4,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2070,0,0,-1,'Darnassian Bleu',6353,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,-1,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2092,2,15,-1,'Worn Dagger',6442,1,0,1,35,7,13,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1600,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,3,0,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2101,11,2,-1,'Light Quiver',21328,1,0,1,4,1,18,2047,255,1,1,0,0,0,0,0,0,0,0,1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,14824,1,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2102,11,3,-1,'Small Ammo Pouch',1816,1,0,1,4,1,18,2047,255,1,1,0,0,0,0,0,0,0,0,1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,14824,1,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2105,4,0,-1,'Thug Shirt',10005,1,0,1,5,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2361,2,5,-1,'Battleworn Hammer',8690,1,0,1,45,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,1,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2362,4,6,-1,'Worn Wooden Shield',18730,0,0,1,7,1,14,32767,511,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,4,0,0,1,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2504,2,2,-1,'Worn Shortbow',8106,1,0,1,29,5,15,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2300,2,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2508,2,3,-1,'Old Blunderbuss',6606,1,0,1,27,5,26,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2300,3,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2512,6,2,-1,'Rough Arrow',5996,1,0,1,10,0,24,2047,255,5,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2516,6,3,-1,'Light Shot',5998,1,0,1,10,0,24,2047,255,5,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(2947,15,0,-1,'Small Throwing Knife',16754,1,0,1,15,0,0,2047,255,3,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,4,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(3661,2,10,-1,'Handcrafted Staff',18530,1,0,1,45,9,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,2,2,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(4536,0,0,-1,'Shiny Red Apple',6410,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,-1,11,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(4540,0,0,-1,'Tough Hunk of Bread',6399,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,-1,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(4604,0,0,-1,'Forest Mushroom Cap',15852,1,0,6,25,1,0,2047,255,5,1,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,433,0,-1,0,-1,11,1000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6096,4,0,-1,'Apprentice\'s Shirt',2163,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6097,4,0,-1,'Acolyte\'s Shirt',2470,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6098,4,1,-1,'Neophyte\'s Robe',12679,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6119,4,1,-1,'Neophyte\'s Robe',12681,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6123,4,1,-1,'Novice\'s Robe',12683,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6124,4,1,-1,'Novice\'s Pants',9987,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6125,4,0,-1,'Brawler\'s Harness',9995,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6126,4,1,-1,'Trapper\'s Pants',10002,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6127,4,0,-1,'Trapper\'s Boots',10003,1,0,1,5,1,8,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6129,4,1,-1,'Acolyte\'s Robe',12646,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6134,4,0,-1,'Primitive Mantle',10108,1,0,1,1,1,4,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6135,4,2,-1,'Primitive Kilt',10109,0,0,1,5,1,7,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,8,0,0,0,0,0,30,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6139,4,1,-1,'Novice\'s Robe',12684,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6140,4,1,-1,'Apprentice\'s Robe',12649,0,0,1,4,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6144,4,1,-1,'Neophyte\'s Robe',12680,0,0,1,5,1,20,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,7,0,0,0,0,0,35,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(6948,15,0,-1,'Hearthstone',6418,1,64,1,0,0,0,32767,511,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8690,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'',0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(12282,2,1,-1,'Worn Battleaxe',22291,1,0,1,43,8,17,2047,255,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2900,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,1,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14646,12,0,-1,'Northshire Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5805,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14647,12,0,-1,'Coldridge Valley Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5841,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14648,12,0,-1,'Shadowglen Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5842,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14649,12,0,-1,'Valley of Trials Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5843,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14650,12,0,-1,'Camp Narache Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5844,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(14651,12,0,-1,'Deathknell Gift Voucher',18499,1,0,1,0,0,0,2047,255,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1000,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,'',0,0,0,5847,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(25861,2,16,-1,'Crude Throwing Axe',20777,1,0,1,15,0,25,2047,255,3,1,0,0,0,0,0,0,0,0,200,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,4,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'0',0,0,0,0),(34648,4,4,-1,'Acherus Knight\'s Greaves',51496,2,32768,1,51,10,8,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,10,7,12,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,392,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,55,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34649,4,4,-1,'Acherus Knight\'s Gauntlets',51498,2,32768,1,34,6,10,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,15,7,6,32,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,356,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34650,4,4,-1,'Acherus Knight\'s Tunic',51494,2,32768,1,69,13,5,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,20,7,11,32,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,570,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,115,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34651,4,4,-1,'Acherus Knight\'s Girdle',51497,2,32768,1,35,7,6,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,2,4,10,32,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,320,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34652,4,4,-1,'Acherus Knight\'s Hood',51495,2,32768,1,52,10,1,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,15,7,15,32,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,463,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,70,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34653,4,4,-1,'Acherus Knight\'s Wristguard',51500,2,32768,1,36,7,9,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,7,31,7,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,249,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34655,4,4,-1,'Acherus Knight\'s Pauldrons',51501,2,32768,1,54,10,3,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,11,3,9,7,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,427,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,70,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34656,4,4,-1,'Acherus Knight\'s Cover',51499,2,32768,1,73,14,7,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,13,3,10,7,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,499,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,6,0,0,0,0,0,85,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34657,4,0,-1,'Choker of Damnation',6539,2,32768,1,2303,575,2,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,9,7,8,31,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34658,4,0,-1,'Plague Band',963,2,32768,1,534,133,11,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,11,3,6,7,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(34659,4,1,-1,'Acherus Knight\'s Shroud',49738,2,32768,1,31,6,16,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,2,4,12,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,39,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(38145,1,0,-1,'Deathweave Bag',1282,1,32768,1,0,0,18,-1,-1,35,0,0,0,0,0,0,0,0,0,1,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(38147,4,0,-1,'Corrupted Band',963,2,32768,1,534,133,11,-1,-1,60,55,0,0,0,0,0,0,0,0,1,0,3,4,11,3,6,32,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,1,'',0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0),(41751,0,5,-1,'Black Mushroom',36728,1,0,1,100,5,0,-1,-1,65,55,0,0,0,0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,27094,0,-1,0,0,11,1000,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0,-1,0,'',0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,0,0,0,'',0,0,0,0);
/*!40000 ALTER TABLE `item_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_achievement_reward`
--

DROP TABLE IF EXISTS `locales_achievement_reward`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_achievement_reward` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject_loc1` varchar(100) NOT NULL DEFAULT '',
  `subject_loc2` varchar(100) NOT NULL DEFAULT '',
  `subject_loc3` varchar(100) NOT NULL DEFAULT '',
  `subject_loc4` varchar(100) NOT NULL DEFAULT '',
  `subject_loc5` varchar(100) NOT NULL DEFAULT '',
  `subject_loc6` varchar(100) NOT NULL DEFAULT '',
  `subject_loc7` varchar(100) NOT NULL DEFAULT '',
  `subject_loc8` varchar(100) NOT NULL DEFAULT '',
  `text_loc1` text,
  `text_loc2` text,
  `text_loc3` text,
  `text_loc4` text,
  `text_loc5` text,
  `text_loc6` text,
  `text_loc7` text,
  `text_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_achievement_reward`
--

LOCK TABLES `locales_achievement_reward` WRITE;
/*!40000 ALTER TABLE `locales_achievement_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_achievement_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_creature`
--

DROP TABLE IF EXISTS `locales_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_creature`
--

LOCK TABLES `locales_creature` WRITE;
/*!40000 ALTER TABLE `locales_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_gameobject`
--

DROP TABLE IF EXISTS `locales_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc1` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc2` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc3` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc4` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc5` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc6` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc7` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_gameobject`
--

LOCK TABLES `locales_gameobject` WRITE;
/*!40000 ALTER TABLE `locales_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_gameobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_item`
--

DROP TABLE IF EXISTS `locales_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_item`
--

LOCK TABLES `locales_item` WRITE;
/*!40000 ALTER TABLE `locales_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_npc_option`
--

DROP TABLE IF EXISTS `locales_npc_option`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_npc_option` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_npc_option`
--

LOCK TABLES `locales_npc_option` WRITE;
/*!40000 ALTER TABLE `locales_npc_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_npc_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_npc_text`
--

DROP TABLE IF EXISTS `locales_npc_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_npc_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_npc_text`
--

LOCK TABLES `locales_npc_text` WRITE;
/*!40000 ALTER TABLE `locales_npc_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_npc_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_page_text`
--

DROP TABLE IF EXISTS `locales_page_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_page_text`
--

LOCK TABLES `locales_page_text` WRITE;
/*!40000 ALTER TABLE `locales_page_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_page_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_points_of_interest`
--

DROP TABLE IF EXISTS `locales_points_of_interest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name_loc1` text,
  `icon_name_loc2` text,
  `icon_name_loc3` text,
  `icon_name_loc4` text,
  `icon_name_loc5` text,
  `icon_name_loc6` text,
  `icon_name_loc7` text,
  `icon_name_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_points_of_interest`
--

LOCK TABLES `locales_points_of_interest` WRITE;
/*!40000 ALTER TABLE `locales_points_of_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_points_of_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_quest`
--

DROP TABLE IF EXISTS `locales_quest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locales_quest`
--

LOCK TABLES `locales_quest` WRITE;
/*!40000 ALTER TABLE `locales_quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_quest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mangos_string`
--

DROP TABLE IF EXISTS `mangos_string`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mangos_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mangos_string`
--

LOCK TABLES `mangos_string` WRITE;
/*!40000 ALTER TABLE `mangos_string` DISABLE KEYS */;
INSERT INTO `mangos_string` VALUES
(1,'You should select a character or a creature.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'You should select a creature.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'|cffff0000[System Message]: %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'|cffff0000[Event Message]: %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'There is no help for that command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,'There is no such command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,'There is no such subcommand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,'Command %s have subcommands:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Commands available to you:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Incorrect syntax.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'Your account level is: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,'Online players: %u (max: %u) Queued players: %u (max: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'Server uptime: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,'Player saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,'All players saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,'There are the following active GMs on this server:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,'There are no GMs currently logged in on this server.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'Cannot do that while flying.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'Cannot do that in Battlegrounds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,'Target is flying you can\'t do that.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,'%s is flying command failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'You are not mounted so you can\'t dismount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'Cannot do that while fighting.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,'You used it recently.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,'Password not changed (unknown error)!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,'The password was changed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'The new passwords do not match or the old password is wrong',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'Your account is now locked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,'Your account is now unlocked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,', rank ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,' [known]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,' [learn]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,' [passive]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,' [talent]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,' [active]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,' [complete]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,' (offline)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,'on',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,'off',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,'You are: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,'visible',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,'invisible',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,'done',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,'You',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,' <unknown> ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,'<error>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,'<non-existing character>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,'UNKNOWN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,'You must be at least level %u to enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,'You must be at least level %u and have item %s to enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,'Hello! Ready for some training?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,'Invaid item count (%u) for item %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,'Mail can\'t have more %u item stacks',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(54,'The new passwords do not match',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(55,'Your password can\'t be longer than 16 characters (client limit), password not changed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(56,'Current Message of the day: \r\n%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(57,'Using World DB: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(58,'Using script library: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(59,'Using creature EventAI: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(100,'Global notify: ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(101,'Map: %u (%s) Zone: %u (%s) Area: %u (%s) Phase: %u\nX: %f Y: %f Z: %f Orientation: %f\ngrid[%u,%u]cell[%u,%u] InstanceID: %u\n ZoneX: %f ZoneY: %f\nGroundZ: %f FloorZ: %f Have height data (Map: %u VMap: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(102,'%s is already being teleported.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(103,'You can summon a player to your instance only if he is in your party with you as leader.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(104,'You cannot go to the player\'s instance because you are in a party now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(105,'You can go to the player\'s instance while not being in his party only if your GM mode is on.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(106,'You can not go to player %s from instance to instance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(107,'You can not summon player %s from instance to instance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(108,'You are summoning %s%s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(109,'You are being summoned by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(110,'You are teleporting %s%s to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(111,'You are being teleported by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(112,'Player (%s) does not exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(113,'Appearing at %s\'s location.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(114,'%s is appearing to your location.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(115,'Incorrect values.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(116,'No character selected.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(117,'%s is not in a group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(118,'You changed HP of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(119,'%s changed your HP to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(120,'You changed MANA of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(121,'%s changed your MANA to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(122,'You changed ENERGY of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(123,'%s changed your ENERGY to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(124,'Current energy: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(125,'You changed rage of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(126,'%s changed your rage to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(127,'You changed level of %s to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(128,'GUID %i, faction is %i, flags is %i, npcflag is %i, DY flag is %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(129,'Wrong faction: %u (not found in factiontemplate.dbc).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(130,'You changed GUID=%i \'s Faction to %i, flags to %i, npcflag to %i, dyflag to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(131,'You changed the spellflatid=%i, val= %i, mark =%i to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(132,'%s changed your spellflatid=%i, val= %i, mark =%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(133,'%s has access to all taxi nodes now (until logout).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(134,'%s has no more access to all taxi nodes now (only visited accessible).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(135,'%s has given you access to all taxi nodes (until logout).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(136,'%s has removed access to all taxi nodes (only visited still accessible).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(137,'You set all speeds to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(138,'%s set all your speeds to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(139,'You set the speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(140,'%s set your speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(141,'You set the swim speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(142,'%s set your swim speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(143,'You set the backwards run speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(144,'%s set your backwards run speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(145,'You set the fly speed to %2.2f from normal of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(146,'%s set your fly speed to %2.2f from normal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(147,'You set the size %2.2f of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(148,'%s set your size to %2.2f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(149,'There is no such mount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(150,'You give a mount to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(151,'%s gave you a mount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(152,'USER1: %i, ADD: %i, DIF: %i\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(153,'You take all copper of %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(154,'%s took you all of your copper.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(155,'You take %i copper from %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(156,'%s took %i copper from you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(157,'You give %i copper to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(158,'%s gave you %i copper.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(159,'You hear sound %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(160,'USER2: %i, ADD: %i, RESULT: %i\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(161,'Removed bit %i in field %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(162,'Set bit %i in field %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(163,'Teleport location table is empty!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(164,'Teleport location not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(165,'Requires search parameter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(166,'There are no teleport locations matching your request.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(168,'Locations found are:\n %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(169,'Mail sent to %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(170,'You try to hear sound %u but it doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(171,'You can\'t teleport self to self!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(172,'server console command',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(173,'You changed runic power of %s to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(174,'%s changed your runic power to %i/%i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(175,'Liquid level: %f, ground: %f, type: %d, status: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(200,'No selection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(201,'Object GUID is: lowpart %u highpart %X',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(202,'The name was too long by %i characters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(203,'Error, name can only contain characters A-Z and a-z.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(204,'The subname was too long by %i characters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(205,'Not yet implemented',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(206,'Item \'%i\' \'%s\' added to list with maxcount \'%i\' and incrtime \'%i\' and extendedcost \'%i\'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(207,'Item \'%i\' not found in database.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(208,'Item \'%i\' \'%s\' deleted from vendor list',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(209,'Item \'%i\' not found in vendor list.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(210,'Item \'%i\' already in vendor list.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(211,'Spells of %s reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(212,'Spells of %s will reset at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(213,'Talents of %s reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(214,'Talents of %s will reset at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(215,'Your spells have been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(216,'Your talents have been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(217,'Unknown case \'%s\' for .resetall command. Type full correct case name.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(218,'Spells will reset for all players at login. Strongly recommend re-login!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(219,'Talents will reset for all players at login. Strongly recommend re-login!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(220,'Creature (GUID: %u) No waypoint found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(221,'Creature (GUID: %u) Last waypoint not found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(222,'Creature (GUID: %u) No waypoint found - used \'wpguid\'. Now trying to find it by its position...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(223,'Creature (GUID: %u) No waypoints found - This is a MaNGOS db problem (single float).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(224,'Selected creature is ignored - provided GUID is used',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(225,'Creature (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(226,'You must select a visual waypoint.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(227,'No visual waypoints found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(228,'Could not create visual waypoint with creatureID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(229,'All visual waypoints removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(230,'Could not create waypoint-creature with ID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(231,'No GUID provided.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(232,'No waypoint number provided.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(233,'Argument required for \'%s\'.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(234,'Waypoint %i added to GUID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(235,'Waypoint %d added.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(236,'Waypoint changed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(237,'Waypoint %s modified.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(238,'WP export successfull.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(239,'No waypoints found inside the database.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(240,'File imported.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(241,'Waypoint removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(242,'Warning: Could not delete WP from the world with ID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(243,'This happens if the waypoint is too far away from your char.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(244,'The WP is deleted from the database, but not from the world here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(245,'They will disappear after a server restart.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(246,'Waypoint %d: Info for creature: %s, GUID: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(247,'Waittime: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(248,'Model %d: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(249,'Emote: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(250,'Spell: %d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(251,'Text%d (ID: %i): %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(252,'AIScript: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(253,'Forced rename for player %s will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(254,'Forced rename for player %s (GUID #%u) will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(255,'Waypoint-Creature (GUID: %u) Not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(256,'Could not find NPC...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(257,'Creature movement type set to \'%s\', waypoints removed (if any).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(258,'Creature movement type set to \'%s\', waypoints were not removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(259,'Incorrect value, use on or off',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(260,'Value saved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(261,'Value saved, you may need to rejoin or clean your client cache.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(262,'Areatrigger ID %u not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(263,'Target map or coordinates is invalid (X: %f Y: %f MapId: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(264,'Zone coordinates is invalid (X: %f Y: %f AreaId: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(265,'Zone %u (%s) is part of instanceable map %u (%s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(266,'Nothing found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(267,'Object not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(268,'Creature not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(269,'Warning: Mob found more than once - you will be teleported to the first one found in DB.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(270,'Creature Removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(271,'Creature moved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(272,'Creature (GUID:%u) must be on the same map as player!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(273,'Game Object (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(274,'Game Object (GUID: %u) has references in not found creature %u GO list, can\'t be deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(275,'Game Object (GUID: %u) removed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(276,'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) turned',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(277,'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) moved',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(278,'You must select a vendor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(279,'You must send id for item',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(280,'Vendor has too many items (max 128)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(281,'You can\'t kick self, logout instead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(282,'Player %s kicked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(284,'Accepting Whisper: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(285,'Accepting Whisper: ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(286,'Accepting Whisper: OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(287,'Creature (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(288,'Tickets count: %i show new tickets: %s\n',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(289,'New ticket from %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(290,'Ticket of %s (Last updated: %s):\n%s ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(291,'New ticket show: ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(292,'New ticket show: OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(293,'Ticket %i doesn\'t exist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(294,'All tickets deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(295,'Character %s ticket deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(296,'Ticket deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(297,'Spawn distance changed to: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(298,'Spawn time changed to: %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(299,'The honor of %s was set to %u!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(300,'Your chat has been disabled for %u minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(301,'You have disabled %s\'s chat for %u minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(302,'Player\'s chat is already enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(303,'Your chat has been enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(304,'You have enabled %s\'s chat.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(305, 'Faction %s (%u) reputation of %s was set to %5d!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(306, 'The arena points of %s was set to %u!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(307, 'No faction found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(308, 'Faction %i unknown!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(309, 'Invalid parameter %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(310, 'delta must be between 0 and %d (inclusive)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(311, '%d - |cffffffff|Hfaction:%d|h[%s]|h|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(312, ' [visible]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(313, ' [at war]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(314, ' [peace forced]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(315, ' [hidden]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(316, ' [invisible forced]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(317, ' [inactive]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(318, 'Hated',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(319, 'Hostile',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(320, 'Unfriendly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(321, 'Neutral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(322, 'Friendly',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(323, 'Honored',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(324, 'Revered',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(325, 'Exalted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(326, 'Faction %s (%u) can\'not have reputation.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(327, ' [no reputation]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(328,'Characters at account %s (Id: %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(329,'  %s (GUID %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(330,'No players found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(331,'Extended item cost %u not exist',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(332,'GM mode is ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(333,'GM mode is OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(334,'GM Chat Badge is ON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(335,'GM Chat Badge is OFF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(336,'You repair all %s''s items.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(337,'All your items repaired by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(338,'You set waterwalk mode %s for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(339,'Your waterwalk mode %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(340,'%s is now following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(341,'%s is not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(342,'%s is now not following you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(343,'Creature (Entry: %u) cannot be tamed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(344,'You already have pet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(345,'Forced customize for player %s will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(346,'Forced customize for player %s (GUID #%u) will be requested at next login.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(347,'TaxiNode ID %u not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(400,'|cffff0000[System Message]:|rScripts reloaded',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(401,'You change security level of account %s to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(402,'%s changed your security level to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(403,'You have low security level for this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(404,'Creature movement disabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(405,'Creature movement enabled.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(406,'Weather can\'t be changed for this zone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(407,'Weather system disabled at server.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(408,'%s is banned for %s. Reason: %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(409,'%s is banned permanently for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(410,'%s %s not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(411,'%s unbanned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(412,'There was an error removing the ban on %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(413,'Account not exist: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(414,'There is no such character.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(415,'There is no such IP in banlist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(416,'Account %s has never been banned',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(417,'Ban history for account %s:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(418,'Ban Date: %s Bantime: %s Still active: %s  Reason: %s Set by: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(419,'Inf.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(420,'Never',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(421,'Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(422,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(423,'IP: %s\nBan Date: %s\nUnban Date: %s\nRemaining: %s\nReason: %s\nSet by: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(424,'There is no matching IPban.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(425,'There is no matching account.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(426,'There is no banned account owning a character matching this part.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(427,'The following IPs match your pattern:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(428,'The following accounts match your query:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(429,'You learned many spells/skills.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(430,'You learned all spells for class.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(431,'You learned all talents for class.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(432,'You learned all languages.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(433,'You learned all craft skills and recipes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(434,'Could not find \'%s\'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(435,'Invalid item id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(436,'No items found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(437,'Invalid gameobject id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(438,'Found items %u: %u ( inventory %u mail %u auction %u guild %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(439,'Found gameobjects %u: %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(440,'Invalid creature id: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(441,'Found creatures %u: %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(442,'No area found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(443,'No item sets found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(444,'No skills found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(445,'No spells found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(446,'No quests found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(447,'No creatures found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(448,'No gameobjects found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(449,'Graveyard #%u doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(450,'Graveyard #%u already linked to zone #%u (current).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(451,'Graveyard #%u linked to zone #%u (current).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(452,'Graveyard #%u can\'t be linked to subzone or not existed zone #%u (internal error).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(454,'No faction in Graveyard with id= #%u , fix your DB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(455,'invalid team, please fix database',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(456,'any',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(457,'alliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(458,'horde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(459,'Graveyard #%u (faction: %s) is nearest from linked to zone #%u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(460,'Zone #%u doesn\'t have linked graveyards.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(461,'Zone #%u doesn\'t have linked graveyards for faction: %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(462,'Teleport location already exists!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(463,'Teleport location added.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(464,'Teleport location NOT added: database error.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(465,'Teleport location deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(466,'No taxinodes found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(467,'Target unit has %d auras:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(468,'id: %d eff: %d type: %d duration: %d maxduration: %d name: %s%s%s caster: %s %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(469,'Target unit has %d auras of type %d:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(470,'id: %d eff: %d name: %s%s%s caster: %s %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(471,'Quest %u not found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(472,'Quest %u started from item. For correct work, please, add item to inventory and start quest in normal way: .additem %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(473,'Quest removed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(474,' [rewarded]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(475,' [complete]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(476,' [active]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(477,'%s\'s Fly Mode %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(478,'Opcode %u sent to %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(479,'Character loaded successfully!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(480,'Failed to load the character!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(481,'Character dumped successfully!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(482,'Character dump failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(483,'Spell %u broken and not allowed to cast or learn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(484,'Skill %u (%s) for player %s set to %u and current maximum set to %u (without permanent (talent) bonuses).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(485,'Player %s must have skill %u (%s) before using this command.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(486,'Invalid skill id (%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(487,'You learned default GM spells/skills.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(488,'You already know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(489,'Target(%s) already know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(490,'%s doesn\'t know that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(491,'You already forgot that spell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(492,'All spell cooldowns removed for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(493,'Spell %u cooldown removed for %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(494,'Command : Additem, itemId = %i, amount = %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(495,'Command : Additemset, itemsetId = %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(496,'Removed itemID = %i, amount = %i from %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(497,'Cannot create item \'%i\' (amount: %i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(498,'You need to provide a guild name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(499,'Player not found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(500,'Player already has a guild!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(501,'Guild not created! (already exists?)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(502,'No items from itemset \'%u\' found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(503,'The distance is: (3D) %f (2D) %f yards.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(504,'Item \'%i\' \'%s\' Item Slot %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(505,'Item \'%i\' doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(506,'Item \'%i\' \'%s\' Added to Slot %i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(507,'Item save failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(508,'%d - owner: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(509,'%d - sender: %s (guid: %u account: %u ) receiver: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(510,'%d - owner: %s (guid: %u account: %u ) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(511,'Wrong link type!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(512,'%d - |cffffffff|Hitem:%d:0:0:0:0:0:0:0|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(513,'%d - |cffffffff|Hquest:%d|h[%s]|h|r %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(514,'%d - |cffffffff|Hcreature_entry:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(515,'%d - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(516,'%d - |cffffffff|Hgameobject_entry:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(517,'%d - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(518,'%d - |cffffffff|Hitemset:%d|h[%s %s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(519,'|cffffffff|Htele:%s|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(520,'%d - |cffffffff|Hspell:%d|h[%s]|h|r ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(521,'%d - |cffffffff|Hskill:%d|h[%s %s]|h|r %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(522,'Game Object (GUID: %u) not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(523,'>> Game Object %s (GUID: %u) at %f %f %f. Orientation %f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(524,'Selected object:\n|cffffffff|Hgameobject:%d|h[%s]|h|r GUID: %u ID: %u\nX: %f Y: %f Z: %f MapId: %u\nOrientation: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(525,'>> Add Game Object \'%i\' (%s) (GUID: %i) added at \'%f %f %f\'.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(526,'%s (lowguid: %u) movement generators stack:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(527,'   Idle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(528,'   Random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(529,'   Waypoint',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(530,'   Animal random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(531,'   Confused',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(532,'   Targeted to player %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(533,'   Targeted to creature %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(534,'   Targeted to <NULL>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(535,'   Home movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(536,'   Home movement used for player?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(537,'   Taxi flight',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(538,'   Unknown movement generator (%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(539,'Player selected NPC\nGUID: %u.\nFaction: %u.\nnpcFlags: %u.\nEntry: %u.\nDisplayID: %u (Native: %u).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(540,'Level: %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(541,'Health (base): %u. (max): %u. (current): %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(542,'Unit Flags: %u.\nDynamic Flags: %u.\nFaction Template: %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(543,'Loot: %u Pickpocket: %u Skinning: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(544,'Position: %f %f %f.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(545,'*** Is a vendor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(546,'*** Is a trainer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(547,'InstanceID: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(548,'Player%s %s (guid: %u) Account: %s (id: %u) GMLevel: %u Last IP: %s Last login: %s Latency: %ums',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(549,'Played time: %s Level: %u Money: %ug%us%uc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(550,'Command .pinfo doesn\'t support \'rep\' option for offline players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(551,'%s has explored all zones now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(552,'%s has no more explored zones.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(553,'%s has explored all zones for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(554,'%s has hidden all zones from you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(555,'Hover enabled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(556,'Hover disabled',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(557,'%s level up you to (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(558,'%s level down you to (%i)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(559,'%s reset your level progress.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(560,'The area has been set as explored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(561,'The area has been set as not explored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(562,'GUID=%i \'s updateIndex: %i, value:  %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(563,'You change GUID=%i \'s UpdateIndex: %i value to %i.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(564,'The value index %u is too big to %u(count: %u).',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(565,'Set %u uint32 Value:[OPCODE]:%u [VALUE]:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(566,'You Set %u Field:%u to uint32 Value: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(567,'Set %u float Value:[OPCODE]:%u [VALUE]:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(568,'You Set %u Field:%i to float Value: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(569,'Get %u uint32 Value:[OPCODE]:%u [VALUE]:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(570,'The uint32 value of %u in %u is: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(571,'Get %u float Value:[OPCODE]:%u [VALUE]:%f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(572,'The float of %u value in %u is: %f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(573,'.Set32Bit:[OPCODE]:%u [VALUE]:%u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(574,'You set Bit of Field:%u to Value: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(575,'.Mod32Value:[OPCODE]:%u [VALUE]:%i',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(576,'You modified the value of Field:%u to Value: %u',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(577,'You are now invisible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(578,'You are now visible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(579,'Selected player or creature not have victim.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(580,'You learned all default spells for race/class and completed quests rewarded spells.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(581,'Found near gameobjects (distance %f): %u ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(582,'SpawnTime: Full:%s Remain:%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(583,'%d - |cffffffff|Hgameevent:%d|h[%s]|h|r%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(584,'No event found!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(585,'Event not exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(586,'Event %u: %s%s\nStart: %s End: %s Occurence: %s Length: %s\nNext state change: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(587,'Event %u already active!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(588,'Event %u not active!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(589,'   Point movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(590,'   Fear movement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(591,'   Distract movement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(592,'You have learned all spells in craft: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(593,'Currently Banned Accounts:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(594,'|    Account    |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(595,'Currently Banned IPs:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(596,'|      IP       |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(597,'Current gamemasters:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(598,'|    Account    |  GM  |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(599,'No gamemasters.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(600,'The Alliance wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(601,'The Horde wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(602,'The battle for Warsong Gulch begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(603,'The battle for Warsong Gulch begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(604,'Let the battle for Warsong Gulch begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(605,'$n captured the Horde flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(606,'$n captured the Alliance flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(607,'The Horde flag was dropped by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(608,'The Alliance Flag was dropped by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(609,'The Alliance Flag was returned to its base by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(610,'The Horde flag was returned to its base by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(611,'The Horde flag was picked up by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(612,'The Alliance Flag was picked up by $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(613,'The flags are now placed at their bases.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(614,'The Alliance flag is now placed at its base.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(615,'The Horde flag is now placed at its base.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(636,'The battle begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(637,'The battle begins in 30 seconds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(638,'The battle has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(650,'Alliance',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(651,'Horde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(652,'stables',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(653,'blacksmith',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(654,'farm',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(655,'lumber mill',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(656,'mine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(657,'The %s has taken the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(658,'$n has defended the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(659,'$n has assaulted the %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(660,'$n claims the %s! If left unchallenged, the %s will control it in 1 minute!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(661,'The battle for Arathi Basin begins in 1 minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(662,'The battle for Arathi Basin begins in 30 seconds. Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(663,'The battle for Arathi Basin has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(664,'The Alliance has gathered $1776W resources, and is near victory!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(665,'The Horde has gathered $1777W resources, and is near victory!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(666,'After your recent battle in %s our best attempts to award you a Mark of Honor failed. Enclosed you will find the Mark of Honor we were not able to deliver to you at the time. Thanks for fighting in %s!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(667,'The Alliance has taken control of the Mage Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(668,'The Horde has taken control of the Mage Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(669,'The Alliance has taken control of the Draenei Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(670,'The Horde has taken control of the Draenei Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(671,'The Alliance has taken control of the Blood Elf Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(672,'The Horde has taken control of the Blood Elf Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(673,'The Alliance has taken control of the Fel Reaver Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(674,'The Horde has taken control of the Fel Reaver Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(675,'The Alliance has lost control of the Mage Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(676,'The Horde has lost control of the Mage Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(677,'The Alliance has lost control of the Draenei Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(678,'The Horde has lost control of the Draenei Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(679,'The Alliance has lost control of the Blood Elf Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(680,'The Horde has lost control of the Blood Elf Tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(681,'The Alliance has lost control of the Fel Reaver Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(682,'The Horde has lost control of the Fel Reaver Ruins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(683,'%s has taken the flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(684,'The Alliance have captured the flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(685,'The Horde have captured the flag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(686,'The flag has been dropped.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(687,'The flag has been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(700,'You must be level %u to form an arena team',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(701,'One minute until the Arena battle begins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(702,'Thirty seconds until the Arena battle begins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(703,'Fifteen seconds until the Arena battle begins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(704,'The Arena battle has begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(705,'You must wait %s before speaking again.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(706,'This item(s) have problems with equipping/storing in inventory.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(707,'%s wishes to not be disturbed and cannot receive whisper messages: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(708,'%s is Away from Keyboard: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(709,'Do not Disturb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(710,'Away from Keyboard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(711,'Queue status for %s (Lvl: %u to %u)\nQueued alliances: %u (Need at least %u more)\nQueued hordes: %u (Need at least %u more)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(712,'|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] A: %u/%u, H: %u/%u|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(713,'You must be level %u to join an arena team!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(714,'%s is not high enough level to join your team',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(715,'You don\'t meet Battleground level requirements',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(716,'Your arena team is full, %s cannot join it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(717,'|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] Started!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(718,'|cffff0000[Arena Queue Announcer]:|r %s -- Joined : %ux%u : %u|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(719,'|cffff0000[Arena Queue Announcer]:|r %s -- Exited : %ux%u : %u|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(720,'Your group is too large for this battleground. Please regroup to join.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(721,'Your group is too large for this arena. Please regroup to join.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(722,'Your group has members not in your arena team. Please regroup to join.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(723,'Your group does not have enough players to join this match.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(724,'The Gold Team wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(725,'The Green Team wins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(727,'Your group has an offline member. Please remove him before joining.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(728,'Your group has players from the opposing faction. You can\'t join the battleground as a group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(729,'Your group has players from different battleground brakets. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(730,'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(731,'Someone in your party is Deserter. You can\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(732,'Someone in your party is already in three battleground queues. You cannot join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(733,'You cannot teleport to a battleground or arena map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(734,'You cannot summon players to a battleground or arena map.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(735,'You must be in GM mode to teleport to a player in a battleground.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(736,'You cannot teleport to a battleground from another battleground. Please leave the current battleground first.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(737,'Arenas are set to 1v1 for debugging. So, don\'t join as group.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(738,'Arenas are set to normal playercount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(739,'Battlegrounds are set to 1v0 for debugging.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(740,'Battlegrounds are set to normal playercount.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(741,'Flushing Arena points based on team ratings, this may take a few minutes. Please stand by...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(742,'Distributing arena points to players...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(743,'Finished setting arena points for online players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(744,'Modifying played count, arena points etc. for loaded arena teams, sending updated stats to online players...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(745,'Modification done.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(746,'Done flushing Arena points.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(750,'Not enough players. This game will close in %u mins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(751,'Not enough players. This game will close in %u seconds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(753,'The battle for Warsong Gulch begins in 2 minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(754,'The battle for Arathi Basin begins in 2 minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(755,'The battle begins in 2 minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(801,'You do not have enough gold',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(802,'You do not have enough free slots',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(803,'Your partner does not have enough free bag slots',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(804,'You do not have permission to perform that function',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(805,'Unknown language',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(806,'You don\'t know that language',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(807,'Please provide character name',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(808,'Player %s not found or offline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(809,'Account for character %s not found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(810,'|Hplayer:$N|h[$N]|h has earned the achievement $a!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(811,'Guild Master',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(812,'Officer',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(813,'Veteran',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(814,'Member',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(815,'Initiate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1000,'Exiting daemon...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1001,'Account deleted: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1002,'Account %s NOT deleted (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1003,'Account %s NOT deleted (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1004,'Account created: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1005,'Account name can\'t be longer than 16 characters (client limit), account not created!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1006,'Account with this name already exist!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1007,'Account %s NOT created (probably sql file format was updated)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1008,'Account %s NOT created (unknown error)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1009,'Player %s (Guid: %u) Account %s (Id: %u) deleted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1010,'|    Account    |       Character      |       IP        | GM | Expansion |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1011,'|<Error>        | %20s |<Error>          |<Er>| <Error>   |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1012,'===========================================================================',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1013,'|%15s| %20s | %15s |%4d| %9d |',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1014,'No online players.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1100,'Account %s (Id: %u) have up to %u expansion allowed now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1101,'Message of the day changed to:\r\n%s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1102,'Message sent to %s: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1103,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1104,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1105,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1106,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1107,'%d - %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1108,'%d - %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1109,'%d - %s %s %s %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1110,'%d - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1111,'%d - %s X:%f Y:%f Z:%f MapId:%d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1112,'Failed to open file: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1113,'Account %s (%u) have max amount allowed characters (client limit)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1114,'Dump file have broken data!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1115,'Invalid character name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1116,'Invalid character guid!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1117,'Character guid %u in use!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1118,'%d - guild: %s (guid: %u) %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1119,'You must use male or female as gender.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1120,'You change gender of %s to %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1121,'Your gender changed to %s by %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1122,'(%u/%u +perm %u +temp %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1123,'Not pet found',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1124,'Wrong pet type',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1125,'Your pet learned all talents',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1126,'Your pet talents have been reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1127,'Talents of %s\'s pet reset.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1128,'%d - |cffffffff|Htaxinode:%u|h[%s %s]|h|r (Map:%u X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1129,'%d - %s %s (Map:%u X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1200,'You try to view cinemitic %u but it doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1201,'You try to view movie %u but it doesn\'t exist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mangos_string` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milling_loot_template`
--

DROP TABLE IF EXISTS `milling_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `milling_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `milling_loot_template`
--

LOCK TABLES `milling_loot_template` WRITE;
/*!40000 ALTER TABLE `milling_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `milling_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_gossip`
--

DROP TABLE IF EXISTS `npc_gossip`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_gossip` (
  `npc_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_gossip`
--

LOCK TABLES `npc_gossip` WRITE;
/*!40000 ALTER TABLE `npc_gossip` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_gossip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_gossip_textid`
--

DROP TABLE IF EXISTS `npc_gossip_textid`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_gossip_textid` (
  `zoneid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `zoneid` (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_gossip_textid`
--

LOCK TABLES `npc_gossip_textid` WRITE;
/*!40000 ALTER TABLE `npc_gossip_textid` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_gossip_textid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_option`
--

DROP TABLE IF EXISTS `npc_option`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_option` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gossip_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `box_money` int(10) unsigned NOT NULL DEFAULT '0',
  `coded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `box_text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_option`
--

LOCK TABLES `npc_option` WRITE;
/*!40000 ALTER TABLE `npc_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_spellclick_spells`
--

DROP TABLE IF EXISTS `npc_spellclick_spells`;
CREATE TABLE `npc_spellclick_spells` (
    `npc_entry` INT UNSIGNED NOT NULL COMMENT 'reference to creature_template',
    `spell_id` INT UNSIGNED NOT NULL COMMENT 'spell which should be casted ',
    `quest_id` INT UNSIGNED NOT NULL COMMENT 'reference to quest_template',
    `cast_flags` TINYINT UNSIGNED NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit'
) ENGINE = MYISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `npc_spellclick_spells`
--

LOCK TABLES `npc_spellclick_spells` WRITE;
/*!40000 ALTER TABLE `npc_spellclick_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_spellclick_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_text`
--

DROP TABLE IF EXISTS `npc_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_text`
--

LOCK TABLES `npc_text` WRITE;
/*!40000 ALTER TABLE `npc_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_trainer`
--

DROP TABLE IF EXISTS `npc_trainer`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_trainer`
--

LOCK TABLES `npc_trainer` WRITE;
/*!40000 ALTER TABLE `npc_trainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `npc_vendor`
--

DROP TABLE IF EXISTS `npc_vendor`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `npc_vendor`
--

LOCK TABLES `npc_vendor` WRITE;
/*!40000 ALTER TABLE `npc_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_text`
--

DROP TABLE IF EXISTS `page_text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_text`
--

LOCK TABLES `page_text` WRITE;
/*!40000 ALTER TABLE `page_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_levelspell`
--

DROP TABLE IF EXISTS `pet_levelspell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pet_levelspell` (
  `creature_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_id` mediumint(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_entry`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pet_levelspell`
--

LOCK TABLES `pet_levelspell` WRITE;
/*!40000 ALTER TABLE `pet_levelspell` DISABLE KEYS */;
INSERT INTO `pet_levelspell` VALUES (15,19244),(15,19505),(15,19647),(15,19731),(15,19734),(15,19736),(15,27276),(15,27277),(15,48011),(15,54049),(15,54050),(15,54051),(15,54052),(15,54053),(15,54424),(15,57564),(15,57565),(15,57566),(15,57567),(16,3716),(16,7809),(16,7810),(16,7811),(16,7812),(16,11774),(16,11775),(16,17735),(16,17750),(16,17751),(16,17752),(16,17767),(16,17850),(16,17851),(16,17852),(16,17853),(16,17854),(16,19438),(16,19440),(16,19441),(16,19442),(16,19443),(16,27270),(16,27271),(16,27272),(16,27273),(16,33701),(16,47984),(16,47985),(16,47986),(16,47987),(16,47988),(16,47989),(16,47990),(17,6358),(17,6360),(17,7813),(17,7814),(17,7815),(17,7816),(17,7870),(17,11778),(17,11779),(17,11780),(17,11784),(17,11785),(17,27274),(17,27275),(17,47991),(17,47992),(23,2947),(23,3110),(23,4511),(23,6307),(23,7799),(23,7800),(23,7801),(23,7802),(23,7804),(23,7805),(23,8316),(23,8317),(23,11762),(23,11763),(23,11766),(23,11767),(23,11770),(23,11771),(23,27267),(23,27268),(23,27269),(23,47964),(23,47982),(23,47983),(29,30151),(29,30194),(29,30198),(29,30213),(29,30219),(29,30223),(29,33698),(29,33699),(29,33700),(29,47993),(29,47994),(29,47996);
/*!40000 ALTER TABLE `pet_levelspell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_levelstats`
--

DROP TABLE IF EXISTS `pet_levelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pet_levelstats`
--

LOCK TABLES `pet_levelstats` WRITE;
/*!40000 ALTER TABLE `pet_levelstats` DISABLE KEYS */;
/*!40000 ALTER TABLE `pet_levelstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_name_generation`
--

DROP TABLE IF EXISTS `pet_name_generation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pet_name_generation`
--

LOCK TABLES `pet_name_generation` WRITE;
/*!40000 ALTER TABLE `pet_name_generation` DISABLE KEYS */;
INSERT INTO `pet_name_generation` VALUES (1,'Aba',416,0),(2,'Az',416,0),(3,'Bel',416,0),(4,'Biz',416,0),(5,'Cho',416,0),(6,'Dag',416,0),(7,'Gak',416,0),(8,'Gar',416,0),(9,'Gel',416,0),(10,'Gho',416,0),(11,'Gob',416,0),(12,'Gra',416,0),(13,'Jak',416,0),(14,'Jub',416,0),(15,'Kar',416,0),(16,'Kup',416,0),(17,'Laz',416,0),(18,'Nal',416,0),(19,'Nok',416,0),(20,'Pag',416,0),(21,'Pig',416,0),(22,'Pip',416,0),(23,'Piz',416,0),(24,'Quz',416,0),(25,'Rui',416,0),(26,'Rul',416,0),(27,'Rup',416,0),(28,'Tar',416,0),(29,'Vol',416,0),(30,'Yaz',416,0),(31,'Zep',416,0),(32,'Zig',416,0),(33,'Zil',416,0),(34,'Zor',416,0),(35,'bis',416,1),(36,'fip',416,1),(37,'gup',416,1),(38,'ham',416,1),(39,'jub',416,1),(40,'kin',416,1),(41,'kol',416,1),(42,'lop',416,1),(43,'loz',416,1),(44,'mat',416,1),(45,'mir',416,1),(46,'nam',416,1),(47,'nar',416,1),(48,'nik',416,1),(49,'nip',416,1),(50,'pad',416,1),(51,'pep',416,1),(52,'pit',416,1),(53,'qua',416,1),(54,'rai',416,1),(55,'rin',416,1),(56,'rot',416,1),(57,'tai',416,1),(58,'tal',416,1),(59,'tik',416,1),(60,'tip',416,1),(61,'tog',416,1),(62,'tuk',416,1),(63,'uri',416,1),(64,'yal',416,1),(65,'yap',416,1),(66,'Bhee',417,0),(67,'Bruu',417,0),(68,'Czaa',417,0),(69,'Droo',417,0),(70,'Flaa',417,0),(71,'Fzuu',417,0),(72,'Ghaa',417,0),(73,'Gree',417,0),(74,'Gzaa',417,0),(75,'Haa',417,0),(76,'Haad',417,0),(77,'Haag',417,0),(78,'Haap',417,0),(79,'Jhaa',417,0),(80,'Jhuu',417,0),(81,'Khaa',417,0),(82,'Khii',417,0),(83,'Khuu',417,0),(84,'Kree',417,0),(85,'Luu',417,0),(86,'Maa',417,0),(87,'Nhee',417,0),(88,'Phuu',417,0),(89,'Pryy',417,0),(90,'Rhuu',417,0),(91,'Shaa',417,0),(92,'Sloo',417,0),(93,'Sruu',417,0),(94,'Thoo',417,0),(95,'Traa',417,0),(96,'Wraa',417,0),(97,'Zhaa',417,0),(98,'dhon',417,1),(99,'dhum',417,1),(100,'dhun',417,1),(101,'dom',417,1),(102,'don',417,1),(103,'drom',417,1),(104,'dym',417,1),(105,'fenn',417,1),(106,'fum',417,1),(107,'fun',417,1),(108,'ghon',417,1),(109,'ghun',417,1),(110,'grom',417,1),(111,'grym',417,1),(112,'hom',417,1),(113,'hon',417,1),(114,'hun',417,1),(115,'jhom',417,1),(116,'kun',417,1),(117,'lum',417,1),(118,'mmon',417,1),(119,'mon',417,1),(120,'myn',417,1),(121,'nam',417,1),(122,'nem',417,1),(123,'nhym',417,1),(124,'nom',417,1),(125,'num',417,1),(126,'phom',417,1),(127,'roon',417,1),(128,'rym',417,1),(129,'shon',417,1),(130,'thun',417,1),(131,'tom',417,1),(132,'zhem',417,1),(133,'zhum',417,1),(134,'zun',417,1),(135,'Bar',1860,0),(136,'Bel',1860,0),(137,'Char',1860,0),(138,'Grak\'',1860,0),(139,'Graz\'',1860,0),(140,'Grim',1860,0),(141,'Hath',1860,0),(142,'Hel',1860,0),(143,'Hok',1860,0),(144,'Huk',1860,0),(145,'Jhaz',1860,0),(146,'Jhom',1860,0),(147,'Juk\'',1860,0),(148,'Kal\'',1860,0),(149,'Klath',1860,0),(150,'Kon',1860,0),(151,'Krag',1860,0),(152,'Krak',1860,0),(153,'Mak',1860,0),(154,'Mezz',1860,0),(155,'Orm',1860,0),(156,'Phan',1860,0),(157,'Sar',1860,0),(158,'Tang',1860,0),(159,'Than',1860,0),(160,'Thog',1860,0),(161,'Thok',1860,0),(162,'Thul',1860,0),(163,'Zag\'',1860,0),(164,'Zang',1860,0),(165,'Zhar\'',1860,0),(166,'kath',1860,1),(167,'doc',1860,1),(168,'dok',1860,1),(169,'gak',1860,1),(170,'garth',1860,1),(171,'gore',1860,1),(172,'gorg',1860,1),(173,'grave',1860,1),(174,'gron',1860,1),(175,'juk',1860,1),(176,'krast',1860,1),(177,'kresh',1860,1),(178,'krit',1860,1),(179,'los',1860,1),(180,'mon',1860,1),(181,'mos',1860,1),(182,'moth',1860,1),(183,'nagma',1860,1),(184,'nak',1860,1),(185,'nar',1860,1),(186,'nos',1860,1),(187,'nuz',1860,1),(188,'phog',1860,1),(189,'rath',1860,1),(190,'tast',1860,1),(191,'taz',1860,1),(192,'thak',1860,1),(193,'thang',1860,1),(194,'thyk',1860,1),(195,'vhug',1860,1),(196,'zazt',1860,1),(197,'Ael',1863,0),(198,'Aez',1863,0),(199,'Ang',1863,0),(200,'Ban',1863,0),(201,'Bet',1863,0),(202,'Bro',1863,0),(203,'Bry',1863,0),(204,'Cat',1863,0),(205,'Dir',1863,0),(206,'Dis',1863,0),(207,'Dom',1863,0),(208,'Drus',1863,0),(209,'Fie',1863,0),(210,'Fier',1863,0),(211,'Gly',1863,0),(212,'Hel',1863,0),(213,'Hes',1863,0),(214,'Kal',1863,0),(215,'Lyn',1863,0),(216,'Mir',1863,0),(217,'Nim',1863,0),(218,'Sar',1863,0),(219,'Sel',1863,0),(220,'Vil',1863,0),(221,'Zah',1863,0),(222,'aith',1863,1),(223,'anda',1863,1),(224,'antia',1863,1),(225,'evere',1863,1),(226,'lia',1863,1),(227,'lissa',1863,1),(228,'neri',1863,1),(229,'neth',1863,1),(230,'nia',1863,1),(231,'nlissa',1863,1),(232,'nora',1863,1),(233,'nva',1863,1),(234,'nys',1863,1),(235,'ola',1863,1),(236,'ona',1863,1),(237,'ora',1863,1),(238,'rah',1863,1),(239,'riana',1863,1),(240,'riel',1863,1),(241,'rona',1863,1),(242,'tai',1863,1),(243,'tevere',1863,1),(244,'thea',1863,1),(245,'vina',1863,1),(246,'wena',1863,1),(247,'wyn',1863,1),(248,'xia',1863,1),(249,'yla',1863,1),(250,'yssa',1863,1),(251,'Flaa',17252,0),(252,'Haa',17252,0),(253,'Jhuu',17252,0),(254,'Shaa',17252,0),(255,'Thoo',17252,0),(256,'dhun',17252,1),(257,'ghun',17252,1),(258,'roon',17252,1),(259,'thun',17252,1),(260,'tom',17252,1);
/*!40000 ALTER TABLE `pet_name_generation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickpocketing_loot_template`
--

DROP TABLE IF EXISTS `pickpocketing_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pickpocketing_loot_template`
--

LOCK TABLES `pickpocketing_loot_template` WRITE;
/*!40000 ALTER TABLE `pickpocketing_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickpocketing_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_classlevelstats`
--

DROP TABLE IF EXISTS `player_classlevelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_classlevelstats` (
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `basehp` smallint(5) unsigned NOT NULL,
  `basemana` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player_classlevelstats`
--

LOCK TABLES `player_classlevelstats` WRITE;
/*!40000 ALTER TABLE `player_classlevelstats` DISABLE KEYS */;
INSERT INTO `player_classlevelstats` VALUES (1,1,20,0),(1,2,29,0),(1,3,38,0),(1,4,47,0),(1,5,56,0),(1,6,65,0),(1,7,74,0),(1,8,83,0),(1,9,92,0),(1,10,101,0),(1,11,100,0),(1,12,109,0),(1,13,118,0),(1,14,128,0),(1,15,139,0),(1,16,151,0),(1,17,154,0),(1,18,168,0),(1,19,183,0),(1,20,199,0),(1,21,206,0),(1,22,224,0),(1,23,243,0),(1,24,253,0),(1,25,274,0),(1,26,296,0),(1,27,309,0),(1,28,333,0),(1,29,348,0),(1,30,374,0),(1,31,401,0),(1,32,419,0),(1,33,448,0),(1,34,468,0),(1,35,499,0),(1,36,521,0),(1,37,545,0),(1,38,581,0),(1,39,609,0),(1,40,649,0),(1,41,681,0),(1,42,715,0),(1,43,761,0),(1,44,799,0),(1,45,839,0),(1,46,881,0),(1,47,935,0),(1,48,981,0),(1,49,1029,0),(1,50,1079,0),(1,51,1131,0),(1,52,1185,0),(1,53,1241,0),(1,54,1299,0),(1,55,1359,0),(1,56,1421,0),(1,57,1485,0),(1,58,1551,0),(1,59,1619,0),(1,60,1689,0),(1,61,1902,0),(1,62,2129,0),(1,63,2357,0),(1,64,2612,0),(1,65,2883,0),(1,66,3169,0),(1,67,3455,0),(1,68,3774,0),(1,69,4109,0),(1,70,4444,0),(1,71,4720,0),(1,72,5013,0),(1,73,5325,0),(1,74,5656,0),(1,75,6008,0),(1,76,6381,0),(1,77,6778,0),(1,78,7198,0),(1,79,7646,0),(1,80,8121,0),(2,1,28,60),(2,2,36,78),(2,3,44,98),(2,4,52,104),(2,5,60,111),(2,6,68,134),(2,7,76,143),(2,8,84,153),(2,9,92,179),(2,10,100,192),(2,11,108,205),(2,12,116,219),(2,13,124,249),(2,14,132,265),(2,15,131,282),(2,16,141,315),(2,17,152,334),(2,18,164,354),(2,19,177,390),(2,20,191,412),(2,21,206,435),(2,22,222,459),(2,23,239,499),(2,24,247,525),(2,25,266,552),(2,26,286,579),(2,27,307,621),(2,28,329,648),(2,29,342,675),(2,30,366,702),(2,31,391,729),(2,32,407,756),(2,33,434,798),(2,34,462,825),(2,35,481,852),(2,36,511,879),(2,37,542,906),(2,38,564,933),(2,39,597,960),(2,40,621,987),(2,41,656,1014),(2,42,682,1041),(2,43,719,1068),(2,44,747,1110),(2,45,786,1137),(2,46,816,1164),(2,47,857,1176),(2,48,889,1203),(2,49,922,1230),(2,50,966,1257),(2,51,1001,1284),(2,52,1037,1311),(2,53,1084,1338),(2,54,1122,1365),(2,55,1161,1392),(2,56,1201,1419),(2,57,1252,1446),(2,58,1294,1458),(2,59,1337,1485),(2,60,1381,1512),(2,61,1540,1656),(2,62,1708,1800),(2,63,1884,1944),(2,64,2068,2088),(2,65,2262,2232),(2,66,2466,2377),(2,67,2679,2521),(2,68,2901,2665),(2,69,3134,2809),(2,70,3377,2953),(2,71,3629,3097),(2,72,3900,3241),(2,73,4191,3385),(2,74,4503,3529),(2,75,4839,3673),(2,76,5200,3817),(2,77,5588,3962),(2,78,6005,4106),(2,79,6453,4250),(2,80,6934,4394),(3,1,46,65),(3,2,53,70),(3,3,60,76),(3,4,67,98),(3,5,74,106),(3,6,81,130),(3,7,88,140),(3,8,95,166),(3,9,102,193),(3,10,109,206),(3,11,116,235),(3,12,123,250),(3,13,130,266),(3,14,138,298),(3,15,147,316),(3,16,157,350),(3,17,168,370),(3,18,180,391),(3,19,193,428),(3,20,207,451),(3,21,222,475),(3,22,238,515),(3,23,255,541),(3,24,273,568),(3,25,292,611),(3,26,312,640),(3,27,333,670),(3,28,355,715),(3,29,378,745),(3,30,402,775),(3,31,417,805),(3,32,443,850),(3,33,470,880),(3,34,498,910),(3,35,527,940),(3,36,547,970),(3,37,578,1015),(3,38,610,1045),(3,39,643,1075),(3,40,667,1105),(3,41,702,1135),(3,42,738,1180),(3,43,775,1210),(3,44,803,1240),(3,45,842,1270),(3,46,872,1300),(3,47,913,1330),(3,48,955,1360),(3,49,994,1390),(3,50,1047,1420),(3,51,1067,1450),(3,52,1113,1480),(3,53,1150,1510),(3,54,1198,1540),(3,55,1237,1570),(3,56,1287,1600),(3,57,1328,1630),(3,58,1370,1660),(3,59,1423,1690),(3,60,1467,1720),(3,61,1633,1886),(3,62,1819,2053),(3,63,2003,2219),(3,64,2195,2385),(3,65,2397,2552),(3,66,2623,2718),(3,67,2844,2884),(3,68,3075,3050),(3,69,3316,3217),(3,70,3568,3383),(3,71,3834,3549),(3,72,4120,3716),(3,73,4427,3882),(3,74,4757,4048),(3,75,5112,4215),(3,76,5493,4381),(3,77,5903,4547),(3,78,6343,4713),(3,79,6816,4880),(3,80,7324,5046),(4,1,25,0),(4,2,32,0),(4,3,49,0),(4,4,56,0),(4,5,63,0),(4,6,70,0),(4,7,87,0),(4,8,94,0),(4,9,101,0),(4,10,118,0),(4,11,125,0),(4,12,142,0),(4,13,149,0),(4,14,156,0),(4,15,173,0),(4,16,181,0),(4,17,190,0),(4,18,200,0),(4,19,221,0),(4,20,233,0),(4,21,246,0),(4,22,260,0),(4,23,275,0),(4,24,301,0),(4,25,318,0),(4,26,336,0),(4,27,355,0),(4,28,375,0),(4,29,396,0),(4,30,428,0),(4,31,451,0),(4,32,475,0),(4,33,500,0),(4,34,526,0),(4,35,553,0),(4,36,581,0),(4,37,610,0),(4,38,640,0),(4,39,671,0),(4,40,703,0),(4,41,736,0),(4,42,770,0),(4,43,805,0),(4,44,841,0),(4,45,878,0),(4,46,916,0),(4,47,955,0),(4,48,995,0),(4,49,1026,0),(4,50,1068,0),(4,51,1111,0),(4,52,1155,0),(4,53,1200,0),(4,54,1246,0),(4,55,1283,0),(4,56,1331,0),(4,57,1380,0),(4,58,1430,0),(4,59,1471,0),(4,60,1523,0),(4,61,1702,0),(4,62,1879,0),(4,63,2077,0),(4,64,2285,0),(4,65,2489,0),(4,66,2717,0),(4,67,2941,0),(4,68,3190,0),(4,69,3450,0),(4,70,3704,0),(4,71,3980,0),(4,72,4277,0),(4,73,4596,0),(4,74,4939,0),(4,75,5307,0),(4,76,5703,0),(4,77,6128,0),(4,78,6585,0),(4,79,7076,0),(4,80,7604,0),(5,1,52,73),(5,2,57,76),(5,3,72,95),(5,4,77,114),(5,5,92,133),(5,6,97,152),(5,7,112,171),(5,8,117,190),(5,9,132,209),(5,10,137,212),(5,11,142,215),(5,12,157,234),(5,13,172,254),(5,14,177,260),(5,15,192,282),(5,16,197,305),(5,17,212,329),(5,18,227,339),(5,19,232,365),(5,20,247,377),(5,21,252,405),(5,22,268,434),(5,23,275,449),(5,24,293,480),(5,25,302,497),(5,26,322,530),(5,27,343,549),(5,28,355,584),(5,29,378,605),(5,30,392,627),(5,31,417,665),(5,32,433,689),(5,33,460,728),(5,34,478,752),(5,35,507,776),(5,36,527,800),(5,37,548,839),(5,38,580,863),(5,39,603,887),(5,40,637,911),(5,41,662,950),(5,42,698,974),(5,43,725,998),(5,44,763,1022),(5,45,792,1046),(5,46,822,1070),(5,47,863,1094),(5,48,895,1118),(5,49,928,1142),(5,50,972,1166),(5,51,1007,1190),(5,52,1053,1214),(5,53,1090,1238),(5,54,1128,1262),(5,55,1177,1271),(5,56,1217,1295),(5,57,1258,1319),(5,58,1300,1343),(5,59,1353,1352),(5,60,1397,1376),(5,61,1557,1500),(5,62,1738,1625),(5,63,1916,1749),(5,64,2101,1873),(5,65,2295,1998),(5,66,2495,2122),(5,67,2719,2247),(5,68,2936,2371),(5,69,3160,2495),(5,70,3391,2620),(5,71,3644,2744),(5,72,3916,2868),(5,73,4208,2993),(5,74,4522,3117),(5,75,4859,3242),(5,76,5221,3366),(5,77,5610,3490),(5,78,6028,3615),(5,79,6477,3739),(5,80,6960,3863),(6,1,22,0),(6,2,27,0),(6,3,32,0),(6,4,37,0),(6,5,42,0),(6,6,47,0),(6,7,52,0),(6,8,58,0),(6,9,64,0),(6,10,70,0),(6,11,77,0),(6,12,84,0),(6,13,92,0),(6,14,100,0),(6,15,117,0),(6,16,127,0),(6,17,138,0),(6,18,150,0),(6,19,163,0),(6,20,177,0),(6,21,192,0),(6,22,208,0),(6,23,225,0),(6,24,239,0),(6,25,258,0),(6,26,278,0),(6,27,299,0),(6,28,321,0),(6,29,344,0),(6,30,368,0),(6,31,393,0),(6,32,419,0),(6,33,446,0),(6,34,474,0),(6,35,503,0),(6,36,533,0),(6,37,564,0),(6,38,596,0),(6,39,629,0),(6,40,698,0),(6,41,698,0),(6,42,734,0),(6,43,771,0),(6,44,809,0),(6,45,849,0),(6,46,891,0),(6,47,935,0),(6,48,981,0),(6,49,1029,0),(6,50,1079,0),(6,51,1131,0),(6,52,1185,0),(6,53,1241,0),(6,54,1299,0),(6,55,1359,0),(6,56,1421,0),(6,57,1485,0),(6,58,1551,0),(6,59,1619,0),(6,60,1689,0),(6,61,1902,0),(6,62,2129,0),(6,63,2357,0),(6,64,2612,0),(6,65,2883,0),(6,66,3169,0),(6,67,3455,0),(6,68,3774,0),(6,69,4109,0),(6,70,4444,0),(6,71,4720,0),(6,72,5013,0),(6,73,5325,0),(6,74,5656,0),(6,75,6008,0),(6,76,6381,0),(6,77,6778,0),(6,78,7199,0),(6,79,7646,0),(6,80,8121,0),(7,1,37,85),(7,2,44,91),(7,3,51,98),(7,4,58,106),(7,5,65,115),(7,6,72,125),(7,7,79,136),(7,8,86,148),(7,9,93,161),(7,10,100,175),(7,11,107,190),(7,12,114,206),(7,13,121,223),(7,14,128,241),(7,15,135,260),(7,16,142,280),(7,17,150,301),(7,18,159,323),(7,19,169,346),(7,20,180,370),(7,21,192,395),(7,22,205,421),(7,23,219,448),(7,24,234,476),(7,25,240,505),(7,26,257,535),(7,27,275,566),(7,28,294,598),(7,29,314,631),(7,30,335,665),(7,31,347,699),(7,32,370,733),(7,33,394,767),(7,34,419,786),(7,35,435,820),(7,36,462,854),(7,37,490,888),(7,38,509,922),(7,39,539,941),(7,40,570,975),(7,41,592,1009),(7,42,625,1028),(7,43,649,1062),(7,44,684,1096),(7,45,710,1115),(7,46,747,1149),(7,47,775,1183),(7,48,814,1202),(7,49,844,1236),(7,50,885,1255),(7,51,917,1289),(7,52,960,1323),(7,53,994,1342),(7,54,1029,1376),(7,55,1075,1395),(7,56,1112,1414),(7,57,1150,1448),(7,58,1199,1467),(7,59,1239,1501),(7,60,1330,1520),(7,61,1428,1664),(7,62,1583,1808),(7,63,1760,1951),(7,64,1932,2095),(7,65,2114,2239),(7,66,2304,2383),(7,67,2504,2527),(7,68,2713,2670),(7,69,2931,2814),(7,70,3159,2958),(7,71,3395,3102),(7,72,3648,3246),(7,73,3920,3389),(7,74,4212,3533),(7,75,4526,3677),(7,76,4863,3821),(7,77,5226,3965),(7,78,5616,4108),(7,79,6035,4252),(7,80,6485,4396),(8,1,32,100),(8,2,47,110),(8,3,52,106),(8,4,67,118),(8,5,82,131),(8,6,97,130),(8,7,102,145),(8,8,117,146),(8,9,132,163),(8,10,137,196),(8,11,152,215),(8,12,167,220),(8,13,172,241),(8,14,187,263),(8,15,202,271),(8,16,207,295),(8,17,222,305),(8,18,237,331),(8,19,242,343),(8,20,257,371),(8,21,272,385),(8,22,277,415),(8,23,292,431),(8,24,298,463),(8,25,315,481),(8,26,333,515),(8,27,342,535),(8,28,362,556),(8,29,373,592),(8,30,395,613),(8,31,418,634),(8,32,432,670),(8,33,457,691),(8,34,473,712),(8,35,500,733),(8,36,518,754),(8,37,547,790),(8,38,577,811),(8,39,598,832),(8,40,630,853),(8,41,653,874),(8,42,687,895),(8,43,712,916),(8,44,748,937),(8,45,775,958),(8,46,813,979),(8,47,842,1000),(8,48,882,1021),(8,49,913,1042),(8,50,955,1048),(8,51,988,1069),(8,52,1032,1090),(8,53,1067,1111),(8,54,1103,1117),(8,55,1150,1138),(8,56,1188,1159),(8,57,1237,1165),(8,58,1277,1186),(8,59,1328,1192),(8,60,1370,1213),(8,61,1526,1316),(8,62,1702,1419),(8,63,1875,1521),(8,64,2070,1624),(8,65,2261,1727),(8,66,2461,1830),(8,67,2686,1932),(8,68,2906,2035),(8,69,3136,2138),(8,70,3393,2241),(8,71,3646,2343),(8,72,3918,2446),(8,73,4210,2549),(8,74,4524,2652),(8,75,4861,2754),(8,76,5223,2857),(8,77,5612,2960),(8,78,6030,3063),(8,79,6480,3165),(8,80,6963,3268),(9,1,23,90),(9,2,28,98),(9,3,43,107),(9,4,48,102),(9,5,63,113),(9,6,68,126),(9,7,83,144),(9,8,88,162),(9,9,93,180),(9,10,108,198),(9,11,123,200),(9,12,128,218),(9,13,143,237),(9,14,148,257),(9,15,153,278),(9,16,168,300),(9,17,173,308),(9,18,189,332),(9,19,196,357),(9,20,204,383),(9,21,223,395),(9,22,233,423),(9,23,244,452),(9,24,266,467),(9,25,279,498),(9,26,293,530),(9,27,318,548),(9,28,334,582),(9,29,351,602),(9,30,379,638),(9,31,398,674),(9,32,418,695),(9,33,439,731),(9,34,471,752),(9,35,494,788),(9,36,518,809),(9,37,543,830),(9,38,569,866),(9,39,606,887),(9,40,634,923),(9,41,663,944),(9,42,693,965),(9,43,724,1001),(9,44,756,1022),(9,45,799,1043),(9,46,832,1064),(9,47,868,1100),(9,48,904,1121),(9,49,941,1142),(9,50,979,1163),(9,51,1018,1184),(9,52,1058,1205),(9,53,1099,1226),(9,54,1141,1247),(9,55,1184,1268),(9,56,1228,1289),(9,57,1273,1310),(9,58,1319,1331),(9,59,1366,1352),(9,60,1414,1373),(9,61,1580,1497),(9,62,1755,1621),(9,63,1939,1745),(9,64,2133,1870),(9,65,2323,1994),(9,66,2535,2118),(9,67,2758,2242),(9,68,2991,2366),(9,69,3235,2490),(9,70,3490,2615),(9,71,3750,2739),(9,72,4025,2863),(9,73,4330,2987),(9,74,4646,3111),(9,75,4997,3235),(9,76,5373,3360),(9,77,5774,3483),(9,78,6207,3608),(9,79,6667,3732),(9,80,7136,3856),(11,1,44,60),(11,2,51,66),(11,3,58,73),(11,4,75,81),(11,5,82,90),(11,6,89,100),(11,7,106,111),(11,8,113,123),(11,9,120,136),(11,10,137,150),(11,11,144,165),(11,12,151,182),(11,13,168,200),(11,14,175,219),(11,15,182,239),(11,16,199,260),(11,17,206,282),(11,18,214,305),(11,19,233,329),(11,20,243,354),(11,21,254,380),(11,22,266,392),(11,23,289,420),(11,24,303,449),(11,25,318,479),(11,26,334,509),(11,27,361,524),(11,28,379,554),(11,29,398,584),(11,30,418,614),(11,31,439,629),(11,32,461,659),(11,33,494,689),(11,34,518,704),(11,35,543,734),(11,36,569,749),(11,37,596,779),(11,38,624,809),(11,39,653,824),(11,40,683,854),(11,41,714,869),(11,42,746,899),(11,43,779,914),(11,44,823,944),(11,45,858,959),(11,46,894,989),(11,47,921,1004),(11,48,959,1019),(11,49,998,1049),(11,50,1038,1064),(11,51,1079,1079),(11,52,1121,1109),(11,53,1164,1124),(11,54,1208,1139),(11,55,1253,1154),(11,56,1299,1169),(11,57,1346,1199),(11,58,1384,1214),(11,59,1433,1229),(11,60,1483,1244),(11,61,1657,1357),(11,62,1840,1469),(11,63,2020,1582),(11,64,2222,1694),(11,65,2433,1807),(11,66,2640,1919),(11,67,2872,2032),(11,68,3114,2145),(11,69,3351,2257),(11,70,3614,2370),(11,71,3883,2482),(11,72,4172,2595),(11,73,4483,2708),(11,74,4817,2820),(11,75,5176,2933),(11,76,5562,3045),(11,77,5977,3158),(11,78,6423,3270),(11,79,6902,3383),(11,80,7417,3496);
/*!40000 ALTER TABLE `player_classlevelstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_levelstats`
--

DROP TABLE IF EXISTS `player_levelstats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player_levelstats`
--

LOCK TABLES `player_levelstats` WRITE;
/*!40000 ALTER TABLE `player_levelstats` DISABLE KEYS */;
INSERT INTO `player_levelstats` VALUES (1,1,1,23,20,22,20,20),(1,1,2,24,21,23,20,20),(1,1,3,26,22,24,20,21),(1,1,4,27,22,26,20,21),(1,1,5,28,23,27,20,21),(1,1,6,30,24,28,20,21),(1,1,7,31,25,29,21,22),(1,1,8,32,26,30,21,22),(1,1,9,34,26,32,21,22),(1,1,10,35,27,33,21,23),(1,1,11,36,28,34,21,23),(1,1,12,38,29,35,21,23),(1,1,13,39,30,37,21,24),(1,1,14,41,31,38,21,24),(1,1,15,42,32,39,21,24),(1,1,16,44,33,41,21,25),(1,1,17,45,34,42,22,25),(1,1,18,47,34,43,22,25),(1,1,19,48,35,45,22,26),(1,1,20,50,36,46,22,26),(1,1,21,51,37,48,22,26),(1,1,22,53,38,49,22,27),(1,1,23,54,39,51,22,27),(1,1,24,56,40,52,23,28),(1,1,25,58,41,53,23,28),(1,1,26,59,42,55,23,28),(1,1,27,61,43,56,23,29),(1,1,28,63,44,58,23,29),(1,1,29,64,45,59,23,30),(1,1,30,66,46,61,24,30),(1,1,31,68,47,62,24,30),(1,1,32,69,48,64,24,31),(1,1,33,71,50,66,24,31),(1,1,34,73,51,67,24,32),(1,1,35,74,52,69,24,32),(1,1,36,76,53,70,25,33),(1,1,37,78,54,72,25,33),(1,1,38,80,55,74,25,34),(1,1,39,82,56,75,25,34),(1,1,40,83,57,77,25,35),(1,1,41,85,58,79,26,35),(1,1,42,87,60,80,26,35),(1,1,43,89,61,82,26,36),(1,1,44,91,62,84,26,36),(1,1,45,93,63,85,26,37),(1,1,46,95,64,87,27,37),(1,1,47,97,66,89,27,38),(1,1,48,99,67,91,27,38),(1,1,49,101,68,93,27,39),(1,1,50,103,69,94,28,40),(1,1,51,105,71,96,28,40),(1,1,52,107,72,98,28,41),(1,1,53,109,73,100,28,41),(1,1,54,111,74,102,29,42),(1,1,55,113,76,103,29,42),(1,1,56,115,77,105,29,43),(1,1,57,117,78,107,29,43),(1,1,58,119,79,109,30,44),(1,1,59,121,81,111,30,44),(1,1,60,123,82,113,30,45),(1,1,61,125,83,115,30,46),(1,1,62,127,85,117,31,46),(1,1,63,129,86,119,31,47),(1,1,64,132,88,121,31,47),(1,1,65,134,89,123,32,48),(1,1,66,136,90,125,32,49),(1,1,67,138,92,127,32,49),(1,1,68,140,93,129,32,50),(1,1,69,143,95,131,33,50),(1,1,70,145,96,133,33,51),(1,1,71,148,97,140,33,53),(1,1,72,156,99,143,33,54),(1,1,73,162,101,148,33,55),(1,1,74,162,102,148,34,55),(1,1,75,165,104,150,34,56),(1,1,76,171,106,156,34,57),(1,1,77,171,108,157,35,58),(1,1,78,174,109,159,35,58),(1,1,79,181,111,165,35,59),(1,1,80,184,113,168,36,60),(1,2,1,22,20,22,20,21),(1,2,2,23,21,23,21,22),(1,2,3,24,21,24,21,22),(1,2,4,25,22,25,22,23),(1,2,5,26,22,26,23,24),(1,2,6,28,23,27,23,25),(1,2,7,29,24,28,24,25),(1,2,8,30,24,29,25,26),(1,2,9,31,25,30,25,27),(1,2,10,32,25,32,26,27),(1,2,11,33,26,33,27,28),(1,2,12,35,27,34,27,29),(1,2,13,36,27,35,28,30),(1,2,14,37,28,36,29,31),(1,2,15,38,29,37,30,31),(1,2,16,40,29,38,30,32),(1,2,17,41,30,40,31,33),(1,2,18,42,31,41,32,34),(1,2,19,43,31,42,33,35),(1,2,20,45,32,43,33,35),(1,2,21,46,33,45,34,36),(1,2,22,47,33,46,35,37),(1,2,23,49,34,47,36,38),(1,2,24,50,35,48,37,39),(1,2,25,51,36,50,37,40),(1,2,26,53,36,51,38,41),(1,2,27,54,37,52,39,42),(1,2,28,56,38,54,40,43),(1,2,29,57,39,55,41,43),(1,2,30,58,39,56,42,44),(1,2,31,60,40,58,43,45),(1,2,32,61,41,59,43,46),(1,2,33,63,42,60,44,47),(1,2,34,64,43,62,45,48),(1,2,35,66,44,63,46,49),(1,2,36,67,44,65,47,50),(1,2,37,69,45,66,48,51),(1,2,38,70,46,67,49,52),(1,2,39,72,47,69,50,53),(1,2,40,73,48,70,51,54),(1,2,41,75,49,72,52,55),(1,2,42,77,49,73,53,56),(1,2,43,78,50,75,54,57),(1,2,44,80,51,76,55,58),(1,2,45,81,52,78,56,59),(1,2,46,83,53,79,57,61),(1,2,47,85,54,81,58,62),(1,2,48,86,55,83,59,63),(1,2,49,88,56,84,60,64),(1,2,50,90,57,86,61,65),(1,2,51,91,58,87,62,66),(1,2,52,93,59,89,63,67),(1,2,53,95,60,91,64,68),(1,2,54,97,61,92,65,69),(1,2,55,98,61,94,66,71),(1,2,56,100,62,95,67,72),(1,2,57,102,63,97,68,73),(1,2,58,104,64,99,69,74),(1,2,59,105,65,101,70,75),(1,2,60,107,66,102,71,77),(1,2,61,109,67,104,73,78),(1,2,62,111,69,106,74,79),(1,2,63,113,70,107,75,80),(1,2,64,115,71,109,76,81),(1,2,65,116,72,111,77,83),(1,2,66,118,73,113,78,84),(1,2,67,120,74,115,79,85),(1,2,68,122,75,116,81,86),(1,2,69,124,76,118,82,88),(1,2,70,126,77,120,83,89),(1,2,71,148,78,122,84,92),(1,2,72,150,79,125,86,94),(1,2,73,152,80,127,87,96),(1,2,74,156,82,129,89,97),(1,2,75,158,83,131,90,99),(1,2,76,162,84,134,92,100),(1,2,77,164,86,136,93,103),(1,2,78,167,87,138,95,105),(1,2,79,170,88,153,96,106),(1,2,80,173,90,160,98,108),(1,4,1,21,23,21,20,20),(1,4,2,22,24,22,20,20),(1,4,3,23,26,22,20,21),(1,4,4,23,27,23,20,21),(1,4,5,24,29,24,21,21),(1,4,6,25,30,25,21,22),(1,4,7,26,32,25,21,22),(1,4,8,26,33,26,21,23),(1,4,9,27,35,27,21,23),(1,4,10,28,36,27,21,23),(1,4,11,29,38,28,22,24),(1,4,12,30,39,29,22,24),(1,4,13,31,41,30,22,25),(1,4,14,31,43,31,22,25),(1,4,15,32,44,31,22,25),(1,4,16,33,46,32,23,26),(1,4,17,34,48,33,23,26),(1,4,18,35,49,34,23,27),(1,4,19,36,51,35,23,27),(1,4,20,37,53,35,23,28),(1,4,21,38,54,36,24,28),(1,4,22,39,56,37,24,29),(1,4,23,40,58,38,24,29),(1,4,24,41,60,39,24,30),(1,4,25,42,61,40,25,30),(1,4,26,43,63,41,25,31),(1,4,27,44,65,42,25,31),(1,4,28,45,67,43,25,32),(1,4,29,46,69,43,25,32),(1,4,30,47,71,44,26,33),(1,4,31,48,72,45,26,33),(1,4,32,49,74,46,26,34),(1,4,33,50,76,47,27,34),(1,4,34,51,78,48,27,35),(1,4,35,52,80,49,27,35),(1,4,36,53,82,50,27,36),(1,4,37,54,84,51,28,36),(1,4,38,55,86,52,28,37),(1,4,39,56,88,53,28,38),(1,4,40,57,90,54,28,38),(1,4,41,58,92,55,29,39),(1,4,42,60,94,56,29,39),(1,4,43,61,96,57,29,40),(1,4,44,62,98,58,30,40),(1,4,45,63,100,59,30,41),(1,4,46,64,103,61,30,42),(1,4,47,65,105,62,31,42),(1,4,48,66,107,63,31,43),(1,4,49,68,109,64,31,44),(1,4,50,69,111,65,32,44),(1,4,51,70,113,66,32,45),(1,4,52,71,116,67,32,45),(1,4,53,73,118,68,33,46),(1,4,54,74,120,69,33,47),(1,4,55,75,122,71,33,47),(1,4,56,76,125,72,34,48),(1,4,57,78,127,73,34,49),(1,4,58,79,129,74,34,49),(1,4,59,80,131,75,35,50),(1,4,60,81,134,77,35,51),(1,4,61,83,136,78,35,51),(1,4,62,84,138,79,36,52),(1,4,63,85,141,80,36,53),(1,4,64,87,143,81,37,54),(1,4,65,88,146,83,37,54),(1,4,66,89,148,84,37,55),(1,4,67,91,151,85,38,56),(1,4,68,92,153,86,38,57),(1,4,69,94,156,88,39,57),(1,4,70,95,158,89,39,58),(1,4,71,97,161,90,39,60),(1,4,72,99,164,92,40,60),(1,4,73,100,167,94,40,61),(1,4,74,102,170,95,41,62),(1,4,75,104,173,97,41,63),(1,4,76,105,176,98,41,64),(1,4,77,107,179,100,42,65),(1,4,78,109,183,106,42,66),(1,4,79,111,186,107,43,67),(1,4,80,113,189,109,43,69),(1,5,1,20,20,20,22,23),(1,5,2,20,20,20,23,24),(1,5,3,20,20,21,25,26),(1,5,4,20,21,21,26,27),(1,5,5,21,21,21,27,28),(1,5,6,21,21,22,29,30),(1,5,7,21,21,22,30,31),(1,5,8,21,22,23,31,33),(1,5,9,21,22,23,33,34),(1,5,10,21,22,23,34,36),(1,5,11,22,22,24,36,37),(1,5,12,22,23,24,37,39),(1,5,13,22,23,25,38,40),(1,5,14,22,23,25,40,42),(1,5,15,22,23,25,41,43),(1,5,16,23,24,26,43,45),(1,5,17,23,24,26,44,46),(1,5,18,23,24,27,46,48),(1,5,19,23,24,27,47,49),(1,5,20,23,25,28,49,51),(1,5,21,24,25,28,51,53),(1,5,22,24,25,29,52,54),(1,5,23,24,26,29,54,56),(1,5,24,24,26,30,55,58),(1,5,25,25,26,30,57,59),(1,5,26,25,27,31,59,61),(1,5,27,25,27,31,60,63),(1,5,28,25,27,32,62,65),(1,5,29,25,28,32,64,66),(1,5,30,26,28,33,65,68),(1,5,31,26,28,33,67,70),(1,5,32,26,29,34,69,72),(1,5,33,27,29,34,70,73),(1,5,34,27,29,35,72,75),(1,5,35,27,30,35,74,77),(1,5,36,27,30,36,76,79),(1,5,37,28,30,36,78,81),(1,5,38,28,31,37,79,83),(1,5,39,28,31,38,81,85),(1,5,40,28,31,38,83,87),(1,5,41,29,32,39,85,88),(1,5,42,29,32,39,87,90),(1,5,43,29,33,40,89,92),(1,5,44,30,33,40,91,94),(1,5,45,30,33,41,92,96),(1,5,46,30,34,42,94,98),(1,5,47,31,34,42,96,100),(1,5,48,31,35,43,98,102),(1,5,49,31,35,44,100,104),(1,5,50,32,36,44,102,106),(1,5,51,32,36,45,104,109),(1,5,52,32,36,45,106,111),(1,5,53,33,37,46,108,113),(1,5,54,33,37,47,110,115),(1,5,55,33,38,47,112,117),(1,5,56,34,38,48,114,119),(1,5,57,34,39,49,117,121),(1,5,58,34,39,49,119,124),(1,5,59,35,40,50,121,126),(1,5,60,35,40,51,123,128),(1,5,61,35,41,51,125,130),(1,5,62,36,41,52,127,132),(1,5,63,36,41,53,129,135),(1,5,64,37,42,54,132,137),(1,5,65,37,42,54,134,139),(1,5,66,37,43,55,136,142),(1,5,67,38,43,56,138,144),(1,5,68,38,44,57,140,146),(1,5,69,39,44,57,143,149),(1,5,70,39,45,58,145,151),(1,5,71,39,46,59,148,158),(1,5,72,40,46,59,151,161),(1,5,73,40,47,60,154,164),(1,5,74,41,47,61,156,167),(1,5,75,41,48,62,159,170),(1,5,76,41,49,63,162,174),(1,5,77,42,49,64,165,177),(1,5,78,42,50,65,168,180),(1,5,79,43,50,66,171,183),(1,5,80,43,51,67,174,186),(1,6,1,23,20,22,20,20),(1,6,2,24,21,23,20,20),(1,6,3,26,22,24,20,21),(1,6,4,27,22,26,20,21),(1,6,5,28,23,27,20,21),(1,6,6,30,24,28,20,21),(1,6,7,31,25,29,21,22),(1,6,8,32,26,30,21,22),(1,6,9,34,26,32,21,22),(1,6,10,35,27,33,21,23),(1,6,11,36,28,34,21,23),(1,6,12,38,29,35,21,23),(1,6,13,39,30,37,21,24),(1,6,14,41,31,38,21,24),(1,6,15,42,32,39,21,24),(1,6,16,44,33,41,21,25),(1,6,17,45,34,42,22,25),(1,6,18,47,34,43,22,25),(1,6,19,48,35,45,22,26),(1,6,20,50,36,46,22,26),(1,6,21,51,37,48,22,26),(1,6,22,53,38,49,22,27),(1,6,23,54,39,51,22,27),(1,6,24,56,40,52,23,28),(1,6,25,58,41,53,23,28),(1,6,26,59,42,55,23,28),(1,6,27,61,43,56,23,29),(1,6,28,63,44,58,23,29),(1,6,29,64,45,59,23,30),(1,6,30,66,46,61,24,30),(1,6,31,68,47,62,24,30),(1,6,32,69,48,64,24,31),(1,6,33,71,50,66,24,31),(1,6,34,73,51,67,24,32),(1,6,35,74,52,69,24,32),(1,6,36,76,53,70,25,33),(1,6,37,78,54,72,25,33),(1,6,38,80,55,74,25,34),(1,6,39,82,56,75,25,34),(1,6,40,83,57,77,25,35),(1,6,41,85,58,79,26,35),(1,6,42,87,60,80,26,35),(1,6,43,89,61,82,26,36),(1,6,44,91,62,84,26,36),(1,6,45,93,63,85,26,37),(1,6,46,95,64,87,27,37),(1,6,47,97,66,89,27,38),(1,6,48,99,67,91,27,38),(1,6,49,101,68,93,27,39),(1,6,50,103,69,94,28,40),(1,6,51,105,71,96,28,40),(1,6,52,106,72,97,28,41),(1,6,53,107,72,98,28,41),(1,6,54,107,73,98,29,42),(1,6,55,108,73,99,29,43),(1,6,56,111,75,102,29,44),(1,6,57,113,76,104,29,44),(1,6,58,118,77,106,30,45),(1,6,59,118,79,108,30,45),(1,6,60,123,80,110,30,46),(1,6,61,125,81,112,30,47),(1,6,62,128,83,114,30,47),(1,6,63,130,84,117,31,48),(1,6,64,130,86,119,31,48),(1,6,65,140,87,128,31,49),(1,6,66,143,89,131,31,50),(1,6,67,146,90,133,32,50),(1,6,68,148,92,135,32,51),(1,6,69,151,93,138,32,52),(1,6,70,154,95,140,32,52),(1,6,71,162,97,144,33,53),(1,6,72,164,98,146,33,54),(1,6,73,165,100,148,33,55),(1,6,74,166,102,151,33,55),(1,6,75,169,103,154,34,56),(1,6,76,172,105,157,34,57),(1,6,77,175,107,157,34,58),(1,6,78,176,108,157,34,58),(1,6,79,177,110,157,35,59),(1,6,80,180,112,160,35,60),(1,8,1,20,20,20,23,22),(1,8,2,20,20,20,24,23),(1,8,3,20,20,21,26,25),(1,8,4,20,20,21,27,26),(1,8,5,20,21,21,28,27),(1,8,6,20,21,21,30,29),(1,8,7,21,21,22,31,30),(1,8,8,21,21,22,33,31),(1,8,9,21,21,22,34,33),(1,8,10,21,21,23,36,34),(1,8,11,21,22,23,37,36),(1,8,12,21,22,23,39,37),(1,8,13,21,22,24,40,38),(1,8,14,21,22,24,42,40),(1,8,15,21,22,24,43,41),(1,8,16,21,23,25,45,43),(1,8,17,22,23,25,46,44),(1,8,18,22,23,25,48,46),(1,8,19,22,23,26,49,47),(1,8,20,22,23,26,51,49),(1,8,21,22,24,26,53,51),(1,8,22,22,24,27,54,52),(1,8,23,22,24,27,56,54),(1,8,24,23,24,28,58,55),(1,8,25,23,25,28,59,57),(1,8,26,23,25,28,61,59),(1,8,27,23,25,29,63,60),(1,8,28,23,25,29,65,62),(1,8,29,23,25,30,66,64),(1,8,30,24,26,30,68,65),(1,8,31,24,26,30,70,67),(1,8,32,24,26,31,72,69),(1,8,33,24,27,31,73,70),(1,8,34,24,27,32,75,72),(1,8,35,24,27,32,77,74),(1,8,36,25,27,33,79,76),(1,8,37,25,28,33,81,78),(1,8,38,25,28,34,83,79),(1,8,39,25,28,34,85,81),(1,8,40,25,28,35,87,83),(1,8,41,26,29,35,88,85),(1,8,42,26,29,35,90,87),(1,8,43,26,29,36,92,89),(1,8,44,26,30,36,94,91),(1,8,45,26,30,37,96,92),(1,8,46,27,30,37,98,94),(1,8,47,27,31,38,100,96),(1,8,48,27,31,38,102,98),(1,8,49,27,31,39,104,100),(1,8,50,28,32,40,106,102),(1,8,51,28,32,40,109,104),(1,8,52,28,32,41,111,106),(1,8,53,28,33,41,113,108),(1,8,54,29,33,42,115,110),(1,8,55,29,33,42,117,112),(1,8,56,29,34,43,119,114),(1,8,57,29,34,43,121,117),(1,8,58,30,34,44,124,119),(1,8,59,30,35,44,126,121),(1,8,60,30,35,45,128,123),(1,8,61,30,35,46,130,125),(1,8,62,31,36,46,132,127),(1,8,63,31,36,47,135,129),(1,8,64,31,37,47,137,132),(1,8,65,32,37,48,139,134),(1,8,66,32,37,49,142,136),(1,8,67,32,38,49,144,138),(1,8,68,32,38,50,146,140),(1,8,69,33,39,50,149,143),(1,8,70,33,39,51,151,145),(1,8,71,33,39,52,154,152),(1,8,72,33,40,53,160,155),(1,8,73,33,40,54,160,158),(1,8,74,34,41,54,163,160),(1,8,75,34,41,55,166,163),(1,8,76,34,41,56,169,166),(1,8,77,35,42,57,172,169),(1,8,78,35,42,57,175,173),(1,8,79,35,43,58,178,176),(1,8,80,36,43,59,181,179),(1,9,1,20,20,21,22,22),(1,9,2,20,20,22,23,23),(1,9,3,21,21,22,24,24),(1,9,4,21,21,23,26,25),(1,9,5,21,21,23,27,27),(1,9,6,21,22,24,28,28),(1,9,7,22,22,24,29,29),(1,9,8,22,23,25,30,30),(1,9,9,22,23,26,32,31),(1,9,10,23,23,26,33,33),(1,9,11,23,24,27,34,34),(1,9,12,23,24,27,35,35),(1,9,13,24,25,28,37,36),(1,9,14,24,25,29,38,38),(1,9,15,24,25,29,39,39),(1,9,16,25,26,30,41,40),(1,9,17,25,26,31,42,42),(1,9,18,25,27,31,43,43),(1,9,19,26,27,32,45,44),(1,9,20,26,28,33,46,46),(1,9,21,26,28,33,48,47),(1,9,22,27,29,34,49,49),(1,9,23,27,29,35,51,50),(1,9,24,28,30,35,52,51),(1,9,25,28,30,36,53,53),(1,9,26,28,31,37,55,54),(1,9,27,29,31,37,56,56),(1,9,28,29,32,38,58,57),(1,9,29,30,32,39,59,59),(1,9,30,30,33,40,61,60),(1,9,31,30,33,40,62,62),(1,9,32,31,34,41,64,63),(1,9,33,31,34,42,66,65),(1,9,34,32,35,43,67,66),(1,9,35,32,35,44,69,68),(1,9,36,33,36,44,70,69),(1,9,37,33,36,45,72,71),(1,9,38,34,37,46,74,73),(1,9,39,34,38,47,75,74),(1,9,40,35,38,48,77,76),(1,9,41,35,39,48,79,78),(1,9,42,35,39,49,80,79),(1,9,43,36,40,50,82,81),(1,9,44,36,40,51,84,83),(1,9,45,37,41,52,85,84),(1,9,46,37,42,53,87,86),(1,9,47,38,42,54,89,88),(1,9,48,38,43,55,91,89),(1,9,49,39,44,55,93,91),(1,9,50,40,44,56,94,93),(1,9,51,40,45,57,96,95),(1,9,52,41,45,58,98,97),(1,9,53,41,46,59,100,98),(1,9,54,42,47,60,102,100),(1,9,55,42,47,61,103,102),(1,9,56,43,48,62,105,104),(1,9,57,43,49,63,107,106),(1,9,58,44,49,64,109,108),(1,9,59,44,50,65,111,109),(1,9,60,45,51,66,113,111),(1,9,61,46,51,67,115,113),(1,9,62,46,52,68,117,115),(1,9,63,47,53,69,119,117),(1,9,64,47,54,70,121,119),(1,9,65,48,54,71,123,121),(1,9,66,49,55,72,125,123),(1,9,67,49,56,73,127,125),(1,9,68,50,57,74,129,127),(1,9,69,50,57,75,131,129),(1,9,70,51,58,76,133,131),(1,9,71,52,59,78,135,146),(1,9,72,53,59,79,138,148),(1,9,73,54,60,80,140,151),(1,9,74,54,61,89,143,154),(1,9,75,55,62,91,145,156),(1,9,76,56,63,92,148,159),(1,9,77,57,64,93,151,162),(1,9,78,57,65,95,153,165),(1,9,79,58,66,96,156,168),(1,9,80,59,67,97,159,170),(2,1,1,26,17,24,17,23),(2,1,2,27,18,25,17,23),(2,1,3,29,19,26,17,24),(2,1,4,30,19,27,17,24),(2,1,5,31,20,29,17,24),(2,1,6,32,21,30,17,24),(2,1,7,34,22,31,18,25),(2,1,8,35,23,32,18,25),(2,1,9,37,24,34,18,25),(2,1,10,38,24,35,18,26),(2,1,11,39,25,36,18,26),(2,1,12,41,26,37,18,26),(2,1,13,42,27,39,18,27),(2,1,14,44,28,40,18,27),(2,1,15,45,29,41,18,27),(2,1,16,47,30,43,19,28),(2,1,17,48,31,44,19,28),(2,1,18,50,32,45,19,28),(2,1,19,51,33,47,19,29),(2,1,20,53,34,48,19,29),(2,1,21,54,34,50,19,29),(2,1,22,56,35,51,19,30),(2,1,23,57,36,52,20,30),(2,1,24,59,37,54,20,30),(2,1,25,60,38,55,20,31),(2,1,26,62,39,57,20,31),(2,1,27,64,40,58,20,32),(2,1,28,65,41,60,20,32),(2,1,29,67,43,61,21,32),(2,1,30,69,44,63,21,33),(2,1,31,70,45,64,21,33),(2,1,32,72,46,66,21,34),(2,1,33,74,47,67,21,34),(2,1,34,76,48,69,21,35),(2,1,35,77,49,71,22,35),(2,1,36,79,50,72,22,36),(2,1,37,81,51,74,22,36),(2,1,38,83,52,76,22,36),(2,1,39,84,53,77,22,37),(2,1,40,86,55,79,23,37),(2,1,41,88,56,81,23,38),(2,1,42,90,57,82,23,38),(2,1,43,92,58,84,23,39),(2,1,44,94,59,86,23,39),(2,1,45,96,60,87,24,40),(2,1,46,98,62,89,24,40),(2,1,47,100,63,91,24,41),(2,1,48,101,64,93,24,41),(2,1,49,103,65,94,25,42),(2,1,50,105,66,96,25,42),(2,1,51,107,68,98,25,43),(2,1,52,109,69,100,25,43),(2,1,53,111,70,102,25,44),(2,1,54,113,71,104,26,45),(2,1,55,115,73,105,26,45),(2,1,56,118,74,107,26,46),(2,1,57,120,75,109,26,46),(2,1,58,122,77,111,27,47),(2,1,59,124,78,113,27,47),(2,1,60,126,79,115,27,48),(2,1,61,128,81,117,27,48),(2,1,62,130,82,119,28,49),(2,1,63,132,83,121,28,50),(2,1,64,135,85,123,28,50),(2,1,65,137,86,125,29,51),(2,1,66,139,87,127,29,52),(2,1,67,141,89,129,29,52),(2,1,68,143,90,131,29,53),(2,1,69,146,92,133,30,53),(2,1,70,148,93,135,30,54),(2,1,71,157,94,142,30,55),(2,1,72,162,96,148,30,56),(2,1,73,165,98,150,30,57),(2,1,74,168,99,153,31,57),(2,1,75,170,101,154,31,58),(2,1,76,172,103,156,31,59),(2,1,77,174,105,159,32,60),(2,1,78,179,106,162,32,60),(2,1,79,184,108,167,32,61),(2,1,80,187,110,170,33,62),(2,3,1,23,20,23,17,24),(2,3,2,23,21,24,18,25),(2,3,3,24,23,25,18,25),(2,3,4,24,24,26,19,26),(2,3,5,25,25,27,19,26),(2,3,6,25,27,28,20,27),(2,3,7,26,28,28,21,28),(2,3,8,26,30,29,21,28),(2,3,9,26,31,30,22,29),(2,3,10,27,33,31,22,30),(2,3,11,27,34,32,23,30),(2,3,12,28,36,33,24,31),(2,3,13,28,37,34,24,32),(2,3,14,29,39,35,25,33),(2,3,15,29,40,36,26,33),(2,3,16,30,42,37,26,34),(2,3,17,30,43,39,27,35),(2,3,18,31,45,40,28,35),(2,3,19,31,47,41,28,36),(2,3,20,32,48,42,29,37),(2,3,21,32,50,43,30,38),(2,3,22,33,51,44,31,39),(2,3,23,34,53,45,31,39),(2,3,24,34,55,46,32,40),(2,3,25,35,57,47,33,41),(2,3,26,35,58,48,34,42),(2,3,27,36,60,50,34,43),(2,3,28,36,62,51,35,43),(2,3,29,37,63,52,36,44),(2,3,30,38,65,53,37,45),(2,3,31,38,67,54,37,46),(2,3,32,39,69,56,38,47),(2,3,33,39,71,57,39,48),(2,3,34,40,72,58,40,49),(2,3,35,41,74,59,41,49),(2,3,36,41,76,61,42,50),(2,3,37,42,78,62,42,51),(2,3,38,43,80,63,43,52),(2,3,39,43,82,64,44,53),(2,3,40,44,84,66,45,54),(2,3,41,45,86,67,46,55),(2,3,42,45,88,68,47,56),(2,3,43,46,90,70,47,57),(2,3,44,47,91,71,48,58),(2,3,45,47,93,72,49,59),(2,3,46,48,95,74,50,60),(2,3,47,49,98,75,51,61),(2,3,48,50,100,77,52,62),(2,3,49,50,102,78,53,63),(2,3,50,51,104,79,54,64),(2,3,51,52,106,81,55,65),(2,3,52,52,108,82,56,66),(2,3,53,53,110,84,57,67),(2,3,54,54,112,85,58,68),(2,3,55,55,114,87,59,69),(2,3,56,55,116,88,60,70),(2,3,57,56,118,90,61,71),(2,3,58,57,121,91,62,72),(2,3,59,58,123,93,63,73),(2,3,60,59,125,94,64,74),(2,3,61,59,127,96,65,76),(2,3,62,60,130,97,66,77),(2,3,63,61,132,99,67,78),(2,3,64,62,134,100,68,79),(2,3,65,63,136,102,69,80),(2,3,66,64,139,104,70,81),(2,3,67,64,141,105,71,82),(2,3,68,65,143,107,72,84),(2,3,69,66,146,108,73,85),(2,3,70,67,148,110,74,86),(2,3,71,68,151,112,75,87),(2,3,72,69,154,114,76,88),(2,3,73,70,157,116,77,90),(2,3,74,71,160,118,79,91),(2,3,75,72,163,120,80,93),(2,3,76,73,166,122,81,94),(2,3,77,74,169,124,83,96),(2,3,78,75,172,126,84,97),(2,3,79,76,175,128,85,99),(2,3,80,77,178,130,87,100),(2,4,1,24,20,23,17,23),(2,4,2,25,21,24,17,23),(2,4,3,25,23,24,17,24),(2,4,4,26,24,25,17,24),(2,4,5,27,26,26,18,24),(2,4,6,28,27,26,18,25),(2,4,7,29,29,27,18,25),(2,4,8,29,30,28,18,26),(2,4,9,30,32,29,18,26),(2,4,10,31,33,29,19,26),(2,4,11,32,35,30,19,27),(2,4,12,33,37,31,19,27),(2,4,13,34,38,32,19,28),(2,4,14,34,40,32,19,28),(2,4,15,35,41,33,19,28),(2,4,16,36,43,34,20,29),(2,4,17,37,45,35,20,29),(2,4,18,38,46,36,20,30),(2,4,19,39,48,37,20,30),(2,4,20,40,50,37,21,31),(2,4,21,41,52,38,21,31),(2,4,22,42,53,39,21,31),(2,4,23,43,55,40,21,32),(2,4,24,43,57,41,21,32),(2,4,25,44,59,42,22,33),(2,4,26,45,60,43,22,33),(2,4,27,46,62,44,22,34),(2,4,28,47,64,44,22,34),(2,4,29,48,66,45,23,35),(2,4,30,49,68,46,23,35),(2,4,31,50,70,47,23,36),(2,4,32,51,72,48,23,36),(2,4,33,53,73,49,24,37),(2,4,34,54,75,50,24,38),(2,4,35,55,77,51,24,38),(2,4,36,56,79,52,24,39),(2,4,37,57,81,53,25,39),(2,4,38,58,83,54,25,40),(2,4,39,59,85,55,25,40),(2,4,40,60,87,56,26,41),(2,4,41,61,89,57,26,41),(2,4,42,62,91,58,26,42),(2,4,43,63,93,59,27,43),(2,4,44,65,95,60,27,43),(2,4,45,66,98,61,27,44),(2,4,46,67,100,62,27,44),(2,4,47,68,102,64,28,45),(2,4,48,69,104,65,28,46),(2,4,49,71,106,66,28,46),(2,4,50,72,108,67,29,47),(2,4,51,73,110,68,29,48),(2,4,52,74,113,69,29,48),(2,4,53,75,115,70,30,49),(2,4,54,77,117,71,30,50),(2,4,55,78,119,73,30,50),(2,4,56,79,122,74,31,51),(2,4,57,80,124,75,31,52),(2,4,58,82,126,76,31,52),(2,4,59,83,129,77,32,53),(2,4,60,84,131,78,32,54),(2,4,61,86,133,80,33,54),(2,4,62,87,136,81,33,55),(2,4,63,88,138,82,33,56),(2,4,64,90,140,83,34,57),(2,4,65,91,143,85,34,57),(2,4,66,92,145,86,34,58),(2,4,67,94,148,87,35,59),(2,4,68,95,150,88,35,59),(2,4,69,97,153,90,36,60),(2,4,70,98,155,91,36,61),(2,4,71,100,158,92,36,62),(2,4,72,102,161,94,37,62),(2,4,73,103,164,99,37,63),(2,4,74,105,167,100,38,64),(2,4,75,107,170,102,38,65),(2,4,76,108,173,102,38,66),(2,4,77,110,176,102,39,67),(2,4,78,112,180,103,39,68),(2,4,79,114,183,105,40,69),(2,4,80,116,186,107,40,70),(2,6,1,26,17,24,17,23),(2,6,2,27,18,25,17,23),(2,6,3,29,19,26,17,24),(2,6,4,30,19,27,17,24),(2,6,5,31,20,29,17,24),(2,6,6,32,21,30,17,24),(2,6,7,34,22,31,18,25),(2,6,8,35,23,32,18,25),(2,6,9,37,24,34,18,25),(2,6,10,38,24,35,18,26),(2,6,11,39,25,36,18,26),(2,6,12,41,26,37,18,26),(2,6,13,42,27,39,18,27),(2,6,14,44,28,40,18,27),(2,6,15,45,29,41,18,27),(2,6,16,47,30,43,19,28),(2,6,17,48,31,44,19,28),(2,6,18,50,32,45,19,28),(2,6,19,51,33,47,19,29),(2,6,20,53,34,48,19,29),(2,6,21,54,34,50,19,29),(2,6,22,56,35,51,19,30),(2,6,23,57,36,52,20,30),(2,6,24,59,37,54,20,30),(2,6,25,60,38,55,20,31),(2,6,26,62,39,57,20,31),(2,6,27,64,40,58,20,32),(2,6,28,65,41,60,20,32),(2,6,29,67,43,61,21,32),(2,6,30,69,44,63,21,33),(2,6,31,70,45,64,21,33),(2,6,32,72,46,66,21,34),(2,6,33,74,47,67,21,34),(2,6,34,76,48,69,21,35),(2,6,35,77,49,71,22,35),(2,6,36,79,50,72,22,36),(2,6,37,81,51,74,22,36),(2,6,38,83,52,76,22,36),(2,6,39,84,53,77,22,37),(2,6,40,86,55,79,23,37),(2,6,41,88,56,81,23,38),(2,6,42,90,57,82,23,38),(2,6,43,92,58,84,23,39),(2,6,44,94,59,86,23,39),(2,6,45,96,60,87,24,40),(2,6,46,98,62,89,24,40),(2,6,47,100,63,91,24,41),(2,6,48,101,64,93,24,41),(2,6,49,103,65,94,25,42),(2,6,50,105,66,96,25,42),(2,6,51,107,68,98,25,43),(2,6,52,109,69,100,25,43),(2,6,53,110,69,100,25,44),(2,6,54,111,70,101,26,45),(2,6,55,111,70,101,26,45),(2,6,56,114,72,104,26,46),(2,6,57,116,73,106,26,46),(2,6,58,118,74,108,27,47),(2,6,59,124,76,110,27,47),(2,6,60,126,77,112,27,48),(2,6,61,128,78,114,27,49),(2,6,62,131,80,116,27,49),(2,6,63,133,81,119,28,50),(2,6,64,136,83,121,28,50),(2,6,65,136,84,123,28,51),(2,6,66,142,86,126,28,52),(2,6,67,145,87,128,29,52),(2,6,68,147,89,130,29,53),(2,6,69,150,90,133,29,54),(2,6,70,157,92,135,29,54),(2,6,71,160,94,138,30,55),(2,6,72,163,95,140,30,56),(2,6,73,166,97,151,30,57),(2,6,74,169,99,154,30,57),(2,6,75,172,100,156,31,58),(2,6,76,175,102,160,31,59),(2,6,77,179,104,162,31,60),(2,6,78,182,105,165,31,60),(2,6,79,191,107,168,32,61),(2,6,80,194,109,171,32,62),(2,7,1,24,17,23,18,25),(2,7,2,25,17,24,19,26),(2,7,3,26,18,25,20,27),(2,7,4,26,18,26,21,28),(2,7,5,27,19,27,22,29),(2,7,6,28,19,28,23,30),(2,7,7,29,20,29,24,31),(2,7,8,30,20,30,25,32),(2,7,9,31,21,31,26,33),(2,7,10,32,21,32,27,34),(2,7,11,33,22,33,28,36),(2,7,12,34,22,34,29,37),(2,7,13,34,23,35,30,38),(2,7,14,35,23,36,31,39),(2,7,15,36,24,37,32,40),(2,7,16,37,24,39,33,41),(2,7,17,38,25,40,34,43),(2,7,18,39,25,41,35,44),(2,7,19,40,26,42,36,45),(2,7,20,41,26,43,37,46),(2,7,21,42,27,44,38,47),(2,7,22,43,27,45,39,49),(2,7,23,44,28,47,40,50),(2,7,24,45,28,48,41,51),(2,7,25,47,29,49,43,52),(2,7,26,48,30,50,44,54),(2,7,27,49,30,52,45,55),(2,7,28,50,31,53,46,56),(2,7,29,51,31,54,47,58),(2,7,30,52,32,55,48,59),(2,7,31,53,33,57,50,60),(2,7,32,54,33,58,51,62),(2,7,33,55,34,59,52,63),(2,7,34,57,34,61,53,65),(2,7,35,58,35,62,55,66),(2,7,36,59,36,63,56,67),(2,7,37,60,36,65,57,69),(2,7,38,61,37,66,58,70),(2,7,39,62,38,67,60,72),(2,7,40,64,38,69,61,73),(2,7,41,65,39,70,62,75),(2,7,42,66,40,72,64,76),(2,7,43,67,40,73,65,78),(2,7,44,69,41,74,66,79),(2,7,45,70,42,76,68,81),(2,7,46,71,42,77,69,82),(2,7,47,72,43,79,70,84),(2,7,48,74,44,80,72,85),(2,7,49,75,45,82,73,87),(2,7,50,76,45,83,75,89),(2,7,51,78,46,85,76,90),(2,7,52,79,47,86,77,92),(2,7,53,80,47,88,79,93),(2,7,54,82,48,90,80,95),(2,7,55,83,49,91,82,97),(2,7,56,85,50,93,83,98),(2,7,57,86,50,94,85,100),(2,7,58,87,51,96,86,102),(2,7,59,89,52,97,88,103),(2,7,60,90,53,99,89,105),(2,7,61,92,54,101,91,107),(2,7,62,93,54,102,92,109),(2,7,63,95,55,104,94,110),(2,7,64,96,56,106,95,112),(2,7,65,97,57,107,97,114),(2,7,66,99,58,109,99,116),(2,7,67,100,58,111,100,118),(2,7,68,102,59,113,102,119),(2,7,69,103,60,114,103,121),(2,7,70,105,61,116,105,123),(2,7,71,106,62,118,117,125),(2,7,72,108,63,120,119,128),(2,7,73,110,64,122,122,130),(2,7,74,112,65,125,124,132),(2,7,75,114,66,127,126,134),(2,7,76,116,67,129,128,137),(2,7,77,117,68,131,128,139),(2,7,78,119,69,133,133,141),(2,7,79,121,70,136,135,144),(2,7,80,123,71,138,137,146),(2,9,1,23,17,23,19,25),(2,9,2,23,17,24,20,26),(2,9,3,24,18,24,21,27),(2,9,4,24,18,25,23,28),(2,9,5,24,18,25,24,30),(2,9,6,24,19,26,25,31),(2,9,7,25,19,26,26,32),(2,9,8,25,20,27,27,33),(2,9,9,25,20,27,29,34),(2,9,10,26,20,28,30,36),(2,9,11,26,21,29,31,37),(2,9,12,26,21,29,33,38),(2,9,13,27,22,30,34,39),(2,9,14,27,22,31,35,41),(2,9,15,27,23,31,37,42),(2,9,16,28,23,32,38,43),(2,9,17,28,23,32,39,45),(2,9,18,28,24,33,41,46),(2,9,19,29,24,34,42,47),(2,9,20,29,25,34,43,49),(2,9,21,29,25,35,45,50),(2,9,22,30,26,36,46,51),(2,9,23,30,26,37,48,53),(2,9,24,30,27,37,49,54),(2,9,25,31,27,38,51,56),(2,9,26,31,28,39,52,57),(2,9,27,32,28,39,54,59),(2,9,28,32,29,40,55,60),(2,9,29,32,29,41,57,62),(2,9,30,33,30,42,58,63),(2,9,31,33,30,42,60,65),(2,9,32,34,31,43,61,66),(2,9,33,34,31,44,63,68),(2,9,34,35,32,45,64,69),(2,9,35,35,32,45,66,71),(2,9,36,36,33,46,68,72),(2,9,37,36,34,47,69,74),(2,9,38,36,34,48,71,76),(2,9,39,37,35,49,72,77),(2,9,40,37,35,50,74,79),(2,9,41,38,36,50,76,80),(2,9,42,38,36,51,77,82),(2,9,43,39,37,52,79,84),(2,9,44,39,38,53,81,85),(2,9,45,40,38,54,83,87),(2,9,46,40,39,55,84,89),(2,9,47,41,39,56,86,91),(2,9,48,41,40,56,88,92),(2,9,49,42,41,57,90,94),(2,9,50,42,41,58,91,96),(2,9,51,43,42,59,93,98),(2,9,52,43,43,60,95,99),(2,9,53,44,43,61,97,101),(2,9,54,45,44,62,99,103),(2,9,55,45,45,63,101,105),(2,9,56,46,45,64,102,107),(2,9,57,46,46,65,104,109),(2,9,58,47,47,66,106,110),(2,9,59,47,47,67,108,112),(2,9,60,48,48,68,110,114),(2,9,61,48,49,69,112,116),(2,9,62,49,49,70,114,118),(2,9,63,50,50,71,116,120),(2,9,64,50,51,72,118,122),(2,9,65,51,51,73,120,124),(2,9,66,52,52,74,122,126),(2,9,67,52,53,75,124,128),(2,9,68,53,54,76,126,130),(2,9,69,53,54,77,128,132),(2,9,70,54,55,78,130,134),(2,9,71,55,56,88,134,145),(2,9,72,56,56,89,135,147),(2,9,73,57,57,90,137,150),(2,9,74,57,58,91,142,153),(2,9,75,58,59,93,142,155),(2,9,76,59,60,94,145,158),(2,9,77,60,61,95,148,161),(2,9,78,60,62,97,150,164),(2,9,79,61,63,98,153,167),(2,9,80,62,64,99,156,169),(3,1,1,25,16,25,19,19),(3,1,2,26,17,26,19,19),(3,1,3,28,18,27,19,20),(3,1,4,29,18,28,19,20),(3,1,5,30,19,30,19,20),(3,1,6,31,20,31,19,20),(3,1,7,33,21,32,20,21),(3,1,8,34,22,33,20,21),(3,1,9,36,23,35,20,21),(3,1,10,37,23,36,20,22),(3,1,11,38,24,37,20,22),(3,1,12,40,25,38,20,22),(3,1,13,41,26,40,20,23),(3,1,14,43,27,41,20,23),(3,1,15,44,28,42,20,23),(3,1,16,46,29,44,21,24),(3,1,17,47,30,45,21,24),(3,1,18,49,31,46,21,24),(3,1,19,50,32,48,21,25),(3,1,20,52,33,49,21,25),(3,1,21,53,34,51,21,26),(3,1,22,55,34,52,21,26),(3,1,23,56,35,53,21,26),(3,1,24,58,36,55,22,27),(3,1,25,59,37,56,22,27),(3,1,26,61,38,58,22,27),(3,1,27,63,39,59,22,28),(3,1,28,64,41,61,22,28),(3,1,29,66,42,62,22,29),(3,1,30,68,43,64,23,29),(3,1,31,69,44,65,23,30),(3,1,32,71,45,67,23,30),(3,1,33,73,46,68,23,30),(3,1,34,75,47,70,23,31),(3,1,35,76,48,72,24,31),(3,1,36,78,49,73,24,32),(3,1,37,80,50,75,24,32),(3,1,38,82,51,76,24,33),(3,1,39,84,52,78,24,33),(3,1,40,85,54,80,24,34),(3,1,41,87,55,81,25,34),(3,1,42,89,56,83,25,35),(3,1,43,91,57,85,25,35),(3,1,44,93,58,87,25,36),(3,1,45,95,59,88,26,36),(3,1,46,97,61,90,26,37),(3,1,47,99,62,92,26,37),(3,1,48,101,63,94,26,38),(3,1,49,102,64,95,26,38),(3,1,50,104,65,97,27,39),(3,1,51,106,67,99,27,39),(3,1,52,108,68,101,27,40),(3,1,53,110,69,103,27,40),(3,1,54,112,70,104,28,41),(3,1,55,115,72,106,28,41),(3,1,56,117,73,108,28,42),(3,1,57,119,74,110,28,42),(3,1,58,121,76,112,29,43),(3,1,59,123,77,114,29,43),(3,1,60,125,78,116,29,44),(3,1,61,127,80,118,29,45),(3,1,62,129,81,120,30,45),(3,1,63,131,82,122,30,46),(3,1,64,134,84,124,30,46),(3,1,65,136,85,126,31,47),(3,1,66,138,86,128,31,48),(3,1,67,140,88,130,31,48),(3,1,68,142,89,132,31,49),(3,1,69,145,91,134,32,49),(3,1,70,147,92,136,32,50),(3,1,71,150,93,138,32,51),(3,1,72,152,95,141,32,52),(3,1,73,164,97,151,32,53),(3,1,74,164,98,151,33,53),(3,1,75,170,100,156,33,54),(3,1,76,173,102,160,33,55),(3,1,77,173,104,160,34,56),(3,1,78,176,105,162,34,56),(3,1,79,183,107,168,34,57),(3,1,80,186,109,171,35,58),(3,2,1,24,16,25,19,20),(3,2,2,25,17,26,20,21),(3,2,3,26,17,27,20,21),(3,2,4,27,18,28,21,22),(3,2,5,28,18,29,22,23),(3,2,6,29,19,30,22,24),(3,2,7,31,20,31,23,24),(3,2,8,32,20,32,24,25),(3,2,9,33,21,33,24,26),(3,2,10,34,21,34,25,26),(3,2,11,35,22,36,26,27),(3,2,12,36,23,37,26,28),(3,2,13,38,23,38,27,29),(3,2,14,39,24,39,28,30),(3,2,15,40,25,40,29,30),(3,2,16,41,25,41,29,31),(3,2,17,43,26,43,30,32),(3,2,18,44,27,44,31,33),(3,2,19,45,28,45,32,34),(3,2,20,47,28,46,32,35),(3,2,21,48,29,47,33,35),(3,2,22,49,30,49,34,36),(3,2,23,51,30,50,35,37),(3,2,24,52,31,51,36,38),(3,2,25,53,32,52,36,39),(3,2,26,55,33,54,37,40),(3,2,27,56,33,55,38,41),(3,2,28,57,34,56,39,42),(3,2,29,59,35,58,40,43),(3,2,30,60,36,59,41,43),(3,2,31,62,37,60,42,44),(3,2,32,63,37,62,42,45),(3,2,33,65,38,63,43,46),(3,2,34,66,39,65,44,47),(3,2,35,68,40,66,45,48),(3,2,36,69,41,67,46,49),(3,2,37,71,41,69,47,50),(3,2,38,72,42,70,48,51),(3,2,39,74,43,72,49,52),(3,2,40,75,44,73,50,53),(3,2,41,77,45,75,51,54),(3,2,42,78,46,76,52,55),(3,2,43,80,47,78,53,56),(3,2,44,82,47,79,54,57),(3,2,45,83,48,81,55,59),(3,2,46,85,49,82,56,60),(3,2,47,87,50,84,57,61),(3,2,48,88,51,85,58,62),(3,2,49,90,52,87,59,63),(3,2,50,92,53,89,60,64),(3,2,51,93,54,90,61,65),(3,2,52,95,55,92,62,66),(3,2,53,97,56,93,63,67),(3,2,54,98,57,95,64,69),(3,2,55,100,58,97,65,70),(3,2,56,102,59,98,66,71),(3,2,57,104,60,100,67,72),(3,2,58,106,61,102,68,73),(3,2,59,107,62,103,69,74),(3,2,60,109,63,105,70,76),(3,2,61,111,64,107,72,77),(3,2,62,113,65,109,73,78),(3,2,63,115,66,110,74,79),(3,2,64,117,67,112,75,80),(3,2,65,118,68,114,76,82),(3,2,66,120,69,116,77,83),(3,2,67,122,70,118,78,84),(3,2,68,124,71,119,80,85),(3,2,69,126,72,121,81,87),(3,2,70,128,73,123,82,88),(3,2,71,150,74,125,83,89),(3,2,72,152,75,128,85,91),(3,2,73,156,76,130,86,93),(3,2,74,158,78,132,88,94),(3,2,75,161,79,134,89,96),(3,2,76,164,80,137,91,97),(3,2,77,166,82,139,92,99),(3,2,78,170,83,141,94,101),(3,2,79,172,84,144,95,102),(3,2,80,175,86,146,97,104),(3,3,1,22,19,24,19,20),(3,3,2,22,20,25,20,21),(3,3,3,23,22,26,20,21),(3,3,4,23,23,27,21,22),(3,3,5,24,25,28,21,23),(3,3,6,24,26,29,22,23),(3,3,7,25,27,29,23,24),(3,3,8,25,29,30,23,25),(3,3,9,25,30,31,24,25),(3,3,10,26,32,32,24,26),(3,3,11,26,33,33,25,27),(3,3,12,27,35,34,26,27),(3,3,13,27,36,35,26,28),(3,3,14,28,38,36,27,29),(3,3,15,28,39,37,28,29),(3,3,16,29,41,38,28,30),(3,3,17,29,42,39,29,31),(3,3,18,30,44,41,30,32),(3,3,19,30,46,42,30,32),(3,3,20,31,47,43,31,33),(3,3,21,32,49,44,32,34),(3,3,22,32,51,45,33,35),(3,3,23,33,52,46,33,36),(3,3,24,33,54,47,34,36),(3,3,25,34,56,48,35,37),(3,3,26,34,57,49,35,38),(3,3,27,35,59,51,36,39),(3,3,28,35,61,52,37,40),(3,3,29,36,63,53,38,40),(3,3,30,37,64,54,39,41),(3,3,31,37,66,55,39,42),(3,3,32,38,68,57,40,43),(3,3,33,38,70,58,41,44),(3,3,34,39,71,59,42,45),(3,3,35,40,73,60,43,46),(3,3,36,40,75,62,43,47),(3,3,37,41,77,63,44,47),(3,3,38,42,79,64,45,48),(3,3,39,42,81,65,46,49),(3,3,40,43,83,67,47,50),(3,3,41,44,85,68,48,51),(3,3,42,44,87,69,49,52),(3,3,43,45,89,71,49,53),(3,3,44,46,91,72,50,54),(3,3,45,46,93,73,51,55),(3,3,46,47,95,75,52,56),(3,3,47,48,97,76,53,57),(3,3,48,49,99,78,54,58),(3,3,49,49,101,79,55,59),(3,3,50,50,103,80,56,60),(3,3,51,51,105,82,57,61),(3,3,52,51,107,83,58,62),(3,3,53,52,109,85,59,63),(3,3,54,53,111,86,60,64),(3,3,55,54,113,88,61,65),(3,3,56,55,115,89,62,66),(3,3,57,55,118,91,62,67),(3,3,58,56,120,92,63,68),(3,3,59,57,122,94,64,70),(3,3,60,58,124,95,65,71),(3,3,61,58,126,97,67,72),(3,3,62,59,129,98,68,73),(3,3,63,60,131,100,69,74),(3,3,64,61,133,101,70,75),(3,3,65,62,135,103,71,76),(3,3,66,63,138,105,72,77),(3,3,67,63,140,106,73,78),(3,3,68,64,142,108,74,80),(3,3,69,65,145,109,75,81),(3,3,70,66,147,111,76,82),(3,3,71,67,150,113,77,83),(3,3,72,68,153,115,78,84),(3,3,73,69,156,117,79,86),(3,3,74,70,159,119,81,87),(3,3,75,71,162,121,82,89),(3,3,76,72,165,123,83,90),(3,3,77,73,168,125,85,92),(3,3,78,74,171,127,86,93),(3,3,79,75,174,129,87,95),(3,3,80,76,177,131,89,96),(3,4,1,23,19,24,19,19),(3,4,2,24,20,25,19,19),(3,4,3,24,22,25,19,20),(3,4,4,25,23,26,19,20),(3,4,5,26,25,27,20,20),(3,4,6,27,26,27,20,21),(3,4,7,28,28,28,20,21),(3,4,8,28,29,29,20,22),(3,4,9,29,31,30,20,22),(3,4,10,30,32,30,20,22),(3,4,11,31,34,31,21,23),(3,4,12,32,36,32,21,23),(3,4,13,33,37,33,21,24),(3,4,14,33,39,33,21,24),(3,4,15,34,40,34,21,25),(3,4,16,35,42,35,22,25),(3,4,17,36,44,36,22,25),(3,4,18,37,45,37,22,26),(3,4,19,38,47,38,22,26),(3,4,20,39,49,38,22,27),(3,4,21,40,51,39,23,27),(3,4,22,41,52,40,23,28),(3,4,23,42,54,41,23,28),(3,4,24,43,56,42,23,29),(3,4,25,44,58,43,24,29),(3,4,26,44,59,44,24,30),(3,4,27,45,61,44,24,30),(3,4,28,46,63,45,24,31),(3,4,29,47,65,46,25,31),(3,4,30,48,67,47,25,32),(3,4,31,49,69,48,25,32),(3,4,32,51,71,49,25,33),(3,4,33,52,72,50,26,33),(3,4,34,53,74,51,26,34),(3,4,35,54,76,52,26,34),(3,4,36,55,78,53,26,35),(3,4,37,56,80,54,27,35),(3,4,38,57,82,55,27,36),(3,4,39,58,84,56,27,37),(3,4,40,59,86,57,28,37),(3,4,41,60,88,58,28,38),(3,4,42,61,90,59,28,38),(3,4,43,63,92,60,28,39),(3,4,44,64,95,61,29,39),(3,4,45,65,97,62,29,40),(3,4,46,66,99,63,29,41),(3,4,47,67,101,64,30,41),(3,4,48,68,103,66,30,42),(3,4,49,70,105,67,30,43),(3,4,50,71,107,68,31,43),(3,4,51,72,110,69,31,44),(3,4,52,73,112,70,31,44),(3,4,53,74,114,71,32,45),(3,4,54,76,116,72,32,46),(3,4,55,77,118,73,32,46),(3,4,56,78,121,75,33,47),(3,4,57,80,123,76,33,48),(3,4,58,81,125,77,33,48),(3,4,59,82,128,78,34,49),(3,4,60,83,130,79,34,50),(3,4,61,85,132,81,34,51),(3,4,62,86,135,82,35,51),(3,4,63,87,137,83,35,52),(3,4,64,89,139,84,36,53),(3,4,65,90,142,86,36,53),(3,4,66,91,144,87,36,54),(3,4,67,93,147,88,37,55),(3,4,68,94,149,89,37,56),(3,4,69,96,152,91,38,56),(3,4,70,97,154,92,38,57),(3,4,71,99,157,93,38,58),(3,4,72,101,160,96,39,58),(3,4,73,102,163,97,39,59),(3,4,74,104,166,98,40,60),(3,4,75,106,169,100,40,61),(3,4,76,107,172,101,40,62),(3,4,77,109,175,103,41,63),(3,4,78,111,179,105,41,64),(3,4,79,113,182,106,42,65),(3,4,80,115,185,108,42,66),(3,5,1,22,16,23,21,22),(3,5,2,22,16,23,22,23),(3,5,3,22,16,24,24,25),(3,5,4,22,17,24,25,26),(3,5,5,23,17,24,26,27),(3,5,6,23,17,25,28,29),(3,5,7,23,17,25,29,30),(3,5,8,23,18,26,30,32),(3,5,9,23,18,26,32,33),(3,5,10,23,18,26,33,35),(3,5,11,24,18,27,35,36),(3,5,12,24,19,27,36,38),(3,5,13,24,19,28,37,39),(3,5,14,24,19,28,39,41),(3,5,15,24,19,28,40,42),(3,5,16,24,20,29,42,44),(3,5,17,25,20,29,43,45),(3,5,18,25,20,30,45,47),(3,5,19,25,21,30,46,49),(3,5,20,25,21,31,48,50),(3,5,21,25,21,31,50,52),(3,5,22,26,22,31,51,53),(3,5,23,26,22,32,53,55),(3,5,24,26,22,32,54,57),(3,5,25,26,22,33,56,58),(3,5,26,27,23,33,58,60),(3,5,27,27,23,34,59,62),(3,5,28,27,23,34,61,64),(3,5,29,27,24,35,63,65),(3,5,30,28,24,35,64,67),(3,5,31,28,24,36,66,69),(3,5,32,28,25,36,68,71),(3,5,33,28,25,37,70,72),(3,5,34,29,26,38,71,74),(3,5,35,29,26,38,73,76),(3,5,36,29,26,39,75,78),(3,5,37,29,27,39,77,80),(3,5,38,30,27,40,78,82),(3,5,39,30,27,40,80,84),(3,5,40,30,28,41,82,86),(3,5,41,31,28,41,84,88),(3,5,42,31,29,42,86,89),(3,5,43,31,29,43,88,91),(3,5,44,32,29,43,90,93),(3,5,45,32,30,44,92,95),(3,5,46,32,30,44,93,97),(3,5,47,32,30,45,95,99),(3,5,48,33,31,46,97,101),(3,5,49,33,31,46,99,103),(3,5,50,33,32,47,101,106),(3,5,51,34,32,48,103,108),(3,5,52,34,33,48,105,110),(3,5,53,35,33,49,107,112),(3,5,54,35,33,50,109,114),(3,5,55,35,34,50,111,116),(3,5,56,36,34,51,113,118),(3,5,57,36,35,52,116,120),(3,5,58,36,35,52,118,123),(3,5,59,37,36,53,120,125),(3,5,60,37,36,54,122,127),(3,5,61,37,37,54,124,129),(3,5,62,38,37,55,126,131),(3,5,63,38,38,56,128,134),(3,5,64,39,38,57,131,136),(3,5,65,39,39,57,133,138),(3,5,66,39,39,58,135,141),(3,5,67,40,40,59,137,143),(3,5,68,40,40,59,139,145),(3,5,69,41,40,60,142,148),(3,5,70,41,41,61,144,150),(3,5,71,41,42,62,147,153),(3,5,72,42,42,62,150,163),(3,5,73,42,43,63,153,166),(3,5,74,43,43,64,155,170),(3,5,75,43,44,65,158,173),(3,5,76,43,45,66,161,176),(3,5,77,44,45,67,164,179),(3,5,78,44,46,68,167,182),(3,5,79,45,46,69,170,184),(3,5,80,45,47,70,173,189),(3,6,1,25,16,25,19,19),(3,6,2,26,17,26,19,19),(3,6,3,28,18,27,19,20),(3,6,4,29,18,28,19,20),(3,6,5,30,19,30,19,20),(3,6,6,31,20,31,19,20),(3,6,7,33,21,32,20,21),(3,6,8,34,22,33,20,21),(3,6,9,36,23,35,20,21),(3,6,10,37,23,36,20,22),(3,6,11,38,24,37,20,22),(3,6,12,40,25,38,20,22),(3,6,13,41,26,40,20,23),(3,6,14,43,27,41,20,23),(3,6,15,44,28,42,20,23),(3,6,16,46,29,44,21,24),(3,6,17,47,30,45,21,24),(3,6,18,49,31,46,21,24),(3,6,19,50,32,48,21,25),(3,6,20,52,33,49,21,25),(3,6,21,53,34,51,21,26),(3,6,22,55,34,52,21,26),(3,6,23,56,35,53,21,26),(3,6,24,58,36,55,22,27),(3,6,25,59,37,56,22,27),(3,6,26,61,38,58,22,27),(3,6,27,63,39,59,22,28),(3,6,28,64,41,61,22,28),(3,6,29,66,42,62,22,29),(3,6,30,68,43,64,23,29),(3,6,31,69,44,65,23,30),(3,6,32,71,45,67,23,30),(3,6,33,73,46,68,23,30),(3,6,34,75,47,70,23,31),(3,6,35,76,48,72,24,31),(3,6,36,78,49,73,24,32),(3,6,37,80,50,75,24,32),(3,6,38,82,51,76,24,33),(3,6,39,84,52,78,24,33),(3,6,40,85,54,80,24,34),(3,6,41,87,55,81,25,34),(3,6,42,89,56,83,25,35),(3,6,43,91,57,85,25,35),(3,6,44,93,58,87,25,36),(3,6,45,95,59,88,26,36),(3,6,46,97,61,90,26,37),(3,6,47,99,62,92,26,37),(3,6,48,101,63,94,26,38),(3,6,49,102,64,95,26,38),(3,6,50,104,65,97,27,39),(3,6,51,106,67,99,27,39),(3,6,52,108,68,99,27,40),(3,6,53,109,68,101,27,40),(3,6,54,110,69,101,28,41),(3,6,55,110,69,102,28,41),(3,6,56,113,71,105,28,42),(3,6,57,118,72,107,28,42),(3,6,58,120,73,109,29,43),(3,6,59,123,75,111,29,43),(3,6,60,125,76,113,29,44),(3,6,61,126,77,115,29,45),(3,6,62,127,79,117,29,45),(3,6,63,129,80,120,30,46),(3,6,64,132,82,122,30,46),(3,6,65,135,83,124,30,47),(3,6,66,137,85,127,30,48),(3,6,67,144,86,129,31,48),(3,6,68,146,88,131,31,49),(3,6,69,149,89,133,31,50),(3,6,70,152,91,136,31,50),(3,6,71,154,93,139,32,51),(3,6,72,157,94,141,32,52),(3,6,73,160,96,144,32,53),(3,6,74,163,98,146,32,53),(3,6,75,166,99,150,33,54),(3,6,76,169,101,152,33,55),(3,6,77,172,103,155,33,56),(3,6,78,176,104,157,33,56),(3,6,79,179,106,160,34,57),(3,6,80,182,108,163,34,58),(4,1,1,20,25,21,20,20),(4,1,2,21,26,22,20,20),(4,1,3,23,27,23,20,21),(4,1,4,24,27,25,20,21),(4,1,5,25,28,26,20,21),(4,1,6,27,29,27,20,21),(4,1,7,28,30,28,21,22),(4,1,8,29,31,29,21,22),(4,1,9,31,31,31,21,22),(4,1,10,32,32,32,21,23),(4,1,11,33,33,33,21,23),(4,1,12,35,34,34,21,23),(4,1,13,36,35,36,21,24),(4,1,14,38,36,37,21,24),(4,1,15,39,37,38,21,24),(4,1,16,41,37,40,21,25),(4,1,17,42,38,41,22,25),(4,1,18,44,39,43,22,25),(4,1,19,45,40,44,22,26),(4,1,20,47,41,45,22,26),(4,1,21,48,42,47,22,26),(4,1,22,50,43,48,22,27),(4,1,23,52,44,50,22,27),(4,1,24,53,45,51,23,28),(4,1,25,55,46,52,23,28),(4,1,26,56,47,54,23,28),(4,1,27,58,48,55,23,29),(4,1,28,60,49,57,23,29),(4,1,29,61,50,58,23,30),(4,1,30,63,51,60,24,30),(4,1,31,65,52,62,24,30),(4,1,32,66,53,63,24,31),(4,1,33,68,54,65,24,31),(4,1,34,70,55,66,24,32),(4,1,35,72,56,68,24,32),(4,1,36,73,58,69,25,33),(4,1,37,75,59,71,25,33),(4,1,38,77,60,73,25,34),(4,1,39,79,61,74,25,34),(4,1,40,81,62,76,25,35),(4,1,41,82,63,78,26,35),(4,1,42,84,64,79,26,35),(4,1,43,86,66,81,26,36),(4,1,44,88,67,83,26,36),(4,1,45,90,68,85,26,37),(4,1,46,92,69,86,27,37),(4,1,47,94,70,88,27,38),(4,1,48,96,72,90,27,38),(4,1,49,98,73,92,27,39),(4,1,50,100,74,93,28,40),(4,1,51,102,75,95,28,40),(4,1,52,104,77,97,28,41),(4,1,53,106,78,99,28,41),(4,1,54,108,79,101,29,42),(4,1,55,110,80,103,29,42),(4,1,56,112,82,104,29,43),(4,1,57,114,83,106,29,43),(4,1,58,116,84,108,30,44),(4,1,59,118,86,110,30,44),(4,1,60,120,87,112,30,45),(4,1,61,122,88,114,30,46),(4,1,62,124,90,116,31,46),(4,1,63,127,91,118,31,47),(4,1,64,129,92,120,31,47),(4,1,65,131,94,122,32,48),(4,1,66,133,95,124,32,49),(4,1,67,135,97,126,32,49),(4,1,68,138,98,128,32,50),(4,1,69,140,100,130,33,50),(4,1,70,142,101,132,33,51),(4,1,71,145,102,134,33,52),(4,1,72,147,104,137,33,53),(4,1,73,150,106,139,33,54),(4,1,74,153,107,142,34,54),(4,1,75,156,109,144,34,55),(4,1,76,159,111,148,34,56),(4,1,77,162,113,150,35,57),(4,1,78,165,114,152,35,57),(4,1,79,178,116,164,35,58),(4,1,80,181,118,167,36,59),(4,3,1,17,28,20,20,21),(4,3,2,17,29,21,21,22),(4,3,3,18,31,22,21,22),(4,3,4,18,32,23,22,23),(4,3,5,19,33,24,22,24),(4,3,6,19,35,25,23,24),(4,3,7,20,36,26,24,25),(4,3,8,20,38,27,24,25),(4,3,9,21,39,27,25,26),(4,3,10,21,40,28,25,27),(4,3,11,22,42,29,26,28),(4,3,12,22,43,30,27,28),(4,3,13,23,45,31,27,29),(4,3,14,23,46,32,28,30),(4,3,15,24,48,34,29,30),(4,3,16,24,50,35,29,31),(4,3,17,25,51,36,30,32),(4,3,18,25,53,37,31,33),(4,3,19,26,54,38,31,33),(4,3,20,26,56,39,32,34),(4,3,21,27,57,40,33,35),(4,3,22,27,59,41,33,36),(4,3,23,28,61,42,34,36),(4,3,24,28,62,43,35,37),(4,3,25,29,64,44,36,38),(4,3,26,30,66,46,36,39),(4,3,27,30,68,47,37,40),(4,3,28,31,69,48,38,41),(4,3,29,31,71,49,39,41),(4,3,30,32,73,50,39,42),(4,3,31,33,75,52,40,43),(4,3,32,33,76,53,41,44),(4,3,33,34,78,54,42,45),(4,3,34,34,80,55,43,46),(4,3,35,35,82,57,44,47),(4,3,36,36,84,58,44,48),(4,3,37,36,86,59,45,48),(4,3,38,37,87,60,46,49),(4,3,39,38,89,62,47,50),(4,3,40,38,91,63,48,51),(4,3,41,39,93,64,49,52),(4,3,42,40,95,66,49,53),(4,3,43,40,97,67,50,54),(4,3,44,41,99,68,51,55),(4,3,45,42,101,70,52,56),(4,3,46,42,103,71,53,57),(4,3,47,43,105,72,54,58),(4,3,48,44,107,74,55,59),(4,3,49,45,109,75,56,60),(4,3,50,45,111,77,57,61),(4,3,51,46,113,78,58,62),(4,3,52,47,115,79,59,63),(4,3,53,47,118,81,60,64),(4,3,54,48,120,82,61,65),(4,3,55,49,122,84,61,66),(4,3,56,50,124,85,62,67),(4,3,57,50,126,87,63,68),(4,3,58,51,128,88,64,69),(4,3,59,52,131,90,65,70),(4,3,60,53,133,91,66,72),(4,3,61,54,135,93,67,73),(4,3,62,54,137,94,69,74),(4,3,63,55,140,96,70,75),(4,3,64,56,142,97,71,76),(4,3,65,57,144,99,72,77),(4,3,66,58,147,101,73,78),(4,3,67,58,149,102,74,79),(4,3,68,59,151,104,75,81),(4,3,69,60,154,105,76,82),(4,3,70,61,156,107,77,83),(4,3,71,62,159,109,78,84),(4,3,72,63,162,111,79,85),(4,3,73,64,165,113,80,87),(4,3,74,65,168,115,82,88),(4,3,75,66,171,117,83,90),(4,3,76,67,174,119,84,91),(4,3,77,68,177,121,86,93),(4,3,78,69,180,123,87,94),(4,3,79,70,190,125,91,96),(4,3,80,71,193,127,93,97),(4,4,1,18,28,20,20,20),(4,4,2,19,29,21,20,20),(4,4,3,20,31,21,20,21),(4,4,4,20,32,22,20,21),(4,4,5,21,34,23,21,21),(4,4,6,22,35,24,21,22),(4,4,7,23,37,24,21,22),(4,4,8,24,38,25,21,23),(4,4,9,24,40,26,21,23),(4,4,10,25,41,26,21,23),(4,4,11,26,43,27,22,24),(4,4,12,27,44,28,22,24),(4,4,13,28,46,29,22,25),(4,4,14,29,48,30,22,25),(4,4,15,29,49,30,22,25),(4,4,16,30,51,31,23,26),(4,4,17,31,52,32,23,26),(4,4,18,32,54,33,23,27),(4,4,19,33,56,34,23,27),(4,4,20,34,57,35,23,28),(4,4,21,35,59,35,24,28),(4,4,22,36,61,36,24,29),(4,4,23,37,63,37,24,29),(4,4,24,38,64,38,24,30),(4,4,25,39,66,39,25,30),(4,4,26,40,68,40,25,31),(4,4,27,41,70,41,25,31),(4,4,28,42,72,42,25,32),(4,4,29,43,73,43,25,32),(4,4,30,44,75,43,26,33),(4,4,31,45,77,44,26,33),(4,4,32,46,79,45,26,34),(4,4,33,47,81,46,27,34),(4,4,34,48,83,47,27,35),(4,4,35,49,85,48,27,35),(4,4,36,50,87,49,27,36),(4,4,37,51,89,50,28,36),(4,4,38,52,91,51,28,37),(4,4,39,53,93,52,28,38),(4,4,40,54,95,53,28,38),(4,4,41,56,97,54,29,39),(4,4,42,57,99,55,29,39),(4,4,43,58,101,56,29,40),(4,4,44,59,103,57,30,40),(4,4,45,60,105,59,30,41),(4,4,46,61,107,60,30,42),(4,4,47,62,109,61,31,42),(4,4,48,64,112,62,31,43),(4,4,49,65,114,63,31,44),(4,4,50,66,116,64,32,44),(4,4,51,67,118,65,32,45),(4,4,52,68,120,66,32,45),(4,4,53,70,123,67,33,46),(4,4,54,71,125,69,33,47),(4,4,55,72,127,70,33,47),(4,4,56,73,129,71,34,48),(4,4,57,75,132,72,34,49),(4,4,58,76,134,73,34,49),(4,4,59,77,136,74,35,50),(4,4,60,79,139,76,35,51),(4,4,61,80,141,77,35,51),(4,4,62,81,143,78,36,52),(4,4,63,82,146,79,36,53),(4,4,64,84,148,80,37,54),(4,4,65,85,151,82,37,54),(4,4,66,87,153,83,37,55),(4,4,67,88,156,84,38,56),(4,4,68,89,158,85,38,57),(4,4,69,91,160,87,39,57),(4,4,70,92,163,88,39,58),(4,4,71,94,166,90,39,59),(4,4,72,96,169,91,40,59),(4,4,73,97,172,93,40,60),(4,4,74,99,175,94,41,61),(4,4,75,101,178,96,41,62),(4,4,76,102,181,97,41,63),(4,4,77,104,184,99,42,64),(4,4,78,106,188,101,42,65),(4,4,79,108,191,102,43,66),(4,4,80,110,194,104,43,67),(4,5,1,17,25,19,22,23),(4,5,2,17,25,19,23,24),(4,5,3,17,25,20,25,26),(4,5,4,17,26,20,26,27),(4,5,5,18,26,20,27,28),(4,5,6,18,26,21,29,30),(4,5,7,18,26,21,30,31),(4,5,8,18,26,22,31,33),(4,5,9,18,27,22,33,34),(4,5,10,19,27,22,34,36),(4,5,11,19,27,23,36,37),(4,5,12,19,27,23,37,39),(4,5,13,19,28,24,38,40),(4,5,14,19,28,24,40,42),(4,5,15,19,28,25,41,43),(4,5,16,20,28,25,43,45),(4,5,17,20,29,25,44,46),(4,5,18,20,29,26,46,48),(4,5,19,20,29,26,47,49),(4,5,20,21,30,27,49,51),(4,5,21,21,30,27,51,53),(4,5,22,21,30,28,52,54),(4,5,23,21,30,28,54,56),(4,5,24,21,31,29,55,58),(4,5,25,22,31,29,57,59),(4,5,26,22,31,30,59,61),(4,5,27,22,32,30,60,63),(4,5,28,22,32,31,62,65),(4,5,29,23,32,31,64,66),(4,5,30,23,33,32,65,68),(4,5,31,23,33,32,67,70),(4,5,32,23,33,33,69,72),(4,5,33,24,34,33,70,73),(4,5,34,24,34,34,72,75),(4,5,35,24,34,34,74,77),(4,5,36,24,35,35,76,79),(4,5,37,25,35,35,78,81),(4,5,38,25,35,36,79,83),(4,5,39,25,36,37,81,85),(4,5,40,26,36,37,83,87),(4,5,41,26,37,38,85,88),(4,5,42,26,37,38,87,90),(4,5,43,27,37,39,89,92),(4,5,44,27,38,39,91,94),(4,5,45,27,38,40,92,96),(4,5,46,27,39,41,94,98),(4,5,47,28,39,41,96,100),(4,5,48,28,39,42,98,102),(4,5,49,28,40,43,100,104),(4,5,50,29,40,43,102,106),(4,5,51,29,41,44,104,109),(4,5,52,29,41,44,106,111),(4,5,53,30,42,45,108,113),(4,5,54,30,42,46,110,115),(4,5,55,30,43,46,112,117),(4,5,56,31,43,47,114,119),(4,5,57,31,43,48,117,121),(4,5,58,31,44,48,119,124),(4,5,59,32,44,49,121,126),(4,5,60,32,45,50,123,128),(4,5,61,33,45,51,125,130),(4,5,62,33,46,51,127,132),(4,5,63,33,46,52,129,135),(4,5,64,34,47,53,132,137),(4,5,65,34,47,53,134,139),(4,5,66,34,48,54,136,142),(4,5,67,35,48,55,138,144),(4,5,68,35,49,56,140,146),(4,5,69,36,49,56,143,149),(4,5,70,36,50,57,145,151),(4,5,71,36,51,58,148,161),(4,5,72,37,51,58,151,164),(4,5,73,37,52,59,154,168),(4,5,74,38,52,60,156,171),(4,5,75,38,53,61,159,174),(4,5,76,38,54,62,162,177),(4,5,77,39,54,63,165,180),(4,5,78,39,55,64,168,183),(4,5,79,40,55,65,171,186),(4,5,80,40,56,66,200,191),(4,6,1,20,25,21,20,20),(4,6,2,21,26,22,20,20),(4,6,3,23,27,23,20,21),(4,6,4,24,27,25,20,21),(4,6,5,25,28,26,20,21),(4,6,6,27,29,27,20,21),(4,6,7,28,30,28,21,22),(4,6,8,29,31,29,21,22),(4,6,9,31,31,31,21,22),(4,6,10,32,32,32,21,23),(4,6,11,33,33,33,21,23),(4,6,12,35,34,34,21,23),(4,6,13,36,35,36,21,24),(4,6,14,38,36,37,21,24),(4,6,15,39,37,38,21,24),(4,6,16,41,37,40,21,25),(4,6,17,42,38,41,22,25),(4,6,18,44,39,43,22,25),(4,6,19,45,40,44,22,26),(4,6,20,47,41,45,22,26),(4,6,21,48,42,47,22,26),(4,6,22,50,43,48,22,27),(4,6,23,52,44,50,22,27),(4,6,24,53,45,51,23,28),(4,6,25,55,46,52,23,28),(4,6,26,56,47,54,23,28),(4,6,27,58,48,55,23,29),(4,6,28,60,49,57,23,29),(4,6,29,61,50,58,23,30),(4,6,30,63,51,60,24,30),(4,6,31,65,52,62,24,30),(4,6,32,66,53,63,24,31),(4,6,33,68,54,65,24,31),(4,6,34,70,55,66,24,32),(4,6,35,72,56,68,24,32),(4,6,36,73,58,69,25,33),(4,6,37,75,59,71,25,33),(4,6,38,77,60,73,25,34),(4,6,39,79,61,74,25,34),(4,6,40,81,62,76,25,35),(4,6,41,82,63,78,26,35),(4,6,42,84,64,79,26,35),(4,6,43,86,66,81,26,36),(4,6,44,88,67,83,26,36),(4,6,45,90,68,85,26,37),(4,6,46,92,69,86,27,37),(4,6,47,94,70,88,27,38),(4,6,48,96,72,90,27,38),(4,6,49,98,73,92,27,39),(4,6,50,100,74,93,28,40),(4,6,51,101,75,94,28,40),(4,6,52,102,76,95,28,41),(4,6,53,103,77,96,28,41),(4,6,54,104,77,97,29,42),(4,6,55,105,78,98,29,42),(4,6,56,108,80,101,29,43),(4,6,57,113,81,103,29,43),(4,6,58,115,82,105,30,44),(4,6,59,115,84,107,30,44),(4,6,60,120,85,109,30,45),(4,6,61,122,86,111,30,46),(4,6,62,122,88,113,30,46),(4,6,63,127,89,116,31,47),(4,6,64,127,91,118,31,47),(4,6,65,133,92,120,31,48),(4,6,66,135,94,123,31,49),(4,6,67,136,95,125,32,49),(4,6,68,137,97,127,32,50),(4,6,69,140,98,130,32,51),(4,6,70,147,100,132,32,51),(4,6,71,154,102,135,33,52),(4,6,72,156,103,137,33,53),(4,6,73,157,105,140,33,54),(4,6,74,158,107,142,33,54),(4,6,75,161,108,145,34,55),(4,6,76,164,110,148,34,56),(4,6,77,167,112,150,34,57),(4,6,78,170,113,153,34,57),(4,6,79,172,115,156,35,58),(4,6,80,177,117,159,35,59),(4,11,1,18,25,19,22,22),(4,11,2,19,25,20,23,23),(4,11,3,19,26,20,24,24),(4,11,4,20,26,21,25,26),(4,11,5,20,27,22,26,27),(4,11,6,21,27,22,27,28),(4,11,7,21,28,23,28,29),(4,11,8,22,28,24,29,30),(4,11,9,23,29,24,30,32),(4,11,10,23,29,25,32,33),(4,11,11,24,30,26,33,34),(4,11,12,24,31,26,34,35),(4,11,13,25,31,27,35,37),(4,11,14,26,32,28,36,38),(4,11,15,26,32,29,37,39),(4,11,16,27,33,29,38,41),(4,11,17,28,33,30,40,42),(4,11,18,28,34,31,41,43),(4,11,19,29,35,32,42,45),(4,11,20,30,35,32,43,46),(4,11,21,30,36,33,45,48),(4,11,22,31,36,34,46,49),(4,11,23,32,37,35,47,51),(4,11,24,32,38,36,48,52),(4,11,25,33,38,36,50,53),(4,11,26,34,39,37,51,55),(4,11,27,35,40,38,52,56),(4,11,28,35,40,39,54,58),(4,11,29,36,41,40,55,59),(4,11,30,37,42,41,56,61),(4,11,31,38,42,42,58,62),(4,11,32,38,43,42,59,64),(4,11,33,39,44,43,60,66),(4,11,34,40,44,44,62,67),(4,11,35,41,45,45,63,69),(4,11,36,42,46,46,65,70),(4,11,37,42,47,47,66,72),(4,11,38,43,47,48,67,74),(4,11,39,44,48,49,69,75),(4,11,40,45,49,50,70,77),(4,11,41,46,50,51,72,79),(4,11,42,46,50,52,73,80),(4,11,43,47,51,53,75,82),(4,11,44,48,52,54,76,84),(4,11,45,49,53,55,78,85),(4,11,46,50,54,56,79,87),(4,11,47,51,54,57,81,89),(4,11,48,52,55,58,83,91),(4,11,49,53,56,59,84,93),(4,11,50,53,57,60,86,94),(4,11,51,54,58,61,87,96),(4,11,52,55,59,62,89,98),(4,11,53,56,59,63,91,100),(4,11,54,57,60,64,92,102),(4,11,55,58,61,65,94,103),(4,11,56,59,62,66,95,105),(4,11,57,60,63,67,97,107),(4,11,58,61,64,68,99,109),(4,11,59,62,65,69,101,111),(4,11,60,63,66,70,102,113),(4,11,61,64,66,72,104,115),(4,11,62,65,67,73,106,117),(4,11,63,66,68,74,107,119),(4,11,64,67,69,75,109,121),(4,11,65,68,70,76,111,123),(4,11,66,69,71,77,113,125),(4,11,67,70,72,78,115,127),(4,11,68,71,73,80,116,129),(4,11,69,72,74,81,118,131),(4,11,70,73,75,82,120,133),(4,11,71,75,76,83,122,135),(4,11,72,76,78,85,125,138),(4,11,73,77,79,86,127,140),(4,11,74,78,80,88,131,143),(4,11,75,80,81,89,133,145),(4,11,76,81,82,91,134,148),(4,11,77,82,83,92,136,151),(4,11,78,84,85,94,138,153),(4,11,79,85,86,95,141,156),(4,11,80,86,87,97,143,159),(5,1,1,22,18,23,18,25),(5,1,2,23,19,24,18,25),(5,1,3,25,20,25,18,26),(5,1,4,26,20,26,18,26),(5,1,5,27,21,28,18,26),(5,1,6,29,22,29,18,26),(5,1,7,30,23,30,19,27),(5,1,8,31,24,31,19,27),(5,1,9,33,25,33,19,27),(5,1,10,34,25,34,19,28),(5,1,11,35,26,35,19,28),(5,1,12,37,27,36,19,28),(5,1,13,38,28,38,19,28),(5,1,14,40,29,39,19,29),(5,1,15,41,30,40,19,29),(5,1,16,43,31,42,20,29),(5,1,17,44,32,43,20,30),(5,1,18,46,33,44,20,30),(5,1,19,47,34,46,20,31),(5,1,20,49,34,47,20,31),(5,1,21,50,35,49,20,31),(5,1,22,52,36,50,20,32),(5,1,23,53,37,51,21,32),(5,1,24,55,38,53,21,32),(5,1,25,57,39,54,21,33),(5,1,26,58,40,56,21,33),(5,1,27,60,41,57,21,34),(5,1,28,62,42,59,21,34),(5,1,29,63,43,60,21,34),(5,1,30,65,44,62,22,35),(5,1,31,67,46,63,22,35),(5,1,32,68,47,65,22,36),(5,1,33,70,48,67,22,36),(5,1,34,72,49,68,22,36),(5,1,35,74,50,70,23,37),(5,1,36,75,51,71,23,37),(5,1,37,77,52,73,23,38),(5,1,38,79,53,75,23,38),(5,1,39,81,54,76,23,39),(5,1,40,83,55,78,24,39),(5,1,41,84,57,80,24,40),(5,1,42,86,58,81,24,40),(5,1,43,88,59,83,24,41),(5,1,44,90,60,85,24,41),(5,1,45,92,61,86,25,42),(5,1,46,94,62,88,25,42),(5,1,47,96,64,90,25,43),(5,1,48,98,65,92,25,43),(5,1,49,100,66,93,25,44),(5,1,50,102,67,95,26,44),(5,1,51,104,69,97,26,45),(5,1,52,106,70,99,26,45),(5,1,53,108,71,101,26,46),(5,1,54,110,72,103,27,46),(5,1,55,112,74,104,27,47),(5,1,56,114,75,106,27,48),(5,1,57,116,76,108,27,48),(5,1,58,118,78,110,28,49),(5,1,59,120,79,112,28,49),(5,1,60,122,80,114,28,50),(5,1,61,124,82,116,28,50),(5,1,62,126,83,118,29,51),(5,1,63,128,84,120,29,52),(5,1,64,131,86,122,29,52),(5,1,65,133,87,124,30,53),(5,1,66,135,88,126,30,53),(5,1,67,137,90,128,30,54),(5,1,68,139,91,130,30,55),(5,1,69,142,93,132,31,55),(5,1,70,144,94,134,31,56),(5,1,71,147,95,136,31,57),(5,1,72,150,97,139,31,58),(5,1,73,152,99,141,31,59),(5,1,74,155,100,144,32,59),(5,1,75,158,102,146,32,60),(5,1,76,163,104,149,32,61),(5,1,77,167,106,152,33,62),(5,1,78,167,107,154,33,62),(5,1,79,170,109,157,33,63),(5,1,80,173,111,160,34,64),(5,4,1,20,21,22,18,25),(5,4,2,21,22,23,18,25),(5,4,3,22,24,23,18,26),(5,4,4,22,25,24,18,26),(5,4,5,23,27,25,19,26),(5,4,6,24,28,25,19,27),(5,4,7,25,30,26,19,27),(5,4,8,25,31,27,19,27),(5,4,9,26,33,28,19,28),(5,4,10,27,34,28,19,28),(5,4,11,28,36,29,20,29),(5,4,12,29,38,30,20,29),(5,4,13,30,39,31,20,29),(5,4,14,31,41,32,20,30),(5,4,15,31,42,32,20,30),(5,4,16,32,44,33,21,31),(5,4,17,33,46,34,21,31),(5,4,18,34,47,35,21,32),(5,4,19,35,49,36,21,32),(5,4,20,36,51,36,21,32),(5,4,21,37,52,37,22,33),(5,4,22,38,54,38,22,33),(5,4,23,39,56,39,22,34),(5,4,24,40,58,40,22,34),(5,4,25,41,60,41,23,35),(5,4,26,42,61,42,23,35),(5,4,27,43,63,43,23,36),(5,4,28,44,65,44,23,36),(5,4,29,45,67,44,24,37),(5,4,30,46,69,45,24,37),(5,4,31,47,71,46,24,38),(5,4,32,48,72,47,24,38),(5,4,33,49,74,48,25,39),(5,4,34,50,76,49,25,39),(5,4,35,51,78,50,25,40),(5,4,36,52,80,51,25,41),(5,4,37,53,82,52,26,41),(5,4,38,54,84,53,26,42),(5,4,39,55,86,54,26,42),(5,4,40,56,88,55,27,43),(5,4,41,57,90,56,27,43),(5,4,42,59,92,57,27,44),(5,4,43,60,94,58,27,45),(5,4,44,61,96,59,28,45),(5,4,45,62,99,60,28,46),(5,4,46,63,101,61,28,46),(5,4,47,64,103,63,29,47),(5,4,48,66,105,64,29,48),(5,4,49,67,107,65,29,48),(5,4,50,68,109,66,30,49),(5,4,51,69,111,67,30,50),(5,4,52,70,114,68,30,50),(5,4,53,72,116,69,31,51),(5,4,54,73,118,70,31,52),(5,4,55,74,120,72,31,52),(5,4,56,75,123,73,32,53),(5,4,57,77,125,74,32,54),(5,4,58,78,127,75,32,54),(5,4,59,79,130,76,33,55),(5,4,60,81,132,77,33,56),(5,4,61,82,134,79,34,56),(5,4,62,83,137,80,34,57),(5,4,63,84,139,81,34,58),(5,4,64,86,141,82,35,59),(5,4,65,87,144,84,35,59),(5,4,66,88,146,85,35,60),(5,4,67,90,149,86,36,61),(5,4,68,91,151,87,36,61),(5,4,69,93,154,89,37,62),(5,4,70,94,156,90,37,63),(5,4,71,96,159,91,37,64),(5,4,72,98,162,93,38,64),(5,4,73,99,165,95,38,65),(5,4,74,101,168,96,39,66),(5,4,75,103,171,98,39,67),(5,4,76,104,174,99,39,68),(5,4,77,106,177,101,40,69),(5,4,78,108,181,103,40,70),(5,4,79,110,184,104,41,71),(5,4,80,112,187,106,41,72),(5,5,1,19,18,21,20,28),(5,5,2,19,18,21,21,29),(5,5,3,19,18,22,23,31),(5,5,4,19,19,22,24,32),(5,5,5,20,19,22,25,33),(5,5,6,20,19,23,27,35),(5,5,7,20,19,23,28,36),(5,5,8,20,20,24,29,38),(5,5,9,20,20,24,31,39),(5,5,10,20,20,24,32,40),(5,5,11,21,20,25,34,42),(5,5,12,21,21,25,35,43),(5,5,13,21,21,26,37,45),(5,5,14,21,21,26,38,46),(5,5,15,21,21,26,39,48),(5,5,16,22,22,27,41,50),(5,5,17,22,22,27,42,51),(5,5,18,22,22,28,44,53),(5,5,19,22,23,28,46,54),(5,5,20,22,23,29,47,56),(5,5,21,23,23,29,49,57),(5,5,22,23,23,30,50,59),(5,5,23,23,24,30,52,61),(5,5,24,23,24,31,53,62),(5,5,25,24,24,31,55,64),(5,5,26,24,25,32,57,66),(5,5,27,24,25,32,58,68),(5,5,28,24,25,33,60,69),(5,5,29,25,26,33,62,71),(5,5,30,25,26,34,63,73),(5,5,31,25,26,34,65,75),(5,5,32,25,27,35,67,76),(5,5,33,26,27,35,69,78),(5,5,34,26,27,36,70,80),(5,5,35,26,28,36,72,82),(5,5,36,26,28,37,74,84),(5,5,37,27,28,37,76,86),(5,5,38,27,29,38,77,87),(5,5,39,27,29,38,79,89),(5,5,40,28,30,39,81,91),(5,5,41,28,30,40,83,93),(5,5,42,28,30,40,85,95),(5,5,43,28,31,41,87,97),(5,5,44,29,31,41,89,99),(5,5,45,29,32,42,91,101),(5,5,46,29,32,43,92,103),(5,5,47,30,32,43,94,105),(5,5,48,30,33,44,96,107),(5,5,49,30,33,44,98,109),(5,5,50,31,34,45,100,111),(5,5,51,31,34,46,102,113),(5,5,52,31,35,46,104,115),(5,5,53,32,35,47,106,118),(5,5,54,32,35,48,108,120),(5,5,55,32,36,48,110,122),(5,5,56,33,36,49,113,124),(5,5,57,33,37,50,115,126),(5,5,58,33,37,50,117,128),(5,5,59,34,38,51,119,131),(5,5,60,34,38,52,121,133),(5,5,61,34,39,52,123,135),(5,5,62,35,39,53,125,137),(5,5,63,35,40,54,127,140),(5,5,64,36,40,55,130,142),(5,5,65,36,41,55,132,144),(5,5,66,36,41,56,134,147),(5,5,67,37,41,57,136,149),(5,5,68,37,42,58,138,151),(5,5,69,38,42,58,141,154),(5,5,70,38,43,59,143,156),(5,5,71,38,44,60,146,159),(5,5,72,39,44,60,149,162),(5,5,73,39,45,61,152,165),(5,5,74,40,45,62,157,168),(5,5,75,40,46,63,157,171),(5,5,76,40,47,64,160,174),(5,5,77,41,47,65,163,177),(5,5,78,41,48,66,166,180),(5,5,79,42,48,67,169,183),(5,5,80,42,49,68,172,186),(5,6,1,22,18,23,18,25),(5,6,2,23,19,24,18,25),(5,6,3,25,20,25,18,26),(5,6,4,26,20,26,18,26),(5,6,5,27,21,28,18,26),(5,6,6,29,22,29,18,26),(5,6,7,30,23,30,19,27),(5,6,8,31,24,31,19,27),(5,6,9,33,25,33,19,27),(5,6,10,34,25,34,19,28),(5,6,11,35,26,35,19,28),(5,6,12,37,27,36,19,28),(5,6,13,38,28,38,19,28),(5,6,14,40,29,39,19,29),(5,6,15,41,30,40,19,29),(5,6,16,43,31,42,20,29),(5,6,17,44,32,43,20,30),(5,6,18,46,33,44,20,30),(5,6,19,47,34,46,20,31),(5,6,20,49,34,47,20,31),(5,6,21,50,35,49,20,31),(5,6,22,52,36,50,20,32),(5,6,23,53,37,51,21,32),(5,6,24,55,38,53,21,32),(5,6,25,57,39,54,21,33),(5,6,26,58,40,56,21,33),(5,6,27,60,41,57,21,34),(5,6,28,62,42,59,21,34),(5,6,29,63,43,60,21,34),(5,6,30,65,44,62,22,35),(5,6,31,67,46,63,22,35),(5,6,32,68,47,65,22,36),(5,6,33,70,48,67,22,36),(5,6,34,72,49,68,22,36),(5,6,35,74,50,70,23,37),(5,6,36,75,51,71,23,37),(5,6,37,77,52,73,23,38),(5,6,38,79,53,75,23,38),(5,6,39,81,54,76,23,39),(5,6,40,83,55,78,24,39),(5,6,41,84,57,80,24,40),(5,6,42,86,58,81,24,40),(5,6,43,88,59,83,24,41),(5,6,44,90,60,85,24,41),(5,6,45,92,61,86,25,42),(5,6,46,94,62,88,25,42),(5,6,47,96,64,90,25,43),(5,6,48,98,65,92,25,43),(5,6,49,100,66,93,25,44),(5,6,50,102,67,95,26,44),(5,6,51,103,67,96,26,45),(5,6,52,104,68,97,26,45),(5,6,53,105,69,98,26,46),(5,6,54,106,70,99,27,46),(5,6,55,107,71,100,27,47),(5,6,56,110,73,103,27,48),(5,6,57,112,74,105,27,48),(5,6,58,114,75,107,28,49),(5,6,59,119,77,109,28,49),(5,6,60,122,78,111,28,50),(5,6,61,124,79,113,28,51),(5,6,62,127,81,115,28,51),(5,6,63,129,82,118,29,52),(5,6,64,136,84,120,29,52),(5,6,65,137,85,123,29,53),(5,6,66,138,87,125,29,54),(5,6,67,141,88,127,30,54),(5,6,68,143,90,129,30,55),(5,6,69,146,91,132,30,56),(5,6,70,149,93,134,30,56),(5,6,71,152,95,137,31,57),(5,6,72,154,96,139,31,58),(5,6,73,157,98,142,31,59),(5,6,74,158,100,145,31,59),(5,6,75,159,101,147,32,60),(5,6,76,162,103,150,32,61),(5,6,77,167,105,152,32,62),(5,6,78,173,106,155,32,62),(5,6,79,174,108,158,33,63),(5,6,80,174,110,161,33,64),(5,8,1,19,18,21,21,27),(5,8,2,19,18,21,22,28),(5,8,3,19,18,22,24,30),(5,8,4,19,18,22,25,31),(5,8,5,19,19,22,26,32),(5,8,6,19,19,22,28,34),(5,8,7,20,19,23,29,35),(5,8,8,20,19,23,31,36),(5,8,9,20,19,23,32,38),(5,8,10,20,19,24,34,39),(5,8,11,20,20,24,35,40),(5,8,12,20,20,24,37,42),(5,8,13,20,20,25,38,43),(5,8,14,20,20,25,40,45),(5,8,15,20,20,25,41,46),(5,8,16,21,21,26,43,48),(5,8,17,21,21,26,44,49),(5,8,18,21,21,26,46,51),(5,8,19,21,21,27,48,52),(5,8,20,21,21,27,49,54),(5,8,21,21,22,27,51,55),(5,8,22,21,22,28,52,57),(5,8,23,21,22,28,54,58),(5,8,24,22,22,29,56,60),(5,8,25,22,23,29,57,62),(5,8,26,22,23,29,59,63),(5,8,27,22,23,30,61,65),(5,8,28,22,23,30,63,67),(5,8,29,22,24,31,64,68),(5,8,30,23,24,31,66,70),(5,8,31,23,24,31,68,72),(5,8,32,23,24,32,70,73),(5,8,33,23,25,32,72,75),(5,8,34,23,25,33,73,77),(5,8,35,24,25,33,75,79),(5,8,36,24,25,34,77,80),(5,8,37,24,26,34,79,82),(5,8,38,24,26,35,81,84),(5,8,39,24,26,35,83,86),(5,8,40,24,27,35,85,88),(5,8,41,25,27,36,87,90),(5,8,42,25,27,36,89,91),(5,8,43,25,27,37,90,93),(5,8,44,25,28,37,92,95),(5,8,45,26,28,38,94,97),(5,8,46,26,28,38,96,99),(5,8,47,26,29,39,98,101),(5,8,48,26,29,39,100,103),(5,8,49,26,29,40,103,105),(5,8,50,27,30,40,105,107),(5,8,51,27,30,41,107,109),(5,8,52,27,30,42,109,111),(5,8,53,27,31,42,111,113),(5,8,54,28,31,43,113,115),(5,8,55,28,31,43,115,117),(5,8,56,28,32,44,117,119),(5,8,57,28,32,44,119,121),(5,8,58,29,32,45,122,123),(5,8,59,29,33,45,124,126),(5,8,60,29,33,46,126,128),(5,8,61,29,34,47,128,130),(5,8,62,30,34,47,131,132),(5,8,63,30,34,48,133,134),(5,8,64,30,35,48,135,136),(5,8,65,31,35,49,137,139),(5,8,66,31,35,50,140,141),(5,8,67,31,36,50,142,143),(5,8,68,31,36,51,144,145),(5,8,69,32,37,51,147,148),(5,8,70,32,37,52,149,150),(5,8,71,32,37,53,152,153),(5,8,72,32,38,54,155,156),(5,8,73,32,38,55,158,159),(5,8,74,33,39,55,161,161),(5,8,75,33,39,56,164,164),(5,8,76,33,39,57,167,167),(5,8,77,34,40,58,170,170),(5,8,78,34,40,58,173,173),(5,8,79,34,41,59,176,176),(5,8,80,35,41,60,179,179),(5,9,1,19,18,22,20,27),(5,9,2,19,18,23,21,28),(5,9,3,20,19,23,22,29),(5,9,4,20,19,24,24,30),(5,9,5,20,19,24,25,32),(5,9,6,20,20,25,26,33),(5,9,7,21,20,25,27,34),(5,9,8,21,21,26,28,35),(5,9,9,21,21,26,30,36),(5,9,10,22,21,27,31,38),(5,9,11,22,22,28,32,39),(5,9,12,22,22,28,34,40),(5,9,13,23,23,29,35,41),(5,9,14,23,23,30,36,43),(5,9,15,23,24,30,37,44),(5,9,16,24,24,31,39,45),(5,9,17,24,24,31,40,47),(5,9,18,24,25,32,42,48),(5,9,19,25,25,33,43,49),(5,9,20,25,26,33,44,51),(5,9,21,26,26,34,46,52),(5,9,22,26,27,35,47,53),(5,9,23,26,27,36,49,55),(5,9,24,27,28,36,50,56),(5,9,25,27,28,37,52,58),(5,9,26,27,29,38,53,59),(5,9,27,28,29,38,55,60),(5,9,28,28,30,39,56,62),(5,9,29,29,30,40,58,63),(5,9,30,29,31,41,59,65),(5,9,31,30,31,41,61,66),(5,9,32,30,32,42,62,68),(5,9,33,30,32,43,64,69),(5,9,34,31,33,44,65,71),(5,9,35,31,33,45,67,73),(5,9,36,32,34,45,69,74),(5,9,37,32,34,46,70,76),(5,9,38,33,35,47,72,77),(5,9,39,33,36,48,73,79),(5,9,40,34,36,49,75,81),(5,9,41,34,37,49,77,82),(5,9,42,35,37,50,78,84),(5,9,43,35,38,51,80,86),(5,9,44,36,39,52,82,87),(5,9,45,36,39,53,84,89),(5,9,46,37,40,54,85,91),(5,9,47,37,40,55,87,92),(5,9,48,38,41,55,89,94),(5,9,49,38,42,56,91,96),(5,9,50,39,42,57,92,98),(5,9,51,39,43,58,94,100),(5,9,52,40,44,59,96,101),(5,9,53,40,44,60,98,103),(5,9,54,41,45,61,100,105),(5,9,55,41,45,62,102,107),(5,9,56,42,46,63,103,109),(5,9,57,42,47,64,105,111),(5,9,58,43,47,65,107,112),(5,9,59,43,48,66,109,114),(5,9,60,44,49,67,111,116),(5,9,61,45,50,68,113,118),(5,9,62,45,50,69,115,120),(5,9,63,46,51,70,117,122),(5,9,64,46,52,71,119,124),(5,9,65,47,52,72,121,126),(5,9,66,48,53,73,123,128),(5,9,67,48,54,74,125,130),(5,9,68,49,55,75,127,132),(5,9,69,49,55,76,129,134),(5,9,70,50,56,77,131,136),(5,9,71,51,57,86,135,147),(5,9,72,52,57,88,136,149),(5,9,73,53,58,89,138,152),(5,9,74,53,59,90,141,155),(5,9,75,54,60,92,143,157),(5,9,76,55,61,93,146,160),(5,9,77,56,62,94,149,163),(5,9,78,56,63,96,151,166),(5,9,79,57,64,97,154,169),(5,9,80,58,65,99,157,171),(6,1,1,28,15,24,15,22),(6,1,2,29,16,25,15,22),(6,1,3,31,17,26,15,23),(6,1,4,32,17,27,15,23),(6,1,5,33,18,29,15,23),(6,1,6,34,19,30,15,23),(6,1,7,36,20,31,16,24),(6,1,8,37,21,32,16,24),(6,1,9,38,22,34,16,24),(6,1,10,40,22,35,16,25),(6,1,11,41,23,36,16,25),(6,1,12,43,24,37,16,25),(6,1,13,44,25,39,16,26),(6,1,14,46,26,40,16,26),(6,1,15,47,27,41,17,26),(6,1,16,48,28,43,17,27),(6,1,17,50,29,44,17,27),(6,1,18,51,30,45,17,27),(6,1,19,53,31,47,17,28),(6,1,20,54,32,48,17,28),(6,1,21,56,33,50,17,28),(6,1,22,58,34,51,18,29),(6,1,23,59,35,52,18,29),(6,1,24,61,36,54,18,30),(6,1,25,62,37,55,18,30),(6,1,26,64,38,57,18,30),(6,1,27,66,39,58,18,31),(6,1,28,67,40,60,18,31),(6,1,29,69,41,61,19,32),(6,1,30,71,42,63,19,32),(6,1,31,72,43,64,19,32),(6,1,32,74,44,66,19,33),(6,1,33,76,45,67,19,33),(6,1,34,77,46,69,20,34),(6,1,35,79,47,71,20,34),(6,1,36,81,48,72,20,35),(6,1,37,83,49,74,20,35),(6,1,38,85,50,76,20,35),(6,1,39,86,51,77,21,36),(6,1,40,88,53,79,21,36),(6,1,41,90,54,81,21,37),(6,1,42,92,55,82,21,37),(6,1,43,94,56,84,21,38),(6,1,44,96,57,86,22,38),(6,1,45,98,58,87,22,39),(6,1,46,99,60,89,22,39),(6,1,47,101,61,91,22,40),(6,1,48,103,62,93,22,40),(6,1,49,105,63,94,23,41),(6,1,50,107,65,96,23,41),(6,1,51,109,66,98,23,42),(6,1,52,111,67,100,23,42),(6,1,53,113,68,102,24,43),(6,1,54,115,70,104,24,44),(6,1,55,117,71,105,24,44),(6,1,56,119,72,107,24,45),(6,1,57,122,73,109,25,45),(6,1,58,124,75,111,25,46),(6,1,59,126,76,113,25,46),(6,1,60,128,77,115,25,47),(6,1,61,130,79,117,26,48),(6,1,62,132,80,119,26,48),(6,1,63,134,81,121,26,49),(6,1,64,137,83,123,26,49),(6,1,65,139,84,125,27,50),(6,1,66,141,85,127,27,51),(6,1,67,143,87,129,27,51),(6,1,68,145,88,131,27,52),(6,1,69,148,90,133,28,52),(6,1,70,150,91,135,28,53),(6,1,71,153,92,137,28,54),(6,1,72,155,94,140,28,55),(6,1,73,158,96,142,28,56),(6,1,74,161,97,145,29,56),(6,1,75,164,99,147,29,57),(6,1,76,167,101,150,29,58),(6,1,77,170,103,153,30,59),(6,1,78,173,104,155,30,59),(6,1,79,176,106,164,30,60),(6,1,80,179,108,170,31,61),(6,3,1,25,18,23,15,23),(6,3,2,25,19,24,16,24),(6,3,3,26,21,25,16,24),(6,3,4,26,22,26,17,25),(6,3,5,27,24,27,17,25),(6,3,6,27,25,28,18,26),(6,3,7,28,26,28,19,27),(6,3,8,28,28,29,19,27),(6,3,9,28,29,30,20,28),(6,3,10,29,31,31,20,29),(6,3,11,29,32,32,21,29),(6,3,12,30,34,33,22,30),(6,3,13,30,35,34,22,31),(6,3,14,31,37,35,23,32),(6,3,15,31,38,36,24,32),(6,3,16,32,40,37,24,33),(6,3,17,32,41,39,25,34),(6,3,18,33,43,40,26,35),(6,3,19,33,45,41,27,35),(6,3,20,34,46,42,27,36),(6,3,21,34,48,43,28,37),(6,3,22,35,50,44,29,38),(6,3,23,35,51,45,29,38),(6,3,24,36,53,46,30,39),(6,3,25,37,55,47,31,40),(6,3,26,37,56,48,32,41),(6,3,27,38,58,50,32,42),(6,3,28,38,60,51,33,42),(6,3,29,39,62,52,34,43),(6,3,30,39,63,53,35,44),(6,3,31,40,65,54,36,45),(6,3,32,41,67,56,36,46),(6,3,33,41,69,57,37,47),(6,3,34,42,71,58,38,48),(6,3,35,43,72,59,39,48),(6,3,36,43,74,61,40,49),(6,3,37,44,76,62,40,50),(6,3,38,45,78,63,41,51),(6,3,39,45,80,64,42,52),(6,3,40,46,82,66,43,53),(6,3,41,47,84,67,44,54),(6,3,42,47,86,68,45,55),(6,3,43,48,88,70,46,56),(6,3,44,49,90,71,46,57),(6,3,45,49,92,72,47,58),(6,3,46,50,94,74,48,59),(6,3,47,51,96,75,49,60),(6,3,48,51,98,77,50,61),(6,3,49,52,100,78,51,62),(6,3,50,53,102,79,52,63),(6,3,51,54,104,81,53,64),(6,3,52,54,106,82,54,65),(6,3,53,55,108,84,55,66),(6,3,54,56,110,85,56,67),(6,3,55,57,112,87,57,68),(6,3,56,57,114,88,58,69),(6,3,57,58,117,90,59,70),(6,3,58,59,119,91,60,71),(6,3,59,60,121,93,61,72),(6,3,60,61,123,94,62,74),(6,3,61,61,125,96,63,75),(6,3,62,62,128,97,64,76),(6,3,63,63,130,99,65,77),(6,3,64,64,132,100,66,78),(6,3,65,65,134,102,67,79),(6,3,66,66,137,104,68,80),(6,3,67,66,139,105,69,81),(6,3,68,67,141,107,70,83),(6,3,69,68,144,108,71,84),(6,3,70,69,146,110,72,85),(6,3,71,70,149,112,73,86),(6,3,72,71,152,114,74,87),(6,3,73,72,155,116,75,89),(6,3,74,73,158,118,77,90),(6,3,75,74,161,120,78,92),(6,3,76,75,164,122,79,93),(6,3,77,76,167,124,81,95),(6,3,78,77,176,126,85,96),(6,3,79,78,179,128,86,98),(6,3,80,79,183,130,88,99),(6,6,1,28,15,24,15,22),(6,6,2,29,16,25,15,22),(6,6,3,31,17,26,15,23),(6,6,4,32,17,27,15,23),(6,6,5,33,18,29,15,23),(6,6,6,34,19,30,15,23),(6,6,7,36,20,31,16,24),(6,6,8,37,21,32,16,24),(6,6,9,38,22,34,16,24),(6,6,10,40,22,35,16,25),(6,6,11,41,23,36,16,25),(6,6,12,43,24,37,16,25),(6,6,13,44,25,39,16,26),(6,6,14,46,26,40,16,26),(6,6,15,47,27,41,17,26),(6,6,16,48,28,43,17,27),(6,6,17,50,29,44,17,27),(6,6,18,51,30,45,17,27),(6,6,19,53,31,47,17,28),(6,6,20,54,32,48,17,28),(6,6,21,56,33,50,17,28),(6,6,22,58,34,51,18,29),(6,6,23,59,35,52,18,29),(6,6,24,61,36,54,18,30),(6,6,25,62,37,55,18,30),(6,6,26,64,38,57,18,30),(6,6,27,66,39,58,18,31),(6,6,28,67,40,60,18,31),(6,6,29,69,41,61,19,32),(6,6,30,71,42,63,19,32),(6,6,31,72,43,64,19,32),(6,6,32,74,44,66,19,33),(6,6,33,76,45,67,19,33),(6,6,34,77,46,69,20,34),(6,6,35,79,47,71,20,34),(6,6,36,81,48,72,20,35),(6,6,37,83,49,74,20,35),(6,6,38,85,50,76,20,35),(6,6,39,86,51,77,21,36),(6,6,40,88,53,79,21,36),(6,6,41,90,54,81,21,37),(6,6,42,92,55,82,21,37),(6,6,43,94,56,84,21,38),(6,6,44,96,57,86,22,38),(6,6,45,98,58,87,22,39),(6,6,46,99,60,89,22,39),(6,6,47,101,60,91,22,40),(6,6,48,103,61,93,22,40),(6,6,49,105,62,94,23,41),(6,6,50,107,63,96,23,41),(6,6,51,109,64,97,23,42),(6,6,52,110,65,98,23,42),(6,6,53,111,66,99,24,43),(6,6,54,112,67,100,24,44),(6,6,55,113,68,101,24,44),(6,6,56,116,70,104,24,45),(6,6,57,121,71,106,24,45),(6,6,58,123,72,108,25,46),(6,6,59,123,74,110,25,46),(6,6,60,125,75,112,25,47),(6,6,61,127,76,114,25,48),(6,6,62,133,78,116,25,48),(6,6,63,135,79,119,26,49),(6,6,64,139,81,121,26,49),(6,6,65,142,82,123,26,50),(6,6,66,146,84,126,26,51),(6,6,67,150,85,132,27,51),(6,6,68,153,87,137,27,52),(6,6,69,157,88,140,27,53),(6,6,70,160,90,143,27,53),(6,6,71,163,92,146,28,54),(6,6,72,165,93,148,28,55),(6,6,73,167,95,150,28,56),(6,6,74,171,97,153,28,56),(6,6,75,174,98,156,29,57),(6,6,76,178,100,156,29,58),(6,6,77,179,102,156,29,59),(6,6,78,179,103,156,29,59),(6,6,79,182,105,159,30,60),(6,6,80,185,107,162,30,61),(6,7,1,26,15,23,16,24),(6,7,2,27,15,24,17,25),(6,7,3,28,16,25,18,26),(6,7,4,28,16,26,19,27),(6,7,5,29,17,27,20,28),(6,7,6,30,17,28,21,29),(6,7,7,31,18,29,22,30),(6,7,8,32,18,30,23,31),(6,7,9,33,19,31,24,32),(6,7,10,34,19,32,25,33),(6,7,11,35,20,33,26,35),(6,7,12,35,20,34,27,36),(6,7,13,36,21,35,28,37),(6,7,14,37,21,36,29,38),(6,7,15,38,22,37,30,39),(6,7,16,39,22,39,31,40),(6,7,17,40,23,40,32,42),(6,7,18,41,23,41,33,43),(6,7,19,42,24,42,34,44),(6,7,20,43,24,43,35,45),(6,7,21,44,25,44,36,46),(6,7,22,45,25,45,37,48),(6,7,23,46,26,47,38,49),(6,7,24,47,27,48,40,50),(6,7,25,48,27,49,41,51),(6,7,26,49,28,50,42,53),(6,7,27,51,28,52,43,54),(6,7,28,52,29,53,44,55),(6,7,29,53,29,54,45,57),(6,7,30,54,30,55,47,58),(6,7,31,55,31,57,48,59),(6,7,32,56,31,58,49,61),(6,7,33,57,32,59,50,62),(6,7,34,58,33,61,51,64),(6,7,35,60,33,62,53,65),(6,7,36,61,34,63,54,66),(6,7,37,62,34,65,55,68),(6,7,38,63,35,66,57,69),(6,7,39,64,36,67,58,71),(6,7,40,66,36,69,59,72),(6,7,41,67,37,70,60,74),(6,7,42,68,38,72,62,75),(6,7,43,69,38,73,63,77),(6,7,44,70,39,74,64,78),(6,7,45,72,40,76,66,80),(6,7,46,73,41,77,67,81),(6,7,47,74,41,79,69,83),(6,7,48,76,42,80,70,84),(6,7,49,77,43,82,71,86),(6,7,50,78,43,83,73,88),(6,7,51,80,44,85,74,89),(6,7,52,81,45,86,76,91),(6,7,53,82,46,88,77,92),(6,7,54,84,46,90,78,94),(6,7,55,85,47,91,80,96),(6,7,56,86,48,93,81,97),(6,7,57,88,49,94,83,99),(6,7,58,89,49,96,84,101),(6,7,59,91,50,97,86,102),(6,7,60,92,51,99,87,104),(6,7,61,94,52,101,89,106),(6,7,62,95,52,102,90,108),(6,7,63,96,53,104,92,109),(6,7,64,98,54,106,93,111),(6,7,65,99,55,107,95,113),(6,7,66,101,56,109,97,115),(6,7,67,102,57,111,98,117),(6,7,68,104,57,113,100,118),(6,7,69,105,58,114,101,120),(6,7,70,107,59,116,103,122),(6,7,71,108,60,118,113,124),(6,7,72,110,61,120,117,127),(6,7,73,112,62,122,119,129),(6,7,74,114,63,125,122,131),(6,7,75,116,64,127,124,133),(6,7,76,118,65,129,126,136),(6,7,77,119,66,131,128,138),(6,7,78,121,67,133,130,140),(6,7,79,123,68,136,133,143),(6,7,80,125,69,138,135,145),(6,11,1,26,15,22,17,24),(6,11,2,27,16,23,18,25),(6,11,3,27,16,23,19,26),(6,11,4,28,17,24,20,27),(6,11,5,28,17,25,21,29),(6,11,6,29,18,25,22,30),(6,11,7,29,18,26,23,31),(6,11,8,30,19,27,24,32),(6,11,9,30,19,27,26,34),(6,11,10,31,20,28,27,35),(6,11,11,32,20,29,28,36),(6,11,12,32,21,29,29,37),(6,11,13,33,21,30,30,39),(6,11,14,33,22,31,31,40),(6,11,15,34,23,32,32,41),(6,11,16,35,23,32,34,43),(6,11,17,35,24,33,35,44),(6,11,18,36,24,34,36,45),(6,11,19,37,25,35,37,47),(6,11,20,37,26,35,39,48),(6,11,21,38,26,36,40,50),(6,11,22,39,27,37,41,51),(6,11,23,39,28,38,42,52),(6,11,24,40,28,39,44,54),(6,11,25,41,29,39,45,55),(6,11,26,41,30,40,46,57),(6,11,27,42,30,41,47,58),(6,11,28,43,31,42,49,60),(6,11,29,44,32,43,50,61),(6,11,30,44,32,44,52,63),(6,11,31,45,33,44,53,64),(6,11,32,46,34,45,54,66),(6,11,33,47,34,46,56,67),(6,11,34,47,35,47,57,69),(6,11,35,48,36,48,58,71),(6,11,36,49,36,49,60,72),(6,11,37,50,37,50,61,74),(6,11,38,51,38,51,63,76),(6,11,39,52,39,52,64,77),(6,11,40,52,39,53,66,79),(6,11,41,53,40,54,67,81),(6,11,42,54,41,55,69,82),(6,11,43,55,42,56,70,84),(6,11,44,56,43,57,72,86),(6,11,45,57,43,57,73,87),(6,11,46,57,44,58,75,89),(6,11,47,58,45,60,76,91),(6,11,48,59,46,61,78,93),(6,11,49,60,47,62,79,94),(6,11,50,61,47,63,81,96),(6,11,51,62,48,64,83,98),(6,11,52,63,49,65,84,100),(6,11,53,64,50,66,86,102),(6,11,54,65,51,67,87,104),(6,11,55,66,51,68,89,105),(6,11,56,67,52,69,91,107),(6,11,57,68,53,70,92,109),(6,11,58,69,54,71,94,111),(6,11,59,70,55,72,96,113),(6,11,60,71,56,73,97,115),(6,11,61,72,57,74,99,117),(6,11,62,73,58,76,101,119),(6,11,63,74,59,77,103,121),(6,11,64,75,59,78,104,123),(6,11,65,76,60,79,106,125),(6,11,66,77,61,80,108,127),(6,11,67,78,62,81,110,129),(6,11,68,79,63,83,111,131),(6,11,69,80,64,84,113,133),(6,11,70,81,65,85,115,135),(6,11,71,83,66,86,117,137),(6,11,72,84,68,88,120,140),(6,11,73,85,69,89,122,142),(6,11,74,86,70,91,124,145),(6,11,75,88,71,92,126,147),(6,11,76,89,72,94,128,150),(6,11,77,90,73,95,131,153),(6,11,78,92,75,97,133,155),(6,11,79,93,76,98,136,158),(6,11,80,94,77,100,138,185),(7,1,1,18,23,21,24,20),(7,1,2,19,24,22,24,20),(7,1,3,21,25,23,24,21),(7,1,4,22,25,25,24,21),(7,1,5,23,26,26,24,21),(7,1,6,25,27,27,24,21),(7,1,7,26,28,28,24,22),(7,1,8,27,29,29,25,22),(7,1,9,29,29,31,25,22),(7,1,10,30,30,32,25,23),(7,1,11,32,31,33,25,23),(7,1,12,33,32,34,25,23),(7,1,13,34,33,36,25,24),(7,1,14,36,34,37,25,24),(7,1,15,37,35,38,25,24),(7,1,16,39,36,40,25,25),(7,1,17,40,36,41,25,25),(7,1,18,42,37,43,26,25),(7,1,19,43,38,44,26,26),(7,1,20,45,39,45,26,26),(7,1,21,47,40,47,26,26),(7,1,22,48,41,48,26,27),(7,1,23,50,42,50,26,27),(7,1,24,51,43,51,26,28),(7,1,25,53,44,52,27,28),(7,1,26,55,45,54,27,28),(7,1,27,56,46,55,27,29),(7,1,28,58,47,57,27,29),(7,1,29,59,48,58,27,30),(7,1,30,61,49,60,27,30),(7,1,31,63,50,62,27,30),(7,1,32,65,51,63,28,31),(7,1,33,66,52,65,28,31),(7,1,34,68,53,66,28,32),(7,1,35,70,55,68,28,32),(7,1,36,72,56,69,28,33),(7,1,37,73,57,71,29,33),(7,1,38,75,58,73,29,34),(7,1,39,77,59,74,29,34),(7,1,40,79,60,76,29,35),(7,1,41,81,61,78,29,35),(7,1,42,82,62,79,30,35),(7,1,43,84,64,81,30,36),(7,1,44,86,65,83,30,36),(7,1,45,88,66,85,30,37),(7,1,46,90,67,86,30,37),(7,1,47,92,68,88,31,38),(7,1,48,94,70,90,31,38),(7,1,49,96,71,92,31,39),(7,1,50,98,72,93,31,40),(7,1,51,100,73,95,32,40),(7,1,52,102,75,97,32,41),(7,1,53,104,76,99,32,41),(7,1,54,106,77,101,32,42),(7,1,55,108,78,103,33,42),(7,1,56,110,80,104,33,43),(7,1,57,112,81,106,33,43),(7,1,58,114,82,108,33,44),(7,1,59,116,84,110,34,44),(7,1,60,118,85,112,34,45),(7,1,61,120,86,114,34,46),(7,1,62,122,88,116,35,46),(7,1,63,125,89,118,35,47),(7,1,64,127,91,120,35,47),(7,1,65,129,92,122,35,48),(7,1,66,131,93,124,36,49),(7,1,67,133,95,126,36,49),(7,1,68,136,96,128,36,50),(7,1,69,138,98,130,37,50),(7,1,70,140,99,132,37,51),(7,1,71,143,100,134,37,52),(7,1,72,145,102,137,37,53),(7,1,73,148,104,139,37,54),(7,1,74,151,105,142,38,54),(7,1,75,154,107,144,38,55),(7,1,76,157,109,147,38,56),(7,1,77,163,111,153,39,57),(7,1,78,169,112,158,39,57),(7,1,79,172,114,161,39,58),(7,1,80,175,116,164,40,59),(7,4,1,16,26,20,24,20),(7,4,2,17,27,21,24,20),(7,4,3,18,29,21,24,21),(7,4,4,18,30,22,24,21),(7,4,5,19,32,23,25,21),(7,4,6,20,33,24,25,22),(7,4,7,21,35,24,25,22),(7,4,8,22,36,25,25,23),(7,4,9,22,38,26,25,23),(7,4,10,23,39,26,25,23),(7,4,11,24,41,27,25,24),(7,4,12,25,42,28,26,24),(7,4,13,26,44,29,26,25),(7,4,14,27,46,30,26,25),(7,4,15,28,47,30,26,25),(7,4,16,28,49,31,26,26),(7,4,17,29,50,32,27,26),(7,4,18,30,52,33,27,27),(7,4,19,31,54,34,27,27),(7,4,20,32,56,35,27,28),(7,4,21,33,57,35,27,28),(7,4,22,34,59,36,28,29),(7,4,23,35,61,37,28,29),(7,4,24,36,62,38,28,30),(7,4,25,37,64,39,28,30),(7,4,26,38,66,40,29,31),(7,4,27,39,68,41,29,31),(7,4,28,40,70,42,29,32),(7,4,29,41,72,43,29,32),(7,4,30,42,73,43,29,33),(7,4,31,43,75,44,30,33),(7,4,32,44,77,45,30,34),(7,4,33,45,79,46,30,34),(7,4,34,46,81,47,31,35),(7,4,35,47,83,48,31,35),(7,4,36,48,85,49,31,36),(7,4,37,49,87,50,31,36),(7,4,38,50,89,51,32,37),(7,4,39,51,91,52,32,38),(7,4,40,53,93,53,32,38),(7,4,41,54,95,54,33,39),(7,4,42,55,97,55,33,39),(7,4,43,56,99,56,33,40),(7,4,44,57,101,57,33,40),(7,4,45,58,103,59,34,41),(7,4,46,59,105,60,34,42),(7,4,47,61,107,61,34,42),(7,4,48,62,110,62,35,43),(7,4,49,63,112,63,35,44),(7,4,50,64,114,64,35,44),(7,4,51,65,116,65,36,45),(7,4,52,67,118,66,36,45),(7,4,53,68,121,67,36,46),(7,4,54,69,123,69,37,47),(7,4,55,70,125,70,37,47),(7,4,56,72,127,71,37,48),(7,4,57,73,130,72,38,49),(7,4,58,74,132,73,38,49),(7,4,59,75,134,74,39,50),(7,4,60,77,137,76,39,51),(7,4,61,78,139,77,39,51),(7,4,62,79,141,78,40,52),(7,4,63,81,144,79,40,53),(7,4,64,82,146,80,41,54),(7,4,65,83,149,82,41,54),(7,4,66,85,151,83,41,55),(7,4,67,86,154,84,42,56),(7,4,68,87,156,85,42,57),(7,4,69,89,158,87,43,57),(7,4,70,90,161,88,43,58),(7,4,71,92,164,89,44,59),(7,4,72,94,167,91,45,59),(7,4,73,95,170,93,45,60),(7,4,74,97,173,94,46,61),(7,4,75,99,176,96,46,62),(7,4,76,100,179,97,46,63),(7,4,77,102,182,102,47,64),(7,4,78,104,186,105,47,65),(7,4,79,106,189,106,48,66),(7,4,80,108,192,108,48,67),(7,6,1,18,23,21,24,20),(7,6,2,19,24,22,24,20),(7,6,3,21,25,23,24,21),(7,6,4,22,25,25,24,21),(7,6,5,23,26,26,24,21),(7,6,6,25,27,27,24,21),(7,6,7,26,28,28,24,22),(7,6,8,27,29,29,25,22),(7,6,9,29,29,31,25,22),(7,6,10,30,30,32,25,23),(7,6,11,32,31,33,25,23),(7,6,12,33,32,34,25,23),(7,6,13,34,33,36,25,24),(7,6,14,36,34,37,25,24),(7,6,15,37,35,38,25,24),(7,6,16,39,36,40,25,25),(7,6,17,40,36,41,25,25),(7,6,18,42,37,43,26,25),(7,6,19,43,38,44,26,26),(7,6,20,45,39,45,26,26),(7,6,21,47,40,47,26,26),(7,6,22,48,41,48,26,27),(7,6,23,50,42,50,26,27),(7,6,24,51,43,51,26,28),(7,6,25,53,44,52,27,28),(7,6,26,55,45,54,27,28),(7,6,27,56,46,55,27,29),(7,6,28,58,47,57,27,29),(7,6,29,59,48,58,27,30),(7,6,30,61,49,60,27,30),(7,6,31,63,50,62,27,30),(7,6,32,65,51,63,28,31),(7,6,33,66,52,65,28,31),(7,6,34,68,53,66,28,32),(7,6,35,70,55,68,28,32),(7,6,36,72,56,69,28,33),(7,6,37,73,57,71,29,33),(7,6,38,75,58,73,29,34),(7,6,39,77,59,74,29,34),(7,6,40,79,60,76,29,35),(7,6,41,81,61,78,29,35),(7,6,42,82,62,79,30,35),(7,6,43,84,64,81,30,36),(7,6,44,86,65,83,30,36),(7,6,45,88,66,85,30,37),(7,6,46,90,67,86,30,37),(7,6,47,92,68,88,31,38),(7,6,48,94,70,90,31,38),(7,6,49,96,71,92,31,39),(7,6,50,98,72,93,31,40),(7,6,51,99,72,93,32,40),(7,6,52,100,73,95,32,41),(7,6,53,101,74,96,32,41),(7,6,54,102,75,97,32,42),(7,6,55,103,76,98,33,42),(7,6,56,106,78,101,33,43),(7,6,57,111,79,103,33,43),(7,6,58,113,80,105,34,44),(7,6,59,116,82,107,34,44),(7,6,60,118,83,109,34,45),(7,6,61,120,84,111,34,46),(7,6,62,127,86,119,34,46),(7,6,63,129,87,122,35,47),(7,6,64,132,89,125,35,47),(7,6,65,135,90,127,35,48),(7,6,66,137,92,130,35,49),(7,6,67,138,93,130,36,49),(7,6,68,140,95,131,36,50),(7,6,69,142,96,131,36,51),(7,6,70,145,98,132,36,51),(7,6,71,148,100,135,37,52),(7,6,72,150,101,137,37,53),(7,6,73,153,103,140,37,54),(7,6,74,154,105,142,37,54),(7,6,75,155,106,145,38,55),(7,6,76,158,108,151,38,56),(7,6,77,161,110,157,38,57),(7,6,78,164,111,162,38,57),(7,6,79,167,113,165,39,58),(7,6,80,170,115,168,39,59),(7,8,1,15,23,19,27,22),(7,8,2,15,23,19,28,23),(7,8,3,15,23,20,30,25),(7,8,4,15,23,20,31,26),(7,8,5,15,24,20,32,27),(7,8,6,15,24,20,34,29),(7,8,7,16,24,21,35,30),(7,8,8,16,24,21,37,31),(7,8,9,16,24,21,38,33),(7,8,10,16,24,22,40,34),(7,8,11,16,25,22,41,36),(7,8,12,16,25,22,42,37),(7,8,13,16,25,23,44,38),(7,8,14,16,25,23,45,40),(7,8,15,17,25,23,47,41),(7,8,16,17,25,24,49,43),(7,8,17,17,26,24,50,44),(7,8,18,17,26,24,52,46),(7,8,19,17,26,25,53,47),(7,8,20,17,26,25,55,49),(7,8,21,17,26,26,57,51),(7,8,22,18,27,26,58,52),(7,8,23,18,27,26,60,54),(7,8,24,18,27,27,61,55),(7,8,25,18,27,27,63,57),(7,8,26,18,28,27,65,59),(7,8,27,18,28,28,67,60),(7,8,28,18,28,28,68,62),(7,8,29,19,28,29,70,64),(7,8,30,19,29,29,72,65),(7,8,31,19,29,30,74,67),(7,8,32,19,29,30,75,69),(7,8,33,19,29,30,77,70),(7,8,34,20,30,31,79,72),(7,8,35,20,30,31,81,74),(7,8,36,20,30,32,83,76),(7,8,37,20,30,32,85,78),(7,8,38,20,31,33,86,79),(7,8,39,21,31,33,88,81),(7,8,40,21,31,34,90,83),(7,8,41,21,32,34,92,85),(7,8,42,21,32,35,94,87),(7,8,43,21,32,35,96,89),(7,8,44,22,32,36,98,91),(7,8,45,22,33,36,100,92),(7,8,46,22,33,37,102,94),(7,8,47,22,33,37,104,96),(7,8,48,22,34,38,106,98),(7,8,49,23,34,38,108,100),(7,8,50,23,34,39,110,102),(7,8,51,23,35,39,112,104),(7,8,52,23,35,40,114,106),(7,8,53,24,35,40,117,108),(7,8,54,24,36,41,119,110),(7,8,55,24,36,41,121,112),(7,8,56,24,37,42,123,114),(7,8,57,25,37,42,125,117),(7,8,58,25,37,43,127,119),(7,8,59,25,38,43,130,121),(7,8,60,25,38,44,132,123),(7,8,61,26,38,45,134,125),(7,8,62,26,39,45,136,127),(7,8,63,26,39,46,139,129),(7,8,64,26,40,46,141,132),(7,8,65,27,40,47,143,134),(7,8,66,27,40,48,146,136),(7,8,67,27,41,48,148,138),(7,8,68,27,41,49,150,140),(7,8,69,28,42,49,153,143),(7,8,70,28,42,50,155,145),(7,8,71,28,42,51,168,148),(7,8,72,28,43,52,168,151),(7,8,73,28,43,53,171,154),(7,8,74,29,44,53,174,156),(7,8,75,29,44,54,177,159),(7,8,76,29,44,55,180,162),(7,8,77,30,45,56,183,165),(7,8,78,30,45,56,186,168),(7,8,79,30,46,57,190,171),(7,8,80,31,46,58,193,174),(7,9,1,15,23,20,26,22),(7,9,2,15,23,21,27,23),(7,9,3,16,24,21,28,24),(7,9,4,16,24,22,29,25),(7,9,5,16,24,22,31,27),(7,9,6,17,25,23,32,28),(7,9,7,17,25,23,33,29),(7,9,8,17,26,24,34,30),(7,9,9,17,26,25,36,31),(7,9,10,18,26,25,37,33),(7,9,11,18,27,26,38,34),(7,9,12,18,27,26,39,35),(7,9,13,19,28,27,41,36),(7,9,14,19,28,28,42,38),(7,9,15,20,28,28,43,39),(7,9,16,20,29,29,45,40),(7,9,17,20,29,30,46,42),(7,9,18,21,30,30,47,43),(7,9,19,21,30,31,49,44),(7,9,20,21,31,32,50,46),(7,9,21,22,31,32,51,47),(7,9,22,22,31,33,53,49),(7,9,23,23,32,34,54,50),(7,9,24,23,32,34,56,51),(7,9,25,23,33,35,57,53),(7,9,26,24,33,36,59,54),(7,9,27,24,34,37,60,56),(7,9,28,25,34,37,62,57),(7,9,29,25,35,38,63,59),(7,9,30,25,35,39,65,60),(7,9,31,26,36,40,66,62),(7,9,32,26,36,40,68,63),(7,9,33,27,37,41,69,65),(7,9,34,27,38,42,71,66),(7,9,35,28,38,43,73,68),(7,9,36,28,39,43,74,69),(7,9,37,28,39,44,76,71),(7,9,38,29,40,45,77,73),(7,9,39,29,40,46,79,74),(7,9,40,30,41,47,81,76),(7,9,41,30,41,48,82,78),(7,9,42,31,42,48,84,79),(7,9,43,31,43,49,86,81),(7,9,44,32,43,50,88,83),(7,9,45,32,44,51,89,84),(7,9,46,33,44,52,91,86),(7,9,47,33,45,53,93,88),(7,9,48,34,46,54,95,89),(7,9,49,34,46,54,96,91),(7,9,50,35,47,55,98,93),(7,9,51,35,48,56,100,95),(7,9,52,36,48,57,102,97),(7,9,53,36,49,58,104,98),(7,9,54,37,50,59,105,100),(7,9,55,37,50,60,107,102),(7,9,56,38,51,61,109,104),(7,9,57,38,52,62,111,106),(7,9,58,39,52,63,113,108),(7,9,59,40,53,64,115,109),(7,9,60,40,54,65,117,111),(7,9,61,41,54,66,119,113),(7,9,62,41,55,67,121,115),(7,9,63,42,56,68,123,117),(7,9,64,42,57,69,125,119),(7,9,65,43,57,70,127,121),(7,9,66,44,58,71,129,123),(7,9,67,44,59,72,131,125),(7,9,68,45,59,73,133,127),(7,9,69,45,60,74,135,129),(7,9,70,46,61,75,137,131),(7,9,71,47,62,84,147,142),(7,9,72,48,62,85,148,144),(7,9,73,49,63,85,153,147),(7,9,74,49,64,88,153,150),(7,9,75,50,65,90,155,152),(7,9,76,51,66,91,158,155),(7,9,77,52,67,92,161,158),(7,9,78,52,68,93,163,161),(7,9,79,53,69,95,166,164),(7,9,80,54,70,96,170,166),(8,1,1,24,22,23,16,21),(8,1,2,25,23,24,16,21),(8,1,3,27,24,25,16,22),(8,1,4,28,24,26,16,22),(8,1,5,29,25,28,16,22),(8,1,6,31,26,29,16,22),(8,1,7,32,27,30,17,23),(8,1,8,33,28,31,17,23),(8,1,9,35,28,33,17,23),(8,1,10,36,29,34,17,24),(8,1,11,37,30,35,17,24),(8,1,12,39,31,36,17,24),(8,1,13,40,32,38,17,25),(8,1,14,42,33,39,17,25),(8,1,15,43,34,40,18,25),(8,1,16,45,35,42,18,26),(8,1,17,46,35,43,18,26),(8,1,18,48,36,44,18,26),(8,1,19,49,37,46,18,27),(8,1,20,51,38,47,18,27),(8,1,21,52,39,49,18,27),(8,1,22,54,40,50,18,28),(8,1,23,55,41,51,19,28),(8,1,24,57,42,53,19,29),(8,1,25,59,43,54,19,29),(8,1,26,60,44,56,19,29),(8,1,27,62,45,57,19,30),(8,1,28,63,46,59,19,30),(8,1,29,65,47,60,20,31),(8,1,30,67,48,62,20,31),(8,1,31,69,49,63,20,31),(8,1,32,70,50,65,20,32),(8,1,33,72,51,67,20,32),(8,1,34,74,53,68,20,33),(8,1,35,75,54,70,21,33),(8,1,36,77,55,71,21,34),(8,1,37,79,56,73,21,34),(8,1,38,81,57,75,21,35),(8,1,39,83,58,76,21,35),(8,1,40,84,59,78,22,35),(8,1,41,86,60,80,22,36),(8,1,42,88,62,81,22,36),(8,1,43,90,63,83,22,37),(8,1,44,92,64,85,22,37),(8,1,45,94,65,86,23,38),(8,1,46,96,66,88,23,38),(8,1,47,98,67,90,23,39),(8,1,48,100,69,92,23,39),(8,1,49,102,70,93,24,40),(8,1,50,103,71,95,24,40),(8,1,51,105,72,97,24,41),(8,1,52,107,74,99,24,42),(8,1,53,109,75,101,25,42),(8,1,54,112,76,103,25,43),(8,1,55,114,78,104,25,43),(8,1,56,116,79,106,25,44),(8,1,57,118,80,108,25,44),(8,1,58,120,81,110,26,45),(8,1,59,122,83,112,26,45),(8,1,60,124,84,114,26,46),(8,1,61,126,85,116,27,47),(8,1,62,128,87,118,27,47),(8,1,63,130,88,120,27,48),(8,1,64,133,90,122,27,48),(8,1,65,135,91,124,28,49),(8,1,66,137,92,126,28,50),(8,1,67,139,94,128,28,50),(8,1,68,141,95,130,28,51),(8,1,69,144,97,132,29,51),(8,1,70,146,98,134,29,52),(8,1,71,149,99,136,29,53),(8,1,72,151,101,139,29,54),(8,1,73,154,103,141,29,55),(8,1,74,157,104,144,30,55),(8,1,75,166,106,151,30,56),(8,1,76,172,108,157,30,57),(8,1,77,175,110,161,31,58),(8,1,78,179,111,163,31,58),(8,1,79,182,113,164,31,59),(8,1,80,185,115,169,32,60),(8,3,1,21,25,22,16,22),(8,3,2,21,26,23,17,23),(8,3,3,22,28,24,17,23),(8,3,4,22,29,25,18,24),(8,3,5,23,30,26,18,25),(8,3,6,23,32,27,19,25),(8,3,7,24,33,28,20,26),(8,3,8,24,35,28,20,26),(8,3,9,25,36,29,21,27),(8,3,10,25,38,30,21,28),(8,3,11,25,39,31,22,29),(8,3,12,26,41,32,23,29),(8,3,13,26,42,33,23,30),(8,3,14,27,44,34,24,31),(8,3,15,27,45,35,25,31),(8,3,16,28,47,36,25,32),(8,3,17,28,48,38,26,33),(8,3,18,29,50,39,27,34),(8,3,19,29,51,40,28,34),(8,3,20,30,53,41,28,35),(8,3,21,31,55,42,29,36),(8,3,22,31,56,43,30,37),(8,3,23,32,58,44,30,37),(8,3,24,32,60,45,31,38),(8,3,25,33,61,46,32,39),(8,3,26,33,63,48,33,40),(8,3,27,34,65,49,33,41),(8,3,28,35,66,50,34,41),(8,3,29,35,68,51,35,42),(8,3,30,36,70,52,36,43),(8,3,31,36,72,53,37,44),(8,3,32,37,73,55,37,45),(8,3,33,38,75,56,38,46),(8,3,34,38,77,57,39,47),(8,3,35,39,79,58,40,48),(8,3,36,39,81,60,41,48),(8,3,37,40,83,61,41,49),(8,3,38,41,85,62,42,50),(8,3,39,41,86,63,43,51),(8,3,40,42,88,65,44,52),(8,3,41,43,90,66,45,53),(8,3,42,43,92,67,46,54),(8,3,43,44,94,69,47,55),(8,3,44,45,96,70,47,56),(8,3,45,45,98,71,48,57),(8,3,46,46,100,73,49,58),(8,3,47,47,102,74,50,59),(8,3,48,48,104,76,51,60),(8,3,49,48,106,77,52,61),(8,3,50,49,108,78,53,62),(8,3,51,50,110,80,54,63),(8,3,52,51,113,81,55,64),(8,3,53,51,115,83,56,65),(8,3,54,52,117,84,57,66),(8,3,55,53,119,86,58,67),(8,3,56,54,121,87,59,68),(8,3,57,54,123,89,60,69),(8,3,58,55,126,90,61,70),(8,3,59,56,128,92,62,71),(8,3,60,57,130,93,63,73),(8,3,61,58,132,95,64,74),(8,3,62,58,134,96,65,75),(8,3,63,59,137,98,66,76),(8,3,64,60,139,99,67,77),(8,3,65,61,141,101,68,78),(8,3,66,62,144,103,69,79),(8,3,67,62,146,104,70,80),(8,3,68,63,148,106,71,82),(8,3,69,64,151,107,72,83),(8,3,70,65,153,109,73,84),(8,3,71,66,156,111,74,85),(8,3,72,67,159,113,75,86),(8,3,73,68,162,115,76,88),(8,3,74,69,165,117,78,89),(8,3,75,70,174,119,82,91),(8,3,76,71,177,121,83,92),(8,3,77,72,180,123,85,94),(8,3,78,73,184,125,86,95),(8,3,79,74,187,127,87,97),(8,3,80,75,190,129,89,98),(8,4,1,22,25,22,16,21),(8,4,2,23,26,23,16,21),(8,4,3,24,28,23,16,22),(8,4,4,24,29,24,16,22),(8,4,5,25,31,25,17,22),(8,4,6,26,32,25,17,23),(8,4,7,27,34,26,17,23),(8,4,8,27,35,27,17,24),(8,4,9,28,37,28,17,24),(8,4,10,29,38,28,18,24),(8,4,11,30,40,29,18,25),(8,4,12,31,41,30,18,25),(8,4,13,32,43,31,18,26),(8,4,14,32,45,32,18,26),(8,4,15,33,46,32,19,26),(8,4,16,34,48,33,19,27),(8,4,17,35,50,34,19,27),(8,4,18,36,51,35,19,28),(8,4,19,37,53,36,19,28),(8,4,20,38,55,36,20,29),(8,4,21,39,56,37,20,29),(8,4,22,40,58,38,20,30),(8,4,23,41,60,39,20,30),(8,4,24,42,62,40,20,31),(8,4,25,43,63,41,21,31),(8,4,26,44,65,42,21,32),(8,4,27,45,67,43,21,32),(8,4,28,46,69,44,21,33),(8,4,29,47,71,44,22,33),(8,4,30,48,72,45,22,34),(8,4,31,49,74,46,22,34),(8,4,32,50,76,47,22,35),(8,4,33,51,78,48,23,35),(8,4,34,52,80,49,23,36),(8,4,35,53,82,50,23,36),(8,4,36,54,84,51,24,37),(8,4,37,55,86,52,24,37),(8,4,38,56,88,53,24,38),(8,4,39,57,90,54,24,38),(8,4,40,58,92,55,25,39),(8,4,41,59,94,56,25,40),(8,4,42,60,96,57,25,40),(8,4,43,62,98,58,26,41),(8,4,44,63,100,59,26,41),(8,4,45,64,102,60,26,42),(8,4,46,65,104,61,27,43),(8,4,47,66,107,63,27,43),(8,4,48,67,109,64,27,44),(8,4,49,69,111,65,27,44),(8,4,50,70,113,66,28,45),(8,4,51,71,115,67,28,46),(8,4,52,72,117,68,28,46),(8,4,53,74,120,69,29,47),(8,4,54,75,122,70,29,48),(8,4,55,76,124,72,29,48),(8,4,56,77,126,73,30,49),(8,4,57,79,129,74,30,50),(8,4,58,80,131,75,30,50),(8,4,59,81,133,76,31,51),(8,4,60,82,136,77,31,52),(8,4,61,84,138,79,32,52),(8,4,62,85,140,80,32,53),(8,4,63,86,143,81,32,54),(8,4,64,88,145,82,33,55),(8,4,65,89,148,84,33,55),(8,4,66,90,150,85,33,56),(8,4,67,92,153,86,34,57),(8,4,68,93,155,87,34,58),(8,4,69,95,157,89,35,58),(8,4,70,96,160,90,35,59),(8,4,71,98,163,94,35,60),(8,4,72,100,166,96,36,60),(8,4,73,101,169,96,36,61),(8,4,74,103,172,97,37,62),(8,4,75,105,175,98,37,63),(8,4,76,106,178,99,37,64),(8,4,77,108,181,105,38,65),(8,4,78,110,185,107,38,66),(8,4,79,112,188,109,39,67),(8,4,80,114,191,110,39,68),(8,5,1,21,22,21,18,24),(8,5,2,21,22,21,19,25),(8,5,3,21,22,22,21,27),(8,5,4,21,23,22,22,28),(8,5,5,22,23,22,23,29),(8,5,6,22,23,23,25,31),(8,5,7,22,23,23,26,32),(8,5,8,22,24,24,27,34),(8,5,9,22,24,24,29,35),(8,5,10,22,24,24,30,37),(8,5,11,23,24,25,32,38),(8,5,12,23,24,25,33,40),(8,5,13,23,25,26,35,41),(8,5,14,23,25,26,36,43),(8,5,15,23,25,26,38,44),(8,5,16,24,26,27,39,46),(8,5,17,24,26,27,41,47),(8,5,18,24,26,28,42,49),(8,5,19,24,26,28,44,50),(8,5,20,24,27,29,45,52),(8,5,21,25,27,29,47,54),(8,5,22,25,27,30,48,55),(8,5,23,25,28,30,50,57),(8,5,24,25,28,31,52,59),(8,5,25,25,28,31,53,60),(8,5,26,26,28,32,55,62),(8,5,27,26,29,32,56,64),(8,5,28,26,29,33,58,65),(8,5,29,26,29,33,60,67),(8,5,30,27,30,34,62,69),(8,5,31,27,30,34,63,71),(8,5,32,27,30,35,65,73),(8,5,33,27,31,35,67,74),(8,5,34,28,31,36,68,76),(8,5,35,28,32,36,70,78),(8,5,36,28,32,37,72,80),(8,5,37,29,32,37,74,82),(8,5,38,29,33,38,76,84),(8,5,39,29,33,38,77,86),(8,5,40,29,33,39,79,87),(8,5,41,30,34,40,81,89),(8,5,42,30,34,40,83,91),(8,5,43,30,35,41,85,93),(8,5,44,31,35,41,87,95),(8,5,45,31,35,42,89,97),(8,5,46,31,36,43,91,99),(8,5,47,32,36,43,93,101),(8,5,48,32,37,44,94,103),(8,5,49,32,37,44,96,105),(8,5,50,33,37,45,98,107),(8,5,51,33,38,46,100,110),(8,5,52,33,38,46,102,112),(8,5,53,34,39,47,104,114),(8,5,54,34,39,48,106,116),(8,5,55,34,40,48,109,118),(8,5,56,35,40,49,111,120),(8,5,57,35,41,50,113,122),(8,5,58,35,41,50,115,125),(8,5,59,36,42,51,117,127),(8,5,60,36,42,52,119,129),(8,5,61,36,42,52,121,131),(8,5,62,37,43,53,123,133),(8,5,63,37,43,54,125,136),(8,5,64,38,44,55,128,138),(8,5,65,38,44,55,130,140),(8,5,66,38,45,56,132,143),(8,5,67,39,45,57,134,145),(8,5,68,39,46,58,136,147),(8,5,69,40,46,58,139,150),(8,5,70,40,47,59,141,152),(8,5,71,40,48,60,144,155),(8,5,72,41,48,60,147,158),(8,5,73,41,49,61,150,161),(8,5,74,42,49,62,152,164),(8,5,75,42,50,63,155,167),(8,5,76,42,51,64,158,170),(8,5,77,43,51,65,161,173),(8,5,78,43,52,66,164,176),(8,5,79,44,52,67,167,179),(8,5,80,44,53,68,170,182),(8,6,1,24,22,23,16,21),(8,6,2,25,23,24,16,21),(8,6,3,27,24,25,16,22),(8,6,4,28,24,26,16,22),(8,6,5,29,25,28,16,22),(8,6,6,31,26,29,16,22),(8,6,7,32,27,30,17,23),(8,6,8,33,28,31,17,23),(8,6,9,35,28,33,17,23),(8,6,10,36,29,34,17,24),(8,6,11,37,30,35,17,24),(8,6,12,39,31,36,17,24),(8,6,13,40,32,38,17,25),(8,6,14,42,33,39,17,25),(8,6,15,43,34,40,18,25),(8,6,16,45,35,42,18,26),(8,6,17,46,35,43,18,26),(8,6,18,48,36,44,18,26),(8,6,19,49,37,46,18,27),(8,6,20,51,38,47,18,27),(8,6,21,52,39,49,18,27),(8,6,22,54,40,50,18,28),(8,6,23,55,41,51,19,28),(8,6,24,57,42,53,19,29),(8,6,25,59,43,54,19,29),(8,6,26,60,44,56,19,29),(8,6,27,62,45,57,19,30),(8,6,28,63,46,59,19,30),(8,6,29,65,47,60,20,31),(8,6,30,67,48,62,20,31),(8,6,31,69,49,63,20,31),(8,6,32,70,50,65,20,32),(8,6,33,72,51,67,20,32),(8,6,34,74,53,68,20,33),(8,6,35,75,54,70,21,33),(8,6,36,77,55,71,21,34),(8,6,37,79,56,73,21,34),(8,6,38,81,57,75,21,35),(8,6,39,83,58,76,21,35),(8,6,40,84,59,78,22,35),(8,6,41,86,60,80,22,36),(8,6,42,88,62,81,22,36),(8,6,43,90,63,83,22,37),(8,6,44,92,64,85,22,37),(8,6,45,94,65,86,23,38),(8,6,46,96,66,88,23,38),(8,6,47,98,67,90,23,39),(8,6,48,100,69,92,23,39),(8,6,49,102,70,93,24,40),(8,6,50,103,71,95,24,40),(8,6,51,105,72,96,24,41),(8,6,52,106,74,97,24,42),(8,6,53,107,73,98,25,42),(8,6,54,108,74,99,25,43),(8,6,55,109,75,100,25,43),(8,6,56,112,77,103,25,44),(8,6,57,114,78,105,25,44),(8,6,58,118,79,107,26,45),(8,6,59,119,81,109,26,45),(8,6,60,121,82,111,26,46),(8,6,61,123,83,113,26,47),(8,6,62,126,85,115,26,47),(8,6,63,128,86,118,27,48),(8,6,64,131,88,120,27,48),(8,6,65,138,89,122,27,49),(8,6,66,140,91,125,27,50),(8,6,67,143,92,127,28,50),(8,6,68,145,94,129,28,51),(8,6,69,148,95,132,28,52),(8,6,70,151,97,134,28,52),(8,6,71,154,99,137,29,53),(8,6,72,156,100,139,29,54),(8,6,73,159,102,142,29,55),(8,6,74,162,104,144,29,55),(8,6,75,165,105,147,30,56),(8,6,76,168,107,150,30,57),(8,6,77,169,109,153,30,58),(8,6,78,170,110,155,30,58),(8,6,79,178,112,158,31,59),(8,6,80,181,114,161,31,60),(8,7,1,22,22,22,17,23),(8,7,2,23,22,23,18,24),(8,7,3,24,23,24,19,25),(8,7,4,25,23,25,20,26),(8,7,5,25,24,26,21,27),(8,7,6,26,24,27,22,28),(8,7,7,27,25,28,23,29),(8,7,8,28,25,29,24,30),(8,7,9,29,25,30,25,31),(8,7,10,30,26,31,26,33),(8,7,11,31,26,32,27,34),(8,7,12,32,27,33,28,35),(8,7,13,33,27,34,29,36),(8,7,14,34,28,35,30,37),(8,7,15,34,28,36,31,38),(8,7,16,35,29,38,32,39),(8,7,17,36,29,39,33,41),(8,7,18,37,30,40,34,42),(8,7,19,38,30,41,35,43),(8,7,20,39,31,42,36,44),(8,7,21,40,32,43,37,45),(8,7,22,41,32,45,38,47),(8,7,23,43,33,46,39,48),(8,7,24,44,33,47,40,49),(8,7,25,45,34,48,42,51),(8,7,26,46,34,49,43,52),(8,7,27,47,35,51,44,53),(8,7,28,48,35,52,45,54),(8,7,29,49,36,53,46,56),(8,7,30,50,37,54,48,57),(8,7,31,51,37,56,49,59),(8,7,32,52,38,57,50,60),(8,7,33,53,38,58,51,61),(8,7,34,55,39,60,52,63),(8,7,35,56,40,61,54,64),(8,7,36,57,40,62,55,66),(8,7,37,58,41,64,56,67),(8,7,38,59,42,65,57,68),(8,7,39,61,42,66,59,70),(8,7,40,62,43,68,60,71),(8,7,41,63,44,69,61,73),(8,7,42,64,44,71,63,74),(8,7,43,65,45,72,64,76),(8,7,44,67,46,74,65,77),(8,7,45,68,46,75,67,79),(8,7,46,69,47,76,68,80),(8,7,47,71,48,78,69,82),(8,7,48,72,49,79,71,83),(8,7,49,73,49,81,72,85),(8,7,50,74,50,82,74,87),(8,7,51,76,51,84,75,88),(8,7,52,77,51,85,77,90),(8,7,53,78,52,87,78,92),(8,7,54,80,53,89,79,93),(8,7,55,81,54,90,81,95),(8,7,56,83,55,92,82,96),(8,7,57,84,55,93,84,98),(8,7,58,85,56,95,85,100),(8,7,59,87,57,97,87,102),(8,7,60,88,58,98,88,103),(8,7,61,90,58,100,90,105),(8,7,62,91,59,101,91,107),(8,7,63,93,60,103,93,108),(8,7,64,94,61,105,94,110),(8,7,65,95,62,106,96,112),(8,7,66,97,63,108,98,114),(8,7,67,98,63,110,99,116),(8,7,68,100,64,112,101,117),(8,7,69,101,65,113,102,119),(8,7,70,103,66,115,104,121),(8,7,71,104,67,117,116,123),(8,7,72,106,68,119,118,126),(8,7,73,108,69,121,121,128),(8,7,74,110,70,124,123,130),(8,7,75,112,71,126,125,132),(8,7,76,114,72,128,127,135),(8,7,77,115,73,130,129,137),(8,7,78,117,74,132,132,139),(8,7,79,119,75,135,134,142),(8,7,80,121,76,137,136,144),(8,8,1,21,22,21,19,23),(8,8,2,21,22,21,20,24),(8,8,3,21,22,22,22,26),(8,8,4,21,22,22,23,27),(8,8,5,21,23,22,25,28),(8,8,6,21,23,22,26,30),(8,8,7,21,23,23,27,31),(8,8,8,22,23,23,29,32),(8,8,9,22,23,23,30,34),(8,8,10,22,23,24,32,35),(8,8,11,22,24,24,33,37),(8,8,12,22,24,24,35,38),(8,8,13,22,24,25,36,39),(8,8,14,22,24,25,38,41),(8,8,15,22,24,25,39,42),(8,8,16,22,24,26,41,44),(8,8,17,23,25,26,42,45),(8,8,18,23,25,26,44,47),(8,8,19,23,25,27,46,48),(8,8,20,23,25,27,47,50),(8,8,21,23,25,27,49,51),(8,8,22,23,26,28,51,53),(8,8,23,23,26,28,52,55),(8,8,24,24,26,29,54,56),(8,8,25,24,26,29,56,58),(8,8,26,24,27,29,57,60),(8,8,27,24,27,30,59,61),(8,8,28,24,27,30,61,63),(8,8,29,24,27,31,63,65),(8,8,30,24,28,31,64,66),(8,8,31,25,28,31,66,68),(8,8,32,25,28,32,68,70),(8,8,33,25,28,32,70,71),(8,8,34,25,29,33,71,73),(8,8,35,25,29,33,73,75),(8,8,36,26,29,34,75,77),(8,8,37,26,29,34,77,79),(8,8,38,26,30,35,79,80),(8,8,39,26,30,35,81,82),(8,8,40,26,30,35,83,84),(8,8,41,27,31,36,85,86),(8,8,42,27,31,36,87,88),(8,8,43,27,31,37,89,90),(8,8,44,27,32,37,91,91),(8,8,45,27,32,38,93,93),(8,8,46,28,32,38,95,95),(8,8,47,28,32,39,97,97),(8,8,48,28,33,39,99,99),(8,8,49,28,33,40,101,101),(8,8,50,29,33,40,103,103),(8,8,51,29,34,41,105,105),(8,8,52,29,34,42,107,107),(8,8,53,29,35,42,109,109),(8,8,54,30,35,43,111,111),(8,8,55,30,35,43,113,113),(8,8,56,30,36,44,115,115),(8,8,57,30,36,44,118,118),(8,8,58,31,36,45,120,120),(8,8,59,31,37,45,122,122),(8,8,60,31,37,46,124,124),(8,8,61,31,37,47,126,126),(8,8,62,32,38,47,129,128),(8,8,63,32,38,48,131,130),(8,8,64,32,39,48,133,133),(8,8,65,33,39,49,135,135),(8,8,66,33,39,50,138,137),(8,8,67,33,40,50,140,139),(8,8,68,33,40,51,142,141),(8,8,69,34,41,51,145,144),(8,8,70,34,41,52,147,146),(8,8,71,34,41,53,150,149),(8,8,72,34,42,54,153,152),(8,8,73,34,42,55,156,155),(8,8,74,35,43,55,159,157),(8,8,75,35,43,56,162,160),(8,8,76,35,43,57,168,163),(8,8,77,36,44,58,168,166),(8,8,78,36,44,58,171,169),(8,8,79,36,45,59,177,172),(8,8,80,37,45,60,177,175),(10,2,1,19,22,21,24,20),(10,2,2,20,23,22,25,21),(10,2,3,21,23,23,25,21),(10,2,4,22,24,24,26,22),(10,2,5,23,24,25,27,23),(10,2,6,25,25,26,27,24),(10,2,7,26,25,27,28,24),(10,2,8,27,26,28,29,25),(10,2,9,28,27,29,29,26),(10,2,10,29,27,31,30,26),(10,2,11,30,28,32,31,27),(10,2,12,32,29,33,31,28),(10,2,13,33,29,34,32,29),(10,2,14,34,30,35,33,30),(10,2,15,35,31,36,33,30),(10,2,16,37,31,37,34,31),(10,2,17,38,32,39,35,32),(10,2,18,39,33,40,36,33),(10,2,19,40,33,41,36,34),(10,2,20,42,34,42,37,35),(10,2,21,43,35,44,38,35),(10,2,22,44,35,45,39,36),(10,2,23,46,36,46,40,37),(10,2,24,47,37,47,40,38),(10,2,25,49,38,49,41,39),(10,2,26,50,38,50,42,40),(10,2,27,51,39,51,43,41),(10,2,28,53,40,53,44,42),(10,2,29,54,41,54,45,43),(10,2,30,56,41,55,45,43),(10,2,31,57,42,57,46,44),(10,2,32,58,43,58,47,45),(10,2,33,60,44,59,48,46),(10,2,34,61,45,61,49,47),(10,2,35,63,45,62,50,48),(10,2,36,64,46,64,51,49),(10,2,37,66,47,65,52,50),(10,2,38,67,48,67,53,51),(10,2,39,69,49,68,54,52),(10,2,40,71,50,69,55,53),(10,2,41,72,50,71,55,54),(10,2,42,74,51,72,56,55),(10,2,43,75,52,74,57,56),(10,2,44,77,53,75,58,57),(10,2,45,79,54,77,59,59),(10,2,46,80,55,78,60,60),(10,2,47,82,56,80,61,61),(10,2,48,83,57,82,62,62),(10,2,49,85,58,83,63,63),(10,2,50,87,59,85,64,64),(10,2,51,89,60,86,66,65),(10,2,52,90,61,88,67,66),(10,2,53,92,61,90,68,67),(10,2,54,94,62,91,69,69),(10,2,55,95,63,93,70,70),(10,2,56,97,64,95,71,71),(10,2,57,99,65,96,72,72),(10,2,58,101,66,98,73,73),(10,2,59,102,67,100,74,74),(10,2,60,104,68,101,75,76),(10,2,61,106,69,103,76,77),(10,2,62,108,70,105,78,78),(10,2,63,110,72,106,79,79),(10,2,64,112,73,108,80,80),(10,2,65,113,74,110,81,82),(10,2,66,115,75,112,82,83),(10,2,67,117,76,114,83,84),(10,2,68,119,77,115,85,85),(10,2,69,121,78,117,86,87),(10,2,70,123,79,119,87,88),(10,2,71,125,80,120,88,89),(10,2,72,128,81,123,90,91),(10,2,73,130,82,125,91,93),(10,2,74,133,84,127,93,94),(10,2,75,135,85,129,94,96),(10,2,76,137,86,132,96,97),(10,2,77,140,88,134,97,99),(10,2,78,143,89,136,99,101),(10,2,79,145,90,139,100,102),(10,2,80,148,92,141,102,104),(10,3,1,17,25,20,24,20),(10,3,2,17,26,21,25,21),(10,3,3,18,28,22,25,21),(10,3,4,18,29,23,26,22),(10,3,5,19,30,24,26,23),(10,3,6,19,32,25,27,23),(10,3,7,20,33,26,27,24),(10,3,8,20,35,27,28,25),(10,3,9,21,36,27,29,25),(10,3,10,21,38,28,29,26),(10,3,11,22,39,29,30,27),(10,3,12,22,41,30,31,27),(10,3,13,23,42,31,31,28),(10,3,14,23,44,32,32,29),(10,3,15,24,45,34,32,29),(10,3,16,24,47,35,33,30),(10,3,17,25,48,36,34,31),(10,3,18,25,50,37,34,32),(10,3,19,26,51,38,35,32),(10,3,20,26,53,39,36,33),(10,3,21,27,55,40,37,34),(10,3,22,27,56,41,37,35),(10,3,23,28,58,42,38,36),(10,3,24,28,60,43,39,36),(10,3,25,29,61,44,39,37),(10,3,26,30,63,46,40,38),(10,3,27,30,65,47,41,39),(10,3,28,31,66,48,42,40),(10,3,29,31,68,49,42,40),(10,3,30,32,70,50,43,41),(10,3,31,33,72,52,44,42),(10,3,32,33,73,53,45,43),(10,3,33,34,75,54,46,44),(10,3,34,34,77,55,46,45),(10,3,35,35,79,57,47,46),(10,3,36,36,81,58,48,47),(10,3,37,36,83,59,49,47),(10,3,38,37,85,60,50,48),(10,3,39,38,86,62,51,49),(10,3,40,38,88,63,51,50),(10,3,41,39,90,64,52,51),(10,3,42,40,92,66,53,52),(10,3,43,40,94,67,54,53),(10,3,44,41,96,68,55,54),(10,3,45,42,98,70,56,55),(10,3,46,42,100,71,57,56),(10,3,47,43,102,72,58,57),(10,3,48,44,104,74,59,58),(10,3,49,45,106,75,60,59),(10,3,50,45,108,77,61,60),(10,3,51,46,110,78,61,61),(10,3,52,47,113,79,62,62),(10,3,53,47,115,81,63,63),(10,3,54,48,117,82,64,64),(10,3,55,49,119,84,65,65),(10,3,56,50,121,85,66,66),(10,3,57,50,123,87,67,67),(10,3,58,51,126,88,68,68),(10,3,59,52,128,90,69,70),(10,3,60,53,130,91,70,71),(10,3,61,54,132,93,71,72),(10,3,62,54,134,94,72,73),(10,3,63,55,137,96,73,74),(10,3,64,56,139,97,75,75),(10,3,65,57,141,99,76,76),(10,3,66,58,144,101,77,77),(10,3,67,58,146,102,78,78),(10,3,68,59,148,104,79,80),(10,3,69,60,151,105,80,81),(10,3,70,61,153,107,81,82),(10,3,71,62,156,108,82,83),(10,3,72,63,159,110,83,84),(10,3,73,64,162,112,84,86),(10,3,74,65,165,114,86,87),(10,3,75,66,168,116,87,89),(10,3,76,67,171,118,89,90),(10,3,77,68,174,120,90,92),(10,3,78,69,177,122,91,93),(10,3,79,70,180,124,92,95),(10,3,80,71,183,126,94,96),(10,4,1,18,25,20,24,19),(10,4,2,19,26,21,24,19),(10,4,3,20,28,21,24,20),(10,4,4,20,29,22,24,20),(10,4,5,21,31,23,25,20),(10,4,6,22,32,24,25,21),(10,4,7,23,34,24,25,21),(10,4,8,24,35,25,25,22),(10,4,9,24,37,26,25,22),(10,4,10,25,38,26,25,22),(10,4,11,26,40,27,25,23),(10,4,12,27,41,28,26,23),(10,4,13,28,43,29,26,24),(10,4,14,29,45,30,26,24),(10,4,15,29,46,30,26,25),(10,4,16,30,48,31,26,25),(10,4,17,31,50,32,27,25),(10,4,18,32,51,33,27,26),(10,4,19,33,53,34,27,26),(10,4,20,34,55,35,27,27),(10,4,21,35,56,35,27,27),(10,4,22,36,58,36,28,28),(10,4,23,37,60,37,28,28),(10,4,24,38,62,38,28,29),(10,4,25,39,63,39,28,29),(10,4,26,40,65,40,29,30),(10,4,27,41,67,41,29,30),(10,4,28,42,69,42,29,31),(10,4,29,43,71,43,29,31),(10,4,30,44,72,43,29,32),(10,4,31,45,74,44,30,32),(10,4,32,46,76,45,30,33),(10,4,33,47,78,46,30,33),(10,4,34,48,80,47,31,34),(10,4,35,49,82,48,31,34),(10,4,36,50,84,49,31,35),(10,4,37,51,86,50,31,35),(10,4,38,52,88,51,32,36),(10,4,39,53,90,52,32,37),(10,4,40,54,92,53,32,37),(10,4,41,56,94,54,33,38),(10,4,42,57,96,55,33,38),(10,4,43,58,98,56,33,39),(10,4,44,59,100,57,33,39),(10,4,45,60,102,59,34,40),(10,4,46,61,104,60,34,41),(10,4,47,62,107,61,34,41),(10,4,48,64,109,62,35,42),(10,4,49,65,111,63,35,43),(10,4,50,66,113,64,35,43),(10,4,51,67,115,65,36,44),(10,4,52,68,117,66,36,44),(10,4,53,70,120,67,36,45),(10,4,54,71,122,69,37,46),(10,4,55,72,124,70,37,46),(10,4,56,73,126,71,37,47),(10,4,57,75,129,72,38,48),(10,4,58,76,131,73,38,48),(10,4,59,77,133,74,39,49),(10,4,60,79,136,76,39,50),(10,4,61,80,138,77,39,51),(10,4,62,81,140,78,40,51),(10,4,63,82,143,79,40,52),(10,4,64,84,145,80,41,53),(10,4,65,85,148,82,41,53),(10,4,66,87,150,83,41,54),(10,4,67,88,153,84,42,55),(10,4,68,89,155,85,42,56),(10,4,69,91,157,87,43,56),(10,4,70,92,160,88,43,57),(10,4,71,94,163,88,43,58),(10,4,72,96,166,90,44,58),(10,4,73,97,169,92,44,59),(10,4,74,99,172,93,45,60),(10,4,75,101,175,95,45,61),(10,4,76,102,178,96,45,62),(10,4,77,104,181,101,46,63),(10,4,78,106,185,104,46,64),(10,4,79,108,188,105,47,65),(10,4,80,110,191,107,47,66),(10,5,1,17,22,19,26,22),(10,5,2,17,22,19,27,23),(10,5,3,17,22,20,29,25),(10,5,4,17,23,20,30,26),(10,5,5,18,23,20,31,27),(10,5,6,18,23,21,33,29),(10,5,7,18,23,21,34,30),(10,5,8,18,24,22,35,32),(10,5,9,18,24,22,37,33),(10,5,10,19,24,22,38,35),(10,5,11,19,24,23,39,36),(10,5,12,19,24,23,41,38),(10,5,13,19,25,24,42,39),(10,5,14,19,25,24,44,41),(10,5,15,19,25,25,45,42),(10,5,16,20,26,25,47,44),(10,5,17,20,26,25,48,45),(10,5,18,20,26,26,50,47),(10,5,19,20,26,26,51,49),(10,5,20,21,27,27,53,50),(10,5,21,21,27,27,54,52),(10,5,22,21,27,28,56,53),(10,5,23,21,28,28,58,55),(10,5,24,21,28,29,59,57),(10,5,25,22,28,29,61,58),(10,5,26,22,28,30,62,60),(10,5,27,22,29,30,64,62),(10,5,28,22,29,31,66,64),(10,5,29,23,29,31,67,65),(10,5,30,23,30,32,69,67),(10,5,31,23,30,32,71,69),(10,5,32,23,30,33,72,71),(10,5,33,24,31,33,74,72),(10,5,34,24,31,34,76,74),(10,5,35,24,32,34,78,76),(10,5,36,24,32,35,80,78),(10,5,37,25,32,35,81,80),(10,5,38,25,33,36,83,82),(10,5,39,25,33,37,85,84),(10,5,40,26,33,37,87,86),(10,5,41,26,34,38,89,88),(10,5,42,26,34,38,91,89),(10,5,43,27,35,39,92,91),(10,5,44,27,35,39,94,93),(10,5,45,27,35,40,96,95),(10,5,46,27,36,41,98,97),(10,5,47,28,36,41,100,99),(10,5,48,28,37,42,102,101),(10,5,49,28,37,43,104,103),(10,5,50,29,37,43,106,106),(10,5,51,29,38,44,108,108),(10,5,52,29,38,44,110,110),(10,5,53,30,39,45,112,112),(10,5,54,30,39,46,114,114),(10,5,55,30,40,46,116,116),(10,5,56,31,40,47,118,118),(10,5,57,31,41,48,120,120),(10,5,58,31,41,48,123,123),(10,5,59,32,42,49,125,125),(10,5,60,32,42,50,127,127),(10,5,61,33,42,51,129,129),(10,5,62,33,43,51,131,131),(10,5,63,33,43,52,133,134),(10,5,64,34,44,53,135,136),(10,5,65,34,44,53,138,138),(10,5,66,34,45,54,140,141),(10,5,67,35,45,55,142,143),(10,5,68,35,46,56,144,145),(10,5,69,36,46,56,147,148),(10,5,70,36,47,57,149,150),(10,5,71,36,48,57,152,153),(10,5,72,37,48,57,155,156),(10,5,73,37,49,58,158,159),(10,5,74,38,49,59,160,163),(10,5,75,38,50,60,163,165),(10,5,76,38,51,61,166,170),(10,5,77,39,51,62,168,175),(10,5,78,39,52,63,172,174),(10,5,79,40,52,64,175,177),(10,5,80,40,53,65,178,180),(10,6,1,18,23,21,24,20),(10,6,2,19,24,22,24,20),(10,6,3,21,25,23,24,21),(10,6,4,22,25,25,24,21),(10,6,5,23,26,26,24,21),(10,6,6,25,27,27,24,21),(10,6,7,26,28,28,24,22),(10,6,8,27,29,29,25,22),(10,6,9,29,29,31,25,22),(10,6,10,30,30,32,25,23),(10,6,11,32,31,33,25,23),(10,6,12,33,32,34,25,23),(10,6,13,34,33,36,25,24),(10,6,14,36,34,37,25,24),(10,6,15,37,35,38,25,24),(10,6,16,39,36,40,25,25),(10,6,17,40,36,41,25,25),(10,6,18,42,37,43,26,25),(10,6,19,43,38,44,26,26),(10,6,20,45,39,45,26,26),(10,6,21,47,40,47,26,26),(10,6,22,48,41,48,26,27),(10,6,23,50,42,50,26,27),(10,6,24,51,43,51,26,28),(10,6,25,53,44,52,27,28),(10,6,26,55,45,54,27,28),(10,6,27,56,46,55,27,29),(10,6,28,58,47,57,27,29),(10,6,29,59,48,58,27,30),(10,6,30,61,49,60,27,30),(10,6,31,63,50,62,27,30),(10,6,32,65,51,63,28,31),(10,6,33,66,52,65,28,31),(10,6,34,68,53,66,28,32),(10,6,35,70,55,68,28,32),(10,6,36,72,56,69,28,33),(10,6,37,73,57,71,29,33),(10,6,38,75,58,73,29,34),(10,6,39,77,59,74,29,34),(10,6,40,79,60,76,29,35),(10,6,41,81,61,78,29,35),(10,6,42,82,62,79,30,35),(10,6,43,84,64,81,30,36),(10,6,44,86,65,83,30,36),(10,6,45,88,66,85,30,37),(10,6,46,90,67,86,30,37),(10,6,47,92,68,88,31,38),(10,6,48,94,69,90,31,38),(10,6,49,96,69,92,31,39),(10,6,50,98,70,93,31,40),(10,6,51,100,71,95,32,40),(10,6,52,102,72,96,32,41),(10,6,53,103,73,97,32,41),(10,6,54,104,74,98,32,41),(10,6,55,105,75,97,33,41),(10,6,56,108,77,100,33,42),(10,6,57,113,78,102,33,42),(10,6,58,115,79,104,34,43),(10,6,59,117,81,106,34,43),(10,6,60,118,82,108,34,44),(10,6,61,119,83,110,34,45),(10,6,62,121,85,112,34,45),(10,6,63,124,86,115,35,46),(10,6,64,127,88,117,35,46),(10,6,65,133,89,119,35,47),(10,6,66,135,91,122,35,48),(10,6,67,139,92,124,36,48),(10,6,68,141,94,126,36,49),(10,6,69,142,95,129,36,50),(10,6,70,145,97,131,36,50),(10,6,71,150,99,134,37,51),(10,6,72,152,100,136,37,52),(10,6,73,155,102,139,37,53),(10,6,74,158,104,141,37,53),(10,6,75,159,105,144,38,54),(10,6,76,160,107,147,38,55),(10,6,77,163,109,149,38,56),(10,6,78,166,110,152,38,56),(10,6,79,169,112,155,39,57),(10,6,80,172,114,158,39,58),(10,8,1,17,22,19,27,21),(10,8,2,17,22,19,28,22),(10,8,3,17,22,20,30,24),(10,8,4,17,22,20,31,25),(10,8,5,17,23,20,32,26),(10,8,6,17,23,20,34,28),(10,8,7,18,23,21,35,29),(10,8,8,18,23,21,37,30),(10,8,9,18,23,21,38,32),(10,8,10,18,23,22,40,33),(10,8,11,18,24,22,41,35),(10,8,12,18,24,22,42,36),(10,8,13,18,24,23,44,37),(10,8,14,18,24,23,45,39),(10,8,15,18,24,23,47,40),(10,8,16,19,24,24,49,42),(10,8,17,19,25,24,50,43),(10,8,18,19,25,24,52,45),(10,8,19,19,25,25,53,46),(10,8,20,19,25,25,55,48),(10,8,21,19,25,26,57,50),(10,8,22,19,26,26,58,51),(10,8,23,20,26,26,60,53),(10,8,24,20,26,27,61,54),(10,8,25,20,26,27,63,56),(10,8,26,20,27,27,65,58),(10,8,27,20,27,28,67,59),(10,8,28,20,27,28,68,61),(10,8,29,21,27,29,70,63),(10,8,30,21,28,29,72,64),(10,8,31,21,28,30,74,66),(10,8,32,21,28,30,75,68),(10,8,33,21,28,30,77,70),(10,8,34,21,29,31,79,71),(10,8,35,22,29,31,81,73),(10,8,36,22,29,32,83,75),(10,8,37,22,29,32,85,77),(10,8,38,22,30,33,86,78),(10,8,39,22,30,33,88,80),(10,8,40,23,30,34,90,82),(10,8,41,23,31,34,92,84),(10,8,42,23,31,35,94,86),(10,8,43,23,31,35,96,88),(10,8,44,23,32,36,98,90),(10,8,45,24,32,36,100,92),(10,8,46,24,32,37,102,93),(10,8,47,24,32,37,104,95),(10,8,48,24,33,38,106,97),(10,8,49,25,33,38,108,99),(10,8,50,25,33,39,110,101),(10,8,51,25,34,39,112,103),(10,8,52,25,34,40,114,105),(10,8,53,25,35,40,117,107),(10,8,54,26,35,41,119,109),(10,8,55,26,35,41,121,111),(10,8,56,26,36,42,123,113),(10,8,57,26,36,42,125,116),(10,8,58,27,36,43,127,118),(10,8,59,27,37,43,130,120),(10,8,60,27,37,44,132,122),(10,8,61,27,37,45,134,124),(10,8,62,28,38,45,136,126),(10,8,63,28,38,46,139,128),(10,8,64,28,39,46,141,131),(10,8,65,29,39,47,143,133),(10,8,66,29,39,48,146,135),(10,8,67,29,40,48,148,137),(10,8,68,29,40,49,150,139),(10,8,69,30,41,49,153,142),(10,8,70,30,41,50,155,144),(10,8,71,30,41,50,158,147),(10,8,72,30,42,51,161,150),(10,8,73,30,42,52,164,153),(10,8,74,31,43,52,167,155),(10,8,75,31,43,53,170,158),(10,8,76,31,43,54,173,161),(10,8,77,32,44,55,176,164),(10,8,78,32,44,55,179,167),(10,8,79,32,45,56,182,170),(10,8,80,33,45,57,185,173),(10,9,1,17,22,20,26,21),(10,9,2,17,22,21,27,22),(10,9,3,18,23,21,28,23),(10,9,4,18,23,22,29,24),(10,9,5,18,23,22,31,26),(10,9,6,18,24,23,32,27),(10,9,7,19,24,23,33,28),(10,9,8,19,25,24,34,29),(10,9,9,19,25,25,36,30),(10,9,10,20,25,25,37,32),(10,9,11,20,26,26,38,33),(10,9,12,20,26,26,39,34),(10,9,13,21,27,27,41,36),(10,9,14,21,27,28,42,37),(10,9,15,21,27,28,43,38),(10,9,16,22,28,29,45,39),(10,9,17,22,28,30,46,41),(10,9,18,23,29,30,47,42),(10,9,19,23,29,31,49,43),(10,9,20,23,30,32,50,45),(10,9,21,24,30,32,51,46),(10,9,22,24,31,33,53,48),(10,9,23,24,31,34,54,49),(10,9,24,25,31,34,56,50),(10,9,25,25,32,35,57,52),(10,9,26,26,32,36,59,53),(10,9,27,26,33,37,60,55),(10,9,28,26,33,37,62,56),(10,9,29,27,34,38,63,58),(10,9,30,27,34,39,65,59),(10,9,31,28,35,40,66,61),(10,9,32,28,36,40,68,62),(10,9,33,29,36,41,69,64),(10,9,34,29,37,42,71,65),(10,9,35,29,37,43,73,67),(10,9,36,30,38,43,74,69),(10,9,37,30,38,44,76,70),(10,9,38,31,39,45,77,72),(10,9,39,31,39,46,79,73),(10,9,40,32,40,47,81,75),(10,9,41,32,41,48,82,77),(10,9,42,33,41,48,84,78),(10,9,43,33,42,49,86,80),(10,9,44,34,42,50,88,82),(10,9,45,34,43,51,89,83),(10,9,46,35,44,52,91,85),(10,9,47,35,44,53,93,87),(10,9,48,36,45,54,95,89),(10,9,49,36,45,54,96,90),(10,9,50,37,46,55,98,92),(10,9,51,37,47,56,100,94),(10,9,52,38,47,57,102,96),(10,9,53,38,48,58,104,97),(10,9,54,39,49,59,105,99),(10,9,55,39,49,60,107,101),(10,9,56,40,50,61,109,103),(10,9,57,40,51,62,111,105),(10,9,58,41,51,63,113,107),(10,9,59,42,52,64,115,108),(10,9,60,42,53,65,117,110),(10,9,61,43,53,66,119,112),(10,9,62,43,54,67,121,114),(10,9,63,44,55,68,123,116),(10,9,64,44,56,69,125,118),(10,9,65,45,56,70,127,120),(10,9,66,46,57,71,129,122),(10,9,67,46,58,72,131,124),(10,9,68,47,58,73,133,126),(10,9,69,47,59,74,135,128),(10,9,70,48,60,75,137,130),(10,9,71,49,61,83,139,141),(10,9,72,50,61,84,142,143),(10,9,73,51,62,84,144,146),(10,9,74,51,63,86,147,149),(10,9,75,52,64,89,149,151),(10,9,76,53,65,90,155,154),(10,9,77,54,66,91,155,157),(10,9,78,54,67,93,157,160),(10,9,79,55,68,94,160,163),(10,9,80,56,69,95,163,165),(11,1,1,24,17,21,21,22),(11,1,2,25,18,22,21,22),(11,1,3,27,19,23,21,23),(11,1,4,28,19,25,21,23),(11,1,5,29,20,26,21,23),(11,1,6,31,21,27,21,23),(11,1,7,32,22,28,21,24),(11,1,8,33,23,29,22,24),(11,1,9,35,24,31,22,24),(11,1,10,36,24,32,22,25),(11,1,11,37,25,33,22,25),(11,1,12,39,26,34,22,25),(11,1,13,40,27,36,22,26),(11,1,14,42,28,37,22,26),(11,1,15,43,29,38,22,26),(11,1,16,45,30,40,22,27),(11,1,17,46,31,41,23,27),(11,1,18,48,32,43,23,27),(11,1,19,49,33,44,23,28),(11,1,20,51,34,45,23,28),(11,1,21,52,34,47,23,28),(11,1,22,54,35,48,23,29),(11,1,23,55,36,50,23,29),(11,1,24,57,37,51,24,30),(11,1,25,59,38,52,24,30),(11,1,26,60,39,54,24,30),(11,1,27,62,40,55,24,31),(11,1,28,63,41,57,24,31),(11,1,29,65,43,58,24,32),(11,1,30,67,44,60,24,32),(11,1,31,69,45,62,25,32),(11,1,32,70,46,63,25,33),(11,1,33,72,47,65,25,33),(11,1,34,74,48,66,25,34),(11,1,35,75,49,68,25,34),(11,1,36,77,50,69,26,35),(11,1,37,79,51,71,26,35),(11,1,38,81,52,73,26,35),(11,1,39,83,53,74,26,36),(11,1,40,84,55,76,26,36),(11,1,41,86,56,78,27,37),(11,1,42,88,57,79,27,37),(11,1,43,90,58,81,27,38),(11,1,44,92,59,83,27,38),(11,1,45,94,60,85,27,39),(11,1,46,96,62,86,28,39),(11,1,47,98,63,88,28,40),(11,1,48,100,64,90,28,40),(11,1,49,102,65,92,28,41),(11,1,50,103,66,93,29,41),(11,1,51,105,68,95,29,42),(11,1,52,107,69,97,29,42),(11,1,53,109,70,99,29,43),(11,1,54,112,71,101,30,44),(11,1,55,114,73,103,30,44),(11,1,56,116,74,104,30,45),(11,1,57,118,75,106,30,45),(11,1,58,120,77,108,31,46),(11,1,59,122,78,110,31,46),(11,1,60,124,79,112,31,47),(11,1,61,126,81,114,31,48),(11,1,62,128,82,116,32,48),(11,1,63,130,83,118,32,49),(11,1,64,133,85,120,32,49),(11,1,65,135,86,122,33,50),(11,1,66,137,87,124,33,51),(11,1,67,139,89,126,33,51),(11,1,68,141,90,128,33,52),(11,1,69,144,92,130,34,52),(11,1,70,146,93,132,34,53),(11,1,71,149,94,134,34,54),(11,1,72,151,96,137,34,55),(11,1,73,154,98,139,34,56),(11,1,74,157,99,142,35,56),(11,1,75,166,101,149,35,57),(11,1,76,172,103,155,35,58),(11,1,77,175,105,159,36,59),(11,1,78,179,106,161,36,59),(11,1,79,182,108,164,36,60),(11,1,80,185,110,167,37,61),(11,2,1,23,17,21,21,23),(11,2,2,24,18,22,22,24),(11,2,3,25,18,23,22,24),(11,2,4,26,19,24,23,25),(11,2,5,27,19,25,24,26),(11,2,6,29,20,26,24,26),(11,2,7,30,21,27,25,27),(11,2,8,31,21,28,26,28),(11,2,9,32,22,29,26,29),(11,2,10,33,22,31,27,29),(11,2,11,34,23,32,28,30),(11,2,12,36,24,33,28,31),(11,2,13,37,24,34,29,32),(11,2,14,38,25,35,30,32),(11,2,15,39,26,36,31,33),(11,2,16,40,26,37,31,34),(11,2,17,42,27,39,32,35),(11,2,18,43,28,40,33,36),(11,2,19,44,28,41,34,37),(11,2,20,46,29,42,34,37),(11,2,21,47,30,44,35,38),(11,2,22,48,31,45,36,39),(11,2,23,50,31,46,37,40),(11,2,24,51,32,47,38,41),(11,2,25,52,33,49,38,42),(11,2,26,54,34,50,39,43),(11,2,27,55,34,51,40,44),(11,2,28,56,35,53,41,44),(11,2,29,58,36,54,42,45),(11,2,30,59,37,55,43,46),(11,2,31,61,37,57,43,47),(11,2,32,62,38,58,44,48),(11,2,33,64,39,59,45,49),(11,2,34,65,40,61,46,50),(11,2,35,67,41,62,47,51),(11,2,36,68,42,64,48,52),(11,2,37,70,42,65,49,53),(11,2,38,71,43,67,50,54),(11,2,39,73,44,68,51,55),(11,2,40,74,45,69,52,56),(11,2,41,76,46,71,53,57),(11,2,42,78,47,72,54,58),(11,2,43,79,47,74,55,59),(11,2,44,81,48,75,56,60),(11,2,45,82,49,77,57,61),(11,2,46,84,50,78,58,62),(11,2,47,86,51,80,59,64),(11,2,48,87,52,82,60,65),(11,2,49,89,53,83,61,66),(11,2,50,91,54,85,62,67),(11,2,51,92,55,86,63,68),(11,2,52,94,56,88,64,69),(11,2,53,96,57,90,65,70),(11,2,54,97,58,91,66,71),(11,2,55,99,59,93,67,73),(11,2,56,101,60,95,68,74),(11,2,57,103,61,96,69,75),(11,2,58,105,62,98,70,76),(11,2,59,106,63,100,71,77),(11,2,60,108,64,101,72,78),(11,2,61,110,65,103,74,80),(11,2,62,112,66,105,75,81),(11,2,63,114,67,106,76,82),(11,2,64,116,68,108,77,83),(11,2,65,117,69,110,78,85),(11,2,66,119,70,112,79,86),(11,2,67,121,71,114,80,87),(11,2,68,123,72,115,82,88),(11,2,69,125,73,117,83,90),(11,2,70,127,74,119,84,91),(11,2,71,130,75,121,87,92),(11,2,72,132,76,124,90,94),(11,2,73,134,77,126,93,96),(11,2,74,137,79,128,97,97),(11,2,75,139,80,130,101,99),(11,2,76,142,81,133,106,100),(11,2,77,144,83,135,108,102),(11,2,78,147,84,137,110,104),(11,2,79,149,85,140,111,105),(11,2,80,152,87,142,113,107),(11,3,1,21,20,20,21,23),(11,3,2,21,21,21,22,24),(11,3,3,22,23,22,22,24),(11,3,4,22,24,23,23,25),(11,3,5,23,25,24,23,25),(11,3,6,23,27,25,24,26),(11,3,7,24,28,26,24,27),(11,3,8,24,30,27,25,27),(11,3,9,25,31,27,26,28),(11,3,10,25,33,28,26,29),(11,3,11,25,34,29,27,29),(11,3,12,26,36,30,28,30),(11,3,13,26,37,31,28,31),(11,3,14,27,39,32,29,32),(11,3,15,27,40,34,30,32),(11,3,16,28,42,35,30,33),(11,3,17,28,43,36,31,34),(11,3,18,29,45,37,32,35),(11,3,19,29,47,38,32,35),(11,3,20,30,48,39,33,36),(11,3,21,31,50,40,34,37),(11,3,22,31,51,41,34,38),(11,3,23,32,53,42,35,38),(11,3,24,32,55,43,36,39),(11,3,25,33,57,44,37,40),(11,3,26,33,58,46,37,41),(11,3,27,34,60,47,38,42),(11,3,28,35,62,48,39,42),(11,3,29,35,63,49,40,43),(11,3,30,36,65,50,40,44),(11,3,31,36,67,52,41,45),(11,3,32,37,69,53,42,46),(11,3,33,38,71,54,43,47),(11,3,34,38,72,55,44,48),(11,3,35,39,74,57,44,48),(11,3,36,39,76,58,45,49),(11,3,37,40,78,59,46,50),(11,3,38,41,80,60,47,51),(11,3,39,41,82,62,48,52),(11,3,40,42,84,63,49,53),(11,3,41,43,86,64,50,54),(11,3,42,43,88,66,50,55),(11,3,43,44,90,67,51,56),(11,3,44,45,91,68,52,57),(11,3,45,45,93,70,53,58),(11,3,46,46,95,71,54,59),(11,3,47,47,98,72,55,60),(11,3,48,48,100,74,56,61),(11,3,49,48,102,75,57,62),(11,3,50,49,104,77,58,63),(11,3,51,50,106,78,59,64),(11,3,52,51,108,79,60,65),(11,3,53,51,110,81,61,66),(11,3,54,52,112,82,61,67),(11,3,55,53,114,84,62,68),(11,3,56,54,116,85,63,69),(11,3,57,54,118,87,64,70),(11,3,58,55,121,88,65,71),(11,3,59,56,123,90,66,72),(11,3,60,57,125,91,67,74),(11,3,61,58,127,93,68,75),(11,3,62,58,130,94,69,76),(11,3,63,59,132,96,71,77),(11,3,64,60,134,97,72,78),(11,3,65,61,136,99,73,79),(11,3,66,62,139,101,74,80),(11,3,67,62,141,102,75,81),(11,3,68,63,143,104,76,83),(11,3,69,64,146,105,77,84),(11,3,70,65,148,107,78,85),(11,3,71,66,151,109,79,86),(11,3,72,67,154,111,80,87),(11,3,73,68,157,113,81,89),(11,3,74,69,160,115,83,90),(11,3,75,70,163,117,84,92),(11,3,76,71,166,119,85,93),(11,3,77,72,169,121,87,95),(11,3,78,73,172,123,88,96),(11,3,79,74,175,125,89,98),(11,3,80,75,178,127,91,99),(11,5,1,21,17,19,23,25),(11,5,2,21,17,19,24,26),(11,5,3,21,17,20,26,28),(11,5,4,21,18,20,27,29),(11,5,5,22,18,20,28,30),(11,5,6,22,18,21,30,32),(11,5,7,22,18,21,31,33),(11,5,8,22,19,22,32,35),(11,5,9,22,19,22,34,36),(11,5,10,22,19,22,35,38),(11,5,11,23,19,23,37,39),(11,5,12,23,20,23,38,41),(11,5,13,23,20,24,39,42),(11,5,14,23,20,24,41,44),(11,5,15,23,20,25,42,45),(11,5,16,24,21,25,44,47),(11,5,17,24,21,25,45,48),(11,5,18,24,21,26,47,50),(11,5,19,24,22,26,48,51),(11,5,20,24,22,27,50,53),(11,5,21,25,22,27,51,55),(11,5,22,25,22,28,53,56),(11,5,23,25,23,28,55,58),(11,5,24,25,23,29,56,60),(11,5,25,25,23,29,58,61),(11,5,26,26,24,30,60,63),(11,5,27,26,24,30,61,65),(11,5,28,26,24,31,63,66),(11,5,29,26,25,31,65,68),(11,5,30,27,25,32,66,70),(11,5,31,27,25,32,68,72),(11,5,32,27,26,33,70,73),(11,5,33,27,26,33,71,75),(11,5,34,28,26,34,73,77),(11,5,35,28,27,34,75,79),(11,5,36,28,27,35,77,81),(11,5,37,29,28,35,79,83),(11,5,38,29,28,36,80,85),(11,5,39,29,28,37,82,86),(11,5,40,29,29,37,84,88),(11,5,41,30,29,38,86,90),(11,5,42,30,29,38,88,92),(11,5,43,30,30,39,90,94),(11,5,44,31,30,39,91,96),(11,5,45,31,31,40,93,98),(11,5,46,31,31,41,95,100),(11,5,47,32,31,41,97,102),(11,5,48,32,32,42,99,104),(11,5,49,32,32,43,101,106),(11,5,50,33,33,43,103,108),(11,5,51,33,33,44,105,110),(11,5,52,33,34,44,107,113),(11,5,53,34,34,45,109,115),(11,5,54,34,34,46,111,117),(11,5,55,34,35,46,113,119),(11,5,56,35,35,47,115,121),(11,5,57,35,36,48,118,123),(11,5,58,35,36,48,120,126),(11,5,59,36,37,49,122,128),(11,5,60,36,37,50,124,130),(11,5,61,36,38,51,126,132),(11,5,62,37,38,51,128,134),(11,5,63,37,39,52,130,137),(11,5,64,38,39,53,133,139),(11,5,65,38,40,53,135,141),(11,5,66,38,40,54,137,144),(11,5,67,39,40,55,139,146),(11,5,68,39,41,56,141,148),(11,5,69,40,41,56,144,151),(11,5,70,40,42,57,146,153),(11,5,71,40,43,58,149,156),(11,5,72,41,43,58,155,159),(11,5,73,41,44,59,157,160),(11,5,74,42,44,61,160,163),(11,5,75,42,45,62,164,166),(11,5,76,42,46,62,167,169),(11,5,77,43,46,63,168,172),(11,5,78,43,47,64,169,177),(11,5,79,44,47,65,172,180),(11,5,80,44,48,66,175,183),(11,6,1,24,17,21,21,22),(11,6,2,25,18,22,21,22),(11,6,3,27,19,23,21,23),(11,6,4,28,19,25,21,23),(11,6,5,29,20,26,21,23),(11,6,6,31,21,27,21,23),(11,6,7,32,22,28,21,24),(11,6,8,33,23,29,22,24),(11,6,9,35,24,31,22,24),(11,6,10,36,24,32,22,25),(11,6,11,37,25,33,22,25),(11,6,12,39,26,34,22,25),(11,6,13,40,27,36,22,26),(11,6,14,42,28,37,22,26),(11,6,15,43,29,38,22,26),(11,6,16,45,30,40,22,27),(11,6,17,46,31,41,23,27),(11,6,18,48,32,43,23,27),(11,6,19,49,33,44,23,28),(11,6,20,51,34,45,23,28),(11,6,21,52,34,47,23,28),(11,6,22,54,35,48,23,29),(11,6,23,55,36,50,23,29),(11,6,24,57,37,51,24,30),(11,6,25,59,38,52,24,30),(11,6,26,60,39,54,24,30),(11,6,27,62,40,55,24,31),(11,6,28,63,41,57,24,31),(11,6,29,65,43,58,24,32),(11,6,30,67,44,60,24,32),(11,6,31,69,45,62,25,32),(11,6,32,70,46,63,25,33),(11,6,33,72,47,65,25,33),(11,6,34,74,48,66,25,34),(11,6,35,75,49,68,25,34),(11,6,36,77,50,69,26,35),(11,6,37,79,51,71,26,35),(11,6,38,81,52,73,26,35),(11,6,39,83,53,74,26,36),(11,6,40,84,55,76,26,36),(11,6,41,86,56,78,27,37),(11,6,42,88,57,79,27,37),(11,6,43,90,58,81,27,38),(11,6,44,92,59,83,27,38),(11,6,45,94,60,85,27,39),(11,6,46,96,62,86,28,39),(11,6,47,98,63,88,28,40),(11,6,48,100,64,90,28,40),(11,6,49,102,65,92,28,41),(11,6,50,103,65,93,29,41),(11,6,51,105,66,94,29,42),(11,6,52,106,67,95,29,42),(11,6,53,107,68,96,29,43),(11,6,54,108,69,97,30,44),(11,6,55,109,70,98,30,44),(11,6,56,112,72,101,30,45),(11,6,57,114,73,103,30,45),(11,6,58,117,74,105,31,46),(11,6,59,119,76,107,31,46),(11,6,60,121,77,109,31,47),(11,6,61,123,78,111,31,48),(11,6,62,126,80,113,31,48),(11,6,63,128,81,116,32,49),(11,6,64,131,83,118,32,49),(11,6,65,136,84,120,32,50),(11,6,66,140,86,123,32,51),(11,6,67,141,87,125,33,51),(11,6,68,141,89,127,33,52),(11,6,69,144,90,130,33,53),(11,6,70,147,92,132,33,53),(11,6,71,150,94,135,34,54),(11,6,72,152,95,137,34,55),(11,6,73,155,97,140,34,56),(11,6,74,162,99,142,34,56),(11,6,75,165,100,145,35,57),(11,6,76,167,102,146,35,58),(11,6,77,169,104,150,35,59),(11,6,78,170,105,152,35,59),(11,6,79,173,107,156,36,60),(11,6,80,176,109,159,36,61),(11,7,1,22,17,20,22,24),(11,7,2,23,17,21,23,25),(11,7,3,24,18,22,24,26),(11,7,4,25,18,23,25,27),(11,7,5,25,19,24,26,28),(11,7,6,26,19,25,27,29),(11,7,7,27,20,26,28,30),(11,7,8,28,20,27,28,31),(11,7,9,29,21,28,29,32),(11,7,10,30,21,29,30,33),(11,7,11,31,22,30,31,35),(11,7,12,32,22,31,32,36),(11,7,13,33,23,32,33,37),(11,7,14,34,23,33,34,38),(11,7,15,34,24,35,35,39),(11,7,16,35,24,36,36,40),(11,7,17,36,25,37,38,42),(11,7,18,37,25,38,39,43),(11,7,19,38,26,39,40,44),(11,7,20,39,26,40,41,45),(11,7,21,40,27,41,42,46),(11,7,22,41,27,43,43,48),(11,7,23,43,28,44,44,49),(11,7,24,44,28,45,45,50),(11,7,25,45,29,46,46,51),(11,7,26,46,30,47,48,53),(11,7,27,47,30,49,49,54),(11,7,28,48,31,50,50,55),(11,7,29,49,31,51,51,57),(11,7,30,50,32,53,52,58),(11,7,31,51,33,54,53,59),(11,7,32,52,33,55,55,61),(11,7,33,53,34,56,56,62),(11,7,34,55,34,58,57,64),(11,7,35,56,35,59,58,65),(11,7,36,57,36,60,60,66),(11,7,37,58,36,62,61,68),(11,7,38,59,37,63,62,69),(11,7,39,61,38,65,63,71),(11,7,40,62,38,66,65,72),(11,7,41,63,39,67,66,74),(11,7,42,64,40,69,67,75),(11,7,43,65,40,70,69,77),(11,7,44,67,41,72,70,78),(11,7,45,68,42,73,71,80),(11,7,46,69,42,75,73,81),(11,7,47,71,43,76,74,83),(11,7,48,72,44,78,76,84),(11,7,49,73,45,79,77,86),(11,7,50,74,45,81,78,88),(11,7,51,76,46,82,80,89),(11,7,52,77,47,84,81,91),(11,7,53,78,47,85,83,92),(11,7,54,80,48,87,84,94),(11,7,55,81,49,88,86,96),(11,7,56,83,50,90,87,97),(11,7,57,84,50,91,89,99),(11,7,58,85,51,93,90,101),(11,7,59,87,52,95,92,102),(11,7,60,88,53,96,93,104),(11,7,61,90,54,98,95,106),(11,7,62,91,54,99,96,108),(11,7,63,93,55,101,98,109),(11,7,64,94,56,103,99,111),(11,7,65,95,57,104,101,113),(11,7,66,97,58,106,103,115),(11,7,67,98,58,108,104,117),(11,7,68,100,59,110,106,118),(11,7,69,101,60,111,107,120),(11,7,70,103,61,113,109,122),(11,7,71,104,62,115,122,124),(11,7,72,106,63,117,124,127),(11,7,73,108,64,119,126,129),(11,7,74,110,65,122,128,131),(11,7,75,112,66,124,130,133),(11,7,76,114,67,126,133,136),(11,7,77,115,68,128,135,138),(11,7,78,117,69,130,137,140),(11,7,79,119,70,133,139,143),(11,7,80,121,71,135,141,145),(11,8,1,21,17,19,24,24),(11,8,2,21,17,19,25,25),(11,8,3,21,17,20,27,27),(11,8,4,21,17,20,28,28),(11,8,5,21,18,20,29,29),(11,8,6,21,18,20,31,31),(11,8,7,21,18,21,32,32),(11,8,8,22,18,21,34,33),(11,8,9,22,18,21,35,35),(11,8,10,22,19,22,37,36),(11,8,11,22,19,22,38,37),(11,8,12,22,19,22,40,39),(11,8,13,22,19,23,41,40),(11,8,14,22,19,23,43,42),(11,8,15,22,19,23,44,43),(11,8,16,22,20,24,46,45),(11,8,17,23,20,24,47,46),(11,8,18,23,20,24,49,48),(11,8,19,23,20,25,50,49),(11,8,20,23,21,25,52,51),(11,8,21,23,21,26,54,52),(11,8,22,23,21,26,55,54),(11,8,23,23,21,26,57,56),(11,8,24,24,21,27,59,57),(11,8,25,24,22,27,60,59),(11,8,26,24,22,27,62,60),(11,8,27,24,22,28,64,62),(11,8,28,24,22,28,65,64),(11,8,29,24,23,29,67,65),(11,8,30,24,23,29,69,67),(11,8,31,25,23,30,71,69),(11,8,32,25,23,30,73,71),(11,8,33,25,24,30,74,72),(11,8,34,25,24,31,76,74),(11,8,35,25,24,31,78,76),(11,8,36,26,24,32,80,78),(11,8,37,26,25,32,82,79),(11,8,38,26,25,33,84,81),(11,8,39,26,25,33,86,83),(11,8,40,26,26,34,87,85),(11,8,41,27,26,34,89,87),(11,8,42,27,26,35,91,89),(11,8,43,27,27,35,93,91),(11,8,44,27,27,36,95,92),(11,8,45,27,27,36,97,94),(11,8,46,28,27,37,99,96),(11,8,47,28,28,37,101,98),(11,8,48,28,28,38,103,100),(11,8,49,28,28,38,105,102),(11,8,50,29,29,39,107,104),(11,8,51,29,29,39,110,106),(11,8,52,29,29,40,112,108),(11,8,53,29,30,40,114,110),(11,8,54,30,30,41,116,112),(11,8,55,30,30,41,118,114),(11,8,56,30,31,42,120,116),(11,8,57,30,31,42,122,118),(11,8,58,31,31,43,125,121),(11,8,59,31,32,43,127,123),(11,8,60,31,32,44,129,125),(11,8,61,31,33,45,131,127),(11,8,62,32,33,45,133,129),(11,8,63,32,33,46,136,131),(11,8,64,32,34,46,138,134),(11,8,65,33,34,47,140,136),(11,8,66,33,34,48,143,138),(11,8,67,33,35,48,145,140),(11,8,68,33,35,49,147,142),(11,8,69,34,36,49,150,145),(11,8,70,34,36,50,152,147),(11,8,71,34,36,51,155,150),(11,8,72,34,37,52,161,153),(11,8,73,34,37,53,161,156),(11,8,74,35,38,53,164,158),(11,8,75,35,38,54,167,161),(11,8,76,35,38,55,170,164),(11,8,77,36,39,56,173,167),(11,8,78,36,39,56,176,170),(11,8,79,36,40,57,179,173),(11,8,80,37,40,58,182,176);
/*!40000 ALTER TABLE `player_levelstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_xp_for_level`
--

DROP TABLE IF EXISTS `player_xp_for_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `player_xp_for_level` (
  `lvl` int(3) unsigned NOT NULL,
  `xp_for_next_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `player_xp_for_level`
--

LOCK TABLES `player_xp_for_level` WRITE;
/*!40000 ALTER TABLE `player_xp_for_level` DISABLE KEYS */;
INSERT INTO `player_xp_for_level` VALUES (1,400),(2,900),(3,1400),(4,2100),(5,2800),(6,3600),(7,4500),(8,5400),(9,6500),(10,7600),(11,8700),(12,9800),(13,11000),(14,12300),(15,13600),(16,15000),(17,16400),(18,17800),(19,19300),(20,20800),(21,22400),(22,24000),(23,25500),(24,27200),(25,28900),(26,30500),(27,32200),(28,33900),(29,36300),(30,38800),(31,41600),(32,44600),(33,48000),(34,51400),(35,55000),(36,58700),(37,62400),(38,66200),(39,70200),(40,74300),(41,78500),(42,82800),(43,87100),(44,91600),(45,96300),(46,101000),(47,105800),(48,110700),(49,115700),(50,120900),(51,126100),(52,131500),(53,137000),(54,142500),(55,148200),(56,154000),(57,159900),(58,165800),(59,172000),(60,290000),(61,317000),(62,349000),(63,386000),(64,428000),(65,475000),(66,527000),(67,585000),(68,648000),(69,717000),(70,1523800),(71,1539600),(72,1555700),(73,1571800),(74,1587900),(75,1604200),(76,1620700),(77,1637400),(78,1653900),(79,1670800);
/*!40000 ALTER TABLE `player_xp_for_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playercreateinfo`
--

DROP TABLE IF EXISTS `playercreateinfo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playercreateinfo`
--

LOCK TABLES `playercreateinfo` WRITE;
/*!40000 ALTER TABLE `playercreateinfo` DISABLE KEYS */;
INSERT INTO `playercreateinfo` VALUES (1,1,0,12,-8949,-132,84),(1,2,0,12,-8949,-132,84),(1,4,0,12,-8949,-132,84),(1,5,0,12,-8949,-132,84),(1,6,609,4298,2355.84,-5664.77,426.028),(1,8,0,12,-8949,-132,84),(1,9,0,12,-8949,-132,84),(2,1,1,14,-618,-4251,39),(2,3,1,14,-618,-4251,39),(2,4,1,14,-618,-4251,39),(2,6,609,4298,2358.44,-5666.9,426.023),(2,7,1,14,-618,-4251,39),(2,9,1,14,-618,-4251,39),(3,1,0,1,-6240,331,383),(3,2,0,1,-6240,331,383),(3,3,0,1,-6240,331,383),(3,4,0,1,-6240,331,383),(3,5,0,1,-6240,331,383),(3,6,609,4298,2358.44,-5666.9,426.023),(4,1,1,141,10311,832,1327),(4,3,1,141,10311,832,1327),(4,4,1,141,10311,832,1327),(4,5,1,141,10311,832,1327),(4,6,609,4298,2356.21,-5662.21,426.026),(4,11,1,141,10311,832,1327),(5,1,0,85,1676,1677,122),(5,4,0,85,1676,1677,122),(5,5,0,85,1676,1677,122),(5,8,0,85,1676,1677,122),(5,9,0,85,1676,1677,122),(5,6,609,4298,2356.21,-5662.21,426.026),(6,1,1,215,-2917,-257,53),(6,3,1,215,-2917,-257,53),(6,6,609,4298,2358.17,-5663.21,426.027),(6,7,1,215,-2917,-257,53),(6,11,1,215,-2917,-257,53),(7,1,0,1,-6240,331,383),(7,4,0,1,-6240,331,383),(7,6,609,4298,2355.05,-5661.7,426.026),(7,8,0,1,-6240,331,383),(7,9,0,1,-6240,331,383),(8,1,1,14,-618,-4251,39),(8,3,1,14,-618,-4251,39),(8,4,1,14,-618,-4251,39),(8,5,1,14,-618,-4251,39),(8,6,609,4298,2355.05,-5661.7,426.026),(8,7,1,14,-618,-4251,39),(8,8,1,14,-618,-4251,39),(10,2,530,3431,10349.6,-6357.29,33.4026),(10,3,530,3431,10349.6,-6357.29,33.4026),(10,4,530,3431,10349.6,-6357.29,33.4026),(10,5,530,3431,10349.6,-6357.29,33.4026),(10,6,609,4298,2355.84,-5664.77,426.028),(10,8,530,3431,10349.6,-6357.29,33.4026),(10,9,530,3431,10349.6,-6357.29,33.4026),(11,1,530,3526,-3961.64,-13931.2,100.615),(11,2,530,3526,-3961.64,-13931.2,100.615),(11,3,530,3526,-3961.64,-13931.2,100.615),(11,5,530,3526,-3961.64,-13931.2,100.615),(11,6,609,4298,2358.17,-5663.21,426.027),(11,7,530,3526,-3961.64,-13931.2,100.615),(11,8,530,3526,-3961.64,-13931.2,100.615);
/*!40000 ALTER TABLE `playercreateinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playercreateinfo_action`
--

DROP TABLE IF EXISTS `playercreateinfo_action`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `misc` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playercreateinfo_action`
--

LOCK TABLES `playercreateinfo_action` WRITE;
/*!40000 ALTER TABLE `playercreateinfo_action` DISABLE KEYS */;
INSERT INTO `playercreateinfo_action` VALUES (1,1,1,78,0,0),(1,1,0,6603,0,0),(1,1,11,117,128,0),(1,2,2,635,0,0),(1,2,0,6603,0,0),(1,2,1,21084,0,0),(1,2,10,159,128,0),(1,2,11,2070,128,0),(1,4,1,1752,0,0),(1,4,2,2098,0,0),(1,4,3,2764,0,0),(1,4,0,6603,0,0),(1,4,11,2070,128,0),(1,5,1,585,0,0),(1,5,2,2050,0,0),(1,5,0,6603,0,0),(1,5,10,159,128,0),(1,5,11,2070,128,0),(1,6,0,6603,0,0),(1,6,1,49576,0,0),(1,6,2,45477,0,0),(1,6,3,45462,0,0),(1,6,4,45902,0,0),(1,6,5,47541,0,0),(1,6,11,59752,0,0),(1,8,1,133,0,0),(1,8,2,168,0,0),(1,8,0,6603,0,0),(1,8,10,159,128,0),(1,8,11,2070,128,0),(1,9,1,686,0,0),(1,9,2,687,0,0),(1,9,0,6603,0,0),(1,9,10,159,128,0),(1,9,11,4604,128,0),(2,1,1,78,0,0),(2,1,0,6603,0,0),(2,1,11,117,128,0),(2,3,2,75,0,0),(2,3,1,2973,0,0),(2,3,0,6603,0,0),(2,3,11,117,128,0),(2,3,10,159,128,0),(2,4,10,0,128,0),(2,4,1,1752,0,0),(2,4,2,2098,0,0),(2,4,0,6603,0,0),(2,4,11,117,128,0),(2,6,0,6603,0,0),(2,6,1,49576,0,0),(2,6,2,45477,0,0),(2,6,3,45462,0,0),(2,6,4,45902,0,0),(2,6,5,47541,0,0),(2,6,10,20572,0,0),(2,7,2,331,0,0),(2,7,1,403,0,0),(2,7,0,6603,0,0),(2,7,11,117,128,0),(2,7,10,159,128,0),(2,9,1,686,0,0),(2,9,2,687,0,0),(2,9,0,6603,0,0),(2,9,11,117,128,0),(2,9,10,159,128,0),(3,1,1,78,0,0),(3,1,0,6603,0,0),(3,1,11,117,128,0),(3,2,2,635,0,0),(3,2,0,6603,0,0),(3,2,1,21084,0,0),(3,2,10,159,128,0),(3,2,11,4540,128,0),(3,3,2,75,0,0),(3,3,1,2973,0,0),(3,3,0,6603,0,0),(3,3,11,117,128,0),(3,3,10,159,128,0),(3,4,1,1752,0,0),(3,4,2,2098,0,0),(3,4,3,2764,0,0),(3,4,0,6603,0,0),(3,4,11,4540,128,0),(3,5,1,585,0,0),(3,5,2,2050,0,0),(3,5,0,6603,0,0),(3,5,10,159,128,0),(3,5,11,4540,128,0),(3,6,0,6603,0,0),(3,6,1,49576,0,0),(3,6,2,45477,0,0),(3,6,3,45462,0,0),(3,6,4,45902,0,0),(3,6,5,47541,0,0),(3,6,10,2481,0,0),(4,1,1,78,0,0),(4,1,0,6603,0,0),(4,1,11,117,128,0),(4,3,2,75,0,0),(4,3,1,2973,0,0),(4,3,0,6603,0,0),(4,3,11,117,128,0),(4,3,10,159,128,0),(4,4,1,1752,0,0),(4,4,2,2098,0,0),(4,4,3,2764,0,0),(4,4,0,6603,0,0),(4,4,11,4540,128,0),(4,5,1,585,0,0),(4,5,2,2050,0,0),(4,5,0,6603,0,0),(4,5,10,159,128,0),(4,5,11,2070,128,0),(4,6,0,6603,0,0),(4,6,1,49576,0,0),(4,6,2,45477,0,0),(4,6,3,45462,0,0),(4,6,4,45902,0,0),(4,6,5,47541,0,0),(4,6,10,58984,0,0),(4,6,83,58984,0,0),(4,11,1,5176,0,0),(4,11,2,5185,0,0),(4,11,0,6603,0,0),(4,11,10,159,128,0),(4,11,11,4536,128,0),(5,1,11,4604,128,0),(5,1,0,6603,0,0),(5,1,1,78,0,0),(5,4,11,4604,128,0),(5,4,3,2764,0,0),(5,4,2,2098,0,0),(5,4,1,1752,0,0),(5,4,0,6603,0,0),(5,5,10,159,128,0),(5,5,2,2050,0,0),(5,5,1,585,0,0),(5,5,11,4604,128,0),(5,5,0,6603,0,0),(5,6,0,6603,0,0),(5,6,1,49576,0,0),(5,6,2,45477,0,0),(5,6,3,45462,0,0),(5,6,4,45902,0,0),(5,6,5,47541,0,0),(5,6,10,20577,0,0),(5,8,11,4604,128,0),(5,8,10,159,128,0),(5,8,2,168,0,0),(5,8,1,133,0,0),(5,8,0,6603,0,0),(5,9,1,686,0,0),(5,9,10,159,128,0),(5,9,2,687,0,0),(5,9,11,4604,128,0),(5,9,0,6603,0,0),(6,1,1,78,0,0),(6,1,2,20549,0,0),(6,1,11,4540,128,0),(6,1,0,6603,0,0),(6,3,1,2973,0,0),(6,3,10,159,128,0),(6,3,2,75,0,0),(6,3,3,20549,0,0),(6,3,11,117,128,0),(6,3,0,6603,0,0),(6,6,0,6603,0,0),(6,6,1,49576,0,0),(6,6,2,45477,0,0),(6,6,3,45462,0,0),(6,6,4,45902,0,0),(6,6,5,47541,0,0),(6,6,10,20549,0,0),(6,6,75,20549,0,0),(6,7,1,403,0,0),(6,7,10,159,128,0),(6,7,2,331,0,0),(6,7,3,20549,0,0),(6,7,11,4604,128,0),(6,7,0,6603,0,0),(6,11,1,5176,0,0),(6,11,10,159,128,0),(6,11,2,5185,0,0),(6,11,3,20549,0,0),(6,11,11,4536,128,0),(6,11,0,6603,0,0),(7,1,11,117,128,0),(7,1,1,78,0,0),(7,1,0,6603,0,0),(7,4,11,117,128,0),(7,4,3,2764,0,0),(7,4,1,1752,0,0),(7,4,2,2098,0,0),(7,4,0,6603,0,0),(7,6,0,6603,0,0),(7,6,1,49576,0,0),(7,6,2,45477,0,0),(7,6,3,45462,0,0),(7,6,4,45902,0,0),(7,6,5,47541,0,0),(7,6,10,20589,0,0),(7,6,72,6603,0,0),(7,6,83,117,128,0),(7,6,84,6603,0,0),(7,6,96,6603,0,0),(7,6,108,6603,0,0),(7,8,11,4536,128,0),(7,8,1,133,0,0),(7,8,2,168,0,0),(7,8,10,159,128,0),(7,8,0,6603,0,0),(7,9,11,4604,128,0),(7,9,1,686,0,0),(7,9,2,687,0,0),(7,9,10,159,128,0),(7,9,0,6603,0,0),(8,1,11,117,128,0),(8,1,1,78,0,0),(8,1,3,2764,0,0),(8,1,0,6603,0,0),(8,3,10,159,128,0),(8,3,11,4604,128,0),(8,3,1,2973,0,0),(8,3,2,75,0,0),(8,3,0,6603,0,0),(8,4,1,1752,0,0),(8,4,3,2764,0,0),(8,4,2,2098,0,0),(8,4,11,117,128,0),(8,4,0,6603,0,0),(8,5,1,585,0,0),(8,5,10,159,128,0),(8,5,2,2050,0,0),(8,5,11,4540,128,0),(8,5,0,6603,0,0),(8,6,0,6603,0,0),(8,6,1,49576,0,0),(8,6,2,45477,0,0),(8,6,3,45462,0,0),(8,6,4,45902,0,0),(8,6,5,47541,0,0),(8,6,10,50621,0,0),(8,7,1,403,0,0),(8,7,10,159,128,0),(8,7,2,331,0,0),(8,7,11,117,128,0),(8,7,0,6603,0,0),(8,8,1,133,0,0),(8,8,10,159,128,0),(8,8,2,168,0,0),(8,8,11,117,128,0),(8,8,0,6603,0,0),(10,2,0,6603,0,0),(10,2,1,21084,0,0),(10,2,2,635,0,0),(10,2,3,28734,0,0),(10,2,4,28730,0,0),(10,2,10,159,128,0),(10,2,11,20857,128,0),(10,3,0,6603,0,0),(10,3,1,2973,0,0),(10,3,2,75,0,0),(10,3,3,28734,0,0),(10,3,4,28730,0,0),(10,3,10,159,128,0),(10,3,11,20857,128,0),(10,4,0,6603,0,0),(10,4,1,1752,0,0),(10,4,2,2098,0,0),(10,4,3,2764,0,0),(10,4,4,28734,0,0),(10,4,5,25046,0,0),(10,4,11,20857,128,0),(10,5,0,6603,0,0),(10,5,1,585,0,0),(10,5,2,2050,0,0),(10,5,3,28734,0,0),(10,5,4,28730,0,0),(10,5,10,159,128,0),(10,5,11,20857,128,0),(10,6,0,6603,0,0),(10,6,1,49576,0,0),(10,6,2,45477,0,0),(10,6,3,45462,0,0),(10,6,4,45902,0,0),(10,6,5,47541,0,0),(10,6,6,50613,0,0),(10,8,0,6603,0,0),(10,8,1,133,0,0),(10,8,2,168,0,0),(10,8,3,28734,0,0),(10,8,4,28730,0,0),(10,8,10,159,128,0),(10,8,11,20857,128,0),(10,9,11,20857,128,0),(10,9,10,159,128,0),(10,9,4,28730,0,0),(10,9,3,28734,0,0),(10,9,2,687,0,0),(10,9,1,686,0,0),(10,9,0,6603,0,0),(11,1,0,6603,0,0),(11,1,72,6603,0,0),(11,1,73,78,0,0),(11,1,74,28880,0,0),(11,1,83,4540,128,0),(11,1,84,6603,0,0),(11,1,96,6603,0,0),(11,1,108,6603,0,0),(11,2,0,6603,0,0),(11,2,1,21084,0,0),(11,2,2,635,0,0),(11,2,3,59542,0,0),(11,2,10,159,128,0),(11,2,11,4540,128,0),(11,2,83,4540,128,0),(11,3,0,6603,0,0),(11,3,1,2973,0,0),(11,3,2,75,0,0),(11,3,3,59543,0,0),(11,3,10,159,128,0),(11,3,11,4540,128,0),(11,3,72,6603,0,0),(11,3,73,2973,0,0),(11,3,74,75,0,0),(11,3,82,159,128,0),(11,3,83,4540,128,0),(11,5,0,6603,0,0),(11,5,1,585,0,0),(11,5,2,2050,0,0),(11,5,3,59544,0,0),(11,5,10,159,128,0),(11,5,11,4540,128,0),(11,5,83,4540,128,0),(11,6,0,6603,0,0),(11,6,1,49576,0,0),(11,6,2,45477,0,0),(11,6,3,45462,0,0),(11,6,4,45902,0,0),(11,6,5,47541,0,0),(11,6,6,59545,0,0),(11,7,0,6603,0,0),(11,7,1,403,0,0),(11,7,2,331,0,0),(11,7,3,59547,0,0),(11,7,10,159,128,0),(11,7,11,4540,128,0),(11,8,0,6603,0,0),(11,8,1,133,0,0),(11,8,2,168,0,0),(11,8,3,59548,0,0),(11,8,10,159,128,0),(11,8,11,4540,128,0),(11,8,83,4540,128,0);
/*!40000 ALTER TABLE `playercreateinfo_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playercreateinfo_item`
--

DROP TABLE IF EXISTS `playercreateinfo_item`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playercreateinfo_item`
--

LOCK TABLES `playercreateinfo_item` WRITE;
/*!40000 ALTER TABLE `playercreateinfo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `playercreateinfo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playercreateinfo_spell`
--

DROP TABLE IF EXISTS `playercreateinfo_spell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `playercreateinfo_spell`
--

LOCK TABLES `playercreateinfo_spell` WRITE;
/*!40000 ALTER TABLE `playercreateinfo_spell` DISABLE KEYS */;
INSERT INTO `playercreateinfo_spell` VALUES (1,1,78,'Heroic Strike'),(1,1,81,'Dodge'),(1,1,107,'Block'),(1,1,196,'One-Handed Axes'),(1,1,198,'One-Handed Maces'),(1,1,201,'One-Handed Swords'),(1,1,203,'Unarmed'),(1,1,204,'Defense'),(1,1,522,'SPELLDEFENSE (DND)'),(1,1,668,'Language Common'),(1,1,1843,'Disarm'),(1,1,2382,'Generic'),(1,1,2457,'Battle Stance'),(1,1,2479,'Honorless Target'),(1,1,3050,'Detect'),(1,1,3365,'Opening'),(1,1,5301,'Defensive State (DND)'),(1,1,6233,'Closing'),(1,1,6246,'Closing'),(1,1,6247,'Opening'),(1,1,6477,'Opening'),(1,1,6478,'Opening'),(1,1,6603,'Attack'),(1,1,7266,'Duel'),(1,1,7267,'Grovel'),(1,1,7355,'Stuck'),(1,1,8386,'Attacking'),(1,1,8737,'Mail'),(1,1,9077,'Leather'),(1,1,9078,'Cloth'),(1,1,9116,'Shield'),(1,1,9125,'Generic'),(1,1,20597,'Sword Specialization'),(1,1,20598,'The Human Spirit'),(1,1,20599,'Diplomacy'),(1,1,20864,'Mace Specialization'),(1,1,21651,'Opening'),(1,1,21652,'Closing'),(1,1,22027,'Remove Insignia'),(1,1,22810,'Opening - No Text'),(1,1,32215,'Victorious State'),(1,1,45927,'Summon Friend'),(1,1,58985,'Perception'),(1,1,59752,'Every Man for Himself'),(1,1,61437,'Opening'),(1,2,81,'Dodge'),(1,2,107,'Block'),(1,2,198,'One-Handed Maces'),(1,2,199,'Two-Handed Maces'),(1,2,203,'Unarmed'),(1,2,204,'Defense'),(1,2,522,'SPELLDEFENSE (DND)'),(1,2,635,'Holy Light'),(1,2,668,'Language Common'),(1,2,1843,'Disarm'),(1,2,2382,'Generic'),(1,2,2479,'Honorless Target'),(1,2,3050,'Detect'),(1,2,3365,'Opening'),(1,2,6233,'Closing'),(1,2,6246,'Closing'),(1,2,6247,'Opening'),(1,2,6477,'Opening'),(1,2,6478,'Opening'),(1,2,6603,'Attack'),(1,2,7266,'Duel'),(1,2,7267,'Grovel'),(1,2,7355,'Stuck'),(1,2,8386,'Attacking'),(1,2,8737,'Mail'),(1,2,9077,'Leather'),(1,2,9078,'Cloth'),(1,2,9116,'Shield'),(1,2,9125,'Generic'),(1,2,20154,'Seal of Righteousness'),(1,2,20597,'Sword Specialization'),(1,2,20598,'The Human Spirit'),(1,2,20599,'Diplomacy'),(1,2,20864,'Mace Specialization'),(1,2,21651,'Opening'),(1,2,21652,'Closing'),(1,2,22027,'Remove Insignia'),(1,2,22810,'Opening - No Text'),(1,2,27762,'Libram'),(1,2,45927,'Summon Friend'),(1,2,58985,'Perception'),(1,2,59752,'Every Man for Himself'),(1,2,61437,'Opening'),(1,4,81,'Dodge'),(1,4,203,'Unarmed'),(1,4,204,'Defense'),(1,4,522,'SPELLDEFENSE (DND)'),(1,4,668,'Language Common'),(1,4,1180,'Daggers'),(1,4,1752,'Sinister Strike'),(1,4,1843,'Disarm'),(1,4,2098,'Eviscerate'),(1,4,2382,'Generic'),(1,4,2479,'Honorless Target'),(1,4,2567,'Thrown'),(1,4,2764,'Throw'),(1,4,3050,'Detect'),(1,4,3365,'Opening'),(1,4,6233,'Closing'),(1,4,6246,'Closing'),(1,4,6247,'Opening'),(1,4,6477,'Opening'),(1,4,6478,'Opening'),(1,4,6603,'Attack'),(1,4,7266,'Duel'),(1,4,7267,'Grovel'),(1,4,7355,'Stuck'),(1,4,8386,'Attacking'),(1,4,9077,'Leather'),(1,4,9078,'Cloth'),(1,4,9125,'Generic'),(1,4,16092,'Defensive State (DND)'),(1,4,20597,'Sword Specialization'),(1,4,20598,'The Human Spirit'),(1,4,20599,'Diplomacy'),(1,4,20864,'Mace Specialization'),(1,4,21184,'Rogue Passive (DND)'),(1,4,21651,'Opening'),(1,4,21652,'Closing'),(1,4,22027,'Remove Insignia'),(1,4,22810,'Opening - No Text'),(1,4,45927,'Summon Friend'),(1,4,58985,'Perception'),(1,4,59752,'Every Man for Himself'),(1,4,61437,'Opening'),(1,5,81,'Dodge'),(1,5,198,'One-Handed Maces'),(1,5,203,'Unarmed'),(1,5,204,'Defense'),(1,5,522,'SPELLDEFENSE (DND)'),(1,5,585,'Smite'),(1,5,668,'Language Common'),(1,5,1843,'Disarm'),(1,5,2050,'Lesser Heal'),(1,5,2382,'Generic'),(1,5,2479,'Honorless Target'),(1,5,3050,'Detect'),(1,5,3365,'Opening'),(1,5,5009,'Wands'),(1,5,5019,'Shoot'),(1,5,6233,'Closing'),(1,5,6246,'Closing'),(1,5,6247,'Opening'),(1,5,6477,'Opening'),(1,5,6478,'Opening'),(1,5,6603,'Attack'),(1,5,7266,'Duel'),(1,5,7267,'Grovel'),(1,5,7355,'Stuck'),(1,5,8386,'Attacking'),(1,5,9078,'Cloth'),(1,5,9125,'Generic'),(1,5,20597,'Sword Specialization'),(1,5,20598,'The Human Spirit'),(1,5,20599,'Diplomacy'),(1,5,20864,'Mace Specialization'),(1,5,21651,'Opening'),(1,5,21652,'Closing'),(1,5,22027,'Remove Insignia'),(1,5,22810,'Opening - No Text'),(1,5,45927,'Summon Friend'),(1,5,58985,'Perception'),(1,5,59752,'Every Man for Himself'),(1,5,61437,'Opening'),(1,6,81,'Dodge'),(1,6,196,'One-Handed Axes'),(1,6,197,'Two-Handed Axes'),(1,6,200,'Polearms'),(1,6,201,'One-Handed Swords'),(1,6,202,'Two-Handed Swords'),(1,6,203,'Unarmed'),(1,6,204,'Defense'),(1,6,522,'SPELLDEFENSE (DND)'),(1,6,668,'Language Common'),(1,6,674,'Dual Wield'),(1,6,750,'Plate Mail'),(1,6,1843,'Disarm'),(1,6,2382,'Generic'),(1,6,2479,'Honorless Target'),(1,6,3050,'Detect'),(1,6,3127,'Parry'),(1,6,3275,'Linen Bandage'),(1,6,3276,'Heavy Linen Bandage'),(1,6,3277,'Wool Bandage'),(1,6,3278,'Heavy Wool Bandage'),(1,6,3365,'Opening'),(1,6,6233,'Closing'),(1,6,6246,'Closing'),(1,6,6247,'Opening'),(1,6,6477,'Opening'),(1,6,6478,'Opening'),(1,6,6603,'Attack'),(1,6,7266,'Duel'),(1,6,7267,'Grovel'),(1,6,7355,'Stuck'),(1,6,7928,'Silk Bandage'),(1,6,7929,'Heavy Silk Bandage'),(1,6,7934,'Anti-Venom'),(1,6,8386,'Attacking'),(1,6,8737,'Mail'),(1,6,9077,'Leather'),(1,6,9078,'Cloth'),(1,6,9125,'Generic'),(1,6,10840,'Mageweave Bandage'),(1,6,10841,'Heavy Mageweave Bandage'),(1,6,10846,'First Aid'),(1,6,18629,'Runecloth Bandage'),(1,6,18630,'Heavy Runecloth Bandage'),(1,6,20597,'Sword Specialization'),(1,6,20598,'The Human Spirit'),(1,6,20599,'Diplomacy'),(1,6,20864,'Mace Specialization'),(1,6,21651,'Opening'),(1,6,21652,'Closing'),(1,6,22027,'Remove Insignia'),(1,6,22810,'Opening - No Text'),(1,6,33391,'Journeyman Riding'),(1,6,45462,'Plague Strike'),(1,6,45477,'Icy Touch'),(1,6,45902,'Blood Strike'),(1,6,45903,'Offensive State (DND)'),(1,6,45927,'Summon Friend'),(1,6,47541,'Death Coil'),(1,6,48266,'Blood Presence'),(1,6,49410,'Forceful Deflection'),(1,6,49576,'Death Grip'),(1,6,52665,'Sigil'),(1,6,58985,'Perception'),(1,6,59752,'Every Man for Himself'),(1,6,59879,'Blood Plague'),(1,6,59921,'Frost Fever'),(1,6,61437,'Opening'),(1,6,61455,'Runic Focus'),(1,8,81,'Dodge'),(1,8,133,'Fireball'),(1,8,168,'Frost Armor'),(1,8,203,'Unarmed'),(1,8,204,'Defense'),(1,8,227,'Staves'),(1,8,522,'SPELLDEFENSE (DND)'),(1,8,668,'Language Common'),(1,8,1843,'Disarm'),(1,8,2382,'Generic'),(1,8,2479,'Honorless Target'),(1,8,3050,'Detect'),(1,8,3365,'Opening'),(1,8,5009,'Wands'),(1,8,5019,'Shoot'),(1,8,6233,'Closing'),(1,8,6246,'Closing'),(1,8,6247,'Opening'),(1,8,6477,'Opening'),(1,8,6478,'Opening'),(1,8,6603,'Attack'),(1,8,7266,'Duel'),(1,8,7267,'Grovel'),(1,8,7355,'Stuck'),(1,8,8386,'Attacking'),(1,8,9078,'Cloth'),(1,8,9125,'Generic'),(1,8,20597,'Sword Specialization'),(1,8,20598,'The Human Spirit'),(1,8,20599,'Diplomacy'),(1,8,20864,'Mace Specialization'),(1,8,21651,'Opening'),(1,8,21652,'Closing'),(1,8,22027,'Remove Insignia'),(1,8,22810,'Opening - No Text'),(1,8,45927,'Summon Friend'),(1,8,58985,'Perception'),(1,8,59752,'Every Man for Himself'),(1,8,61437,'Opening'),(1,9,81,'Dodge'),(1,9,203,'Unarmed'),(1,9,204,'Defense'),(1,9,522,'SPELLDEFENSE (DND)'),(1,9,668,'Language Common'),(1,9,686,'Shadow Bolt'),(1,9,687,'Demon Skin'),(1,9,1180,'Daggers'),(1,9,1843,'Disarm'),(1,9,2382,'Generic'),(1,9,2479,'Honorless Target'),(1,9,3050,'Detect'),(1,9,3365,'Opening'),(1,9,5009,'Wands'),(1,9,5019,'Shoot'),(1,9,6233,'Closing'),(1,9,6246,'Closing'),(1,9,6247,'Opening'),(1,9,6477,'Opening'),(1,9,6478,'Opening'),(1,9,6603,'Attack'),(1,9,7266,'Duel'),(1,9,7267,'Grovel'),(1,9,7355,'Stuck'),(1,9,8386,'Attacking'),(1,9,9078,'Cloth'),(1,9,9125,'Generic'),(1,9,20597,'Sword Specialization'),(1,9,20598,'The Human Spirit'),(1,9,20599,'Diplomacy'),(1,9,20864,'Mace Specialization'),(1,9,21651,'Opening'),(1,9,21652,'Closing'),(1,9,22027,'Remove Insignia'),(1,9,22810,'Opening - No Text'),(1,9,45927,'Summon Friend'),(1,9,58284,'Chaos Bolt Passive'),(1,9,58985,'Perception'),(1,9,59752,'Every Man for Himself'),(1,9,61437,'Opening'),(2,1,78,'Heroic Strike'),(2,1,81,'Dodge'),(2,1,107,'Block'),(2,1,196,'One-Handed Axes'),(2,1,197,'Two-Handed Axes'),(2,1,201,'One-Handed Swords'),(2,1,203,'Unarmed'),(2,1,204,'Defense'),(2,1,522,'SPELLDEFENSE (DND)'),(2,1,669,'Language Orcish'),(2,1,1843,'Disarm'),(2,1,2382,'Generic'),(2,1,2457,'Battle Stance'),(2,1,2479,'Honorless Target'),(2,1,3050,'Detect'),(2,1,3365,'Opening'),(2,1,5301,'Defensive State (DND)'),(2,1,6233,'Closing'),(2,1,6246,'Closing'),(2,1,6247,'Opening'),(2,1,6477,'Opening'),(2,1,6478,'Opening'),(2,1,6603,'Attack'),(2,1,7266,'Duel'),(2,1,7267,'Grovel'),(2,1,7355,'Stuck'),(2,1,8386,'Attacking'),(2,1,8737,'Mail'),(2,1,9077,'Leather'),(2,1,9078,'Cloth'),(2,1,9116,'Shield'),(2,1,9125,'Generic'),(2,1,20572,'Blood Fury'),(2,1,20573,'Hardiness'),(2,1,20574,'Axe Specialization'),(2,1,21563,'Command'),(2,1,21651,'Opening'),(2,1,21652,'Closing'),(2,1,22027,'Remove Insignia'),(2,1,22810,'Opening - No Text'),(2,1,32215,'Victorious State'),(2,1,45927,'Summon Friend'),(2,1,61437,'Opening'),(2,3,75,'Auto Shot'),(2,3,81,'Dodge'),(2,3,196,'One-Handed Axes'),(2,3,203,'Unarmed'),(2,3,204,'Defense'),(2,3,264,'Bows'),(2,3,522,'SPELLDEFENSE (DND)'),(2,3,669,'Language Orcish'),(2,3,1843,'Disarm'),(2,3,2382,'Generic'),(2,3,2479,'Honorless Target'),(2,3,2973,'Raptor Strike'),(2,3,3050,'Detect'),(2,3,3365,'Opening'),(2,3,6233,'Closing'),(2,3,6246,'Closing'),(2,3,6247,'Opening'),(2,3,6477,'Opening'),(2,3,6478,'Opening'),(2,3,6603,'Attack'),(2,3,7266,'Duel'),(2,3,7267,'Grovel'),(2,3,7355,'Stuck'),(2,3,8386,'Attacking'),(2,3,9077,'Leather'),(2,3,9078,'Cloth'),(2,3,9125,'Generic'),(2,3,13358,'Defensive State (DND)'),(2,3,20572,'Blood Fury'),(2,3,20573,'Hardiness'),(2,3,20574,'Axe Specialization'),(2,3,20576,'Command'),(2,3,21651,'Opening'),(2,3,21652,'Closing'),(2,3,22027,'Remove Insignia'),(2,3,22810,'Opening - No Text'),(2,3,24949,'Defensive State 2 (DND)'),(2,3,34082,'Advantaged State (DND)'),(2,3,45927,'Summon Friend'),(2,3,61437,'Opening'),(2,4,81,'Dodge'),(2,4,203,'Unarmed'),(2,4,204,'Defense'),(2,4,522,'SPELLDEFENSE (DND)'),(2,4,669,'Language Orcish'),(2,4,1180,'Daggers'),(2,4,1752,'Sinister Strike'),(2,4,1843,'Disarm'),(2,4,2098,'Eviscerate'),(2,4,2382,'Generic'),(2,4,2479,'Honorless Target'),(2,4,2567,'Thrown'),(2,4,2764,'Throw'),(2,4,3050,'Detect'),(2,4,3365,'Opening'),(2,4,6233,'Closing'),(2,4,6246,'Closing'),(2,4,6247,'Opening'),(2,4,6477,'Opening'),(2,4,6478,'Opening'),(2,4,6603,'Attack'),(2,4,7266,'Duel'),(2,4,7267,'Grovel'),(2,4,7355,'Stuck'),(2,4,8386,'Attacking'),(2,4,9077,'Leather'),(2,4,9078,'Cloth'),(2,4,9125,'Generic'),(2,4,16092,'Defensive State (DND)'),(2,4,20572,'Blood Fury'),(2,4,20573,'Hardiness'),(2,4,20574,'Axe Specialization'),(2,4,21184,'Rogue Passive (DND)'),(2,4,21563,'Command'),(2,4,21651,'Opening'),(2,4,21652,'Closing'),(2,4,22027,'Remove Insignia'),(2,4,22810,'Opening - No Text'),(2,4,45927,'Summon Friend'),(2,4,61437,'Opening'),(2,6,81,'Dodge'),(2,6,196,'One-Handed Axes'),(2,6,197,'Two-Handed Axes'),(2,6,200,'Polearms'),(2,6,201,'One-Handed Swords'),(2,6,202,'Two-Handed Swords'),(2,6,203,'Unarmed'),(2,6,204,'Defense'),(2,6,522,'SPELLDEFENSE (DND)'),(2,6,669,'Language Orcish'),(2,6,674,'Dual Wield'),(2,6,750,'Plate Mail'),(2,6,1843,'Disarm'),(2,6,2382,'Generic'),(2,6,2479,'Honorless Target'),(2,6,3050,'Detect'),(2,6,3127,'Parry'),(2,6,3275,'Linen Bandage'),(2,6,3276,'Heavy Linen Bandage'),(2,6,3277,'Wool Bandage'),(2,6,3278,'Heavy Wool Bandage'),(2,6,3365,'Opening'),(2,6,6233,'Closing'),(2,6,6246,'Closing'),(2,6,6247,'Opening'),(2,6,6477,'Opening'),(2,6,6478,'Opening'),(2,6,6603,'Attack'),(2,6,7266,'Duel'),(2,6,7267,'Grovel'),(2,6,7355,'Stuck'),(2,6,7928,'Silk Bandage'),(2,6,7929,'Heavy Silk Bandage'),(2,6,7934,'Anti-Venom'),(2,6,8386,'Attacking'),(2,6,8737,'Mail'),(2,6,9077,'Leather'),(2,6,9078,'Cloth'),(2,6,9125,'Generic'),(2,6,10840,'Mageweave Bandage'),(2,6,10841,'Heavy Mageweave Bandage'),(2,6,10846,'First Aid'),(2,6,18629,'Runecloth Bandage'),(2,6,18630,'Heavy Runecloth Bandage'),(2,6,20572,'Blood Fury'),(2,6,20573,'Hardiness'),(2,6,20574,'Axe Specialization'),(2,6,21651,'Opening'),(2,6,21652,'Closing'),(2,6,22027,'Remove Insignia'),(2,6,22810,'Opening - No Text'),(2,6,33391,'Journeyman Riding'),(2,6,45462,'Plague Strike'),(2,6,45477,'Icy Touch'),(2,6,45902,'Blood Strike'),(2,6,45903,'Offensive State (DND)'),(2,6,45927,'Summon Friend'),(2,6,47541,'Death Coil'),(2,6,48266,'Blood Presence'),(2,6,49410,'Forceful Deflection'),(2,6,49576,'Death Grip'),(2,6,52665,'Sigil'),(2,6,54562,'Command'),(2,6,59879,'Blood Plague'),(2,6,59921,'Frost Fever'),(2,6,61437,'Opening'),(2,6,61455,'Runic Focus'),(2,7,81,'Dodge'),(2,7,107,'Block'),(2,7,198,'One-Handed Maces'),(2,7,203,'Unarmed'),(2,7,204,'Defense'),(2,7,227,'Staves'),(2,7,331,'Healing Wave'),(2,7,403,'Lightning Bolt'),(2,7,522,'SPELLDEFENSE (DND)'),(2,7,669,'Language Orcish'),(2,7,1843,'Disarm'),(2,7,2382,'Generic'),(2,7,2479,'Honorless Target'),(2,7,3050,'Detect'),(2,7,3365,'Opening'),(2,7,6233,'Closing'),(2,7,6246,'Closing'),(2,7,6247,'Opening'),(2,7,6477,'Opening'),(2,7,6478,'Opening'),(2,7,6603,'Attack'),(2,7,7266,'Duel'),(2,7,7267,'Grovel'),(2,7,7355,'Stuck'),(2,7,8386,'Attacking'),(2,7,9077,'Leather'),(2,7,9078,'Cloth'),(2,7,9116,'Shield'),(2,7,9125,'Generic'),(2,7,20573,'Hardiness'),(2,7,20574,'Axe Specialization'),(2,7,21563,'Command'),(2,7,21651,'Opening'),(2,7,21652,'Closing'),(2,7,22027,'Remove Insignia'),(2,7,22810,'Opening - No Text'),(2,7,27763,'Totem'),(2,7,33697,'Blood Fury'),(2,7,45927,'Summon Friend'),(2,7,61437,'Opening'),(2,9,81,'Dodge'),(2,9,203,'Unarmed'),(2,9,204,'Defense'),(2,9,522,'SPELLDEFENSE (DND)'),(2,9,669,'Language Orcish'),(2,9,686,'Shadow Bolt'),(2,9,687,'Demon Skin'),(2,9,1180,'Daggers'),(2,9,1843,'Disarm'),(2,9,2382,'Generic'),(2,9,2479,'Honorless Target'),(2,9,3050,'Detect'),(2,9,3365,'Opening'),(2,9,5009,'Wands'),(2,9,5019,'Shoot'),(2,9,6233,'Closing'),(2,9,6246,'Closing'),(2,9,6247,'Opening'),(2,9,6477,'Opening'),(2,9,6478,'Opening'),(2,9,6603,'Attack'),(2,9,7266,'Duel'),(2,9,7267,'Grovel'),(2,9,7355,'Stuck'),(2,9,8386,'Attacking'),(2,9,9078,'Cloth'),(2,9,9125,'Generic'),(2,9,20573,'Hardiness'),(2,9,20574,'Axe Specialization'),(2,9,20575,'Command'),(2,9,21651,'Opening'),(2,9,21652,'Closing'),(2,9,22027,'Remove Insignia'),(2,9,22810,'Opening - No Text'),(2,9,33702,'Blood Fury'),(2,9,45927,'Summon Friend'),(2,9,58284,'Chaos Bolt Passive'),(2,9,61437,'Opening'),(3,1,78,'Heroic Strike'),(3,1,81,'Dodge'),(3,1,107,'Block'),(3,1,196,'One-Handed Axes'),(3,1,197,'Two-Handed Axes'),(3,1,198,'One-Handed Maces'),(3,1,203,'Unarmed'),(3,1,204,'Defense'),(3,1,522,'SPELLDEFENSE (DND)'),(3,1,668,'Language Common'),(3,1,672,'Language Dwarven'),(3,1,1843,'Disarm'),(3,1,2382,'Generic'),(3,1,2457,'Battle Stance'),(3,1,2479,'Honorless Target'),(3,1,2481,'Find Treasure'),(3,1,3050,'Detect'),(3,1,3365,'Opening'),(3,1,5301,'Defensive State (DND)'),(3,1,6233,'Closing'),(3,1,6246,'Closing'),(3,1,6247,'Opening'),(3,1,6477,'Opening'),(3,1,6478,'Opening'),(3,1,6603,'Attack'),(3,1,7266,'Duel'),(3,1,7267,'Grovel'),(3,1,7355,'Stuck'),(3,1,8386,'Attacking'),(3,1,8737,'Mail'),(3,1,9077,'Leather'),(3,1,9078,'Cloth'),(3,1,9116,'Shield'),(3,1,9125,'Generic'),(3,1,20594,'Stoneform'),(3,1,20595,'Gun Specialization'),(3,1,20596,'Frost Resistance'),(3,1,21651,'Opening'),(3,1,21652,'Closing'),(3,1,22027,'Remove Insignia'),(3,1,22810,'Opening - No Text'),(3,1,32215,'Victorious State'),(3,1,45927,'Summon Friend'),(3,1,59224,'Mace Specialization'),(3,1,61437,'Opening'),(3,2,81,'Dodge'),(3,2,107,'Block'),(3,2,198,'One-Handed Maces'),(3,2,199,'Two-Handed Maces'),(3,2,203,'Unarmed'),(3,2,204,'Defense'),(3,2,522,'SPELLDEFENSE (DND)'),(3,2,635,'Holy Light'),(3,2,668,'Language Common'),(3,2,672,'Language Dwarven'),(3,2,1843,'Disarm'),(3,2,2382,'Generic'),(3,2,2479,'Honorless Target'),(3,2,2481,'Find Treasure'),(3,2,3050,'Detect'),(3,2,3365,'Opening'),(3,2,6233,'Closing'),(3,2,6246,'Closing'),(3,2,6247,'Opening'),(3,2,6477,'Opening'),(3,2,6478,'Opening'),(3,2,6603,'Attack'),(3,2,7266,'Duel'),(3,2,7267,'Grovel'),(3,2,7355,'Stuck'),(3,2,8386,'Attacking'),(3,2,8737,'Mail'),(3,2,9077,'Leather'),(3,2,9078,'Cloth'),(3,2,9116,'Shield'),(3,2,9125,'Generic'),(3,2,20154,'Seal of Righteousness'),(3,2,20594,'Stoneform'),(3,2,20595,'Gun Specialization'),(3,2,20596,'Frost Resistance'),(3,2,21651,'Opening'),(3,2,21652,'Closing'),(3,2,22027,'Remove Insignia'),(3,2,22810,'Opening - No Text'),(3,2,27762,'Libram'),(3,2,45927,'Summon Friend'),(3,2,59224,'Mace Specialization'),(3,2,61437,'Opening'),(3,3,75,'Auto Shot'),(3,3,81,'Dodge'),(3,3,196,'One-Handed Axes'),(3,3,203,'Unarmed'),(3,3,204,'Defense'),(3,3,266,'Guns'),(3,3,522,'SPELLDEFENSE (DND)'),(3,3,668,'Language Common'),(3,3,672,'Language Dwarven'),(3,3,1843,'Disarm'),(3,3,2382,'Generic'),(3,3,2479,'Honorless Target'),(3,3,2481,'Find Treasure'),(3,3,2973,'Raptor Strike'),(3,3,3050,'Detect'),(3,3,3365,'Opening'),(3,3,6233,'Closing'),(3,3,6246,'Closing'),(3,3,6247,'Opening'),(3,3,6477,'Opening'),(3,3,6478,'Opening'),(3,3,6603,'Attack'),(3,3,7266,'Duel'),(3,3,7267,'Grovel'),(3,3,7355,'Stuck'),(3,3,8386,'Attacking'),(3,3,9077,'Leather'),(3,3,9078,'Cloth'),(3,3,9125,'Generic'),(3,3,13358,'Defensive State (DND)'),(3,3,20594,'Stoneform'),(3,3,20595,'Gun Specialization'),(3,3,20596,'Frost Resistance'),(3,3,21651,'Opening'),(3,3,21652,'Closing'),(3,3,22027,'Remove Insignia'),(3,3,22810,'Opening - No Text'),(3,3,24949,'Defensive State 2 (DND)'),(3,3,34082,'Advantaged State (DND)'),(3,3,45927,'Summon Friend'),(3,3,59224,'Mace Specialization'),(3,3,61437,'Opening'),(3,4,81,'Dodge'),(3,4,203,'Unarmed'),(3,4,204,'Defense'),(3,4,522,'SPELLDEFENSE (DND)'),(3,4,668,'Language Common'),(3,4,672,'Language Dwarven'),(3,4,1180,'Daggers'),(3,4,1752,'Sinister Strike'),(3,4,1843,'Disarm'),(3,4,2098,'Eviscerate'),(3,4,2382,'Generic'),(3,4,2479,'Honorless Target'),(3,4,2481,'Find Treasure'),(3,4,2567,'Thrown'),(3,4,2764,'Throw'),(3,4,3050,'Detect'),(3,4,3365,'Opening'),(3,4,6233,'Closing'),(3,4,6246,'Closing'),(3,4,6247,'Opening'),(3,4,6477,'Opening'),(3,4,6478,'Opening'),(3,4,6603,'Attack'),(3,4,7266,'Duel'),(3,4,7267,'Grovel'),(3,4,7355,'Stuck'),(3,4,8386,'Attacking'),(3,4,9077,'Leather'),(3,4,9078,'Cloth'),(3,4,9125,'Generic'),(3,4,16092,'Defensive State (DND)'),(3,4,20594,'Stoneform'),(3,4,20595,'Gun Specialization'),(3,4,20596,'Frost Resistance'),(3,4,21184,'Rogue Passive (DND)'),(3,4,21651,'Opening'),(3,4,21652,'Closing'),(3,4,22027,'Remove Insignia'),(3,4,22810,'Opening - No Text'),(3,4,45927,'Summon Friend'),(3,4,59224,'Mace Specialization'),(3,4,61437,'Opening'),(3,5,81,'Dodge'),(3,5,198,'One-Handed Maces'),(3,5,203,'Unarmed'),(3,5,204,'Defense'),(3,5,522,'SPELLDEFENSE (DND)'),(3,5,585,'Smite'),(3,5,668,'Language Common'),(3,5,672,'Language Dwarven'),(3,5,1843,'Disarm'),(3,5,2050,'Lesser Heal'),(3,5,2382,'Generic'),(3,5,2479,'Honorless Target'),(3,5,2481,'Find Treasure'),(3,5,3050,'Detect'),(3,5,3365,'Opening'),(3,5,5009,'Wands'),(3,5,5019,'Shoot'),(3,5,6233,'Closing'),(3,5,6246,'Closing'),(3,5,6247,'Opening'),(3,5,6477,'Opening'),(3,5,6478,'Opening'),(3,5,6603,'Attack'),(3,5,7266,'Duel'),(3,5,7267,'Grovel'),(3,5,7355,'Stuck'),(3,5,8386,'Attacking'),(3,5,9078,'Cloth'),(3,5,9125,'Generic'),(3,5,20594,'Stoneform'),(3,5,20595,'Gun Specialization'),(3,5,20596,'Frost Resistance'),(3,5,21651,'Opening'),(3,5,21652,'Closing'),(3,5,22027,'Remove Insignia'),(3,5,22810,'Opening - No Text'),(3,5,45927,'Summon Friend'),(3,5,59224,'Mace Specialization'),(3,5,61437,'Opening'),(3,6,81,'Dodge'),(3,6,196,'One-Handed Axes'),(3,6,197,'Two-Handed Axes'),(3,6,200,'Polearms'),(3,6,201,'One-Handed Swords'),(3,6,202,'Two-Handed Swords'),(3,6,203,'Unarmed'),(3,6,204,'Defense'),(3,6,522,'SPELLDEFENSE (DND)'),(3,6,668,'Language Common'),(3,6,672,'Language Dwarven'),(3,6,674,'Dual Wield'),(3,6,750,'Plate Mail'),(3,6,1843,'Disarm'),(3,6,2382,'Generic'),(3,6,2479,'Honorless Target'),(3,6,2481,'Find Treasure'),(3,6,3050,'Detect'),(3,6,3127,'Parry'),(3,6,3275,'Linen Bandage'),(3,6,3276,'Heavy Linen Bandage'),(3,6,3277,'Wool Bandage'),(3,6,3278,'Heavy Wool Bandage'),(3,6,3365,'Opening'),(3,6,6233,'Closing'),(3,6,6246,'Closing'),(3,6,6247,'Opening'),(3,6,6477,'Opening'),(3,6,6478,'Opening'),(3,6,6603,'Attack'),(3,6,7266,'Duel'),(3,6,7267,'Grovel'),(3,6,7355,'Stuck'),(3,6,7928,'Silk Bandage'),(3,6,7929,'Heavy Silk Bandage'),(3,6,7934,'Anti-Venom'),(3,6,8386,'Attacking'),(3,6,8737,'Mail'),(3,6,9077,'Leather'),(3,6,9078,'Cloth'),(3,6,9125,'Generic'),(3,6,10840,'Mageweave Bandage'),(3,6,10841,'Heavy Mageweave Bandage'),(3,6,10846,'First Aid'),(3,6,18629,'Runecloth Bandage'),(3,6,18630,'Heavy Runecloth Bandage'),(3,6,20594,'Stoneform'),(3,6,20595,'Gun Specialization'),(3,6,20596,'Frost Resistance'),(3,6,21651,'Opening'),(3,6,21652,'Closing'),(3,6,22027,'Remove Insignia'),(3,6,22810,'Opening - No Text'),(3,6,33391,'Journeyman Riding'),(3,6,45462,'Plague Strike'),(3,6,45477,'Icy Touch'),(3,6,45902,'Blood Strike'),(3,6,45903,'Offensive State (DND)'),(3,6,45927,'Summon Friend'),(3,6,47541,'Death Coil'),(3,6,48266,'Blood Presence'),(3,6,49410,'Forceful Deflection'),(3,6,49576,'Death Grip'),(3,6,52665,'Sigil'),(3,6,59224,'Mace Specialization'),(3,6,59879,'Blood Plague'),(3,6,59921,'Frost Fever'),(3,6,61437,'Opening'),(3,6,61455,'Runic Focus'),(4,1,78,'Heroic Strike'),(4,1,81,'Dodge'),(4,1,107,'Block'),(4,1,198,'One-Handed Maces'),(4,1,201,'One-Handed Swords'),(4,1,203,'Unarmed'),(4,1,204,'Defense'),(4,1,522,'SPELLDEFENSE (DND)'),(4,1,668,'Language Common'),(4,1,671,'Language Darnassian'),(4,1,1180,'Daggers'),(4,1,1843,'Disarm'),(4,1,2382,'Generic'),(4,1,2457,'Battle Stance'),(4,1,2479,'Honorless Target'),(4,1,3050,'Detect'),(4,1,3365,'Opening'),(4,1,5301,'Defensive State (DND)'),(4,1,6233,'Closing'),(4,1,6246,'Closing'),(4,1,6247,'Opening'),(4,1,6477,'Opening'),(4,1,6478,'Opening'),(4,1,6603,'Attack'),(4,1,7266,'Duel'),(4,1,7267,'Grovel'),(4,1,7355,'Stuck'),(4,1,8386,'Attacking'),(4,1,8737,'Mail'),(4,1,9077,'Leather'),(4,1,9078,'Cloth'),(4,1,9116,'Shield'),(4,1,9125,'Generic'),(4,1,20582,'Quickness'),(4,1,20583,'Nature Resistance'),(4,1,20585,'Wisp Spirit'),(4,1,21651,'Opening'),(4,1,21652,'Closing'),(4,1,22027,'Remove Insignia'),(4,1,22810,'Opening - No Text'),(4,1,32215,'Victorious State'),(4,1,45927,'Summon Friend'),(4,1,58984,'Shadowmelt'),(4,1,61437,'Opening'),(4,3,75,'Auto Shot'),(4,3,81,'Dodge'),(4,3,203,'Unarmed'),(4,3,204,'Defense'),(4,3,264,'Bows'),(4,3,522,'SPELLDEFENSE (DND)'),(4,3,668,'Language Common'),(4,3,671,'Language Darnassian'),(4,3,1180,'Daggers'),(4,3,1843,'Disarm'),(4,3,2382,'Generic'),(4,3,2479,'Honorless Target'),(4,3,2973,'Raptor Strike'),(4,3,3050,'Detect'),(4,3,3365,'Opening'),(4,3,6233,'Closing'),(4,3,6246,'Closing'),(4,3,6247,'Opening'),(4,3,6477,'Opening'),(4,3,6478,'Opening'),(4,3,6603,'Attack'),(4,3,7266,'Duel'),(4,3,7267,'Grovel'),(4,3,7355,'Stuck'),(4,3,8386,'Attacking'),(4,3,9077,'Leather'),(4,3,9078,'Cloth'),(4,3,9125,'Generic'),(4,3,13358,'Defensive State (DND)'),(4,3,20582,'Quickness'),(4,3,20583,'Nature Resistance'),(4,3,20585,'Wisp Spirit'),(4,3,21651,'Opening'),(4,3,21652,'Closing'),(4,3,22027,'Remove Insignia'),(4,3,22810,'Opening - No Text'),(4,3,24949,'Defensive State 2 (DND)'),(4,3,34082,'Advantaged State (DND)'),(4,3,45927,'Summon Friend'),(4,3,58984,'Shadowmelt'),(4,3,61437,'Opening'),(4,4,81,'Dodge'),(4,4,203,'Unarmed'),(4,4,204,'Defense'),(4,4,522,'SPELLDEFENSE (DND)'),(4,4,668,'Language Common'),(4,4,671,'Language Darnassian'),(4,4,1180,'Daggers'),(4,4,1752,'Sinister Strike'),(4,4,1843,'Disarm'),(4,4,2098,'Eviscerate'),(4,4,2382,'Generic'),(4,4,2479,'Honorless Target'),(4,4,2567,'Thrown'),(4,4,2764,'Throw'),(4,4,3050,'Detect'),(4,4,3365,'Opening'),(4,4,6233,'Closing'),(4,4,6246,'Closing'),(4,4,6247,'Opening'),(4,4,6477,'Opening'),(4,4,6478,'Opening'),(4,4,6603,'Attack'),(4,4,7266,'Duel'),(4,4,7267,'Grovel'),(4,4,7355,'Stuck'),(4,4,8386,'Attacking'),(4,4,9077,'Leather'),(4,4,9078,'Cloth'),(4,4,9125,'Generic'),(4,4,16092,'Defensive State (DND)'),(4,4,20582,'Quickness'),(4,4,20583,'Nature Resistance'),(4,4,20585,'Wisp Spirit'),(4,4,21184,'Rogue Passive (DND)'),(4,4,21651,'Opening'),(4,4,21652,'Closing'),(4,4,22027,'Remove Insignia'),(4,4,22810,'Opening - No Text'),(4,4,45927,'Summon Friend'),(4,4,58984,'Shadowmelt'),(4,4,61437,'Opening'),(4,5,81,'Dodge'),(4,5,198,'One-Handed Maces'),(4,5,203,'Unarmed'),(4,5,204,'Defense'),(4,5,522,'SPELLDEFENSE (DND)'),(4,5,585,'Smite'),(4,5,668,'Language Common'),(4,5,671,'Language Darnassian'),(4,5,1843,'Disarm'),(4,5,2050,'Lesser Heal'),(4,5,2382,'Generic'),(4,5,2479,'Honorless Target'),(4,5,3050,'Detect'),(4,5,3365,'Opening'),(4,5,5009,'Wands'),(4,5,5019,'Shoot'),(4,5,6233,'Closing'),(4,5,6246,'Closing'),(4,5,6247,'Opening'),(4,5,6477,'Opening'),(4,5,6478,'Opening'),(4,5,6603,'Attack'),(4,5,7266,'Duel'),(4,5,7267,'Grovel'),(4,5,7355,'Stuck'),(4,5,8386,'Attacking'),(4,5,9078,'Cloth'),(4,5,9125,'Generic'),(4,5,20582,'Quickness'),(4,5,20583,'Nature Resistance'),(4,5,20585,'Wisp Spirit'),(4,5,21651,'Opening'),(4,5,21652,'Closing'),(4,5,22027,'Remove Insignia'),(4,5,22810,'Opening - No Text'),(4,5,45927,'Summon Friend'),(4,5,58984,'Shadowmelt'),(4,5,61437,'Opening'),(4,6,81,'Dodge'),(4,6,196,'One-Handed Axes'),(4,6,197,'Two-Handed Axes'),(4,6,200,'Polearms'),(4,6,201,'One-Handed Swords'),(4,6,202,'Two-Handed Swords'),(4,6,203,'Unarmed'),(4,6,204,'Defense'),(4,6,522,'SPELLDEFENSE (DND)'),(4,6,668,'Language Common'),(4,6,671,'Language Darnassian'),(4,6,674,'Dual Wield'),(4,6,750,'Plate Mail'),(4,6,1843,'Disarm'),(4,6,2382,'Generic'),(4,6,2479,'Honorless Target'),(4,6,3050,'Detect'),(4,6,3127,'Parry'),(4,6,3275,'Linen Bandage'),(4,6,3276,'Heavy Linen Bandage'),(4,6,3277,'Wool Bandage'),(4,6,3278,'Heavy Wool Bandage'),(4,6,3365,'Opening'),(4,6,6233,'Closing'),(4,6,6246,'Closing'),(4,6,6247,'Opening'),(4,6,6477,'Opening'),(4,6,6478,'Opening'),(4,6,6603,'Attack'),(4,6,7266,'Duel'),(4,6,7267,'Grovel'),(4,6,7355,'Stuck'),(4,6,7928,'Silk Bandage'),(4,6,7929,'Heavy Silk Bandage'),(4,6,7934,'Anti-Venom'),(4,6,8386,'Attacking'),(4,6,8737,'Mail'),(4,6,9077,'Leather'),(4,6,9078,'Cloth'),(4,6,9125,'Generic'),(4,6,10840,'Mageweave Bandage'),(4,6,10841,'Heavy Mageweave Bandage'),(4,6,10846,'First Aid'),(4,6,18629,'Runecloth Bandage'),(4,6,18630,'Heavy Runecloth Bandage'),(4,6,20582,'Quickness'),(4,6,20583,'Nature Resistance'),(4,6,20585,'Wisp Spirit'),(4,6,21651,'Opening'),(4,6,21652,'Closing'),(4,6,22027,'Remove Insignia'),(4,6,22810,'Opening - No Text'),(4,6,33391,'Journeyman Riding'),(4,6,45462,'Plague Strike'),(4,6,45477,'Icy Touch'),(4,6,45902,'Blood Strike'),(4,6,45903,'Offensive State (DND)'),(4,6,45927,'Summon Friend'),(4,6,47541,'Death Coil'),(4,6,48266,'Blood Presence'),(4,6,49410,'Forceful Deflection'),(4,6,49576,'Death Grip'),(4,6,52665,'Sigil'),(4,6,58984,'Shadowmeld'),(4,6,59879,'Blood Plague'),(4,6,59921,'Frost Fever'),(4,6,61437,'Opening'),(4,6,61455,'Runic Focus'),(4,11,81,'Dodge'),(4,11,203,'Unarmed'),(4,11,204,'Defense'),(4,11,227,'Staves'),(4,11,522,'SPELLDEFENSE (DND)'),(4,11,668,'Language Common'),(4,11,671,'Language Darnassian'),(4,11,1180,'Daggers'),(4,11,1843,'Disarm'),(4,11,2382,'Generic'),(4,11,2479,'Honorless Target'),(4,11,3050,'Detect'),(4,11,3365,'Opening'),(4,11,5176,'Wrath'),(4,11,5185,'Healing Touch'),(4,11,6233,'Closing'),(4,11,6246,'Closing'),(4,11,6247,'Opening'),(4,11,6477,'Opening'),(4,11,6478,'Opening'),(4,11,6603,'Attack'),(4,11,7266,'Duel'),(4,11,7267,'Grovel'),(4,11,7355,'Stuck'),(4,11,8386,'Attacking'),(4,11,9077,'Leather'),(4,11,9078,'Cloth'),(4,11,9125,'Generic'),(4,11,20582,'Quickness'),(4,11,20583,'Nature Resistance'),(4,11,20585,'Wisp Spirit'),(4,11,21651,'Opening'),(4,11,21652,'Closing'),(4,11,22027,'Remove Insignia'),(4,11,22810,'Opening - No Text'),(4,11,27764,'Fetish'),(4,11,45927,'Summon Friend'),(4,11,58984,'Shadowmelt'),(4,11,61437,'Opening'),(5,1,78,'Heroic Strike'),(5,1,81,'Dodge'),(5,1,107,'Block'),(5,1,201,'One-Handed Swords'),(5,1,202,'Two-Handed Swords'),(5,1,203,'Unarmed'),(5,1,204,'Defense'),(5,1,522,'SPELLDEFENSE (DND)'),(5,1,669,'Language Orcish'),(5,1,1180,'Daggers'),(5,1,1843,'Disarm'),(5,1,2382,'Generic'),(5,1,2457,'Battle Stance'),(5,1,2479,'Honorless Target'),(5,1,3050,'Detect'),(5,1,3365,'Opening'),(5,1,5227,'Underwater Breathing'),(5,1,5301,'Defensive State (DND)'),(5,1,6233,'Closing'),(5,1,6246,'Closing'),(5,1,6247,'Opening'),(5,1,6477,'Opening'),(5,1,6478,'Opening'),(5,1,6603,'Attack'),(5,1,7266,'Duel'),(5,1,7267,'Grovel'),(5,1,7355,'Stuck'),(5,1,7744,'Will of the Forsaken'),(5,1,8386,'Attacking'),(5,1,8737,'Mail'),(5,1,9077,'Leather'),(5,1,9078,'Cloth'),(5,1,9116,'Shield'),(5,1,9125,'Generic'),(5,1,17737,'Language Gutterspeak'),(5,1,20577,'Cannibalize'),(5,1,20579,'Shadow Resistance'),(5,1,21651,'Opening'),(5,1,21652,'Closing'),(5,1,22027,'Remove Insignia'),(5,1,22810,'Opening - No Text'),(5,1,32215,'Victorious State'),(5,1,45927,'Summon Friend'),(5,1,61437,'Opening'),(5,4,81,'Dodge'),(5,4,203,'Unarmed'),(5,4,204,'Defense'),(5,4,522,'SPELLDEFENSE (DND)'),(5,4,669,'Language Orcish'),(5,4,1180,'Daggers'),(5,4,1752,'Sinister Strike'),(5,4,1843,'Disarm'),(5,4,2098,'Eviscerate'),(5,4,2382,'Generic'),(5,4,2479,'Honorless Target'),(5,4,2567,'Thrown'),(5,4,2764,'Throw'),(5,4,3050,'Detect'),(5,4,3365,'Opening'),(5,4,5227,'Underwater Breathing'),(5,4,6233,'Closing'),(5,4,6246,'Closing'),(5,4,6247,'Opening'),(5,4,6477,'Opening'),(5,4,6478,'Opening'),(5,4,6603,'Attack'),(5,4,7266,'Duel'),(5,4,7267,'Grovel'),(5,4,7355,'Stuck'),(5,4,7744,'Will of the Forsaken'),(5,4,8386,'Attacking'),(5,4,9077,'Leather'),(5,4,9078,'Cloth'),(5,4,9125,'Generic'),(5,4,16092,'Defensive State (DND)'),(5,4,17737,'Language Gutterspeak'),(5,4,20577,'Cannibalize'),(5,4,20579,'Shadow Resistance'),(5,4,21184,'Rogue Passive (DND)'),(5,4,21651,'Opening'),(5,4,21652,'Closing'),(5,4,22027,'Remove Insignia'),(5,4,22810,'Opening - No Text'),(5,4,45927,'Summon Friend'),(5,4,61437,'Opening'),(5,5,81,'Dodge'),(5,5,198,'One-Handed Maces'),(5,5,203,'Unarmed'),(5,5,204,'Defense'),(5,5,522,'SPELLDEFENSE (DND)'),(5,5,585,'Smite'),(5,5,669,'Language Orcish'),(5,5,1843,'Disarm'),(5,5,2050,'Lesser Heal'),(5,5,2382,'Generic'),(5,5,2479,'Honorless Target'),(5,5,3050,'Detect'),(5,5,3365,'Opening'),(5,5,5009,'Wands'),(5,5,5019,'Shoot'),(5,5,5227,'Underwater Breathing'),(5,5,6233,'Closing'),(5,5,6246,'Closing'),(5,5,6247,'Opening'),(5,5,6477,'Opening'),(5,5,6478,'Opening'),(5,5,6603,'Attack'),(5,5,7266,'Duel'),(5,5,7267,'Grovel'),(5,5,7355,'Stuck'),(5,5,7744,'Will of the Forsaken'),(5,5,8386,'Attacking'),(5,5,9078,'Cloth'),(5,5,9125,'Generic'),(5,5,17737,'Language Gutterspeak'),(5,5,20577,'Cannibalize'),(5,5,20579,'Shadow Resistance'),(5,5,21651,'Opening'),(5,5,21652,'Closing'),(5,5,22027,'Remove Insignia'),(5,5,22810,'Opening - No Text'),(5,5,45927,'Summon Friend'),(5,5,61437,'Opening'),(5,6,81,'Dodge'),(5,6,196,'One-Handed Axes'),(5,6,197,'Two-Handed Axes'),(5,6,200,'Polearms'),(5,6,201,'One-Handed Swords'),(5,6,202,'Two-Handed Swords'),(5,6,203,'Unarmed'),(5,6,204,'Defense'),(5,6,522,'SPELLDEFENSE (DND)'),(5,6,669,'Language Orcish'),(5,6,674,'Dual Wield'),(5,6,750,'Plate Mail'),(5,6,1843,'Disarm'),(5,6,2382,'Generic'),(5,6,2479,'Honorless Target'),(5,6,3050,'Detect'),(5,6,3127,'Parry'),(5,6,3275,'Linen Bandage'),(5,6,3276,'Heavy Linen Bandage'),(5,6,3277,'Wool Bandage'),(5,6,3278,'Heavy Wool Bandage'),(5,6,3365,'Opening'),(5,6,5227,'Underwater Breathing'),(5,6,6233,'Closing'),(5,6,6246,'Closing'),(5,6,6247,'Opening'),(5,6,6477,'Opening'),(5,6,6478,'Opening'),(5,6,6603,'Attack'),(5,6,7266,'Duel'),(5,6,7267,'Grovel'),(5,6,7355,'Stuck'),(5,6,7744,'Will of the Forsaken'),(5,6,7928,'Silk Bandage'),(5,6,7929,'Heavy Silk Bandage'),(5,6,7934,'Anti-Venom'),(5,6,8386,'Attacking'),(5,6,8737,'Mail'),(5,6,9077,'Leather'),(5,6,9078,'Cloth'),(5,6,9125,'Generic'),(5,6,10840,'Mageweave Bandage'),(5,6,10841,'Heavy Mageweave Bandage'),(5,6,10846,'First Aid'),(5,6,17737,'Language Gutterspeak'),(5,6,18629,'Runecloth Bandage'),(5,6,18630,'Heavy Runecloth Bandage'),(5,6,20577,'Cannibalize'),(5,6,20579,'Shadow Resistance'),(5,6,21651,'Opening'),(5,6,21652,'Closing'),(5,6,22027,'Remove Insignia'),(5,6,22810,'Opening - No Text'),(5,6,33391,'Journeyman Riding'),(5,6,45462,'Plague Strike'),(5,6,45477,'Icy Touch'),(5,6,45902,'Blood Strike'),(5,6,45903,'Offensive State (DND)'),(5,6,45927,'Summon Friend'),(5,6,47541,'Death Coil'),(5,6,48266,'Blood Presence'),(5,6,49410,'Forceful Deflection'),(5,6,49576,'Death Grip'),(5,6,52665,'Sigil'),(5,6,59879,'Blood Plague'),(5,6,59921,'Frost Fever'),(5,6,61437,'Opening'),(5,6,61455,'Runic Focus'),(5,8,81,'Dodge'),(5,8,133,'Fireball'),(5,8,168,'Frost Armor'),(5,8,203,'Unarmed'),(5,8,204,'Defense'),(5,8,227,'Staves'),(5,8,522,'SPELLDEFENSE (DND)'),(5,8,669,'Language Orcish'),(5,8,1843,'Disarm'),(5,8,2382,'Generic'),(5,8,2479,'Honorless Target'),(5,8,3050,'Detect'),(5,8,3365,'Opening'),(5,8,5009,'Wands'),(5,8,5019,'Shoot'),(5,8,5227,'Underwater Breathing'),(5,8,6233,'Closing'),(5,8,6246,'Closing'),(5,8,6247,'Opening'),(5,8,6477,'Opening'),(5,8,6478,'Opening'),(5,8,6603,'Attack'),(5,8,7266,'Duel'),(5,8,7267,'Grovel'),(5,8,7355,'Stuck'),(5,8,7744,'Will of the Forsaken'),(5,8,8386,'Attacking'),(5,8,9078,'Cloth'),(5,8,9125,'Generic'),(5,8,17737,'Language Gutterspeak'),(5,8,20577,'Cannibalize'),(5,8,20579,'Shadow Resistance'),(5,8,21651,'Opening'),(5,8,21652,'Closing'),(5,8,22027,'Remove Insignia'),(5,8,22810,'Opening - No Text'),(5,8,45927,'Summon Friend'),(5,8,61437,'Opening'),(5,9,81,'Dodge'),(5,9,203,'Unarmed'),(5,9,204,'Defense'),(5,9,522,'SPELLDEFENSE (DND)'),(5,9,669,'Language Orcish'),(5,9,686,'Shadow Bolt'),(5,9,687,'Demon Skin'),(5,9,1180,'Daggers'),(5,9,1843,'Disarm'),(5,9,2382,'Generic'),(5,9,2479,'Honorless Target'),(5,9,3050,'Detect'),(5,9,3365,'Opening'),(5,9,5009,'Wands'),(5,9,5019,'Shoot'),(5,9,5227,'Underwater Breathing'),(5,9,6233,'Closing'),(5,9,6246,'Closing'),(5,9,6247,'Opening'),(5,9,6477,'Opening'),(5,9,6478,'Opening'),(5,9,6603,'Attack'),(5,9,7266,'Duel'),(5,9,7267,'Grovel'),(5,9,7355,'Stuck'),(5,9,7744,'Will of the Forsaken'),(5,9,8386,'Attacking'),(5,9,9078,'Cloth'),(5,9,9125,'Generic'),(5,9,17737,'Language Gutterspeak'),(5,9,20577,'Cannibalize'),(5,9,20579,'Shadow Resistance'),(5,9,21651,'Opening'),(5,9,21652,'Closing'),(5,9,22027,'Remove Insignia'),(5,9,22810,'Opening - No Text'),(5,9,45927,'Summon Friend'),(5,9,58284,'Chaos Bolt Passive'),(5,9,61437,'Opening'),(6,1,78,'Heroic Strike'),(6,1,81,'Dodge'),(6,1,107,'Block'),(6,1,196,'One-Handed Axes'),(6,1,198,'One-Handed Maces'),(6,1,199,'Two-Handed Maces'),(6,1,203,'Unarmed'),(6,1,204,'Defense'),(6,1,522,'SPELLDEFENSE (DND)'),(6,1,669,'Language Orcish'),(6,1,670,'Language Taurahe'),(6,1,1843,'Disarm'),(6,1,2382,'Generic'),(6,1,2457,'Battle Stance'),(6,1,2479,'Honorless Target'),(6,1,3050,'Detect'),(6,1,3365,'Opening'),(6,1,5301,'Defensive State (DND)'),(6,1,6233,'Closing'),(6,1,6246,'Closing'),(6,1,6247,'Opening'),(6,1,6477,'Opening'),(6,1,6478,'Opening'),(6,1,6603,'Attack'),(6,1,7266,'Duel'),(6,1,7267,'Grovel'),(6,1,7355,'Stuck'),(6,1,8386,'Attacking'),(6,1,8737,'Mail'),(6,1,9077,'Leather'),(6,1,9078,'Cloth'),(6,1,9116,'Shield'),(6,1,9125,'Generic'),(6,1,20549,'War Stomp'),(6,1,20550,'Endurance'),(6,1,20551,'Nature Resistance'),(6,1,20552,'Cultivation'),(6,1,21651,'Opening'),(6,1,21652,'Closing'),(6,1,22027,'Remove Insignia'),(6,1,22810,'Opening - No Text'),(6,1,32215,'Victorious State'),(6,1,45927,'Summon Friend'),(6,1,61437,'Opening'),(6,3,75,'Auto Shot'),(6,3,81,'Dodge'),(6,3,196,'One-Handed Axes'),(6,3,203,'Unarmed'),(6,3,204,'Defense'),(6,3,266,'Guns'),(6,3,522,'SPELLDEFENSE (DND)'),(6,3,669,'Language Orcish'),(6,3,670,'Language Taurahe'),(6,3,1843,'Disarm'),(6,3,2382,'Generic'),(6,3,2479,'Honorless Target'),(6,3,2973,'Raptor Strike'),(6,3,3050,'Detect'),(6,3,3365,'Opening'),(6,3,6233,'Closing'),(6,3,6246,'Closing'),(6,3,6247,'Opening'),(6,3,6477,'Opening'),(6,3,6478,'Opening'),(6,3,6603,'Attack'),(6,3,7266,'Duel'),(6,3,7267,'Grovel'),(6,3,7355,'Stuck'),(6,3,8386,'Attacking'),(6,3,9077,'Leather'),(6,3,9078,'Cloth'),(6,3,9125,'Generic'),(6,3,13358,'Defensive State (DND)'),(6,3,20549,'War Stomp'),(6,3,20550,'Endurance'),(6,3,20551,'Nature Resistance'),(6,3,20552,'Cultivation'),(6,3,21651,'Opening'),(6,3,21652,'Closing'),(6,3,22027,'Remove Insignia'),(6,3,22810,'Opening - No Text'),(6,3,24949,'Defensive State 2 (DND)'),(6,3,34082,'Advantaged State (DND)'),(6,3,45927,'Summon Friend'),(6,3,61437,'Opening'),(6,6,81,'Dodge'),(6,6,196,'One-Handed Axes'),(6,6,197,'Two-Handed Axes'),(6,6,200,'Polearms'),(6,6,201,'One-Handed Swords'),(6,6,202,'Two-Handed Swords'),(6,6,203,'Unarmed'),(6,6,204,'Defense'),(6,6,522,'SPELLDEFENSE (DND)'),(6,6,669,'Language Orcish'),(6,6,670,'Language Taurahe'),(6,6,674,'Dual Wield'),(6,6,750,'Plate Mail'),(6,6,1843,'Disarm'),(6,6,2382,'Generic'),(6,6,2479,'Honorless Target'),(6,6,3050,'Detect'),(6,6,3127,'Parry'),(6,6,3275,'Linen Bandage'),(6,6,3276,'Heavy Linen Bandage'),(6,6,3277,'Wool Bandage'),(6,6,3278,'Heavy Wool Bandage'),(6,6,3365,'Opening'),(6,6,6233,'Closing'),(6,6,6246,'Closing'),(6,6,6247,'Opening'),(6,6,6477,'Opening'),(6,6,6478,'Opening'),(6,6,6603,'Attack'),(6,6,7266,'Duel'),(6,6,7267,'Grovel'),(6,6,7355,'Stuck'),(6,6,7928,'Silk Bandage'),(6,6,7929,'Heavy Silk Bandage'),(6,6,7934,'Anti-Venom'),(6,6,8386,'Attacking'),(6,6,8737,'Mail'),(6,6,9077,'Leather'),(6,6,9078,'Cloth'),(6,6,9125,'Generic'),(6,6,10840,'Mageweave Bandage'),(6,6,10841,'Heavy Mageweave Bandage'),(6,6,10846,'First Aid'),(6,6,18629,'Runecloth Bandage'),(6,6,18630,'Heavy Runecloth Bandage'),(6,6,20549,'War Stomp'),(6,6,20550,'Endurance'),(6,6,20551,'Nature Resistance'),(6,6,20552,'Cultivation'),(6,6,21651,'Opening'),(6,6,21652,'Closing'),(6,6,22027,'Remove Insignia'),(6,6,22810,'Opening - No Text'),(6,6,33391,'Journeyman Riding'),(6,6,45462,'Plague Strike'),(6,6,45477,'Icy Touch'),(6,6,45902,'Blood Strike'),(6,6,45903,'Offensive State (DND)'),(6,6,45927,'Summon Friend'),(6,6,47541,'Death Coil'),(6,6,48266,'Blood Presence'),(6,6,49410,'Forceful Deflection'),(6,6,49576,'Death Grip'),(6,6,52665,'Sigil'),(6,6,59879,'Blood Plague'),(6,6,59921,'Frost Fever'),(6,6,61437,'Opening'),(6,6,61455,'Runic Focus'),(6,7,81,'Dodge'),(6,7,107,'Block'),(6,7,198,'One-Handed Maces'),(6,7,203,'Unarmed'),(6,7,204,'Defense'),(6,7,227,'Staves'),(6,7,331,'Healing Wave'),(6,7,403,'Lightning Bolt'),(6,7,522,'SPELLDEFENSE (DND)'),(6,7,669,'Language Orcish'),(6,7,670,'Language Taurahe'),(6,7,1843,'Disarm'),(6,7,2382,'Generic'),(6,7,2479,'Honorless Target'),(6,7,3050,'Detect'),(6,7,3365,'Opening'),(6,7,6233,'Closing'),(6,7,6246,'Closing'),(6,7,6247,'Opening'),(6,7,6477,'Opening'),(6,7,6478,'Opening'),(6,7,6603,'Attack'),(6,7,7266,'Duel'),(6,7,7267,'Grovel'),(6,7,7355,'Stuck'),(6,7,8386,'Attacking'),(6,7,9077,'Leather'),(6,7,9078,'Cloth'),(6,7,9116,'Shield'),(6,7,9125,'Generic'),(6,7,20549,'War Stomp'),(6,7,20550,'Endurance'),(6,7,20551,'Nature Resistance'),(6,7,20552,'Cultivation'),(6,7,21651,'Opening'),(6,7,21652,'Closing'),(6,7,22027,'Remove Insignia'),(6,7,22810,'Opening - No Text'),(6,7,27763,'Totem'),(6,7,45927,'Summon Friend'),(6,7,61437,'Opening'),(6,11,81,'Dodge'),(6,11,198,'One-Handed Maces'),(6,11,203,'Unarmed'),(6,11,204,'Defense'),(6,11,227,'Staves'),(6,11,522,'SPELLDEFENSE (DND)'),(6,11,669,'Language Orcish'),(6,11,670,'Language Taurahe'),(6,11,1843,'Disarm'),(6,11,2382,'Generic'),(6,11,2479,'Honorless Target'),(6,11,3050,'Detect'),(6,11,3365,'Opening'),(6,11,5176,'Wrath'),(6,11,5185,'Healing Touch'),(6,11,6233,'Closing'),(6,11,6246,'Closing'),(6,11,6247,'Opening'),(6,11,6477,'Opening'),(6,11,6478,'Opening'),(6,11,6603,'Attack'),(6,11,7266,'Duel'),(6,11,7267,'Grovel'),(6,11,7355,'Stuck'),(6,11,8386,'Attacking'),(6,11,9077,'Leather'),(6,11,9078,'Cloth'),(6,11,9125,'Generic'),(6,11,20549,'War Stomp'),(6,11,20550,'Endurance'),(6,11,20551,'Nature Resistance'),(6,11,20552,'Cultivation'),(6,11,21651,'Opening'),(6,11,21652,'Closing'),(6,11,22027,'Remove Insignia'),(6,11,22810,'Opening - No Text'),(6,11,27764,'Fetish'),(6,11,45927,'Summon Friend'),(6,11,61437,'Opening'),(7,1,78,'Heroic Strike'),(7,1,81,'Dodge'),(7,1,107,'Block'),(7,1,198,'One-Handed Maces'),(7,1,201,'One-Handed Swords'),(7,1,203,'Unarmed'),(7,1,204,'Defense'),(7,1,522,'SPELLDEFENSE (DND)'),(7,1,668,'Language Common'),(7,1,1180,'Daggers'),(7,1,1843,'Disarm'),(7,1,2382,'Generic'),(7,1,2457,'Battle Stance'),(7,1,2479,'Honorless Target'),(7,1,3050,'Detect'),(7,1,3365,'Opening'),(7,1,5301,'Defensive State (DND)'),(7,1,6233,'Closing'),(7,1,6246,'Closing'),(7,1,6247,'Opening'),(7,1,6477,'Opening'),(7,1,6478,'Opening'),(7,1,6603,'Attack'),(7,1,7266,'Duel'),(7,1,7267,'Grovel'),(7,1,7340,'Language Gnomish'),(7,1,7355,'Stuck'),(7,1,8386,'Attacking'),(7,1,8737,'Mail'),(7,1,9077,'Leather'),(7,1,9078,'Cloth'),(7,1,9116,'Shield'),(7,1,9125,'Generic'),(7,1,20589,'Escape Artist'),(7,1,20591,'Expansive Mind'),(7,1,20592,'Arcane Resistance'),(7,1,20593,'Engineering Specialization'),(7,1,21651,'Opening'),(7,1,21652,'Closing'),(7,1,22027,'Remove Insignia'),(7,1,22810,'Opening - No Text'),(7,1,32215,'Victorious State'),(7,1,45927,'Summon Friend'),(7,1,61437,'Opening'),(7,4,81,'Dodge'),(7,4,203,'Unarmed'),(7,4,204,'Defense'),(7,4,522,'SPELLDEFENSE (DND)'),(7,4,668,'Language Common'),(7,4,1180,'Daggers'),(7,4,1752,'Sinister Strike'),(7,4,1843,'Disarm'),(7,4,2098,'Eviscerate'),(7,4,2382,'Generic'),(7,4,2479,'Honorless Target'),(7,4,2567,'Thrown'),(7,4,2764,'Throw'),(7,4,3050,'Detect'),(7,4,3365,'Opening'),(7,4,6233,'Closing'),(7,4,6246,'Closing'),(7,4,6247,'Opening'),(7,4,6477,'Opening'),(7,4,6478,'Opening'),(7,4,6603,'Attack'),(7,4,7266,'Duel'),(7,4,7267,'Grovel'),(7,4,7340,'Language Gnomish'),(7,4,7355,'Stuck'),(7,4,8386,'Attacking'),(7,4,9077,'Leather'),(7,4,9078,'Cloth'),(7,4,9125,'Generic'),(7,4,16092,'Defensive State (DND)'),(7,4,20589,'Escape Artist'),(7,4,20591,'Expansive Mind'),(7,4,20592,'Arcane Resistance'),(7,4,20593,'Engineering Specialization'),(7,4,21184,'Rogue Passive (DND)'),(7,4,21651,'Opening'),(7,4,21652,'Closing'),(7,4,22027,'Remove Insignia'),(7,4,22810,'Opening - No Text'),(7,4,45927,'Summon Friend'),(7,4,61437,'Opening'),(7,6,81,'Dodge'),(7,6,196,'One-Handed Axes'),(7,6,197,'Two-Handed Axes'),(7,6,200,'Polearms'),(7,6,201,'One-Handed Swords'),(7,6,202,'Two-Handed Swords'),(7,6,203,'Unarmed'),(7,6,204,'Defense'),(7,6,522,'SPELLDEFENSE (DND)'),(7,6,668,'Language Common'),(7,6,674,'Dual Wield'),(7,6,750,'Plate Mail'),(7,6,1843,'Disarm'),(7,6,2382,'Generic'),(7,6,2479,'Honorless Target'),(7,6,3050,'Detect'),(7,6,3127,'Parry'),(7,6,3275,'Linen Bandage'),(7,6,3276,'Heavy Linen Bandage'),(7,6,3277,'Wool Bandage'),(7,6,3278,'Heavy Wool Bandage'),(7,6,3365,'Opening'),(7,6,6233,'Closing'),(7,6,6246,'Closing'),(7,6,6247,'Opening'),(7,6,6477,'Opening'),(7,6,6478,'Opening'),(7,6,6603,'Attack'),(7,6,7266,'Duel'),(7,6,7267,'Grovel'),(7,6,7340,'Language Gnomish'),(7,6,7355,'Stuck'),(7,6,7928,'Silk Bandage'),(7,6,7929,'Heavy Silk Bandage'),(7,6,7934,'Anti-Venom'),(7,6,8386,'Attacking'),(7,6,8737,'Mail'),(7,6,9077,'Leather'),(7,6,9078,'Cloth'),(7,6,9125,'Generic'),(7,6,10840,'Mageweave Bandage'),(7,6,10841,'Heavy Mageweave Bandage'),(7,6,10846,'First Aid'),(7,6,18629,'Runecloth Bandage'),(7,6,18630,'Heavy Runecloth Bandage'),(7,6,20589,'Escape Artist'),(7,6,20591,'Expansive Mind'),(7,6,20592,'Arcane Resistance'),(7,6,20593,'Engineering Specialization'),(7,6,21651,'Opening'),(7,6,21652,'Closing'),(7,6,22027,'Remove Insignia'),(7,6,22810,'Opening - No Text'),(7,6,33391,'Journeyman Riding'),(7,6,45462,'Plague Strike'),(7,6,45477,'Icy Touch'),(7,6,45902,'Blood Strike'),(7,6,45903,'Offensive State (DND)'),(7,6,45927,'Summon Friend'),(7,6,47541,'Death Coil'),(7,6,48266,'Blood Presence'),(7,6,49410,'Forceful Deflection'),(7,6,49576,'Death Grip'),(7,6,52665,'Sigil'),(7,6,59879,'Blood Plague'),(7,6,59921,'Frost Fever'),(7,6,61437,'Opening'),(7,6,61455,'Runic Focus'),(7,8,81,'Dodge'),(7,8,133,'Fireball'),(7,8,168,'Frost Armor'),(7,8,203,'Unarmed'),(7,8,204,'Defense'),(7,8,227,'Staves'),(7,8,522,'SPELLDEFENSE (DND)'),(7,8,668,'Language Common'),(7,8,1843,'Disarm'),(7,8,2382,'Generic'),(7,8,2479,'Honorless Target'),(7,8,3050,'Detect'),(7,8,3365,'Opening'),(7,8,5009,'Wands'),(7,8,5019,'Shoot'),(7,8,6233,'Closing'),(7,8,6246,'Closing'),(7,8,6247,'Opening'),(7,8,6477,'Opening'),(7,8,6478,'Opening'),(7,8,6603,'Attack'),(7,8,7266,'Duel'),(7,8,7267,'Grovel'),(7,8,7340,'Language Gnomish'),(7,8,7355,'Stuck'),(7,8,8386,'Attacking'),(7,8,9078,'Cloth'),(7,8,9125,'Generic'),(7,8,20589,'Escape Artist'),(7,8,20591,'Expansive Mind'),(7,8,20592,'Arcane Resistance'),(7,8,20593,'Engineering Specialization'),(7,8,21651,'Opening'),(7,8,21652,'Closing'),(7,8,22027,'Remove Insignia'),(7,8,22810,'Opening - No Text'),(7,8,45927,'Summon Friend'),(7,8,61437,'Opening'),(7,9,81,'Dodge'),(7,9,203,'Unarmed'),(7,9,204,'Defense'),(7,9,522,'SPELLDEFENSE (DND)'),(7,9,668,'Language Common'),(7,9,686,'Shadow Bolt'),(7,9,687,'Demon Skin'),(7,9,1180,'Daggers'),(7,9,1843,'Disarm'),(7,9,2382,'Generic'),(7,9,2479,'Honorless Target'),(7,9,3050,'Detect'),(7,9,3365,'Opening'),(7,9,5009,'Wands'),(7,9,5019,'Shoot'),(7,9,6233,'Closing'),(7,9,6246,'Closing'),(7,9,6247,'Opening'),(7,9,6477,'Opening'),(7,9,6478,'Opening'),(7,9,6603,'Attack'),(7,9,7266,'Duel'),(7,9,7267,'Grovel'),(7,9,7340,'Language Gnomish'),(7,9,7355,'Stuck'),(7,9,8386,'Attacking'),(7,9,9078,'Cloth'),(7,9,9125,'Generic'),(7,9,20589,'Escape Artist'),(7,9,20591,'Expansive Mind'),(7,9,20592,'Arcane Resistance'),(7,9,20593,'Engineering Specialization'),(7,9,21651,'Opening'),(7,9,21652,'Closing'),(7,9,22027,'Remove Insignia'),(7,9,22810,'Opening - No Text'),(7,9,45927,'Summon Friend'),(7,9,58284,'Chaos Bolt Passive'),(7,9,61437,'Opening'),(8,1,78,'Heroic Strike'),(8,1,81,'Dodge'),(8,1,107,'Block'),(8,1,196,'One-Handed Axes'),(8,1,203,'Unarmed'),(8,1,204,'Defense'),(8,1,522,'SPELLDEFENSE (DND)'),(8,1,669,'Language Orcish'),(8,1,1180,'Daggers'),(8,1,1843,'Disarm'),(8,1,2382,'Generic'),(8,1,2457,'Battle Stance'),(8,1,2479,'Honorless Target'),(8,1,2567,'Thrown'),(8,1,2764,'Throw'),(8,1,3050,'Detect'),(8,1,3365,'Opening'),(8,1,5301,'Defensive State (DND)'),(8,1,6233,'Closing'),(8,1,6246,'Closing'),(8,1,6247,'Opening'),(8,1,6477,'Opening'),(8,1,6478,'Opening'),(8,1,6603,'Attack'),(8,1,7266,'Duel'),(8,1,7267,'Grovel'),(8,1,7341,'Language Troll'),(8,1,7355,'Stuck'),(8,1,8386,'Attacking'),(8,1,8737,'Mail'),(8,1,9077,'Leather'),(8,1,9078,'Cloth'),(8,1,9116,'Shield'),(8,1,9125,'Generic'),(8,1,20555,'Regeneration'),(8,1,20557,'Beast Slaying'),(8,1,20558,'Throwing Specialization'),(8,1,21651,'Opening'),(8,1,21652,'Closing'),(8,1,22027,'Remove Insignia'),(8,1,22810,'Opening - No Text'),(8,1,26290,'Bow Specialization'),(8,1,26296,'Berserking'),(8,1,32215,'Victorious State'),(8,1,45927,'Summon Friend'),(8,1,58943,'Da Voodoo Shuffle'),(8,1,61437,'Opening'),(8,3,75,'Auto Shot'),(8,3,81,'Dodge'),(8,3,196,'One-Handed Axes'),(8,3,203,'Unarmed'),(8,3,204,'Defense'),(8,3,264,'Bows'),(8,3,522,'SPELLDEFENSE (DND)'),(8,3,669,'Language Orcish'),(8,3,1843,'Disarm'),(8,3,2382,'Generic'),(8,3,2479,'Honorless Target'),(8,3,2973,'Raptor Strike'),(8,3,3050,'Detect'),(8,3,3365,'Opening'),(8,3,6233,'Closing'),(8,3,6246,'Closing'),(8,3,6247,'Opening'),(8,3,6477,'Opening'),(8,3,6478,'Opening'),(8,3,6603,'Attack'),(8,3,7266,'Duel'),(8,3,7267,'Grovel'),(8,3,7341,'Language Troll'),(8,3,7355,'Stuck'),(8,3,8386,'Attacking'),(8,3,9077,'Leather'),(8,3,9078,'Cloth'),(8,3,9125,'Generic'),(8,3,13358,'Defensive State (DND)'),(8,3,20554,'Berserking'),(8,3,20555,'Regeneration'),(8,3,20557,'Beast Slaying'),(8,3,20558,'Throwing Specialization'),(8,3,21651,'Opening'),(8,3,21652,'Closing'),(8,3,22027,'Remove Insignia'),(8,3,22810,'Opening - No Text'),(8,3,24949,'Defensive State 2 (DND)'),(8,3,26290,'Bow Specialization'),(8,3,34082,'Advantaged State (DND)'),(8,3,45927,'Summon Friend'),(8,3,58943,'Da Voodoo Shuffle'),(8,3,61437,'Opening'),(8,4,81,'Dodge'),(8,4,203,'Unarmed'),(8,4,204,'Defense'),(8,4,522,'SPELLDEFENSE (DND)'),(8,4,669,'Language Orcish'),(8,4,1180,'Daggers'),(8,4,1752,'Sinister Strike'),(8,4,1843,'Disarm'),(8,4,2098,'Eviscerate'),(8,4,2382,'Generic'),(8,4,2479,'Honorless Target'),(8,4,2567,'Thrown'),(8,4,2764,'Throw'),(8,4,3050,'Detect'),(8,4,3365,'Opening'),(8,4,6233,'Closing'),(8,4,6246,'Closing'),(8,4,6247,'Opening'),(8,4,6477,'Opening'),(8,4,6478,'Opening'),(8,4,6603,'Attack'),(8,4,7266,'Duel'),(8,4,7267,'Grovel'),(8,4,7341,'Language Troll'),(8,4,7355,'Stuck'),(8,4,8386,'Attacking'),(8,4,9077,'Leather'),(8,4,9078,'Cloth'),(8,4,9125,'Generic'),(8,4,16092,'Defensive State (DND)'),(8,4,20555,'Regeneration'),(8,4,20557,'Beast Slaying'),(8,4,20558,'Throwing Specialization'),(8,4,21184,'Rogue Passive (DND)'),(8,4,21651,'Opening'),(8,4,21652,'Closing'),(8,4,22027,'Remove Insignia'),(8,4,22810,'Opening - No Text'),(8,4,26290,'Bow Specialization'),(8,4,26297,'Berserking'),(8,4,45927,'Summon Friend'),(8,4,58943,'Da Voodoo Shuffle'),(8,4,61437,'Opening'),(8,5,81,'Dodge'),(8,5,198,'One-Handed Maces'),(8,5,203,'Unarmed'),(8,5,204,'Defense'),(8,5,522,'SPELLDEFENSE (DND)'),(8,5,585,'Smite'),(8,5,669,'Language Orcish'),(8,5,1843,'Disarm'),(8,5,2050,'Lesser Heal'),(8,5,2382,'Generic'),(8,5,2479,'Honorless Target'),(8,5,3050,'Detect'),(8,5,3365,'Opening'),(8,5,5009,'Wands'),(8,5,5019,'Shoot'),(8,5,6233,'Closing'),(8,5,6246,'Closing'),(8,5,6247,'Opening'),(8,5,6477,'Opening'),(8,5,6478,'Opening'),(8,5,6603,'Attack'),(8,5,7266,'Duel'),(8,5,7267,'Grovel'),(8,5,7341,'Language Troll'),(8,5,7355,'Stuck'),(8,5,8386,'Attacking'),(8,5,9078,'Cloth'),(8,5,9125,'Generic'),(8,5,20554,'Berserking'),(8,5,20555,'Regeneration'),(8,5,20557,'Beast Slaying'),(8,5,20558,'Throwing Specialization'),(8,5,21651,'Opening'),(8,5,21652,'Closing'),(8,5,22027,'Remove Insignia'),(8,5,22810,'Opening - No Text'),(8,5,26290,'Bow Specialization'),(8,5,45927,'Summon Friend'),(8,5,58943,'Da Voodoo Shuffle'),(8,5,61437,'Opening'),(8,6,81,'Dodge'),(8,6,196,'One-Handed Axes'),(8,6,197,'Two-Handed Axes'),(8,6,200,'Polearms'),(8,6,201,'One-Handed Swords'),(8,6,202,'Two-Handed Swords'),(8,6,203,'Unarmed'),(8,6,204,'Defense'),(8,6,522,'SPELLDEFENSE (DND)'),(8,6,669,'Language Orcish'),(8,6,674,'Dual Wield'),(8,6,750,'Plate Mail'),(8,6,1843,'Disarm'),(8,6,2382,'Generic'),(8,6,2479,'Honorless Target'),(8,6,3050,'Detect'),(8,6,3127,'Parry'),(8,6,3275,'Linen Bandage'),(8,6,3276,'Heavy Linen Bandage'),(8,6,3277,'Wool Bandage'),(8,6,3278,'Heavy Wool Bandage'),(8,6,3365,'Opening'),(8,6,6233,'Closing'),(8,6,6246,'Closing'),(8,6,6247,'Opening'),(8,6,6477,'Opening'),(8,6,6478,'Opening'),(8,6,6603,'Attack'),(8,6,7266,'Duel'),(8,6,7267,'Grovel'),(8,6,7341,'Language Troll'),(8,6,7355,'Stuck'),(8,6,7928,'Silk Bandage'),(8,6,7929,'Heavy Silk Bandage'),(8,6,7934,'Anti-Venom'),(8,6,8386,'Attacking'),(8,6,8737,'Mail'),(8,6,9077,'Leather'),(8,6,9078,'Cloth'),(8,6,9125,'Generic'),(8,6,10840,'Mageweave Bandage'),(8,6,10841,'Heavy Mageweave Bandage'),(8,6,10846,'First Aid'),(8,6,18629,'Runecloth Bandage'),(8,6,18630,'Heavy Runecloth Bandage'),(8,6,20555,'Regeneration'),(8,6,20557,'Beast Slaying'),(8,6,20558,'Throwing Specialization'),(8,6,21651,'Opening'),(8,6,21652,'Closing'),(8,6,22027,'Remove Insignia'),(8,6,22810,'Opening - No Text'),(8,6,26290,'Bow Specialization'),(8,6,33391,'Journeyman Riding'),(8,6,45462,'Plague Strike'),(8,6,45477,'Icy Touch'),(8,6,45902,'Blood Strike'),(8,6,45903,'Offensive State (DND)'),(8,6,45927,'Summon Friend'),(8,6,47541,'Death Coil'),(8,6,48266,'Blood Presence'),(8,6,49410,'Forceful Deflection'),(8,6,49576,'Death Grip'),(8,6,50621,'Berserking'),(8,6,52665,'Sigil'),(8,6,58943,'Da Voodoo Shuffle'),(8,6,59879,'Blood Plague'),(8,6,59921,'Frost Fever'),(8,6,61437,'Opening'),(8,6,61455,'Runic Focus'),(8,7,81,'Dodge'),(8,7,107,'Block'),(8,7,198,'One-Handed Maces'),(8,7,203,'Unarmed'),(8,7,204,'Defense'),(8,7,227,'Staves'),(8,7,331,'Healing Wave'),(8,7,403,'Lightning Bolt'),(8,7,522,'SPELLDEFENSE (DND)'),(8,7,669,'Language Orcish'),(8,7,1843,'Disarm'),(8,7,2382,'Generic'),(8,7,2479,'Honorless Target'),(8,7,3050,'Detect'),(8,7,3365,'Opening'),(8,7,6233,'Closing'),(8,7,6246,'Closing'),(8,7,6247,'Opening'),(8,7,6477,'Opening'),(8,7,6478,'Opening'),(8,7,6603,'Attack'),(8,7,7266,'Duel'),(8,7,7267,'Grovel'),(8,7,7341,'Language Troll'),(8,7,7355,'Stuck'),(8,7,8386,'Attacking'),(8,7,9077,'Leather'),(8,7,9078,'Cloth'),(8,7,9116,'Shield'),(8,7,9125,'Generic'),(8,7,20554,'Berserking'),(8,7,20555,'Regeneration'),(8,7,20557,'Beast Slaying'),(8,7,20558,'Throwing Specialization'),(8,7,21651,'Opening'),(8,7,21652,'Closing'),(8,7,22027,'Remove Insignia'),(8,7,22810,'Opening - No Text'),(8,7,26290,'Bow Specialization'),(8,7,27763,'Totem'),(8,7,45927,'Summon Friend'),(8,7,58943,'Da Voodoo Shuffle'),(8,7,61437,'Opening'),(8,8,81,'Dodge'),(8,8,133,'Fireball'),(8,8,168,'Frost Armor'),(8,8,203,'Unarmed'),(8,8,204,'Defense'),(8,8,227,'Staves'),(8,8,522,'SPELLDEFENSE (DND)'),(8,8,669,'Language Orcish'),(8,8,1843,'Disarm'),(8,8,2382,'Generic'),(8,8,2479,'Honorless Target'),(8,8,3050,'Detect'),(8,8,3365,'Opening'),(8,8,5009,'Wands'),(8,8,5019,'Shoot'),(8,8,6233,'Closing'),(8,8,6246,'Closing'),(8,8,6247,'Opening'),(8,8,6477,'Opening'),(8,8,6478,'Opening'),(8,8,6603,'Attack'),(8,8,7266,'Duel'),(8,8,7267,'Grovel'),(8,8,7341,'Language Troll'),(8,8,7355,'Stuck'),(8,8,8386,'Attacking'),(8,8,9078,'Cloth'),(8,8,9125,'Generic'),(8,8,20554,'Berserking'),(8,8,20555,'Regeneration'),(8,8,20557,'Beast Slaying'),(8,8,20558,'Throwing Specialization'),(8,8,21651,'Opening'),(8,8,21652,'Closing'),(8,8,22027,'Remove Insignia'),(8,8,22810,'Opening - No Text'),(8,8,26290,'Bow Specialization'),(8,8,45927,'Summon Friend'),(8,8,58943,'Da Voodoo Shuffle'),(8,8,61437,'Opening'),(10,2,81,'Dodge'),(10,2,107,'Block'),(10,2,201,'One-Handed Swords'),(10,2,202,'Two-Handed Swords'),(10,2,203,'Unarmed'),(10,2,204,'Defense'),(10,2,522,'SPELLDEFENSE (DND)'),(10,2,635,'Holy Light'),(10,2,669,'Language Orcish'),(10,2,813,'Language Thalassian'),(10,2,822,'Magic Resistance'),(10,2,2382,'Generic'),(10,2,2479,'Honorless Target'),(10,2,3050,'Detect'),(10,2,3365,'Opening'),(10,2,6233,'Closing'),(10,2,6246,'Closing'),(10,2,6247,'Opening'),(10,2,6477,'Opening'),(10,2,6478,'Opening'),(10,2,6603,'Attack'),(10,2,7266,'Duel'),(10,2,7267,'Grovel'),(10,2,7355,'Stuck'),(10,2,8386,'Attacking'),(10,2,8737,'Mail'),(10,2,9077,'Leather'),(10,2,9078,'Cloth'),(10,2,9116,'Shield'),(10,2,9125,'Generic'),(10,2,21084,'Seal of Righteousness'),(10,2,21651,'Opening'),(10,2,21652,'Closing'),(10,2,22027,'Remove Insignia'),(10,2,22810,'Opening - No Text'),(10,2,27762,'Libram'),(10,2,28730,'Arcane Torrent'),(10,2,28734,'Mana Tap'),(10,2,28877,'Arcane Affinity'),(10,3,75,'Auto Shot'),(10,3,81,'Dodge'),(10,3,203,'Unarmed'),(10,3,204,'Defense'),(10,3,264,'Bows'),(10,3,522,'SPELLDEFENSE (DND)'),(10,3,669,'Language Orcish'),(10,3,813,'Language Thalassian'),(10,3,822,'Magic Resistance'),(10,3,1180,'Daggers'),(10,3,2382,'Generic'),(10,3,2479,'Honorless Target'),(10,3,2973,'Raptor Strike'),(10,3,3050,'Detect'),(10,3,3365,'Opening'),(10,3,6233,'Closing'),(10,3,6246,'Closing'),(10,3,6247,'Opening'),(10,3,6477,'Opening'),(10,3,6478,'Opening'),(10,3,6603,'Attack'),(10,3,7266,'Duel'),(10,3,7267,'Grovel'),(10,3,7355,'Stuck'),(10,3,8386,'Attacking'),(10,3,9077,'Leather'),(10,3,9078,'Cloth'),(10,3,9125,'Generic'),(10,3,13358,'Defensive State (DND)'),(10,3,21651,'Opening'),(10,3,21652,'Closing'),(10,3,22027,'Remove Insignia'),(10,3,22810,'Opening - No Text'),(10,3,24949,'Defensive State 2 (DND)'),(10,3,28730,'Arcane Torrent'),(10,3,28734,'Mana Tap'),(10,3,28877,'Arcane Affinity'),(10,3,34082,'Advantaged State (DND)'),(10,4,81,'Dodge'),(10,4,203,'Unarmed'),(10,4,204,'Defense'),(10,4,522,'SPELLDEFENSE (DND)'),(10,4,669,'Language Orcish'),(10,4,813,'Language Thalassian'),(10,4,822,'Magic Resistance'),(10,4,1180,'Daggers'),(10,4,1752,'Sinister Strike'),(10,4,2098,'Eviscerate'),(10,4,2382,'Generic'),(10,4,2479,'Honorless Target'),(10,4,2567,'Thrown'),(10,4,2764,'Throw'),(10,4,3050,'Detect'),(10,4,3365,'Opening'),(10,4,6233,'Closing'),(10,4,6246,'Closing'),(10,4,6247,'Opening'),(10,4,6477,'Opening'),(10,4,6478,'Opening'),(10,4,6603,'Attack'),(10,4,7266,'Duel'),(10,4,7267,'Grovel'),(10,4,7355,'Stuck'),(10,4,8386,'Attacking'),(10,4,9077,'Leather'),(10,4,9078,'Cloth'),(10,4,9125,'Generic'),(10,4,16092,'Defensive State (DND)'),(10,4,21184,'Rogue Passive (DND)'),(10,4,21651,'Opening'),(10,4,21652,'Closing'),(10,4,22027,'Remove Insignia'),(10,4,22810,'Opening - No Text'),(10,4,25046,'Arcane Torrent'),(10,4,28734,'Mana Tap'),(10,4,28877,'Arcane Affinity'),(10,5,81,'Dodge'),(10,5,198,'One-Handed Maces'),(10,5,203,'Unarmed'),(10,5,204,'Defense'),(10,5,522,'SPELLDEFENSE (DND)'),(10,5,585,'Smite'),(10,5,669,'Language Orcish'),(10,5,813,'Language Thalassian'),(10,5,822,'Magic Resistance'),(10,5,2050,'Lesser Heal'),(10,5,2382,'Generic'),(10,5,2479,'Honorless Target'),(10,5,3050,'Detect'),(10,5,3365,'Opening'),(10,5,5009,'Wands'),(10,5,5019,'Shoot'),(10,5,6233,'Closing'),(10,5,6246,'Closing'),(10,5,6247,'Opening'),(10,5,6477,'Opening'),(10,5,6478,'Opening'),(10,5,6603,'Attack'),(10,5,7266,'Duel'),(10,5,7267,'Grovel'),(10,5,7355,'Stuck'),(10,5,8386,'Attacking'),(10,5,9078,'Cloth'),(10,5,9125,'Generic'),(10,5,21651,'Opening'),(10,5,21652,'Closing'),(10,5,22027,'Remove Insignia'),(10,5,22810,'Opening - No Text'),(10,5,28730,'Arcane Torrent'),(10,5,28734,'Mana Tap'),(10,5,28877,'Arcane Affinity'),(10,6,81,'Dodge'),(10,6,196,'One-Handed Axes'),(10,6,197,'Two-Handed Axes'),(10,6,200,'Polearms'),(10,6,201,'One-Handed Swords'),(10,6,202,'Two-Handed Swords'),(10,6,203,'Unarmed'),(10,6,204,'Defense'),(10,6,522,'SPELLDEFENSE (DND)'),(10,6,669,'Language Orcish'),(10,6,674,'Dual Wield'),(10,6,750,'Plate Mail'),(10,6,813,'Language Thalassian'),(10,6,822,'Magic Resistance'),(10,6,1843,'Disarm'),(10,6,2382,'Generic'),(10,6,2479,'Honorless Target'),(10,6,3050,'Detect'),(10,6,3127,'Parry'),(10,6,3275,'Linen Bandage'),(10,6,3276,'Heavy Linen Bandage'),(10,6,3277,'Wool Bandage'),(10,6,3278,'Heavy Wool Bandage'),(10,6,3365,'Opening'),(10,6,6233,'Closing'),(10,6,6246,'Closing'),(10,6,6247,'Opening'),(10,6,6477,'Opening'),(10,6,6478,'Opening'),(10,6,6603,'Attack'),(10,6,7266,'Duel'),(10,6,7267,'Grovel'),(10,6,7355,'Stuck'),(10,6,7928,'Silk Bandage'),(10,6,7929,'Heavy Silk Bandage'),(10,6,7934,'Anti-Venom'),(10,6,8386,'Attacking'),(10,6,8737,'Mail'),(10,6,9077,'Leather'),(10,6,9078,'Cloth'),(10,6,9125,'Generic'),(10,6,10840,'Mageweave Bandage'),(10,6,10841,'Heavy Mageweave Bandage'),(10,6,10846,'First Aid'),(10,6,18629,'Runecloth Bandage'),(10,6,18630,'Heavy Runecloth Bandage'),(10,6,21651,'Opening'),(10,6,21652,'Closing'),(10,6,22027,'Remove Insignia'),(10,6,22810,'Opening - No Text'),(10,6,28877,'Arcane Affinity'),(10,6,33391,'Journeyman Riding'),(10,6,45462,'Plague Strike'),(10,6,45477,'Icy Touch'),(10,6,45902,'Blood Strike'),(10,6,45903,'Offensive State (DND)'),(10,6,45927,'Summon Friend'),(10,6,47541,'Death Coil'),(10,6,48266,'Blood Presence'),(10,6,49410,'Forceful Deflection'),(10,6,49576,'Death Grip'),(10,6,50613,'Arcane Torrent'),(10,6,52665,'Sigil'),(10,6,59879,'Blood Plague'),(10,6,59921,'Frost Fever'),(10,6,61437,'Opening'),(10,6,61455,'Runic Focus'),(10,8,81,'Dodge'),(10,8,133,'Fireball'),(10,8,168,'Frost Armor'),(10,8,203,'Unarmed'),(10,8,204,'Defense'),(10,8,227,'Staves'),(10,8,522,'SPELLDEFENSE (DND)'),(10,8,669,'Language Orcish'),(10,8,813,'Language Thalassian'),(10,8,822,'Magic Resistance'),(10,8,2382,'Generic'),(10,8,2479,'Honorless Target'),(10,8,3050,'Detect'),(10,8,3365,'Opening'),(10,8,5009,'Wands'),(10,8,5019,'Shoot'),(10,8,6233,'Closing'),(10,8,6246,'Closing'),(10,8,6247,'Opening'),(10,8,6477,'Opening'),(10,8,6478,'Opening'),(10,8,6603,'Attack'),(10,8,7266,'Duel'),(10,8,7267,'Grovel'),(10,8,7355,'Stuck'),(10,8,8386,'Attacking'),(10,8,9078,'Cloth'),(10,8,9125,'Generic'),(10,8,21651,'Opening'),(10,8,21652,'Closing'),(10,8,22027,'Remove Insignia'),(10,8,22810,'Opening - No Text'),(10,8,28730,'Arcane Torrent'),(10,8,28734,'Mana Tap'),(10,8,28877,'Arcane Affinity'),(10,9,81,'Dodge'),(10,9,203,'Unarmed'),(10,9,204,'Defense'),(10,9,522,'SPELLDEFENSE (DND)'),(10,9,669,'Language Orcish'),(10,9,686,'Shadow Bolt'),(10,9,687,'Demon Skin'),(10,9,813,'Language Thalassian'),(10,9,822,'Magic Resistance'),(10,9,1180,'Daggers'),(10,9,2382,'Generic'),(10,9,2479,'Honorless Target'),(10,9,3050,'Detect'),(10,9,3365,'Opening'),(10,9,5009,'Wands'),(10,9,5019,'Shoot'),(10,9,6233,'Closing'),(10,9,6246,'Closing'),(10,9,6247,'Opening'),(10,9,6477,'Opening'),(10,9,6478,'Opening'),(10,9,6603,'Attack'),(10,9,7266,'Duel'),(10,9,7267,'Grovel'),(10,9,7355,'Stuck'),(10,9,8386,'Attacking'),(10,9,9078,'Cloth'),(10,9,9125,'Generic'),(10,9,21651,'Opening'),(10,9,21652,'Closing'),(10,9,22027,'Remove Insignia'),(10,9,22810,'Opening - No Text'),(10,9,28730,'Arcane Torrent'),(10,9,28734,'Mana Tap'),(10,9,28877,'Arcane Affinity'),(10,9,58284,'Chaos Bolt Passive'),(11,1,78,'Heroic Strike'),(11,1,81,'Dodge'),(11,1,107,'Block'),(11,1,198,'One-Handed Maces'),(11,1,201,'One-Handed Swords'),(11,1,202,'Two-Handed Swords'),(11,1,203,'Unarmed'),(11,1,204,'Defense'),(11,1,522,'SPELLDEFENSE (DND)'),(11,1,668,'Language Common'),(11,1,1843,'Disarm'),(11,1,2382,'Generic'),(11,1,2457,'Battle Stance'),(11,1,2479,'Honorless Target'),(11,1,3050,'Detect'),(11,1,3365,'Opening'),(11,1,5301,'Defensive State (DND)'),(11,1,6233,'Closing'),(11,1,6246,'Closing'),(11,1,6247,'Opening'),(11,1,6477,'Opening'),(11,1,6478,'Opening'),(11,1,6562,'Heroic Presence'),(11,1,6603,'Attack'),(11,1,7266,'Duel'),(11,1,7267,'Grovel'),(11,1,7355,'Stuck'),(11,1,8386,'Attacking'),(11,1,8737,'Mail'),(11,1,9077,'Leather'),(11,1,9078,'Cloth'),(11,1,9116,'Shield'),(11,1,9125,'Generic'),(11,1,21651,'Opening'),(11,1,21652,'Closing'),(11,1,22027,'Remove Insignia'),(11,1,22810,'Opening - No Text'),(11,1,28875,'Gemcutting'),(11,1,28880,'Gift of the Naaru'),(11,1,29932,'Language Draenei'),(11,1,32215,'Victorious State'),(11,1,45927,'Summon Friend'),(11,1,59221,'Shadow Resistance'),(11,1,61437,'Opening'),(11,2,81,'Dodge'),(11,2,107,'Block'),(11,2,198,'One-Handed Maces'),(11,2,199,'Two-Handed Maces'),(11,2,203,'Unarmed'),(11,2,204,'Defense'),(11,2,522,'SPELLDEFENSE (DND)'),(11,2,635,'Holy Light'),(11,2,668,'Language Common'),(11,2,1843,'Disarm'),(11,2,2382,'Generic'),(11,2,2479,'Honorless Target'),(11,2,3050,'Detect'),(11,2,3365,'Opening'),(11,2,6233,'Closing'),(11,2,6246,'Closing'),(11,2,6247,'Opening'),(11,2,6477,'Opening'),(11,2,6478,'Opening'),(11,2,6562,'Heroic Presence'),(11,2,6603,'Attack'),(11,2,7266,'Duel'),(11,2,7267,'Grovel'),(11,2,7355,'Stuck'),(11,2,8386,'Attacking'),(11,2,8737,'Mail'),(11,2,9077,'Leather'),(11,2,9078,'Cloth'),(11,2,9116,'Shield'),(11,2,9125,'Generic'),(11,2,21084,'Seal of Righteousness'),(11,2,21651,'Opening'),(11,2,21652,'Closing'),(11,2,22027,'Remove Insignia'),(11,2,22810,'Opening - No Text'),(11,2,27762,'Libram'),(11,2,28875,'Gemcutting'),(11,2,29932,'Language Draenei'),(11,2,45927,'Summon Friend'),(11,2,59221,'Shadow Resistance'),(11,2,59542,'Gift of the Naaru'),(11,2,61437,'Opening'),(11,3,75,'Auto Shot'),(11,3,81,'Dodge'),(11,3,201,'One-Handed Swords'),(11,3,203,'Unarmed'),(11,3,204,'Defense'),(11,3,522,'SPELLDEFENSE (DND)'),(11,3,668,'Language Common'),(11,3,1843,'Disarm'),(11,3,2382,'Generic'),(11,3,2479,'Honorless Target'),(11,3,2973,'Raptor Strike'),(11,3,3050,'Detect'),(11,3,3365,'Opening'),(11,3,5011,'Crossbows'),(11,3,6233,'Closing'),(11,3,6246,'Closing'),(11,3,6247,'Opening'),(11,3,6477,'Opening'),(11,3,6478,'Opening'),(11,3,6562,'Heroic Presence'),(11,3,6603,'Attack'),(11,3,7266,'Duel'),(11,3,7267,'Grovel'),(11,3,7355,'Stuck'),(11,3,8386,'Attacking'),(11,3,9077,'Leather'),(11,3,9078,'Cloth'),(11,3,9125,'Generic'),(11,3,13358,'Defensive State (DND)'),(11,3,21651,'Opening'),(11,3,21652,'Closing'),(11,3,22027,'Remove Insignia'),(11,3,22810,'Opening - No Text'),(11,3,24949,'Defensive State 2 (DND)'),(11,3,28875,'Gemcutting'),(11,3,29932,'Language Draenei'),(11,3,34082,'Advantaged State (DND)'),(11,3,45927,'Summon Friend'),(11,3,59221,'Shadow Resistance'),(11,3,59543,'Gift of the Naaru'),(11,3,61437,'Opening'),(11,5,81,'Dodge'),(11,5,198,'One-Handed Maces'),(11,5,203,'Unarmed'),(11,5,204,'Defense'),(11,5,522,'SPELLDEFENSE (DND)'),(11,5,585,'Smite'),(11,5,668,'Language Common'),(11,5,1843,'Disarm'),(11,5,2050,'Lesser Heal'),(11,5,2382,'Generic'),(11,5,2479,'Honorless Target'),(11,5,3050,'Detect'),(11,5,3365,'Opening'),(11,5,5009,'Wands'),(11,5,5019,'Shoot'),(11,5,6233,'Closing'),(11,5,6246,'Closing'),(11,5,6247,'Opening'),(11,5,6477,'Opening'),(11,5,6478,'Opening'),(11,5,6603,'Attack'),(11,5,7266,'Duel'),(11,5,7267,'Grovel'),(11,5,7355,'Stuck'),(11,5,8386,'Attacking'),(11,5,9078,'Cloth'),(11,5,9125,'Generic'),(11,5,21651,'Opening'),(11,5,21652,'Closing'),(11,5,22027,'Remove Insignia'),(11,5,22810,'Opening - No Text'),(11,5,28875,'Gemcutting'),(11,5,28878,'Inspiring Presence'),(11,5,29932,'Language Draenei'),(11,5,45927,'Summon Friend'),(11,5,59221,'Shadow Resistance'),(11,5,59544,'Gift of the Naaru'),(11,5,61437,'Opening'),(11,6,81,'Dodge'),(11,6,196,'One-Handed Axes'),(11,6,197,'Two-Handed Axes'),(11,6,200,'Polearms'),(11,6,201,'One-Handed Swords'),(11,6,202,'Two-Handed Swords'),(11,6,203,'Unarmed'),(11,6,204,'Defense'),(11,6,522,'SPELLDEFENSE (DND)'),(11,6,668,'Language Common'),(11,6,674,'Dual Wield'),(11,6,750,'Plate Mail'),(11,6,1843,'Disarm'),(11,6,2382,'Generic'),(11,6,2479,'Honorless Target'),(11,6,3050,'Detect'),(11,6,3127,'Parry'),(11,6,3275,'Linen Bandage'),(11,6,3276,'Heavy Linen Bandage'),(11,6,3277,'Wool Bandage'),(11,6,3278,'Heavy Wool Bandage'),(11,6,3365,'Opening'),(11,6,6233,'Closing'),(11,6,6246,'Closing'),(11,6,6247,'Opening'),(11,6,6477,'Opening'),(11,6,6478,'Opening'),(11,6,6562,'Heroic Presence'),(11,6,6603,'Attack'),(11,6,7266,'Duel'),(11,6,7267,'Grovel'),(11,6,7355,'Stuck'),(11,6,7928,'Silk Bandage'),(11,6,7929,'Heavy Silk Bandage'),(11,6,7934,'Anti-Venom'),(11,6,8386,'Attacking'),(11,6,8737,'Mail'),(11,6,9077,'Leather'),(11,6,9078,'Cloth'),(11,6,9125,'Generic'),(11,6,10840,'Mageweave Bandage'),(11,6,10841,'Heavy Mageweave Bandage'),(11,6,10846,'First Aid'),(11,6,18629,'Runecloth Bandage'),(11,6,18630,'Heavy Runecloth Bandage'),(11,6,21651,'Opening'),(11,6,21652,'Closing'),(11,6,22027,'Remove Insignia'),(11,6,22810,'Opening - No Text'),(11,6,28875,'Gemcutting'),(11,6,29932,'Language Draenei'),(11,6,33391,'Journeyman Riding'),(11,6,45462,'Plague Strike'),(11,6,45477,'Icy Touch'),(11,6,45902,'Blood Strike'),(11,6,45903,'Offensive State (DND)'),(11,6,45927,'Summon Friend'),(11,6,47541,'Death Coil'),(11,6,48266,'Blood Presence'),(11,6,49410,'Forceful Deflection'),(11,6,49576,'Death Grip'),(11,6,52665,'Sigil'),(11,6,59221,'Shadow Resistance'),(11,6,59539,'Shadow Resistance'),(11,6,59545,'Gift of the Naaru'),(11,6,59879,'Blood Plague'),(11,6,59921,'Frost Fever'),(11,6,61437,'Opening'),(11,6,61455,'Runic Focus'),(11,7,81,'Dodge'),(11,7,107,'Block'),(11,7,198,'One-Handed Maces'),(11,7,203,'Unarmed'),(11,7,204,'Defense'),(11,7,227,'Staves'),(11,7,331,'Healing Wave'),(11,7,403,'Lightning Bolt'),(11,7,522,'SPELLDEFENSE (DND)'),(11,7,668,'Language Common'),(11,7,1843,'Disarm'),(11,7,2382,'Generic'),(11,7,2479,'Honorless Target'),(11,7,3050,'Detect'),(11,7,3365,'Opening'),(11,7,6233,'Closing'),(11,7,6246,'Closing'),(11,7,6247,'Opening'),(11,7,6477,'Opening'),(11,7,6478,'Opening'),(11,7,6603,'Attack'),(11,7,7266,'Duel'),(11,7,7267,'Grovel'),(11,7,7355,'Stuck'),(11,7,8386,'Attacking'),(11,7,9077,'Leather'),(11,7,9078,'Cloth'),(11,7,9116,'Shield'),(11,7,9125,'Generic'),(11,7,21651,'Opening'),(11,7,21652,'Closing'),(11,7,22027,'Remove Insignia'),(11,7,22810,'Opening - No Text'),(11,7,27763,'Totem'),(11,7,28875,'Gemcutting'),(11,7,28878,'Inspiring Presence'),(11,7,29932,'Language Draenei'),(11,7,45927,'Summon Friend'),(11,7,59221,'Shadow Resistance'),(11,7,59547,'Gift of the Naaru'),(11,7,61437,'Opening'),(11,8,81,'Dodge'),(11,8,133,'Fireball'),(11,8,168,'Frost Armor'),(11,8,203,'Unarmed'),(11,8,204,'Defense'),(11,8,227,'Staves'),(11,8,522,'SPELLDEFENSE (DND)'),(11,8,668,'Language Common'),(11,8,1843,'Disarm'),(11,8,2382,'Generic'),(11,8,2479,'Honorless Target'),(11,8,3050,'Detect'),(11,8,3365,'Opening'),(11,8,5009,'Wands'),(11,8,5019,'Shoot'),(11,8,6233,'Closing'),(11,8,6246,'Closing'),(11,8,6247,'Opening'),(11,8,6477,'Opening'),(11,8,6478,'Opening'),(11,8,6603,'Attack'),(11,8,7266,'Duel'),(11,8,7267,'Grovel'),(11,8,7355,'Stuck'),(11,8,8386,'Attacking'),(11,8,9078,'Cloth'),(11,8,9125,'Generic'),(11,8,21651,'Opening'),(11,8,21652,'Closing'),(11,8,22027,'Remove Insignia'),(11,8,22810,'Opening - No Text'),(11,8,28875,'Gemcutting'),(11,8,28878,'Inspiring Presence'),(11,8,29932,'Language Draenei'),(11,8,45927,'Summon Friend'),(11,8,59221,'Shadow Resistance'),(11,8,59548,'Gift of the Naaru'),(11,8,61437,'Opening');
/*!40000 ALTER TABLE `playercreateinfo_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_of_interest`
--

DROP TABLE IF EXISTS `points_of_interest`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `points_of_interest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `icon` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `data` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_name` text NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `points_of_interest`
--

LOCK TABLES `points_of_interest` WRITE;
/*!40000 ALTER TABLE `points_of_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `points_of_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_creature`
--

DROP TABLE IF EXISTS `pool_creature`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_creature` (
  `guid` int(10) unsigned NOT NULL default '0',
  `pool_entry` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`pool_entry`,`guid`),
  INDEX `idx_guid`(`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pool_creature`
--

LOCK TABLES `pool_creature` WRITE;
/*!40000 ALTER TABLE `pool_creature` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_creature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_gameobject`
--

DROP TABLE IF EXISTS `pool_gameobject`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_gameobject` (
  `guid` int(10) unsigned NOT NULL default '0',
  `pool_entry` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`guid`,`pool_entry`),
  INDEX `idx_guid`(`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pool_gameobject`
--

LOCK TABLES `pool_gameobject` WRITE;
/*!40000 ALTER TABLE `pool_gameobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_gameobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_pool`
--

DROP TABLE IF EXISTS `pool_pool`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_pool` (
  `pool_id` mediumint(8) unsigned NOT NULL default '0',
  `mother_pool` mediumint(8) unsigned NOT NULL default '0',
  `chance` float NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`pool_id`,`mother_pool`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pool_pool`
--

LOCK TABLES `pool_pool` WRITE;
/*!40000 ALTER TABLE `pool_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_template`
--

DROP TABLE IF EXISTS `pool_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pool_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Pool entry',
  `max_limit` int(10) unsigned NOT NULL default '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pool_template`
--

LOCK TABLES `pool_template` WRITE;
/*!40000 ALTER TABLE `pool_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospecting_loot_template`
--

DROP TABLE IF EXISTS `prospecting_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `prospecting_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `prospecting_loot_template`
--

LOCK TABLES `prospecting_loot_template` WRITE;
/*!40000 ALTER TABLE `prospecting_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospecting_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_end_scripts`
--

DROP TABLE IF EXISTS `quest_end_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quest_end_scripts`
--

LOCK TABLES `quest_end_scripts` WRITE;
/*!40000 ALTER TABLE `quest_end_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_end_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_mail_loot_template`
--

DROP TABLE IF EXISTS `quest_mail_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quest_mail_loot_template`
--

LOCK TABLES `quest_mail_loot_template` WRITE;
/*!40000 ALTER TABLE `quest_mail_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_mail_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_start_scripts`
--

DROP TABLE IF EXISTS `quest_start_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quest_start_scripts`
--

LOCK TABLES `quest_start_scripts` WRITE;
/*!40000 ALTER TABLE `quest_start_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_start_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_template`
--

DROP TABLE IF EXISTS `quest_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `quest_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `SkillOrClass` smallint(6) NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestFlags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CharTitleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PlayersSlain` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BonusTalents` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId2` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId3` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemId4` mediumint(8) unsigned NOT NULL default '0',
  `ReqItemCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqItemCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceId1` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId2` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId3` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceId4` mediumint(8) unsigned NOT NULL default '0',
  `ReqSourceCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqSourceCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOId1` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId2` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId3` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOId4` mediumint(9) NOT NULL default '0',
  `ReqCreatureOrGOCount1` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount2` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount3` smallint(5) unsigned NOT NULL default '0',
  `ReqCreatureOrGOCount4` smallint(5) unsigned NOT NULL default '0',
  `ReqSpellCast1` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast2` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast3` mediumint(8) unsigned NOT NULL default '0',
  `ReqSpellCast4` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId1` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId2` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId3` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId4` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId5` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemId6` mediumint(8) unsigned NOT NULL default '0',
  `RewChoiceItemCount1` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount2` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount3` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount4` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount5` smallint(5) unsigned NOT NULL default '0',
  `RewChoiceItemCount6` smallint(5) unsigned NOT NULL default '0',
  `RewItemId1` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId2` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId3` mediumint(8) unsigned NOT NULL default '0',
  `RewItemId4` mediumint(8) unsigned NOT NULL default '0',
  `RewItemCount1` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount2` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount3` smallint(5) unsigned NOT NULL default '0',
  `RewItemCount4` smallint(5) unsigned NOT NULL default '0',
  `RewRepFaction1` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint(5) unsigned NOT NULL default '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint(9) NOT NULL default '0',
  `RewRepValue2` mediumint(9) NOT NULL default '0',
  `RewRepValue3` mediumint(9) NOT NULL default '0',
  `RewRepValue4` mediumint(9) NOT NULL default '0',
  `RewRepValue5` mediumint(9) NOT NULL default '0',
  `RewHonorableKills` int unsigned NOT NULL default '0',
  `RewOrReqMoney` int(11) NOT NULL default '0',
  `RewMoneyMaxLevel` int(10) unsigned NOT NULL default '0',
  `RewSpell` mediumint(8) unsigned NOT NULL default '0',
  `RewSpellCast` mediumint(8) unsigned NOT NULL default '0',
  `RewMailTemplateId` mediumint(8) unsigned NOT NULL default '0',
  `RewMailDelaySecs` int(11) unsigned NOT NULL default '0',
  `PointMapId` smallint(5) unsigned NOT NULL default '0',
  `PointX` float NOT NULL default '0',
  `PointY` float NOT NULL default '0',
  `PointOpt` mediumint(8) unsigned NOT NULL default '0',
  `DetailsEmote1` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL default '0',
  `DetailsEmoteDelay1` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay2` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay3` int(11) unsigned NOT NULL default '0',
  `DetailsEmoteDelay4` int(11) unsigned NOT NULL default '0',
  `IncompleteEmote` smallint(5) unsigned NOT NULL default '0',
  `CompleteEmote` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay1` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay2` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay3` int(11) unsigned NOT NULL default '0',
  `OfferRewardEmoteDelay4` int(11) unsigned NOT NULL default '0',
  `StartScript` mediumint(8) unsigned NOT NULL default '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `quest_template`
--

LOCK TABLES `quest_template` WRITE;
/*!40000 ALTER TABLE `quest_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_loot_template`
--

DROP TABLE IF EXISTS `reference_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reference_loot_template`
--

LOCK TABLES `reference_loot_template` WRITE;
/*!40000 ALTER TABLE `reference_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved_name`
--

DROP TABLE IF EXISTS `reserved_name`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `reserved_name`
--

LOCK TABLES `reserved_name` WRITE;
/*!40000 ALTER TABLE `reserved_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserved_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `script_texts`
--

DROP TABLE IF EXISTS `script_texts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `script_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `script_texts`
--

LOCK TABLES `script_texts` WRITE;
/*!40000 ALTER TABLE `script_texts` DISABLE KEYS */;
INSERT INTO `script_texts` VALUES (-1000000,'<ScriptDev2 Text Entry Missing!>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'DEFAULT_TEXT'),(-1000001,'goes into a killing frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'EMOTE_GENERIC_FRENZY_KILL'),(-1000002,'goes into a frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'EMOTE_GENERIC_FRENZY'),(-1000003,'becomes enraged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'EMOTE_GENERIC_ENRAGED'),(-1000004,'goes into a berserker rage!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'EMOTE_GENERIC_BERSERK'),(-1000100,'Come, little ones. Face me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'azuregos SAY_TELEPORT'),(-1000101,'Follow me, $N. I\'ll take you to the Defias hideout. But you better protect me or I am as good as dead',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'defias traitor SAY_START'),(-1000102,'The entrance is hidden here in Moonbrook. Keep your eyes peeled for thieves. They want me dead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'defias traitor SAY_PROGRESS'),(-1000103,'You can go tell Stoutmantle this is where the Defias Gang is holed up, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'defias traitor SAY_END'),(-1000104,'%s coming in fast! Prepare to fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'defias traitor SAY_AGGRO_1'),(-1000105,'Help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'defias traitor SAY_AGGRO_2'),(-1000106,'Everyone ready?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'torek SAY_READY'),(-1000107,'Ok, Lets move out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'torek SAY_MOVE'),(-1000108,'Prepare yourselves. Silverwing is just around the bend.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'torek SAY_PREPARE'),(-1000109,'Silverwing is ours!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'torek SAY_WIN'),(-1000110,'Go report that the outpost is taken. We will remain here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'torek SAY_END'),(-1000111,'Our house is this way, through the thicket.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'magwin SAY_START'),(-1000112,'Help me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'magwin SAY_AGGRO'),(-1000113,'My poor family. Everything has been destroyed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'magwin SAY_PROGRESS'),(-1000114,'Father! Father! You\'re alive!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'magwin SAY_END1'),(-1000115,'You can thank $N for getting me back here safely, father.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'magwin SAY_END2'),(-1000116,'hugs her father.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,7,0,'magwin EMOTE_HUG'),(-1000117,'Thank you for agreeing to help. Now, let\'s get out of here $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'wounded elf SAY_ELF_START'),(-1000118,'Over there! They\'re following us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'wounded elf SAY_ELF_SUMMON1'),(-1000119,'Allow me a moment to rest. The journey taxes what little strength I have.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,16,'wounded elf SAY_ELF_RESTING'),(-1000120,'Did you hear something?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'wounded elf SAY_ELF_SUMMON2'),(-1000121,'Falcon Watch, at last! Now, where\'s my... Oh no! My pack, it\'s missing! Where has -',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'wounded elf SAY_ELF_COMPLETE'),(-1000122,'You won\'t keep me from getting to Falcon Watch!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'wounded elf SAY_ELF_AGGRO'),(-1000123,'Ready when you are, $c.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,15,'big will SAY_BIG_WILL_READY'),(-1000124,'The Affray has begun. $n, get ready to fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'twiggy SAY_TWIGGY_BEGIN'),(-1000125,'You! Enter the fray!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'twiggy SAY_TWIGGY_FRAY'),(-1000126,'Challenger is down!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'twiggy SAY_TWIGGY_DOWN'),(-1000127,'The Affray is over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'twiggy SAY_TWIGGY_OVER'),(-1000128,'We need you to send reinforcements to Manaforge Duro, Ardonis. This is not a request, it\'s an order.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge SAY_COMMANDER_DAWNFORGE_1'),(-1000129,'You cannot be serious! We are severely understaffed and can barely keep this manaforge functional!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge SAY_ARCANIST_ARDONIS_1'),(-1000130,'You will do as ordered. Manaforge Duro has come under heavy attack by mana creatures and the situation is out of control. Failure to comply will not be tolerated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge SAY_COMMANDER_DAWNFORGE_2'),(-1000131,'Indeed, it is not a request.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge SAY_PATHALEON_CULATOR_IMAGE_1'),(-1000132,'My lord!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge SAY_COMMANDER_DAWNFORGE_3'),(-1000133,'Duro will be reinforced! Ultris was a complete disaster. I will NOT have that mistake repeated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge PATHALEON_CULATOR_IMAGE_2'),(-1000134,'We\'ve had too many setbacks along the way: Hellfire Citadel, Fallen Sky Ridge, Firewing Point... Prince Kael\'thas will tolerate no further delays. I will tolerate nothing other than complete success!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge PATHALEON_CULATOR_IMAGE_2_1'),(-1000135,'I am returning to Tempest Keep. See to it that I do not have reason to return!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge PATHALEON_CULATOR_IMAGE_2_2'),(-1000136,'Yes, my lord.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge COMMANDER_DAWNFORGE_4 SAY_ARCANIST_ARDONIS_2'),(-1000137,'See to it, Ardonis!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'dawnforge COMMANDER_DAWNFORGE_5'),(-1000138,'Avruu\'s magic... it still controls me. You must fight me, mortal. It\'s the only way to break the spell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'aeranas SAY_SUMMON'),(-1000139,'Avruu\'s magic is broken! I\'m free once again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'aeranas SAY_FREE'),(-1000140,'Let\'s go.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_START'),(-1000141,'$N, let\'s use the antechamber to the right.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_PROGRESS1'),(-1000142,'I can see the light at the end of the tunnel!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_PROGRESS2'),(-1000143,'There\'s Farstrider Enclave now, $C. Not far to go... Look out! Troll ambush!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_PROGRESS3'),(-1000144,'Thank you for saving my life and bringing me back to safety, $N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_END1'),(-1000145,'Captain Helios, I\'ve been rescued from the Amani Catacombs. Reporting for duty, sir!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha SAY_END2'),(-1000146,'Liatha, get someone to look at those injuries. Thank you for bringing her back safely.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lilatha CAPTAIN_ANSWER'),(-1000147,'I remember well the sting of defeat at the conclusion of the Third War. I have waited far too long for my revenge. Now the shadow of the Legion falls over this world. It is only a matter of time until all of your failed creation... is undone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11332,1,0,0,'kazzak SAY_INTRO'),(-1000148,'The Legion will conquer all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11333,1,0,0,'kazzak SAY_AGGRO1'),(-1000149,'All mortals will perish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11334,1,0,0,'kazzak SAY_AGGRO2'),(-1000150,'All life must be eradicated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11335,1,0,0,'kazzak SAY_SURPREME1'),(-1000151,'I\'ll rip the flesh from your bones!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11336,1,0,0,'kazzak SAY_SURPREME2'),(-1000152,'Kirel Narak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11337,1,0,0,'kazzak SAY_KILL1'),(-1000153,'Contemptible wretch!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11338,1,0,0,'kazzak SAY_KILL2'),(-1000154,'The universe will be remade.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11339,1,0,0,'kazzak SAY_KILL3'),(-1000155,'The Legion... will never... fall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11340,1,0,0,'kazzak SAY_DEATH'),(-1000156,'%s goes into a frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'kazzak EMOTE_FRENZY'),(-1000157,'Invaders, you dangle upon the precipice of oblivion! The Burning Legion comes and with it comes your end.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'kazzak SAY_RAND1'),(-1000158,'Impudent whelps, you only delay the inevitable. Where one has fallen, ten shall rise. Such is the will of Kazzak...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'kazzak SAY_RAND2'),(-1000159,'Do not proceed. You will be eliminated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11344,1,0,0,'doomwalker SAY_AGGRO'),(-1000160,'Tectonic disruption commencing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11345,1,0,0,'doomwalker SAY_EARTHQUAKE_1'),(-1000161,'Magnitude set. Release.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11346,1,0,0,'doomwalker SAY_EARTHQUAKE_2'),(-1000162,'Trajectory locked.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11347,1,0,0,'doomwalker SAY_OVERRUN_1'),(-1000163,'Engage maximum speed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11348,1,0,0,'doomwalker SAY_OVERRUN_2'),(-1000164,'Threat level zero.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11349,1,0,0,'doomwalker SAY_SLAY_1'),(-1000165,'Directive accomplished.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11350,1,0,0,'doomwalker SAY_SLAY_2'),(-1000166,'Target exterminated.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11351,1,0,0,'doomwalker SAY_SLAY_3'),(-1000167,'System failure in five, f-o-u-r...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11352,1,0,0,'doomwalker SAY_DEATH'),(-1000168,'Who dares awaken Aquementas?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'aquementas AGGRO_YELL_AQUE'),(-1000169,'Muahahahaha! You fool! You\'ve released me from my banishment in the interstices between space and time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nether_drake SAY_NIHIL_1'),(-1000170,'All of Draenor shall quick beneath my feet! I will destroy this world and reshape it in my image!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nether_drake SAY_NIHIL_2'),(-1000171,'Where shall I begin? I cannot bother myself with a worm such as yourself. There is a world to be conquered!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nether_drake SAY_NIHIL_3'),(-1000172,'No doubt the fools that banished me are long dead. I shall take wing survey my demense. Pray to whatever gods you hold dear that we do not meet again.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nether_drake SAY_NIHIL_4'),(-1000173,'NOOOOooooooo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nether_drake SAY_NIHIL_INTERRUPT'),(-1000174,'Good $N, you are under the spell\'s influence. I must analyze it quickly, then we can talk.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'daranelle SAY_SPELL_INFLUENCE'),(-1000175,'Thank you, mortal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,11,0,' SAY_JUST_EATEN'),(-1000176,'The last thing I remember is the ship falling and us getting into the pods. I\'ll go see how I can help. Thank you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HEAL1'),(-1000177,'$C, Where am I? Who are you? Oh no! What happened to the ship?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HEAL2'),(-1000178,'$C You saved me! I owe you a debt that I can never repay. I\'ll go see if I can help the others.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HEAL3'),(-1000179,'Ugh... what is this place? Is that all that\'s left of the ship over there?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HEAL4'),(-1000180,'Oh, the pain...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HELP1'),(-1000181,'Everything hurts, Please make it stop...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HELP2'),(-1000182,'Ughhh... I hurt. Can you help me?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HELP3'),(-1000183,'I don\'t know if I can make it, please help me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'draenei_survivor SAY_HELP4'),(-1000184,'Yes Master, all goes along as planned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'engineer_spark SAY_TEXT'),(-1000185,'puts the shell to his ear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,7,0,'engineer_spark EMOTE_SHELL'),(-1000186,'Now I cut you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,7,0,'engineer_spark SAY_ATTACK'),(-1000187,'Thank you, dear $C, you just saved my life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'faulk SAY_HEAL'),(-1000188,'Deployment sucessful. Trespassers will be neutralized.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'converted_sentry SAY_CONVERTED_1'),(-1000189,'Objective acquired. Initiating security routines.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'converted_sentry SAY_CONVERTED_2'),(-1000190,'In Nagrand, food hunt ogre!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,' SAY_LUMP_0'),(-1000191,'You taste good with maybe a little salt and pepper.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,' SAY_LUMP_1'),(-1000192,'OK, OK! Lump give up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,' SAY_LUMP_DEFEAT'),(-1000193,'Thank you, dear $C, you just saved my life.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'stillblade SAY_HEAL'),(-1000194,'I give up! Please don\'t kill me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'unkor SAY_SUBMIT'),(-1000195,'I choose the third option: KILLING YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'floon SAY_FLOON_ATTACK'),(-1000196,'Belore...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'lady_sylvanas SAY_LAMENT_END'),(-1000197,'kneels down and pick up the amulet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,1,0,'lady_sylvanas EMOTE_LAMENT_END'),(-1000198,'Taste blade, mongrel!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_GUARD_SIL_AGGRO1'),(-1000199,'Please tell me that you didn\'t just do what I think you just did. Please tell me that I\'m not going to have to hurt you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_GUARD_SIL_AGGRO2'),(-1000200,'As if we don\'t have enough problems, you go and create more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_GUARD_SIL_AGGRO3'),(-1000201,'I\'m saved! Thank you, doctor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'injured_patient SAY_DOC1'),(-1000202,'HOORAY! I AM SAVED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'injured_patient SAY_DOC2'),(-1000203,'Sweet, sweet embrace... take me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'injured_patient SAY_DOC3'),(-1000204,'looks up at you quizzically. Maybe you should inspect it?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'cluck EMOTE_A_HELLO'),(-1000205,'looks at you unexpectadly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'cluck EMOTE_H_HELLO'),(-1000206,'starts pecking at the feed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'cluck EMOTE_CLUCK_TEXT2'),(-1000207,'You have my blessing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'ashyen_and_keleth SAY_REWARD_BLESS'),(-1000208,'UNUSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'REUSE ME'),(-1000209,'Very well. Let\'s see what you have to show me, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'anvilward SAY_ANVIL1'),(-1000210,'What manner of trick is this, $R? If you seek to ambush me, I warn you I will not go down quietly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'anvilward SAY_ANVIL2'),(-1000211,'Warning! Emergency shutdown process initiated by $N. Shutdown will complete in two minutes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_START'),(-1000212,'Emergency shutdown will complete in one minute.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_60'),(-1000213,'Emergency shutdown will complete in thirty seconds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_30'),(-1000214,'Emergency shutdown will complete in ten seconds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_10'),(-1000215,'Emergency shutdown complete.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_COMPLETE'),(-1000216,'Emergency shutdown aborted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'manaforge_control EMOTE_ABORT'),(-1000217,'Greetings, $N. I will guide you through the cavern. Please try and keep up.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_1'),(-1000218,'We do not know if the Caverns of Time have always been accessible to mortals. Truly, it is impossible to tell as the Timeless One is in perpetual motion, changing our timeways as he sees fit. What you see now may very well not exist tomorrow. You may wake up and have no memory of this place.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_2'),(-1000219,'It is strange, I know... Most mortals cannot actually comprehend what they see here, as often, what they see is not anchored within their own perception of reality.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_3'),(-1000220,'Follow me, please.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_4'),(-1000221,'There are only two truths to be found here: First, that time is chaotic, always in flux, and completely malleable and second, perception does not dictate reality.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_5'),(-1000222,'As custodians of time, we watch over and care for Nozdormu\'s realm. The master is away at the moment, which means that attempts are being made to dramatically alter time. The master never meddles in the affairs of mortals but instead corrects the alterations made to time by others. He is reactionary in this regard.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_6'),(-1000223,'For normal maintenance of time, the Keepers of Time are sufficient caretakers. We are able to deal with most ordinary disturbances. I speak of little things, such as rogue mages changing something in the past to elevate their status or wealth in the present.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_7'),(-1000224,'These tunnels that you see are called timeways. They are infinite in number. The ones that currently exist in your reality are what the master has deemed as \'trouble spots.\' These trouble spots may differ completely in theme but they always share a cause. That is, their existence is a result of the same temporal disturbance. Remember that should you venture inside one...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_8'),(-1000225,'This timeway is in great disarray! We have agents inside right now attempting to restore order. What information I have indicates that Thrall\'s freedom is in jeopardy. A malevolent organization known as the Infinite Dragonflight is trying to prevent his escape. I fear without outside assistance, all will be lost.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_9'),(-1000226,'We have very little information on this timeway. Sa\'at has been dispatched and is currently inside. The data we have gathered from his correspondence is that the Infinite Dragonflight are once again attempting to alter time. Could it be that the opening of the Dark Portal is being targeted for sabotage? Let us hope not...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_10'),(-1000227,'This timeway is currently collapsing. What that may hold for the past, present and future is currently unknown...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_11'),(-1000228,'The timeways are currently ranked in order from least catastrophic to most catastrophic. Note that they are all classified as catastrophic, meaning that any single one of these timeways collapsing would mean that your world would end. We only classify them in such a way so that the heroes and adventurers that are sent here know which timeway best suits their abilities.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_12'),(-1000229,'All we know of this timeway is that it leads to Mount Hyjal. The Infinite Dragonflight have gone to great lengths to prevent our involvement. We know next to nothing, mortal. Soridormi is currently attempting to break through the timeway\'s defenses but has thus far been unsuccessful. You might be our only hope of breaking through and resolving the conflict.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_13'),(-1000230,'Our time is at an end $N. I would wish you luck, if such a thing existed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'WHISPER_CUSTODIAN_14'),(-1000231,'Ah, $GPriest:Priestess; you came along just in time. I appreciate it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,20,'garments SAY_COMMON_HEALED'),(-1000232,'Thank you! Thank you, $GPriest:Priestess;. Now I can take on those gnolls with your power to back me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,4,'garments SAY_DG_KEL_THANKS'),(-1000233,'Farewell to you, and may shadow always protect you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,3,'garments SAY_DG_KEL_GOODBYE'),(-1000234,'Follow me, stranger. This won\'t take long.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'SAY_KHAD_SERV_0'),(-1000235,'Shattrath was once the draenei capital of this world. Its name means \"dwelling of light.\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_1'),(-1000236,'When the Burning Legion turned the orcs against the draenei, the fiercest battle was fought here. The draenei fought tooth and nail, but in the end the city fell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_2'),(-1000237,'The city was left in ruins and darkness... until the Sha\'tar arrived.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_3'),(-1000238,'Let us go into the Lower City. I will warn you that as one of the only safe havens in Outland, Shattrath has attracted droves of refugees from all wars, current and past.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_4'),(-1000239,'The Sha\'tar, or \"born from light\" are the naaru that came to Outland to fight the demons of the Burning Legion.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_5'),(-1000240,'They were drawn to the ruins of Shattrath City where a small remnant of the draenei priesthood conducted its rites inside a ruined temple on this very spot.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_6'),(-1000241,'The priesthood, known as the Aldor, quickly regained its strength as word spread that the naaru had returned and reconstruction soon began. The ruined temple is now used as an infirmary for injured refugees.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_7'),(-1000242,'It wouldn\'t be long, however, before the city came under attack once again. This time, the attack came from Illidan\'s armies. A large regiment of blood elves had been sent by Illidan\'s ally, Kael\'thas Sunstrider, to lay waste to the city.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_8'),(-1000243,'As the regiment of blood elves crossed this very bridge, the Aldor\'s exarchs and vindicators lined up to defend the Terrace of Light. But then the unexpected happened.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_9'),(-1000244,'The blood elves laid down their weapons in front of the city\'s defenders; their leader, a blood elf elder known as Voren\'thal, stormed into the Terrace of Light and demanded to speak to A\'dal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_10'),(-1000245,'As the naaru approached him, Voren\'thal kneeled before him and uttered the following words: \"I\'ve seen you in a vision, naaru. My race\'s only hope for survival lies with you. My followers and I are here to serve you.\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_11'),(-1000246,'The defection of Voren\'thal and his followers was the largest loss ever incurred by Kael\'s forces. And these weren\'t just any blood elves. Many of the best and brightest amongst Kael\'s scholars and magisters had been swayed by Voren\'thal\'s influence.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_12'),(-1000247,'The naaru accepted the defectors, who would become known as the Scryers; their dwelling lies in the platform above. Only those initiated with the Scryers are allowed there.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_13'),(-1000248,'The Aldor are followers of the Light and forgiveness and redemption are values they understand. However, they found hard to forget the deeds of the blood elves while under Kael\'s command.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_14'),(-1000249,'Many of the priesthood had been slain by the same magisters who now vowed to serve the naaru. They were not happy to share the city with their former enemies.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_15'),(-1000250,'The Aldor\'s most holy temple and its surrounding dwellings lie on the terrace above. As a holy site, only the initiated are welcome inside.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_16'),(-1000251,'The attacks against Shattrath continued, but the city did not fall, as you can see. On the contrary, the naaru known as Xi\'ri led a successful incursion into Shadowmoon Valley - Illidan\'s doorstep.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_17'),(-1000252,'There he continues to wage war on Illidan with the assistance of the Aldor and the Scryers. The two factions have not given up on their old feuds, though.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_18'),(-1000253,'Such is their animosity that they vie for the honor of being sent to assist the naaru there. Each day, that decision is made here by A\'dal. The armies gather here to receive A\'dal\'s blessing before heading to Shadowmoon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_19'),(-1000254,'Khadgar should be ready to see you again. Just remember that to serve the Sha\'tar you will most likely have to ally with the Aldor or the Scryers. And seeking the favor of one group will cause the others\' dislike.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_20'),(-1000255,'Good luck stranger, and welcome to Shattrath City.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,'SAY_KHAD_SERV_21'),(-1000256,'Thank you! Thank you, $GPriest:Priestess;. Now I can take on those murlocs with the Light on my side!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,4,'garments SAY_ROBERTS_THANKS'),(-1000257,'Farewell to you, and may the Light be with you always.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,3,'garments SAY_ROBERTS_GOODBYE'),(-1000258,'Thank you! Thank you, $GPriest:Priestess;. Now I can take on those humans with your power to back me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,4,'garments SAY_KORJA_THANKS'),(-1000259,'Farewell to you, and may our ancestors be with you always!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,3,'garments SAY_KORJA_GOODBYE'),(-1000260,'Thank you! Thank you, $GPriest:Priestess;. Now I can take on those wendigo with the Light on my side!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,4,'garments SAY_DOLF_THANKS'),(-1000261,'Farewell to you, and may the Light be with you always.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,3,'garments SAY_DOLF_GOODBYE'),(-1000262,'Thank you! Thank you, $GPriest:Priestess;. Now I can take on those corrupt timberlings with Elune\'s power behind me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,4,'garments SAY_SHAYA_THANKS'),(-1000263,'Farewell to you, and may Elune be with you always.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,3,'garments SAY_SHAYA_GOODBYE'),(-1000264,'Ok, $N. Follow me to the cave where I\'ll attempt to harness the power of the rune stone into these goggles.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_1'),(-1000265,'I discovered this cave on our first day here. I believe the energy in the stone can be used to our advantage.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_2'),(-1000266,'I\'ll begin drawing energy from the stone. Your job, $N, is to defend me. This place is cursed... trust me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_3'),(-1000267,'begins tinkering with the goggles before the stone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_4'),(-1000268,'Help!!! Get these things off me so I can get my work done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'phizzlethorpe SAY_AGGRO'),(-1000269,'Almost done! Just a little longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_5'),(-1000270,'I\'ve done it! I have harnessed the power of the stone into the goggles! Let\'s get out of here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_6'),(-1000271,'Phew! Glad to be back from that creepy cave.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_7'),(-1000272,'hands one glowing goggles over to Doctor Draxlegauge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_8'),(-1000273,'Doctor Draxlegauge will give you further instructions, $N. Many thanks for your help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'phizzlethorpe SAY_PROGRESS_9'),(-1000274,'Time to teach you a lesson in manners, little $Gboy:girl;!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_START'),(-1000275,'Now I\'m gonna give you to the count of \'3\' to get out of here before I sick the dogs on you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_COUNT'),(-1000276,'1...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_COUNT_1'),(-1000277,'2...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_COUNT_2'),(-1000278,'Time to meet your maker!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_ATTACK_5'),(-1000279,'Alright, we give up! Don\'t hurt us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'larry SAY_GIVEUP'),(-1000280,'A shadowy, sinister presence has invaded the Emerald Dream. Its power is poised to spill over into our world, $N. We must oppose it! That\'s why I cannot accompany you in person.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'clintar SAY_START'),(-1000281,'The Emerald Dream will never be yours!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'clintar SAY_AGGRO_1'),(-1000282,'Begone from this place!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'clintar SAY_AGGRO_2'),(-1000283,'That\'s the first relic, but there are still two more. Follow me, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'clintar SAY_RELIC1'),(-1000284,'I\'ve recovered the second relic. Take a moment to rest, and then we\'ll continue to the last reliquary.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'clintar SAY_RELIC2'),(-1000285,'We have all three of the relics, but my energy is rapidly fading. We must make our way back to Dreamwarden Lurosa! He will let you know what to do next.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'clintar SAY_RELIC3'),(-1000286,'Lurosa, I am entrusting the Relics of Aviana to $N, who will take them to Morthis Whisperwing. I must return completely to the Emerald Dream now. Do not let $N fail!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'clintar SAY_END'),(-1000287,'Emergency power activated! Initializing ambulancery motor! CLUCK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_START'),(-1000288,'Physical threat detected! Evasive action! CLUCK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_AGGRO1'),(-1000289,'Thread analyzed! Activating combat plan beta! CLUCK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_AGGRO2'),(-1000290,'CLUCK! Sensors detect spatial anomaly - danger imminent! CLUCK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_AMBUSH'),(-1000291,'No one challanges the Wastewander nomads - not even robotic chickens! ATTACK!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_AMBUSH_REPLY'),(-1000292,'Cloaking systems online! CLUCK! Engaging cloak for transport to Booty Bay!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'oox17 SAY_END'),(-1000293,'To the house! Stay close to me, no matter what! I have my gun and ammo there!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'stilwell SAY_DS_START'),(-1000294,'We showed that one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'stilwell SAY_DS_DOWN_1'),(-1000295,'One more down!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'stilwell SAY_DS_DOWN_2'),(-1000296,'We\'ve done it! We won!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'stilwell SAY_DS_DOWN_3'),(-1000297,'Meet me down by the orchard--I just need to put my gun away.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'stilwell SAY_DS_PROLOGUE'),(-1000298,'Alright, alright I think I can figure out how to operate this thing...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,393,'wizzlecrank SAY_START'),(-1000299,'Arrrgh! This isn\'t right!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'wizzlecrank SAY_STARTUP1'),(-1000300,'Okay, I think I\'ve got it, now. Follow me, $n!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'wizzlecrank SAY_STARTUP2'),(-1000301,'There\'s the stolen shredder! Stop it or Lugwizzle will have our hides!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'wizzlecrank SAY_MERCENARY'),(-1000302,'Looks like we\'re out of woods, eh? Wonder what this does...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'wizzlecrank SAY_PROGRESS_1'),(-1000303,'Come on, don\'t break down on me now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,393,'wizzlecrank SAY_PROGRESS_2'),(-1000304,'That was a close one! Well, let\'s get going, it\'s still a ways to Ratchet!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'wizzlecrank SAY_PROGRESS_3'),(-1000305,'Hmm... I don\'t think this blinking red light is a good thing...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'wizzlecrank SAY_END'),(-1000306,'Let\'s get to the others, and keep an eye open for those wolves cutside...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_START_1'),(-1000307,'Be careful, $N. Those wolves like to hide among the trees.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_START_2'),(-1000308,'A $C attacks!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_AGGRO_1'),(-1000309,'Beware! I am under attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_AGGRO_2'),(-1000310,'Oh no! A $C is upon us!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_AGGRO_3'),(-1000311,'We\'re almost there!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_PROGRESS'),(-1000312,'We made it! Thanks, $N. I couldn\'t have gotten without you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'erland SAY_END'),(-1000313,'It\'s good to see you again, Erland. What is your report?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,33,1,'erland SAY_RANE'),(-1000314,'Masses of wolves are to the east, and whoever lived at Malden\'s Orchard is gone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'erland SAY_RANE_REPLY'),(-1000315,'If I am excused, then I\'d like to check on Quinn...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'erland SAY_CHECK_NEXT'),(-1000316,'Hello, Quinn. How are you faring?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'erland SAY_QUINN'),(-1000317,'I\'ve been better. Ivar the Foul got the better of me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,33,1,'erland SAY_QUINN_REPLY'),(-1000318,'Try to take better care of yourself, Quinn. You were lucky this time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'erland SAY_BYE'),(-1000319,'Let the trial begin, Bloodwrath, attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,'kelerun SayId1'),(-1000320,'Champion Lightrend, make me proud!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,'kelerun SayId2'),(-1000321,'Show this upstart how a real Blood Knight fights, Swiftblade!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,'kelerun SayId3'),(-1000322,'Show $n the meaning of pain, Sunstriker!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,1,0,'kelerun SayId4'),(-1000323,'Mist! I feared I would never see you again! Yes, I am well, do not worry for me. You must rest and recover your health.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'mist SAY_AT_HOME'),(-1000324,'growls in acknowledgement before straightening and making her way off into the forest.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'mist EMOTE_AT_HOME'),(-1000325,'\"Threshwackonator First Mate unit prepared to follow\"',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'threshwackonator EMOTE_START'),(-1000326,'YARRR! Swabie, what have ye done?! He\'s gone mad! Baton him down the hatches! Hoist the mast! ARRRR! Every man for hi\'self!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'threshwackonator SAY_AT_CLOSE'),(-1000327,'Ok, $n, let\'s go find where I left that mysterious fossil. Follow me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_START'),(-1000328,'Now where did I put that mysterious fossil? Ah, maybe up there...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_RAMP1_1'),(-1000329,'Hrm, nothing up here.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_RAMP1_2'),(-1000330,'No mysterious fossil here... Ah, but my copy of Green Hills of Stranglethorn. What a good book!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_BOOK'),(-1000331,'I bet you I left it in the tent!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_TENT1_1'),(-1000332,'Oh wait, that\'s Hollee\'s tent... and it\'s empty.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_TENT1_2'),(-1000333,'Interesting... I hadn\'t noticed this earlier...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_MOSS'),(-1000334,'%s inspects the ancient, mossy stone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,7,0,'remtravel EMOTE_REM_MOSS'),(-1000335,'Oh wait! I\'m supposed to be looking for that mysterious fossil!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_MOSS_PROGRESS'),(-1000336,'Nope. didn\'t leave the fossil back here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_PROGRESS'),(-1000337,'Ah. I remember now! I gave the mysterious fossil to Hollee! Check with her.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_REMEMBER'),(-1000338,'%s goes back to work, oblivious to everything around him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,7,0,'remtravel EMOTE_REM_END'),(-1000339,'Something tells me this $r wants the mysterious fossil too. Help!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,0,'remtravel SAY_REM_AGGRO'),(-1000340,'%s howls in delight at the sight of his lunch!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'kyle EMOTE_SEE_LUNCH'),(-1000341,'%s eats his lunch.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'kyle EMOTE_EAT_LUNCH'),(-1000342,'%s thanks you with a special dance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'kyle EMOTE_DANCE'),(-1000343,'Is the way clear? Let\'s get out while we can, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kayra SAY_START'),(-1000344,'Looks like we won\'t get away so easy. Get ready!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kayra SAY_AMBUSH1'),(-1000345,'Let\'s keep moving. We\'re not safe here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kayra SAY_PROGRESS'),(-1000346,'Look out, $N! Enemies ahead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kayra SAY_AMBUSH2'),(-1000347,'We\'re almost to the refuge! Let\'s go.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kayra SAY_END'),(-1000348,'Ah...the wondrous sound of kodos. I love the way they make the ground shake... inspect the beast for me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kodo round SAY_SMEED_HOME_1'),(-1000349,'Hey, look out with that kodo! You had better inspect that beast before i give you credit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kodo round SAY_SMEED_HOME_2'),(-1000350,'That kodo sure is a beauty. Wait a minute, where are my bifocals? Perhaps you should inspect the beast for me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'kodo round SAY_SMEED_HOME_3'),(-1033000,'Follow me and I\'ll open the courtyard door for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,1,'prisoner ashcrombe SAY_FREE_AS'),(-1033001,'I have just the spell to get this door open. Too bad the cell doors weren\'t locked so haphazardly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,1,'prisoner ashcrombe SAY_OPEN_DOOR_AS'),(-1033002,'There it is! Wide open. Good luck to you conquering what lies beyond. I must report back to the Kirin Tor at once!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,1,'prisoner ashcrombe SAY_POST_DOOR_AS'),(-1033003,'Free from this wretched cell at last! Let me show you to the courtyard....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'prisoner adamant SAY_FREE_AD'),(-1033004,'You are indeed courageous for wanting to brave the horrors that lie beyond this door.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'prisoner adamant SAY_OPEN_DOOR_AD'),(-1033005,'There we go!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'prisoner adamant SAY_POST1_DOOR_AD'),(-1033006,'Good luck with Arugal. I must hurry back to Hadrec now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'prisoner adamant SAY_POST2_DOOR_AD'),(-1033007,'About time someone killed the wretch.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,1,'prisoner adamant SAY_BOSS_DIE_AD'),(-1033008,'For once I agree with you... scum.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,7,1,'prisoner ashcrombe SAY_BOSS_DIE_AS'),(-1036000,'You there, check out that noise!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5775,1,7,0,'smite INST_SAY_ALARM1'),(-1036001,'We\'re under attack! A vast, ye swabs! Repel the invaders!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5777,1,7,0,'smite INST_SAY_ALARM2'),(-1070000,'None may steal the secrets of the makers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5851,1,0,0,'ironaya SAY_AGGRO'),(-1129000,'You\'ll never leave this place... alive.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5825,1,0,0,'amnennar SAY_AGGRO'),(-1129001,'To me, my servants!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5828,1,0,0,'amnennar SAY_SUMMON60'),(-1129002,'Come, spirits, attend your master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5829,1,0,0,'amnennar SAY_SUMMON30'),(-1129003,'I am the hand of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5827,1,0,0,'amnennar SAY_HP'),(-1129004,'Too...easy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5826,1,0,0,'amnennar SAY_KILL'),(-1189000,'Ah, I have been waiting for a real challenge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5830,1,0,0,'herod SAY_AGGRO'),(-1189001,'Blades of Light!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5832,1,0,0,'herod SAY_WHIRLWIND'),(-1189002,'Light, give me strength!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5833,1,0,0,'herod SAY_ENRAGE'),(-1189003,'Hah, is that all?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5831,1,0,0,'herod SAY_KILL'),(-1189004,'becomes enraged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'herod EMOTE_ENRAGE'),(-1189005,'Infidels! They must be purified!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5835,1,0,0,'mograine SAY_MO_AGGRO'),(-1189006,'Unworthy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5836,1,0,0,'mograine SAY_MO_KILL'),(-1189007,'At your side, milady!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5837,1,0,0,'mograine SAY_MO_RESSURECTED'),(-1189008,'What, Mograine has fallen? You shall pay for this treachery!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5838,1,0,0,'whitemane SAY_WH_INTRO'),(-1189009,'The Light has spoken!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5839,1,0,0,'whitemane SAY_WH_KILL'),(-1189010,'Arise, my champion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5840,1,0,0,'whitemane SAY_WH_RESSURECT'),(-1189011,'Tell me... tell me everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5847,1,0,0,'vishas SAY_AGGRO'),(-1189012,'Naughty secrets!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5849,1,0,0,'vishas SAY_HEALTH1'),(-1189013,'I\'ll rip the secrets from your flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5850,1,0,0,'vishas SAY_HEALTH2'),(-1189014,'Purged by pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5848,1,0,0,'vishas SAY_KILL'),(-1189015,'The monster got what he deserved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,1,0,'vishas SAY_TRIGGER_VORREL'),(-1189016,'We hunger for vengeance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5844,1,0,0,'thalnos SAY_AGGRO'),(-1189017,'No rest, for the angry dead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5846,1,0,0,'thalnos SAY_HEALTH'),(-1189018,'More... More souls.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5845,1,0,0,'thalnos SAY_KILL'),(-1189019,'You will not defile these mysteries!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5842,1,0,0,'doan SAY_AGGRO'),(-1189020,'Burn in righteous fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5843,1,0,0,'doan SAY_SPECIALAE'),(-1189021,'Release the hounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5841,1,0,0,'loksey SAY_AGGRO'),(-1230000,'Ah, hits the spot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'rocknot SAY_GOT_BEER'),(-1230001,'Come to aid the Throne!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'dagran SAY_AGGRO'),(-1230002,'Hail to the king, baby!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'dagran SAY_SLAY'),(-1249000,'How fortuitous. Usually, I must leave my lair to feed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'onyxia SAY_AGGRO'),(-1249001,'Learn your place mortal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'onyxia SAY_KILL'),(-1249002,'This meaningless exertion bores me. I\'ll incinerate you all from above!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,254,'onyxia SAY_PHASE_2_TRANS'),(-1249003,'It seems you\'ll need another lesson, mortals!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,293,'onyxia SAY_PHASE_3_TRANS'),(-1249004,'takes in a deep breath...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'onyxia EMOTE_BREATH'),(-1269000,'Why do you persist? Surely you can see the futility of it all. It is not too late! You may still leave with your lives ...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10442,1,0,0,'temporus SAY_ENTER'),(-1269001,'So be it ... you have been warned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10444,1,0,0,'temporus SAY_AGGRO'),(-1269002,'Time... sands of time is run out for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10443,1,0,0,'temporus SAY_BANISH'),(-1269003,'You should have left when you had the chance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10445,1,0,0,'temporus SAY_SLAY1'),(-1269004,'Your days are done.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10446,1,0,0,'temporus SAY_SLAY2'),(-1269005,'My death means ... little.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10447,1,0,0,'temporus SAY_DEATH'),(-1269006,'Why do you aid the Magus? Just think of how many lives could be saved if the portal is never opened, if the resulting wars could be erased ...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10412,1,0,0,'chrono_lord_deja SAY_ENTER'),(-1269007,'If you will not cease this foolish quest, then you will die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10414,1,0,0,'chrono_lord_deja SAY_AGGRO'),(-1269008,'You have outstayed your welcome, Timekeeper. Begone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10413,1,0,0,'chrono_lord_deja SAY_BANISH'),(-1269009,'I told you it was a fool\'s quest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10415,1,0,0,'chrono_lord_deja SAY_SLAY1'),(-1269010,'Leaving so soon?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10416,1,0,0,'chrono_lord_deja SAY_SLAY2'),(-1269011,'Time ... is on our side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10417,1,0,0,'chrono_lord_deja SAY_DEATH'),(-1269012,'The time has come to shatter this clockwork universe forever! Let us no longer be slaves of the hourglass! I warn you: those who do not embrace the greater path shall become victims of its passing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10400,1,0,0,'aeonus SAY_ENTER'),(-1269013,'Let us see what fate lays in store...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10402,1,0,0,'aeonus SAY_AGGRO'),(-1269014,'Your time is up, slave of the past!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10401,1,0,0,'aeonus SAY_BANISH'),(-1269015,'One less obstacle in our way!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10403,1,0,0,'aeonus SAY_SLAY1'),(-1269016,'No one can stop us! No one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10404,1,0,0,'aeonus SAY_SLAY2'),(-1269017,'It is only a matter...of time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10405,1,0,0,'aeonus SAY_DEATH'),(-1269018,'goes into a frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'aeonus EMOTE_FRENZY'),(-1269019,'Stop! Do not go further, mortals. You are ill-prepared to face the forces of the Infinite Dragonflight. Come, let me help you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'saat SAY_SAAT_WELCOME'),(-1269020,'The time has come! Gul\'dan, order your warlocks to double their efforts! Moments from now the gateway will open, and your Horde will be released upon this ripe, unsuspecting world!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10435,1,0,0,'medivh SAY_ENTER'),(-1269021,'What is this? Champions, coming to my aid? I sense the hand of the dark one in this. Truly this sacred event bears his blessing?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10436,1,0,0,'medivh SAY_INTRO'),(-1269022,'Champions, my shield grows weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10437,1,0,0,'medivh SAY_WEAK75'),(-1269023,'My powers must be concentrated on the portal! I do not have time to hold the shield!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10438,1,0,0,'medivh SAY_WEAK50'),(-1269024,'The shield is nearly gone! All that I have worked for is in danger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10439,1,0,0,'medivh SAY_WEAK25'),(-1269025,'No... damn this feeble mortal coil...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10441,1,0,0,'medivh SAY_DEATH'),(-1269026,'I am grateful for your aid, champions. Now, Gul\'dan\'s Horde will sweep across this world, like a locust swarm, and all my designs, all my carefully laid plans will at last fall into place.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10440,1,0,0,'medivh SAY_WIN'),(-1269027,'Orcs of the Horde! This portalis the gateway to your new destiny! Azeroth lies before you, ripe for the taking!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'medivh SAY_ORCS_ENTER'),(-1269028,'Gul\'dan speaks the truth! We should return at once to tell our brothers of the news! Retreat back trought the portal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'medivh SAY_ORCS_ANSWER'),(-1309000,'Let the coils of hate unfurl!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8421,1,0,0,'venoxis SAY_TRANSFORM'),(-1309001,'Ssserenity..at lassst!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'venoxis SAY_DEATH'),(-1309002,'Lord Hir\'eek, grant me wings of vengance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8417,1,0,0,'jeklik SAY_AGGRO'),(-1309003,'I command you to rain fire down upon these invaders!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'jeklik SAY_RAIN_FIRE'),(-1309004,'Finally ...death. Curse you Hakkar! Curse you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8422,1,0,0,'jeklik SAY_DEATH'),(-1309005,'Draw me to your web mistress Shadra. Unleash your venom!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8418,1,0,0,'marli SAY_AGGRO'),(-1309006,'Shadra, make of me your avatar!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'marli SAY_TRANSFORM'),(-1309007,'Aid me my brood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'marli SAY_SPIDER_SPAWN'),(-1309008,'Bless you mortal for this release. Hakkar controls me no longer...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8423,1,0,0,'marli SAY_DEATH'),(-1309009,'Shirvallah, fill me with your RAGE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8419,1,0,0,'thekal SAY_AGGRO'),(-1309010,'Hakkar binds me no more! Peace at last!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8424,1,0,0,'thekal SAY_DEATH'),(-1309011,'Bethekk, your priestess calls upon your might!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8416,1,0,0,'arlokk SAY_AGGRO'),(-1309012,'Feast on $n, my pretties!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'arlokk SAY_FEAST_PANTHER'),(-1309013,'At last, I am free of the Soulflayer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8412,1,0,0,'arlokk SAY_DEATH'),(-1309014,'Welcome to da great show friends! Step right up to die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8425,1,0,0,'jindo SAY_AGGRO'),(-1309015,'I\'ll feed your souls to Hakkar himself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8413,1,0,0,'mandokir SAY_AGGRO'),(-1309016,'DING!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'mandokir SAY_DING_KILL'),(-1309017,'GRATS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'mandokir SAY_GRATS_JINDO'),(-1309018,'I\'m keeping my eye on you, $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'mandokir SAY_WATCH'),(-1309019,'Don\'t make me angry. You won\'t like it when I\'m angry.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'mandokir SAY_WATCH_WHISPER'),(-1309020,'PRIDE HERALDS THE END OF YOUR WORLD. COME, MORTALS! FACE THE WRATH OF THE SOULFLAYER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8414,1,0,0,'hakkar SAY_AGGRO'),(-1309021,'Fleeing will do you no good, mortals!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'hakkar SAY_FLEEING'),(-1309022,'You dare set foot upon Hakkari holy ground? Minions of Hakkar, destroy the infidels!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'hakkar SAY_MINION_DESTROY'),(-1309023,'Minions of Hakkar, hear your God. The sanctity of this temple has been compromised. Invaders encroach upon holy ground! The Altar of Blood must be protected. Kill them all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'hakkar SAY_PROTECT_ALTAR'),(-1329000,'Thanks to Egan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'freed_soul SAY_ZAPPED0'),(-1329001,'Rivendare must die',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'freed_soul SAY_ZAPPED1'),(-1329002,'Who you gonna call?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'freed_soul SAY_ZAPPED2'),(-1329003,'Don\'t cross those beams!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'freed_soul SAY_ZAPPED3'),(-1409000,'performs one last service for Ragnaros.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'geddon EMOTE_SERVICE'),(-1409001,'goes into a killing frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'magmadar EMOTE_FRENZY'),(-1409002,'refuses to die while its master is in trouble.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'core rager EMOTE_AEGIS'),(-1409003,'Reckless mortals, none may challenge the sons of the living flame!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8035,1,0,0,'majordomo SAY_AGGRO'),(-1409004,'The runes of warding have been destroyed! Hunt down the infedels my bretheren.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8039,1,0,0,'majordomo SAY_SPAWN'),(-1409005,'Ashes to Ashes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8037,1,0,0,'majordomo SAY_SLAY'),(-1409006,'Burn mortals! Burn for this transgression!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8036,1,0,0,'majordomo SAY_SPECIAL'),(-1409007,'Impossible! Stay your attack mortals! I submitt! I submitt! Brashly you have come to rest the secrets of the living flame. You will soon regret the recklessness of your quest. I go now to summon the lord whos house this is. Should you seek an audiance with him your paltry lives will surly be forfit. Nevertheless seek out his lair if you dare!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8038,1,0,0,'majordomo SAY_DEFEAT'),(-1409008,'Behold Ragnaros, the Firelord! He who was ancient when this world was young! Bow before him, mortals! Bow before your ending!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8040,1,0,0,'ragnaros SAY_SUMMON_MAJ'),(-1409009,'TOO SOON! YOU HAVE AWAKENED ME TOO SOON, EXECUTUS! WHAT IS THE MEANING OF THIS INTRUSION?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8043,1,0,0,'ragnaros SAY_ARRIVAL1_RAG'),(-1409010,'These mortal infidels, my lord! They have invaded your sanctum, and seek to steal your secrets!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8041,1,0,0,'ragnaros SAY_ARRIVAL2_MAJ'),(-1409011,'FOOL! YOU ALLOWED THESE INSECTS TO RUN RAMPANT THROUGH THE HALLOWED CORE, AND NOW YOU LEAD THEM TO MY VERY LAIR? YOU HAVE FAILED ME, EXECUTUS! JUSTICE SHALL BE MET, INDEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8044,1,0,0,'ragnaros SAY_ARRIVAL3_RAG'),(-1409012,'NOW FOR YOU, INSECTS. BOLDLY YOU SAUGHT THE POWER OF RAGNAROS NOW YOU SHALL SEE IT FIRST HAND.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8045,1,0,0,'ragnaros SAY_ARRIVAL5_RAG'),(-1409013,'COME FORTH, MY SERVANTS! DEFEND YOUR MASTER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8049,1,0,0,'ragnaros SAY_REINFORCEMENTS1'),(-1409014,'YOU CANNOT DEFEAT THE LIVING FLAME! COME YOU MINIONS OF FIRE! COME FORTH YOU CREATURES OF HATE! YOUR MASTER CALLS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8050,1,0,0,'ragnaros SAY_REINFORCEMENTS2'),(-1409015,'BY FIRE BE PURGED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8046,1,0,0,'ragnaros SAY_HAND'),(-1409016,'TASTE THE FLAMES OF SULFURON!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8047,1,0,0,'ragnaros SAY_WRATH'),(-1409017,'DIE INSECT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8051,1,0,0,'ragnaros SAY_KILL'),(-1409018,'MY PATIENCE IS DWINDILING! COME NATS TO YOUR DEATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8048,1,0,0,'ragnaros SAY_MAGMABURST'),(-1469000,'None of your kind should be here! You\'ve doomed only yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8286,1,0,0,'broodlord SAY_AGGRO'),(-1469001,'Clever Mortals but I am not so easily lured away from my sanctum!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8287,1,0,0,'broodlord SAY_LEASH'),(-1469002,'goes into a killing frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'chromaggus EMOTE_FRENZY'),(-1469003,'flinches as its skin shimmers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'chromaggus EMOTE_SHIMMER'),(-1469004,'In this world where time is your enemy, it is my greatest ally. This grand game of life that you think you play in fact plays you. To that I say...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'victor_nefarius SAY_GAMESBEGIN_1'),(-1469005,'Let the games begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8280,1,0,0,'victor_nefarius SAY_GAMESBEGIN_2'),(-1469006,'Ah, the heroes. You are persistent, aren\'t you. Your allied attempted to match his power against mine, and had to pay the price. Now he shall serve me, by slaughtering you. Get up little red wyrm and destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8279,1,0,0,'victor_nefarius SAY_VAEL_INTRO'),(-1469007,'Well done, my minions. The mortals\' courage begins to wane! Now, let\'s see how they contend with the true Lord of Blackrock Spire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8288,1,0,0,'nefarian SAY_AGGRO'),(-1469008,'Enough! Now you vermin shall feel the force of my birthright, the fury of the earth itself.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8289,1,0,0,'nefarian SAY_XHEALTH'),(-1469009,'Burn, you wretches! Burn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8290,1,0,0,'nefarian SAY_SHADOWFLAME'),(-1469010,'Impossible! Rise my minions! Serve your master once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8291,1,0,0,'nefarian SAY_RAISE_SKELETONS'),(-1469011,'Worthless $N! Your friends will join you soon enough!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8293,1,0,0,'nefarian SAY_SLAY'),(-1469012,'This cannot be! I am the Master here! You mortals are nothing to my kind! DO YOU HEAR? NOTHING!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8292,1,0,0,'nefarian SAY_DEATH'),(-1469013,'Mages too? You should be more careful when you play with magic...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_MAGE'),(-1469014,'Warriors, I know you can hit harder than that! Let\'s see it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_WARRIOR'),(-1469015,'Druids and your silly shapeshifting. Let\'s see it in action!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_DRUID'),(-1469016,'Priests! If you\'re going to keep healing like that, we might as well make it a little more interesting!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_PRIEST'),(-1469017,'Paladins, I\'ve heard you have many lives. Show me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_PALADIN'),(-1469018,'Shamans, show me what your totems can do!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_SHAMAN'),(-1469019,'Warlocks, you shouldn\'t be playing with magic you don\'t understand. See what happens?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_WARLOCK'),(-1469020,'Hunters and your annoying pea-shooters!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_HUNTER'),(-1469021,'Rogues? Stop hiding and face me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'nefarian SAY_ROGUE'),(-1469022,'You\'ll pay for forcing me to do this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8275,1,0,0,'razorgore SAY_EGGS_BROKEN1'),(-1469023,'Fools! These eggs are more precious than you know.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8276,1,0,0,'razorgore SAY_EGGS_BROKEN2'),(-1469024,'No! Not another one! I\'ll have your heads for this atrocity.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8277,1,0,0,'razorgore SAY_EGGS_BROKEN3'),(-1469025,'If I fall into the abyss I\'ll take all of you mortals with me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8278,1,0,0,'razorgore SAY_DEATH'),(-1469026,'Too late...friends. Nefarius\' corruption has taken hold. I cannot...control myself.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8281,1,0,0,'vaelastrasz SAY_LINE1'),(-1469027,'I beg you Mortals, flee! Flee before I lose all control. The Black Fire rages within my heart. I must release it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8282,1,0,0,'vaelastrasz SAY_LINE2'),(-1469028,'FLAME! DEATH! DESTRUCTION! COWER MORTALS BEFORE THE WRATH OF LORD....NO! I MUST FIGHT THIS!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8283,1,0,0,'vaelastrasz SAY_LINE3'),(-1469029,'Nefarius\' hate has made me stronger than ever before. You should have fled, while you could, mortals! The fury of Blackrock courses through my veins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8285,1,0,0,'vaelastrasz SAY_HALFLIFE'),(-1469030,'Forgive me $N, your death only adds to my failure.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8284,1,0,0,'vaelastrasz SAY_KILLTARGET'),(-1469031,'goes into a frenzy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'flamegor EMOTE_FRENZY'),(-1509000,'senses your fear.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'moam EMOTE_AGGRO'),(-1509001,'bristles with energy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'moan EMOTE_MANA_FULL'),(-1509002,'sets eyes on $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'buru EMOTE_TARGET'),(-1509003,'They come now. Try not to get yourself killed, young blood.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'andorov SAY_ANDOROV_INTRO'),(-1509004,'Remember, Rajaxx, when I said I\'d kill you last? I lied...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'andorov SAY_ANDOROV_ATTACK'),(-1509005,'The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8612,1,0,0,'rajaxx SAY_WAVE3'),(-1509006,'No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8610,1,0,0,'rajaxx SAY_WAVE4'),(-1509007,'Fear is for the enemy! Fear and death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8608,1,0,0,'rajaxx SAY_WAVE5'),(-1509008,'Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8611,1,0,0,'rajaxx SAY_WAVE6'),(-1509009,'Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8607,1,0,0,'rajaxx SAY_WAVE7'),(-1509010,'Impudent fool! I will kill you myself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8609,1,0,0,'rajaxx SAY_INTRO'),(-1509011,'Attack and make them pay dearly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8603,1,0,0,'rajaxx SAY_UNK1'),(-1509012,'Crush them! Drive them out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8605,1,0,0,'rajaxx SAY_UNK2'),(-1509013,'Do not hesitate! Destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8606,1,0,0,'rajaxx SAY_UNK3'),(-1509014,'Warriors! Captains! Continue the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8613,1,0,0,'rajaxx SAY_UNK4'),(-1509015,'You are not worth my time $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8614,1,0,0,'rajaxx SAY_DEAGGRO'),(-1509016,'Breath your last!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8604,1,0,0,'rajaxx SAY_KILLS_ANDOROV'),(-1509017,'Soon you will know the price of your meddling, mortals... The master is nearly whole... And when he rises, your world will be cease!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'rajaxx SAY_COMPLETE_QUEST'),(-1509018,'I am rejuvinated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8593,1,0,0,'ossirian SAY_SURPREME1'),(-1509019,'My powers are renewed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8595,1,0,0,'ossirian SAY_SURPREME2'),(-1509020,'My powers return!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8596,1,0,0,'ossirian SAY_SURPREME3'),(-1509021,'Protect the city at all costs!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8597,1,0,0,'ossirian SAY_RAND_INTRO1'),(-1509022,'The walls have been breached!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8599,1,0,0,'ossirian SAY_RAND_INTRO2'),(-1509023,'To your posts. Defend the city.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8600,1,0,0,'ossirian SAY_RAND_INTRO3'),(-1509024,'Tresspassers will be terminated.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8601,1,0,0,'ossirian SAY_RAND_INTRO4'),(-1509025,'Sands of the desert rise and block out the sun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8598,1,0,0,'ossirian SAY_AGGRO'),(-1509026,'You are terminated.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8602,1,0,0,'ossirian SAY_SLAY'),(-1509027,'I...have...failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8594,1,0,0,'ossirian SAY_DEATH'),(-1531000,'Are you so eager to die? I would be happy to accomodate you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8615,1,0,0,'skeram SAY_AGGRO1'),(-1531001,'Cower mortals! The age of darkness is at hand.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8616,1,0,0,'skeram SAY_AGGRO2'),(-1531002,'Tremble! The end is upon you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8621,1,0,0,'skeram SAY_AGGRO3'),(-1531003,'Let your death serve as an example!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8617,1,0,0,'skeram SAY_SLAY1'),(-1531004,'Spineless wretches! You will drown in rivers of blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8619,1,0,0,'skeram SAY_SLAY2'),(-1531005,'The screams of the dying will fill the air. A symphony of terror is about to begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8620,1,0,0,'skeram SAY_SLAY3'),(-1531006,'Prepare for the return of the ancient ones!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8618,1,0,0,'skeram SAY_SPLIT'),(-1531007,'You only delay... the inevetable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8622,1,0,0,'skeram SAY_DEATH'),(-1531008,'You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8646,1,0,0,'sartura SAY_AGGRO'),(-1531009,'I sentence you to death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8647,1,0,0,'sartura SAY_SLAY'),(-1531010,'I serve to the last!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8648,1,0,0,'sartura SAY_DEATH'),(-1531011,'is weakened!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'cthun EMOTE_WEAKENED'),(-1532000,'Well done Midnight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9173,1,0,0,'attumen SAY_MIDNIGHT_KILL'),(-1532001,'Cowards! Wretches!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9167,1,0,0,'attumen SAY_APPEAR1'),(-1532002,'Who dares attack the steed of the Huntsman?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9298,1,0,0,'attumen SAY_APPEAR2'),(-1532003,'Perhaps you would rather test yourselves against a more formidable opponent?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9299,1,0,0,'attumen SAY_APPEAR3'),(-1532004,'Come, Midnight, let\'s disperse this petty rabble!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9168,1,0,0,'attumen SAY_MOUNT'),(-1532005,'It was... inevitable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9169,1,0,0,'attumen SAY_KILL1'),(-1532006,'Another trophy to add to my collection!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9300,1,0,0,'attumen SAY_KILL2'),(-1532007,'Weapons are merely a convenience for a warrior of my skill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9166,1,0,0,'attumen SAY_DISARMED'),(-1532008,'I always knew... someday I would become... the hunted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9165,1,0,0,'attumen SAY_DEATH'),(-1532009,'Such easy sport.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9170,1,0,0,'attumen SAY_RANDOM1'),(-1532010,'Amateurs! Do not think you can best me! I kill for a living.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9304,1,0,0,'attumen SAY_RANDOM2'),(-1532011,'Hmm, unannounced visitors? Preparations must be made.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9211,1,0,0,'moroes SAY_AGGRO'),(-1532012,'Now, where was I? Oh yes...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9215,1,0,0,'moroes SAY_SPECIAL_1'),(-1532013,'You rang?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9316,1,0,0,'moroes SAY_SPECIAL_2'),(-1532014,'One more for dinner this evening.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9214,1,0,0,'moroes SAY_KILL_1'),(-1532015,'Time... Never enough time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9314,1,0,0,'moroes SAY_KILL_2'),(-1532016,'I\'ve gone and made a mess.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9315,1,0,0,'moroes SAY_KILL_3'),(-1532017,'How terribly clumsy of me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9213,1,0,0,'moroes SAY_DEATH'),(-1532018,'Your behavior will not be tolerated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9204,1,0,0,'maiden SAY_AGGRO'),(-1532019,'Ah ah ah...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9207,1,0,0,'maiden SAY_SLAY1'),(-1532020,'This is for the best.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9312,1,0,0,'maiden SAY_SLAY2'),(-1532021,'Impure thoughts lead to profane actions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9311,1,0,0,'maiden SAY_SLAY3'),(-1532022,'Cast out your corrupt thoughts.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9313,1,0,0,'maiden SAY_REPENTANCE1'),(-1532023,'Your impurity must be cleansed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9208,1,0,0,'maiden SAY_REPENTANCE2'),(-1532024,'Death comes. Will your conscience be clear?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9206,1,0,0,'maiden SAY_DEATH'),(-1532025,'Oh at last, at last. I can go home.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9190,1,0,0,'dorothee SAY_DOROTHEE_DEATH'),(-1532026,'Don\'t let them hurt us, Tito! Oh, you won\'t, will you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9191,1,0,0,'dorothee SAY_DOROTHEE_SUMMON'),(-1532027,'Tito, oh Tito, no!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9192,1,0,0,'dorothee SAY_DOROTHEE_TITO_DEATH'),(-1532028,'Oh dear, we simply must find a way home! The old wizard could be our only hope! Strawman, Roar, Tinhead, will you... wait! Oh golly, look! We have visitors!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9195,1,0,0,'dorothee SAY_DOROTHEE_AGGRO'),(-1532029,'Wanna fight? Huh? Do ya? C\'mon, I\'ll fight you with both claws behind my back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9227,1,0,0,'roar SAY_ROAR_AGGRO'),(-1532030,'You didn\'t have to go and do that.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9229,1,0,0,'roar SAY_ROAR_DEATH'),(-1532031,'I think I\'m going to go take fourty winks.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9230,1,0,0,'roar SAY_ROAR_SLAY'),(-1532032,'Now what should I do with you? I simply can\'t make up my mind.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9254,1,0,0,'strawman SAY_STRAWMAN_AGGRO'),(-1532033,'Don\'t let them make a mattress... out of me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9256,1,0,0,'strawman SAY_STRAWMAN_DEATH'),(-1532034,'I guess I\'m not a failure after all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9257,1,0,0,'strawman SAY_STRAWMAN_SLAY'),(-1532035,'I could really use a heart. Say, can I have yours?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9268,1,0,0,'tinhead SAY_TINHEAD_AGGRO'),(-1532036,'Back to being an old rustbucket.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9270,1,0,0,'tinhead SAY_TINHEAD_DEATH'),(-1532037,'Guess I\'m not so rusty, after all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9271,1,0,0,'tinhead SAY_TINHEAD_SLAY'),(-1532038,'begins to rust.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'tinhead EMOTE_RUST'),(-1532039,'Woe to each and every one of you my pretties! <cackles>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9179,1,0,0,'crone SAY_CRONE_AGGRO'),(-1532040,'It will all be over soon! <cackles>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9307,1,0,0,'crone SAY_CRONE_AGGRO2'),(-1532041,'How could you? What a cruel, cruel world!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9178,1,0,0,'crone SAY_CRONE_DEATH'),(-1532042,'Fixed you, didn\'t I? <cackles>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9180,1,0,0,'crone SAY_CRONE_SLAY'),(-1532043,'All the better to own you with!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9276,1,0,0,'wolf SAY_WOLF_AGGRO'),(-1532044,'Mmmm... delicious.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9277,1,0,0,'wolf SAY_WOLF_SLAY'),(-1532045,'Run away little girl, run away!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9278,1,0,0,'wolf SAY_WOLF_HOOD'),(-1532046,'What devil art thou, that dost torment me thus?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9196,1,0,0,'julianne SAY_JULIANNE_AGGRO'),(-1532047,'Where is my lord? Where is my Romulo?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9199,1,0,0,'julianne SAY_JULIANNE_ENTER'),(-1532048,'Romulo, I come! Oh... this do I drink to thee!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9198,1,0,0,'julianne SAY_JULIANNE_DEATH01'),(-1532049,'Where is my Lord? Where is my Romulo? Ohh, happy dagger! This is thy sheath! There rust, and let me die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9310,1,0,0,'julianne SAY_JULIANNE_DEATH02'),(-1532050,'Come, gentle night; and give me back my Romulo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9200,1,0,0,'julianne SAY_JULIANNE_RESURRECT'),(-1532051,'Parting is such sweet sorrow.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9201,1,0,0,'julianne SAY_JULIANNE_SLAY'),(-1532052,'Wilt thou provoke me? Then have at thee, boy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9233,1,0,0,'romulo SAY_ROMULO_AGGRO'),(-1532053,'Thou smilest... upon the stroke that... murders me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9235,1,0,0,'romulo SAY_ROMULO_DEATH'),(-1532054,'This day\'s black fate on more days doth depend. This but begins the woe. Others must end.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9236,1,0,0,'romulo SAY_ROMULO_ENTER'),(-1532055,'Thou detestable maw, thou womb of death; I enforce thy rotten jaws to open!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9237,1,0,0,'romulo SAY_ROMULO_RESURRECT'),(-1532056,'How well my comfort is revived by this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9238,1,0,0,'romulo SAY_ROMULO_SLAY'),(-1532057,'The Menagerie is for guests only.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9183,1,0,0,'curator SAY_AGGRO'),(-1532058,'Gallery rules will be strictly enforced.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9188,1,0,0,'curator SAY_SUMMON1'),(-1532059,'This curator is equipped for gallery protection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9309,1,0,0,'curator SAY_SUMMON2'),(-1532060,'Your request cannot be processed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9186,1,0,0,'curator SAY_EVOCATE'),(-1532061,'Failure to comply will result in offensive action.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9185,1,0,0,'curator SAY_ENRAGE'),(-1532062,'Do not touch the displays.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9187,1,0,0,'curator SAY_KILL1'),(-1532063,'You are not a guest.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9308,1,0,0,'curator SAY_KILL2'),(-1532064,'This Curator is no longer op... er... ation... al.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9184,1,0,0,'curator SAY_DEATH'),(-1532065,'Your blood will anoint my circle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9264,1,0,0,'terestian SAY_SLAY1'),(-1532066,'The great one will be pleased.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9329,1,0,0,'terestian SAY_SLAY2'),(-1532067,'My life, is yours. Oh great one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9262,1,0,0,'terestian SAY_DEATH'),(-1532068,'Ah, you\'re just in time. The rituals are about to begin.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9260,1,0,0,'terestian SAY_AGGRO'),(-1532069,'Please, accept this humble offering, oh great one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9263,1,0,0,'terestian SAY_SACRIFICE1'),(-1532070,'Let the sacrifice serve his testament to my fealty.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9330,1,0,0,'terestian SAY_SACRIFICE2'),(-1532071,'Come, you dwellers in the dark. Rally to my call!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9265,1,0,0,'terestian SAY_SUMMON1'),(-1532072,'Gather, my pets. There is plenty for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9331,1,0,0,'terestian SAY_SUMMON2'),(-1532073,'Please, no more. My son... he\'s gone mad!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9241,1,0,0,'aran SAY_AGGRO1'),(-1532074,'I\'ll not be tortured again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9323,1,0,0,'aran SAY_AGGRO2'),(-1532075,'Who are you? What do you want? Stay away from me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9324,1,0,0,'aran SAY_AGGRO3'),(-1532076,'I\'ll show you this beaten dog still has some teeth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9245,1,0,0,'aran SAY_FLAMEWREATH1'),(-1532077,'Burn you hellish fiends!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9326,1,0,0,'aran SAY_FLAMEWREATH2'),(-1532078,'I\'ll freeze you all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9246,1,0,0,'aran SAY_BLIZZARD1'),(-1532079,'Back to the cold dark with you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9327,1,0,0,'aran SAY_BLIZZARD2'),(-1532080,'Yes, yes, my son is quite powerful... but I have powers of my own!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9242,1,0,0,'aran SAY_EXPLOSION1'),(-1532081,'I am not some simple jester! I am Nielas Aran!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9325,1,0,0,'aran SAY_EXPLOSION2'),(-1532082,'Surely you would not deny an old man a replenishing drink? No, no I thought not.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9248,1,0,0,'aran SAY_DRINK'),(-1532083,'I\'m not finished yet! No, I have a few more tricks up me sleeve.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9251,1,0,0,'aran SAY_ELEMENTALS'),(-1532084,'I want this nightmare to be over!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9250,1,0,0,'aran SAY_KILL1'),(-1532085,'Torment me no more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9328,1,0,0,'aran SAY_KILL2'),(-1532086,'You\'ve wasted enough of my time. Let these games be finished!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9247,1,0,0,'aran SAY_TIMEOVER'),(-1532087,'At last... The nightmare is.. over...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9244,1,0,0,'aran SAY_DEATH'),(-1532088,'Where did you get that?! Did HE send you?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9249,1,0,0,'aran SAY_ATIESH'),(-1532089,'cries out in withdrawal, opening gates to the warp.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'netherspite EMOTE_PHASE_PORTAL'),(-1532090,'goes into a nether-fed rage!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'netherspite EMOTE_PHASE_BANISH'),(-1532091,'Madness has brought you here to me. I shall be your undoing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9218,1,0,0,'malchezaar SAY_AGGRO'),(-1532092,'Simple fools! Time is the fire in which you\'ll burn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9220,1,0,0,'malchezaar SAY_AXE_TOSS1'),(-1532093,'I see the subtlety of conception is beyond primitives such as you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9317,1,0,0,'malchezaar SAY_AXE_TOSS2'),(-1532094,'Who knows what secrets hide in the dark.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9223,1,0,0,'malchezaar SAY_SPECIAL1'),(-1532095,'The cerestial forces are mine to manipulate.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9320,1,0,0,'malchezaar SAY_SPECIAL2'),(-1532096,'How can you hope to withstand against such overwhelming power?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9321,1,0,0,'malchezaar SAY_SPECIAL3'),(-1532097,'Surely you did not think you could win.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9222,1,0,0,'malchezaar SAY_SLAY1'),(-1532098,'Your greed, your foolishness has brought you to this end.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9318,1,0,0,'malchezaar SAY_SLAY2'),(-1532099,'You are, but a plaything, unfit even to amuse.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9319,1,0,0,'malchezaar SAY_SLAY3'),(-1532100,'All realities, all dimensions are open to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9224,1,0,0,'malchezaar SAY_SUMMON1'),(-1532101,'You face not Malchezaar alone, but the legions I command!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9322,1,0,0,'malchezaar SAY_SUMMON2'),(-1532102,'I refuse to concede defeat. I am a prince of the Eredar! I am...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9221,1,0,0,'malchezaar SAY_DEATH'),(-1532103,'Welcome Ladies and Gentlemen, to this evening\'s presentation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9174,1,0,0,'barnes OZ1'),(-1532104,'Tonight we plumb the depths of the human soul as we join a lost, lonely girl trying desperately -- with the help of her loyal companions -- to find her way home!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9338,1,0,0,'barnes OZ2'),(-1532105,'But she is pursued... by a wicked malevolent crone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9339,1,0,0,'barnes OZ3'),(-1532106,'Will she survive? Will she prevail? Only time will tell. And now ... on with the show!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9340,1,0,0,'barnes OZ4'),(-1532107,'Good evening, Ladies and Gentlemen! Welcome to this evening\'s presentation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9175,1,0,0,'barnes HOOD1'),(-1532108,'Tonight, things are not what they seem. For tonight, your eyes may not be trusted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9335,1,0,0,'barnes HOOD2'),(-1532109,'Take for instance, this quiet, elderly woman, waiting for a visit from her granddaughter. Surely there is nothing to fear from this sweet, grey-haired, old lady.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9336,1,0,0,'barnes HOOD3'),(-1532110,'But don\'t let me pull the wool over your eyes. See for yourself what lies beneath those covers! And now... on with the show!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9337,1,0,0,'barnes HOOD4'),(-1532111,'Welcome, Ladies and Gentlemen, to this evening\'s presentation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9176,1,0,0,'barnes RAJ1'),(-1532112,'Tonight, we explore a tale of forbidden love!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9341,1,0,0,'barnes RAJ2'),(-1532113,'But beware, for not all love stories end happily, as you may find out. Sometimes, love pricks like a thorn.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9342,1,0,0,'barnes RAJ3'),(-1532114,'But don\'t take it from me, see for yourself what tragedy lies ahead when the paths of star-crossed lovers meet. And now...on with the show!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9343,1,0,0,'barnes RAJ4'),(-1533000,'Ahh... welcome to my parlor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8788,1,0,0,'anubrekhan SAY_GREET'),(-1533001,'Just a little taste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8785,1,0,0,'anubrekhan SAY_AGGRO1'),(-1533002,'There is no way out.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8786,1,0,0,'anubrekhan SAY_AGGRO2'),(-1533003,'Yes, Run! It makes the blood pump faster!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8787,1,0,0,'anubrekhan SAY_AGGRO3'),(-1533004,'I hear little hearts beating. Yesss... beating faster now. Soon the beating will stop.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8790,1,0,0,'anubrekhan SAY_TAUNT1'),(-1533005,'Where to go? What to do? So many choices that all end in pain, end in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8791,1,0,0,'anubrekhan SAY_TAUNT2'),(-1533006,'Which one shall I eat first? So difficult to choose... the all smell so delicious.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8792,1,0,0,'anubrekhan SAY_TAUNT3'),(-1533007,'Closer now... tasty morsels. I\'ve been too long without food. Without blood to drink.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8793,1,0,0,'anubrekhan SAY_TAUNT4'),(-1533008,'Shh... it will all be over soon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8789,1,0,0,'anubrekhan SAY_SLAY'),(-1533009,'Your old lives, your mortal desires, mean nothing. You are acolytes of the master now, and you will serve the cause without question! The greatest glory is to die in the master\'s service!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8799,1,0,0,'faerlina SAY_GREET'),(-1533010,'Slay them in the master\'s name!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8794,1,0,0,'faerlina SAY_AGGRO1'),(-1533011,'You cannot hide from me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8795,1,0,0,'faerlina SAY_AGGRO2'),(-1533012,'Kneel before me, worm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8796,1,0,0,'faerlina SAY_AGGRO3'),(-1533013,'Run while you still can!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8797,1,0,0,'faerlina SAY_AGGRO4'),(-1533014,'You have failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8800,1,0,0,'faerlina SAY_SLAY1'),(-1533015,'Pathetic wretch!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8801,1,0,0,'faerlina SAY_SLAY2'),(-1533016,'The master... will avenge me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8798,1,0,0,'faerlina SAY_DEATH'),(-1533017,'Patchwerk want to play!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8909,1,0,0,'patchwerk SAY_AGGRO1'),(-1533018,'Kel\'Thuzad make Patchwerk his Avatar of War!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8910,1,0,0,'patchwerk SAY_AGGRO2'),(-1533019,'No more play?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8912,1,0,0,'patchwerk SAY_SLAY'),(-1533020,'What happened to... Patch...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8911,1,0,0,'patchwerk SAY_DEATH'),(-1533021,'goes into a berserker rage!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'patchwerk EMOTE_BERSERK'),(-1533022,'becomes enraged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'patchwerk EMOTE_ENRAGE'),(-1533023,'Stalagg crush you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8864,1,0,0,'stalagg SAY_STAL_AGGRO'),(-1533024,'Stalagg kill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8866,1,0,0,'stalagg SAY_STAL_SLAY'),(-1533025,'Master save me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8865,1,0,0,'stalagg SAY_STAL_DEATH'),(-1533026,'Feed you to master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8802,1,0,0,'feugen SAY_FEUG_AGGRO'),(-1533027,'Feugen make master happy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8804,1,0,0,'feugen SAY_FEUG_SLAY'),(-1533028,'No... more... Feugen...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8803,1,0,0,'feugen SAY_FEUG_DEATH'),(-1533029,'You are too late... I... must... OBEY!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8872,1,0,0,'thaddius SAY_GREET'),(-1533030,'KILL!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8867,1,0,0,'thaddius SAY_AGGRO1'),(-1533031,'EAT YOUR BONES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8868,1,0,0,'thaddius SAY_AGGRO2'),(-1533032,'BREAK YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8869,1,0,0,'thaddius SAY_AGGRO3'),(-1533033,'You die now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8877,1,0,0,'thaddius SAY_SLAY'),(-1533034,'Now YOU feel pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8871,1,0,0,'thaddius SAY_ELECT'),(-1533035,'Thank... you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8870,1,0,0,'thaddius SAY_DEATH'),(-1533036,'Pleeease!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8873,1,0,0,'thaddius SAY_SCREAM1'),(-1533037,'Stop, make it stop!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8874,1,0,0,'thaddius SAY_SCREAM2'),(-1533038,'Help me! Save me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8875,1,0,0,'thaddius SAY_SCREAM3'),(-1533039,'Please, nooo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8876,1,0,0,'thaddius SAY_SCREAM4'),(-1533040,'Foolishly you have sought your own demise. Brazenly you have disregarded powers beyond your understanding. You have fought hard to invade the realm of the harvester. Now there is only one way out - to walk the lonely path of the damned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8807,1,0,0,'gothik SAY_SPEECH'),(-1533041,'Death is the only escape.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8806,1,0,0,'gothik SAY_KILL'),(-1533042,'I... am... undone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8805,1,0,0,'gothik SAY_DEATH'),(-1533043,'I have waited long enough! Now, you face the harvester of souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8808,1,0,0,'gothik SAY_TELEPORT'),(-1533044,'Defend youself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8892,1,0,0,'blaumeux SAY_BLAU_AGGRO'),(-1533045,'Come, Zeliek, do not drive them out. Not before we\'ve had our fun.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8896,1,0,0,'blaumeux SAY_BLAU_TAUNT1'),(-1533046,'I do hope they stay alive long enough for me to... introduce myself.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8897,1,0,0,'blaumeux SAY_BLAU_TAUNT2'),(-1533047,'The first kill goes to me! Anyone care to wager?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8898,1,0,0,'blaumeux SAY_BLAU_TAUNT3'),(-1533048,'Your life is mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8895,1,0,0,'blaumeux SAY_BLAU_SPECIAL'),(-1533049,'Who\'s next?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8894,1,0,0,'blaumeux SAY_BLAU_SLAY'),(-1533050,'Tou... che!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8893,1,0,0,'blaumeux SAY_BLAU_DEATH'),(-1533051,'Come out and fight, ye wee ninny!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8899,1,0,0,'korthazz SAY_KORT_AGGRO'),(-1533052,'To arms, ye roustabouts! We\'ve got company!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8903,1,0,0,'korthazz SAY_KORT_TAUNT1'),(-1533053,'I heard about enough of yer sniveling. Shut yer fly trap \'afore I shut it for ye!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8904,1,0,0,'korthazz SAY_KORT_TAUNT2'),(-1533054,'I\'m gonna enjoy killin\' these slack-jawed daffodils!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8905,1,0,0,'korthazz SAY_KORT_TAUNT3'),(-1533055,'I like my meat extra crispy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8902,1,0,0,'korthazz SAY_KORT_SPECIAl'),(-1533056,'Next time, bring more friends!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8901,1,0,0,'korthazz SAY_KORT_SLAY'),(-1533057,'What a bloody waste this is!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8900,1,0,0,'korthazz SAY_KORT_DEATH'),(-1533058,'Flee, before it\'s too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8913,1,0,0,'zeliek SAY_ZELI_AGGRO'),(-1533059,'Invaders, cease this foolish venture at once! Turn away while you still can!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8917,1,0,0,'zeliek SAY_ZELI_TAUNT1'),(-1533060,'Perhaps they will come to their senses, and run away as fast as they can!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8918,1,0,0,'zeliek SAY_ZELI_TAUNT2'),(-1533061,'Do not continue! Turn back while there\'s still time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8919,1,0,0,'zeliek SAY_ZELI_TAUNT3'),(-1533062,'I- I have no choice but to obey!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8916,1,0,0,'zeliek SAY_ZELI_SPECIAL'),(-1533063,'Forgive me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8915,1,0,0,'zeliek SAY_ZELI_SLAY'),(-1533064,'It is... as it should be.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8914,1,0,0,'zeliek SAY_ZELI_DEATH'),(-1533065,'You seek death?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14571,1,0,0,'rivendare_naxx SAY_RIVE_AGGRO1'),(-1533066,'None shall pass!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14572,1,0,0,'rivendare_naxx SAY_RIVE_AGGRO2'),(-1533067,'Be still!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14573,1,0,0,'rivendare_naxx SAY_RIVE_AGGRO3'),(-1533068,'You will find no peace in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14574,1,0,0,'rivendare_naxx SAY_RIVE_SLAY1'),(-1533069,'The master\'s will is done.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14575,1,0,0,'rivendare_naxx SAY_RIVE_SLAY2'),(-1533070,'Bow to the might of the scourge!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14576,1,0,0,'rivendare_naxx SAY_RIVE_SPECIAL'),(-1533071,'Enough prattling. Let them come! We shall grind their bones to dust.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14577,1,0,0,'rivendare_naxx SAY_RIVE_TAUNT1'),(-1533072,'Conserve your anger! Harness your rage! You will all have outlets for your frustration soon enough.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14578,1,0,0,'rivendare_naxx SAY_RIVE_TAUNT2'),(-1533073,'Life is meaningless. It is in death that we are truly tested.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14579,1,0,0,'rivendare_naxx SAY_RIVE_TAUNT3'),(-1533074,'Death... will not stop me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14580,1,0,0,'rivendare_naxx SAY_RIVE_DEATH'),(-1533075,'Glory to the master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8845,1,0,0,'noth SAY_AGGRO1'),(-1533076,'Your life is forfeit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8846,1,0,0,'noth SAY_AGGRO2'),(-1533077,'Die, trespasser!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8847,1,0,0,'noth SAY_AGGRO3'),(-1533078,'Rise, my soldiers! Rise and fight once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8851,1,0,0,'noth SAY_SUMMON'),(-1533079,'My task is done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8849,1,0,0,'noth SAY_SLAY1'),(-1533080,'Breathe no more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8850,1,0,0,'noth SAY_SLAY2'),(-1533081,'I will serve the master... in... death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8848,1,0,0,'noth SAY_DEATH'),(-1533082,'takes in a deep breath...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'sapphiron EMOTE_BREATH'),(-1533083,'enrages!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'sapphiron EMOTE_ENRAGE'),(-1533084,'Our preparations continue as planned, master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14467,1,0,0,'kelthuzad SAY_SAPP_DIALOG1'),(-1533085,'It is good that you serve me so faithfully. Soon, all will serve the Lich King and in the end, you shall be rewarded...so long as you do not falter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8881,1,0,0,'kelthuzad SAY_SAPP_DIALOG2_LICH'),(-1533086,'I see no complications... Wait... What is this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14468,1,0,0,'kelthuzad SAY_SAPP_DIALOG3'),(-1533087,'Your security measures have failed! See to this interruption immediately!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8882,1,0,0,'kelthuzad SAY_SAPP_DIALOG4_LICH'),(-1533088,'Yes, master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14469,1,0,0,'kelthuzad SAY_SAPP_DIALOG5'),(-1533089,'No!!! A curse upon you, interlopers! The armies of the Lich King will hunt you down. You will not escape your fate...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14484,1,0,0,'kelthuzad SAY_CAT_DIED'),(-1533090,'Who dares violate the sanctity of my domain? Be warned, all who trespass here are doomed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14463,1,0,0,'kelthuzad SAY_TAUNT1'),(-1533091,'Fools, you think yourselves triumphant? You have only taken one step closer to the abyss! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14464,1,0,0,'kelthuzad SAY_TAUNT2'),(-1533092,'I grow tired of these games. Proceed, and I will banish your souls to oblivion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14465,1,0,0,'kelthuzad SAY_TAUNT3'),(-1533093,'You have no idea what horrors lie ahead. You have seen nothing! The frozen heart of Naxxramas awaits you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14466,1,0,0,'kelthuzad SAY_TAUNT4'),(-1533094,'Pray for mercy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14475,1,0,0,'kelthuzad SAY_AGGRO1'),(-1533095,'Scream your dying breath!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14476,1,0,0,'kelthuzad SAY_AGGRO2'),(-1533096,'The end is upon you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14477,1,0,0,'kelthuzad SAY_AGGRO3'),(-1533097,'The dark void awaits you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14478,1,0,0,'kelthuzad SAY_SLAY1'),(-1533098,'<Kel\'Thuzad cackles maniacally!>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14479,1,0,0,'kelthuzad SAY_SLAY2'),(-1533099,'AAAAGHHH!... Do not rejoice... your victory is a hollow one... for I shall return with powers beyond your imagining!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14480,1,0,0,'kelthuzad SAY_DEATH'),(-1533100,'Your soul, is bound to me now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14472,1,0,0,'kelthuzad SAY_CHAIN1'),(-1533101,'There will be no escape!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14473,1,0,0,'kelthuzad SAY_CHAIN2'),(-1533102,'I will freeze the blood in your veins!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14474,1,0,0,'kelthuzad SAY_FROST_BLAST'),(-1533103,'Master! I require aid! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14470,1,0,0,'kelthuzad SAY_REQUEST_AID'),(-1533104,'Very well... warriors of the frozen wastes, rise up! I command you to fight, kill, and die for your master. Let none survive...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'kelthuzad SAY_ANSWER_REQUEST'),(-1533105,'Minions, servants, soldiers of the cold dark, obey the call of Kel\'Thuzad!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14471,1,0,0,'kelthuzad SAY_SUMMON_MINIONS'),(-1533106,'Your petty magics are no challenge to the might of the Scourge! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14481,1,0,0,'kelthuzad SAY_SPECIAL1_MANA_DET'),(-1533107,'Enough! I grow tired of these distractions! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14483,1,0,0,'kelthuzad SAY_SPECIAL3_MANA_DET'),(-1533108,'Fools, you have spread your powers too thin. Be free, my minions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14482,1,0,0,'kelthuzad SAY_SPECIAL2_DISPELL'),(-1533109,'You are mine now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8825,1,0,0,'heigan SAY_AGGRO1'),(-1533110,'I see you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8826,1,0,0,'heigan SAY_AGGRO2'),(-1533111,'You...are next!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8827,1,0,0,'heigan SAY_AGGRO3'),(-1533112,'Close your eyes... sleep!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8829,1,0,0,'heigan SAY_SLAY'),(-1533113,'The races of the world will perish. It is only a matter of time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8830,1,0,0,'heigan SAY_TAUNT1'),(-1533114,'I see endless suffering, I see torment, I see rage. I see... everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8831,1,0,0,'heigan SAY_TAUNT2'),(-1533115,'Soon... the world will tremble!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8832,1,0,0,'heigan SAY_TAUNT3'),(-1533116,'The end is upon you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8833,1,0,0,'heigan SAY_TAUNT4'),(-1533117,'Hungry worms will feast on your rotten flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8834,1,0,0,'heigan SAY_TAUNT5'),(-1533118,'Noo... o...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8828,1,0,0,'heigan SAY_DEATH'),(-1534000,'I\'m in jeopardy, help me if you can!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11007,1,0,0,'jaina hyjal ATTACKED 1'),(-1534001,'They\'ve broken through!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11049,1,0,0,'jaina hyjal ATTACKED 2'),(-1534002,'Stay alert! Another wave approaches.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11008,1,0,0,'jaina hyjal INCOMING'),(-1534003,'Don\'t give up! We must prevail!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11006,1,0,0,'jaina hyjal BEGIN'),(-1534004,'Hold them back as long as possible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11050,1,0,0,'jaina hyjal RALLY 1'),(-1534005,'We must hold strong!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11051,1,0,0,'jaina hyjal RALLY 2'),(-1534006,'We are lost. Fall back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11009,1,0,0,'jaina hyjal FAILURE'),(-1534007,'We have won valuable time. Now we must pull back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11011,1,0,0,'jaina hyjal SUCCESS'),(-1534008,'I did... my best.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11010,1,0,0,'jaina hyjal DEATH'),(-1534009,'I will lie down for no one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11031,1,0,0,'thrall hyjal ATTACKED 1'),(-1534010,'Bring the fight to me and pay with your lives!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11061,1,0,0,'thrall hyjal ATTACKED 2'),(-1534011,'Make ready for another wave! LOK-TAR OGAR!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11032,1,0,0,'thrall hyjal INCOMING'),(-1534012,'Hold them back! Do not falter!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11030,1,0,0,'thrall hyjal BEGIN'),(-1534013,'Victory or death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11059,1,0,0,'thrall hyjal RALLY 1'),(-1534014,'Do not give an inch of ground!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11060,1,0,0,'thrall hyjal RALLY 2'),(-1534015,'It is over. Withdraw! We have failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11033,1,0,0,'thrall hyjal FAILURE'),(-1534016,'We have played our part and done well. It is up to the others now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11035,1,0,0,'thrall hyjal SUCCESS'),(-1534017,'Uraaa...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11034,1,0,0,'thrall hyjal DEATH'),(-1534018,'All of your efforts have been in vain, for the draining of the World Tree has already begun. Soon the heart of your world will beat no more.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10986,1,0,0,'archimonde SAY_PRE_EVENTS_COMPLETE'),(-1534019,'Your resistance is insignificant.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10987,1,0,0,'archimonde SAY_AGGRO'),(-1534020,'This world will burn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10990,1,0,0,'archimonde SAY_DOOMFIRE1'),(-1534021,'Manach sheek-thrish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11041,1,0,0,'archimonde SAY_DOOMFIRE2'),(-1534022,'A-kreesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10989,1,0,0,'archimonde SAY_AIR_BURST1'),(-1534023,'Away vermin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11043,1,0,0,'archimonde SAY_AIR_BURST2'),(-1534024,'All creation will be devoured!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11044,1,0,0,'archimonde SAY_SLAY1'),(-1534025,'Your soul will languish for eternity.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10991,1,0,0,'archimonde SAY_SLAY2'),(-1534026,'I am the coming of the end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11045,1,0,0,'archimonde SAY_SLAY3'),(-1534027,'At last it is here. Mourn and lament the passing of all you have ever known and all that would have been! Akmin-kurai!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10993,1,0,0,'archimonde SAY_ENRAGE'),(-1534028,'No, it cannot be! Nooo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10992,1,0,0,'archimonde SAY_DEATH'),(-1534029,'You are mine now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10988,1,0,0,'archimonde SAY_SOUL_CHARGE1'),(-1534030,'Bow to my will.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11042,1,0,0,'archimonde SAY_SOUL_CHARGE2'),(-1540000,'You wish to fight us all at once? This should be amusing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10262,1,0,0,'nethekurse SAY_INTRO'),(-1540001,'You can have that one. I no longer need him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10263,1,0,0,'nethekurse PEON_ATTACK_1'),(-1540002,'Yes, beat him mercilessly. His skull is a thick as an ogres.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10264,1,0,0,'nethekurse PEON_ATTACK_2'),(-1540003,'Don\'t waste your time on that one. He\'s weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10265,1,0,0,'nethekurse PEON_ATTACK_3'),(-1540004,'You want him? Very well, take him!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10266,1,0,0,'nethekurse PEON_ATTACK_4'),(-1540005,'One pitiful wretch down. Go on, take another one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10267,1,0,0,'nethekurse PEON_DIE_1'),(-1540006,'Ahh, what a waste... Next!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10268,1,0,0,'nethekurse PEON_DIE_2'),(-1540007,'I was going to kill him anyway!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10269,1,0,0,'nethekurse PEON_DIE_3'),(-1540008,'Thank you for saving me the trouble! Now it\'s my turn to have some fun...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10270,1,0,0,'nethekurse PEON_DIE_4'),(-1540009,'Beg for your pittyfull life!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10259,1,0,0,'nethekurse SAY_TAUNT_1'),(-1540010,'Run covad, ruun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10260,1,0,0,'nethekurse SAY_TAUNT_2'),(-1540011,'Your pain amuses me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10261,1,0,0,'nethekurse SAY_TAUNT_3'),(-1540012,'I\'m already bored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10271,1,0,0,'nethekurse SAY_AGGRO_1'),(-1540013,'Come on! ... Show me a real fight.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10272,1,0,0,'nethekurse SAY_AGGRO_2'),(-1540014,'I had more fun torturing the peons.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10273,1,0,0,'nethekurse SAY_AGGRO_3'),(-1540015,'You Loose.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10274,1,0,0,'nethekurse SAY_SLAY_1'),(-1540016,'Ohh! Just die.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10275,1,0,0,'nethekurse SAY_SLAY_2'),(-1540017,'What a ... a shame.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10276,1,0,0,'nethekurse SAY_DIE'),(-1540018,'Smash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10306,1,0,0,'omrogg GoCombat_1'),(-1540019,'If you nice me let you live.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10308,1,0,0,'omrogg GoCombat_2'),(-1540020,'Me hungry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10309,1,0,0,'omrogg GoCombat_3'),(-1540021,'Why don\'t you let me do the talking?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10317,1,0,0,'omrogg GoCombatDelay_1'),(-1540022,'No, we will NOT let you live!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10318,1,0,0,'omrogg GoCombatDelay_2'),(-1540023,'You always hungry. That why we so fat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10319,1,0,0,'omrogg GoCombatDelay_3'),(-1540024,'You stay here. Me go kill someone else!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10303,1,0,0,'omrogg Threat_1'),(-1540025,'What are you doing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10315,1,0,0,'omrogg Threat_2'),(-1540026,'Me kill someone else...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10302,1,0,0,'omrogg Threat_3'),(-1540027,'Me not like this one...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10300,1,0,0,'omrogg Threat_4'),(-1540028,'That\'s not funny!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10314,1,0,0,'omrogg ThreatDelay1_1'),(-1540029,'Me get bored...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10305,1,0,0,'omrogg ThreatDelay1_2'),(-1540030,'I\'m not done yet, idiot!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10313,1,0,0,'omrogg ThreatDelay1_3'),(-1540031,'Hey you numbskull!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10312,1,0,0,'omrogg ThreatDelay1_4'),(-1540032,'Ha ha ha.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10304,1,0,0,'omrogg ThreatDelay2_1'),(-1540033,'Whhy! He almost dead!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10316,1,0,0,'omrogg ThreatDelay2_2'),(-1540034,'H\'ey...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10307,1,0,0,'omrogg ThreatDelay2_3'),(-1540035,'We kill his friend!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10301,1,0,0,'omrogg ThreatDelay2_4'),(-1540036,'This one die easy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10310,1,0,0,'omrogg Killing_1'),(-1540037,'I\'m tired. You kill next one!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10320,1,0,0,'omrogg Killing_2'),(-1540038,'That\'s because I do all the hard work!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10321,1,0,0,'omrogg KillingDelay_1'),(-1540039,'This all...your fault!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10311,1,0,0,'omrogg YELL_DIE_L'),(-1540040,'I...hate...you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10322,1,0,0,'omrogg YELL_DIE_R'),(-1540041,'enrages',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'omrogg EMOTE_ENRAGE'),(-1540042,'Ours is the true Horde! The only Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10323,1,0,0,'kargath SAY_AGGRO1'),(-1540043,'I\'ll carve the meat from your bones!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10324,1,0,0,'kargath SAY_AGGRO2'),(-1540044,'I am called Bladefist for a reason, as you will see!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10325,1,0,0,'kargath SAY_AGGRO3'),(-1540045,'For the real Horde!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10326,1,0,0,'kargath SAY_SLAY1'),(-1540046,'I am the only Warchief!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10327,1,0,0,'kargath SAY_SLAY2'),(-1540047,'The true Horde... will.. prevail...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10328,1,0,0,'kargath SAY_DEATH'),(-1542000,'Who dares interrupt... What is this? What have you done? You ruin everything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10164,1,0,0,'kelidan SAY_WAKE'),(-1542001,'You mustn\'t let him loose!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10166,1,0,0,'kelidan SAY_ADD_AGGRO_1'),(-1542002,'Ignorant whelps!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10167,1,0,0,'kelidan SAY_ADD_AGGRO_2'),(-1542003,'You fools! He\'ll kill us all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10168,1,0,0,'kelidan SAY_ADD_AGGRO_3'),(-1542004,'Just as you deserve!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10169,1,0,0,'kelidan SAY_KILL_1'),(-1542005,'Your friends will soon be joining you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10170,1,0,0,'kelidan SAY_KILL_2'),(-1542006,'Closer... Come closer.. and burn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10165,1,0,0,'kelidan SAY_NOVA'),(-1542007,'Good luck... you\'ll need it..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10171,1,0,0,'kelidan SAY_DIE'),(-1542008,'Come intruders....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'broggok SAY_AGGRO'),(-1542009,'My work must not be interrupted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10286,1,0,0,'the_maker SAY_AGGRO_1'),(-1542010,'Perhaps I can find a use for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10287,1,0,0,'the_maker SAY_AGGRO_2'),(-1542011,'Anger... Hate... These are tools I can use.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10288,1,0,0,'the_maker SAY_AGGRO_3'),(-1542012,'Let\'s see what I can make of you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10289,1,0,0,'the_maker SAY_KILL_1'),(-1542013,'It is pointless to resist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10290,1,0,0,'the_maker SAY_KILL_2'),(-1542014,'Stay away from... me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10291,1,0,0,'the_maker SAY_DIE'),(-1543000,'Do you smell that? Fresh meat has somehow breached our citadel. Be wary of any intruders.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gargolmar SAY_TAUNT'),(-1543001,'Heal me! QUICKLY!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10329,1,0,0,'gargolmar SAY_HEAL'),(-1543002,'Back off, pup!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10330,1,0,0,'gargolmar SAY_SURGE'),(-1543003,'What have we here...?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10331,1,0,0,'gargolmar SAY_AGGRO_1'),(-1543004,'Heh... this may hurt a little.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10332,1,0,0,'gargolmar SAY_AGGRO_2'),(-1543005,'I\'m gonna enjoy this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10333,1,0,0,'gargolmar SAY_AGGRO_3'),(-1543006,'Say farewell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10334,1,0,0,'gargolmar SAY_KILL_1'),(-1543007,'Much too easy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10335,1,0,0,'gargolmar SAY_KILL_2'),(-1543008,'Hahah.. <cough> ..argh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10336,1,0,0,'gargolmar SAY_DIE'),(-1543009,'You dare stand against me?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10280,1,0,0,'omor SAY_AGGRO_1'),(-1543010,'I will not be defeated!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10279,1,0,0,'omor SAY_AGGRO_2'),(-1543011,'Your insolence will be your death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10281,1,0,0,'omor SAY_AGGRO_3'),(-1543012,'Achor-she-ki! Feast my pet! Eat your fill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10277,1,0,0,'omor SAY_SUMMON'),(-1543013,'A-Kreesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10278,1,0,0,'omor SAY_CURSE'),(-1543014,'Die, weakling!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10282,1,0,0,'omor SAY_KILL_1'),(-1543015,'It is... not over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10284,1,0,0,'omor SAY_DIE'),(-1543016,'I am victorious!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10283,1,0,0,'omor SAY_WIPE'),(-1544000,'Wretched, meddling insects. Release me and perhaps i will grant you a merciful death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10247,1,0,0,'magtheridon SAY_TAUNT1'),(-1544001,'Vermin! Leeches! Take my blood and choke on it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10248,1,0,0,'magtheridon SAY_TAUNT2'),(-1544002,'Illidan is an arrogant fool. I will crush him and reclaim Outland as my own.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10249,1,0,0,'magtheridon SAY_TAUNT3'),(-1544003,'Away, you mindless parasites. My blood is my own!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10250,1,0,0,'magtheridon SAY_TAUNT4'),(-1544004,'How long do you believe your pathetic sorcery can hold me?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10251,1,0,0,'magtheridon SAY_TAUNT5'),(-1544005,'My blood will be the end of you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10252,1,0,0,'magtheridon SAY_TAUNT6'),(-1544006,'I...am...UNLEASHED!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10253,1,0,0,'magtheridon SAY_FREED'),(-1544007,'Thank you for releasing me. Now...die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10254,1,0,0,'magtheridon SAY_AGGRO'),(-1544008,'Not again...NOT AGAIN!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10256,1,0,0,'magtheridon SAY_BANISH'),(-1544009,'I will not be taken so easily. Let the walls of this prison tremble...and FALL!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10257,1,0,0,'magtheridon SAY_CHAMBER_DESTROY'),(-1544010,'Did you think me weak? Soft? Who is the weak one now?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10255,1,0,0,'magtheridon SAY_PLAYER_KILLED'),(-1544011,'The Legion...will consume you...all...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10258,1,0,0,'magtheridon SAY_DEATH'),(-1544012,'becomes enraged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'magtheridon EMOTE_BERSERK'),(-1544013,'begins to cast Blast Nova!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'magtheridon EMOTE_BLASTNOVA'),(-1544014,'\'s bonds begin to weaken!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'magtheridon EMOTE_BEGIN'),(-1544015,'breaks free!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'magtheridon EMOTE_FREED'),(-1545000,'Surge forth my pets!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10360,1,0,0,'thespia SAY_SUMMON'),(-1545001,'The depths will consume you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10361,1,0,0,'thespia SAY_AGGRO_1'),(-1545002,'Meet your doom, surface dwellers!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10362,1,0,0,'thespia SAY_AGGRO_2'),(-1545003,'You will drown in blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10363,1,0,0,'thespia SAY_AGGRO_3'),(-1545004,'To the depths of oblivion with you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10364,1,0,0,'thespia SAY_SLAY_1'),(-1545005,'For my lady and master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10365,1,0,0,'thespia SAY_SLAY_2'),(-1545006,'Our matron will be.. the end of.. you..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10366,1,0,0,'thespia SAY_DEAD'),(-1545007,'I\'m bringin\' the pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10367,1,0,0,'mekgineer SAY_MECHANICS'),(-1545008,'You\'re in for a world of hurt!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10368,1,0,0,'mekgineer SAY_AGGRO_1'),(-1545009,'Eat hot metal, scumbag!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10369,1,0,0,'mekgineer SAY_AGGRO_2'),(-1545010,'I\'ll come over there!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10370,1,0,0,'mekgineer SAY_AGGRO_3'),(-1545011,'I\'m bringin\' the pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10371,1,0,0,'mekgineer SAY_AGGRO_4'),(-1545012,'You just got served, punk!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10372,1,0,0,'mekgineer SOUND_SLAY_1'),(-1545013,'I own you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10373,1,0,0,'mekgineer SOUND_SLAY_2'),(-1545014,'Have fun dyin\', cupcake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10374,1,0,0,'mekgineer SOUND_SLAY_3'),(-1545015,'Mommy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10375,1,0,0,'mekgineer SAY_DEATH'),(-1545016,'You deem yourselves worthy simply because you bested my guards? Our work here will not be compromised!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10390,1,0,0,'kalithresh SAY_INTRO'),(-1545017,'This is not nearly over...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10391,1,0,0,'kalithresh SAY_REGEN'),(-1545018,'Your head will roll!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10392,1,0,0,'kalithresh SAY_AGGRO1'),(-1545019,'I despise all of your kind!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10393,1,0,0,'kalithresh SAY_AGGRO2'),(-1545020,'Ba\'ahntha sol\'dorei!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10394,1,0,0,'kalithresh SAY_AGGRO3'),(-1545021,'Scram, surface filth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10395,1,0,0,'kalithresh SAY_SLAY1'),(-1545022,'Ah ha ha ha ha ha ha!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10396,1,0,0,'kalithresh SAY_SLAY2'),(-1545023,'For her Excellency... for... Vashj!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10397,1,0,0,'kalithresh SAY_DEATH'),(-1548000,'I cannot allow you to interfere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11289,1,0,0,'hydross SAY_AGGRO'),(-1548001,'Better, much better.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11290,1,0,0,'hydross SAY_SWITCH_TO_CLEAN'),(-1548002,'They have forced me to this...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11291,1,0,0,'hydross SAY_CLEAN_SLAY1'),(-1548003,'I have no choice.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11292,1,0,0,'hydross SAY_CLEAN_SLAY2'),(-1548004,'I am... released...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11293,1,0,0,'hydross SAY_CLEAN_DEATH'),(-1548005,'Aaghh, the poison...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11297,1,0,0,'hydross SAY_SWITCH_TO_CORRUPT'),(-1548006,'I will purge you from this place.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11298,1,0,0,'hydross SAY_CORRUPT_SLAY1'),(-1548007,'You are no better than they!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11299,1,0,0,'hydross SAY_CORRUPT_SLAY2'),(-1548008,'You are the disease, not I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11300,1,0,0,'hydross SAY_CORRUPT_DEATH'),(-1548009,'Finally my banishment ends!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11312,1,0,0,'leotheras SAY_AGGRO'),(-1548010,'Be gone trifling elf. I\'m in control now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11304,1,0,0,'leotheras SAY_SWITCH_TO_DEMON'),(-1548011,'We all have our demons...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11305,1,0,0,'leotheras SAY_INNER_DEMONS'),(-1548012,'I have no equal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11306,1,0,0,'leotheras SAY_DEMON_SLAY1'),(-1548013,'Perish, mortal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11307,1,0,0,'leotheras SAY_DEMON_SLAY2'),(-1548014,'Yes, YES! Ahahah!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11308,1,0,0,'leotheras SAY_DEMON_SLAY3'),(-1548015,'Kill! KILL!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11314,1,0,0,'leotheras SAY_NIGHTELF_SLAY1'),(-1548016,'That\'s right! Yes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11315,1,0,0,'leotheras SAY_NIGHTELF_SLAY2'),(-1548017,'Who\'s the master now?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11316,1,0,0,'leotheras SAY_NIGHTELF_SLAY3'),(-1548018,'No! NO! What have you done?! I am the master, do you hear me? I... aaghh... Can\'t... contain him...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11313,1,0,0,'leotheras SAY_FINAL_FORM'),(-1548019,'At last I am liberated. It has been too long since I have tasted true freedom!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11309,1,0,0,'leotheras SAY_FREE'),(-1548020,'You cannot kill me! Fools, I\'ll be back! I\'ll... aarghh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11317,1,0,0,'leotheras SAY_DEATH'),(-1548021,'Guards, attention! We have visitors...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11277,1,0,0,'karathress SAY_AGGRO'),(-1548022,'Your overconfidence will be your undoing! Guards, lend me your strength!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11278,1,0,0,'karathress SAY_GAIN_BLESSING'),(-1548023,'Go on, kill them! I\'ll be the better for it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11279,1,0,0,'karathress SAY_GAIN_ABILITY1'),(-1548024,'I am more powerful than ever!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11280,1,0,0,'karathress SAY_GAIN_ABILITY2'),(-1548025,'More knowledge, more power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11281,1,0,0,'karathress SAY_GAIN_ABILITY3'),(-1548026,'Land-dwelling scum!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11282,1,0,0,'karathress SAY_SLAY1'),(-1548027,'Alana be\'lendor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11283,1,0,0,'karathress SAY_SLAY2'),(-1548028,'I am rid of you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11284,1,0,0,'karathress SAY_SLAY3'),(-1548029,'Her ... excellency ... awaits!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11285,1,0,0,'karathress SAY_DEATH'),(-1548030,'Flood of the deep, take you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11321,1,0,0,'morogrim SAY_AGGRO'),(-1548031,'By the Tides, kill them at once!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11322,1,0,0,'morogrim SAY_SUMMON1'),(-1548032,'Destroy them my subjects!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11323,1,0,0,'morogrim SAY_SUMMON2'),(-1548033,'There is nowhere to hide!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11324,1,0,0,'morogrim SAY_SUMMON_BUBL1'),(-1548034,'Soon it will be finished!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11325,1,0,0,'morogrim SAY_SUMMON_BUBL2'),(-1548035,'It is done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11326,1,0,0,'morogrim SAY_SLAY1'),(-1548036,'Strugging only makes it worse.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11327,1,0,0,'morogrim SAY_SLAY2'),(-1548037,'Only the strong survive.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11328,1,0,0,'morogrim SAY_SLAY3'),(-1548038,'Great... currents of... Ageon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11329,1,0,0,'morogrim SAY_DEATH'),(-1548039,'sends his enemies to their watery graves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'morogrim EMOTE_WATERY_GRAVE'),(-1548040,'The violent earthquake has alerted nearby murlocs!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'morogrim EMOTE_EARTHQUAKE'),(-1548041,'summons Watery Globules!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'morogrim EMOTE_WATERY_GLOBULES'),(-1548042,'Water is life. It has become a rare commodity here in Outland. A commodity that we alone shall control. We are the Highborne, and the time has come at last for us to retake our rightful place in the world!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11531,1,0,0,'vashj SAY_INTRO'),(-1548043,'I\'ll split you from stem to stern!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11532,1,0,0,'vashj SAY_AGGRO1'),(-1548044,'Victory to Lord Illidan!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11533,1,0,0,'vashj SAY_AGGRO2'),(-1548045,'I spit on you, surface filth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11534,1,0,0,'vashj SAY_AGGRO3'),(-1548046,'Death to the outsiders!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11535,1,0,0,'vashj SAY_AGGRO4'),(-1548047,'I did not wish to lower myself by engaging your kind, but you leave me little choice!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11538,1,0,0,'vashj SAY_PHASE1'),(-1548048,'The time is now! Leave none standing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11539,1,0,0,'vashj SAY_PHASE2'),(-1548049,'You may want to take cover.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11540,1,0,0,'vashj SAY_PHASE3'),(-1548050,'Straight to the heart!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11536,1,0,0,'vashj SAY_BOWSHOT1'),(-1548051,'Seek your mark!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11537,1,0,0,'vashj SAY_BOWSHOT2'),(-1548052,'Your time ends now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11541,1,0,0,'vashj SAY_SLAY1'),(-1548053,'You have failed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11542,1,0,0,'vashj SAY_SLAY2'),(-1548054,'Be\'lamere an\'delay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11543,1,0,0,'vashj SAY_SLAY3'),(-1548055,'Lord Illidan, I... I am... sorry.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11544,1,0,0,'vashj SAY_DEATH'),(-1550000,'Alert, you are marked for extermination!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11213,1,0,0,'voidreaver SAY_AGGRO'),(-1550001,'Extermination, successful.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11215,1,0,0,'voidreaver SAY_SLAY1'),(-1550002,'Imbecile life form, no longer functional.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11216,1,0,0,'voidreaver SAY_SLAY2'),(-1550003,'Threat neutralized.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11217,1,0,0,'voidreaver SAY_SLAY3'),(-1550004,'Systems... shutting... down...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11214,1,0,0,'voidreaver SAY_DEATH'),(-1550005,'Alternative measure commencing...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11218,1,0,0,'voidreaver SAY_POUNDING1'),(-1550006,'Calculating force parameters...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11219,1,0,0,'voidreaver SAY_POUNDING2'),(-1550007,'Tal anu\'men no Sin\'dorei!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11134,1,0,0,'solarian SAY_AGGRO'),(-1550008,'Ha ha ha! You are hopelessly outmatched!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11139,1,0,0,'solarian SAY_SUMMON1'),(-1550009,'I will crush your delusions of grandeur!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11140,1,0,0,'solarian SAY_SUMMON2'),(-1550010,'Your soul belongs to the Abyss!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11136,1,0,0,'solarian SAY_KILL1'),(-1550011,'By the blood of the Highborne!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11137,1,0,0,'solarian SAY_KILL2'),(-1550012,'For the Sunwell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11138,1,0,0,'solarian SAY_KILL3'),(-1550013,'The warmth of the sun... awaits.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11135,1,0,0,'solarian SAY_DEATH'),(-1550014,'Enough of this! Now I call upon the fury of the cosmos itself.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'solarian SAY_VOIDA'),(-1550015,'I become ONE... with the VOID!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'solarian SAY_VOIDB'),(-1550016,'Energy. Power. My people are addicted to it... a dependence made manifest after the Sunwell was destroyed. Welcome... to the future. A pity you are too late to stop it. No one can stop me now! Selama ashal\'anore!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11256,1,0,0,'kaelthas SAY_INTRO'),(-1550017,'Capernian will see to it that your stay here is a short one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11257,1,0,0,'kaelthas SAY_INTRO_CAPERNIAN'),(-1550018,'Well done, you have proven worthy to test your skills against my master engineer, Telonicus.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11258,1,0,0,'kaelthas SAY_INTRO_TELONICUS'),(-1550019,'Let us see how your nerves hold up against the Darkener, Thaladred.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11259,1,0,0,'kaelthas SAY_INTRO_THALADRED'),(-1550020,'You have persevered against some of my best advisors... but none can withstand the might of the Blood Hammer. Behold, Lord Sanguinar!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11260,1,0,0,'kaelthas SAY_INTRO_SANGUINAR'),(-1550021,'As you see, I have many weapons in my arsenal...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11261,1,0,0,'kaelthas SAY_PHASE2_WEAPON'),(-1550022,'Perhaps I underestimated you. It would be unfair to make you fight all four advisors at once, but... fair treatment was never shown to my people. I\'m just returning the favor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11262,1,0,0,'kaelthas SAY_PHASE3_ADVANCE'),(-1550023,'Alas, sometimes one must take matters into one\'s own hands. Balamore shanal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11263,1,0,0,'kaelthas SAY_PHASE4_INTRO2'),(-1550024,'I have not come this far to be stopped! The future I have planned will not be jeopardized! Now you will taste true power!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11273,1,0,0,'kaelthas SAY_PHASE5_NUTS'),(-1550025,'You will not prevail.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11270,1,0,0,'kaelthas SAY_SLAY1'),(-1550026,'You gambled...and lost.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11271,1,0,0,'kaelthas SAY_SLAY2'),(-1550027,'This was Child\'s play.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11272,1,0,0,'kaelthas SAY_SLAY3'),(-1550028,'Obey me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11268,1,0,0,'kaelthas SAY_MINDCONTROL1'),(-1550029,'Bow to my will.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11269,1,0,0,'kaelthas SAY_MINDCONTROL2'),(-1550030,'Let us see how you fare when your world is turned upside down.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11264,1,0,0,'kaelthas SAY_GRAVITYLAPSE1'),(-1550031,'Having trouble staying grounded?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11265,1,0,0,'kaelthas SAY_GRAVITYLAPSE2'),(-1550032,'Anara\'nel belore!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11267,1,0,0,'kaelthas SAY_SUMMON_PHOENIX1'),(-1550033,'By the power of the sun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11266,1,0,0,'kaelthas SAY_SUMMON_PHOENIX2'),(-1550034,'For...Quel...thalas!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11274,1,0,0,'kaelthas SAY_DEATH'),(-1550035,'Prepare yourselves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11203,1,0,0,'thaladred SAY_THALADRED_AGGRO'),(-1550036,'Forgive me, my prince! I have... failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11204,1,0,0,'thaladred SAY_THALADRED_DEATH'),(-1550037,'sets his gaze on $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'thaladred EMOTE_THALADRED_GAZE'),(-1550038,'Blood for blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11152,1,0,0,'sanguinar SAY_SANGUINAR_AGGRO'),(-1550039,'NO! I ...will... not...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11153,1,0,0,'sanguinar SAY_SANGUINAR_DEATH'),(-1550040,'The sin\'dore reign supreme!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11117,1,0,0,'capernian SAY_CAPERNIAN_AGGRO'),(-1550041,'This is not over!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11118,1,0,0,'capernian SAY_CAPERNIAN_DEATH'),(-1550042,'Anar\'alah belore!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11157,1,0,0,'telonicus SAY_TELONICUS_AGGRO'),(-1550043,'More perils... await',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11158,1,0,0,'telonicus SAY_TELONICUS_DEATH'),(-1552000,'It is a small matter to control the mind of the weak... for I bear allegiance to powers untouched by time, unmoved by fate. No force on this world or beyond harbors the strength to bend our knee... not even the mighty Legion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11122,1,0,0,'skyriss SAY_INTRO'),(-1552001,'Bear witness to the agent of your demise!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11123,1,0,0,'skyriss SAY_AGGRO'),(-1552002,'Your fate is written!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11124,1,0,0,'skyriss SAY_KILL_1'),(-1552003,'The chaos I have sown here is but a taste...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11125,1,0,0,'skyriss SAY_KILL_2'),(-1552004,'You will do my bidding, weakling.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11127,1,0,0,'skyriss SAY_MIND_1'),(-1552005,'Your will is no longer your own.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11128,1,0,0,'skyriss SAY_MIND_2'),(-1552006,'Flee in terror!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11129,1,0,0,'skyriss SAY_FEAR_1'),(-1552007,'I will show you horrors undreamed of!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11130,1,0,0,'skyriss SAY_FEAR_2'),(-1552008,'We span the universe, as countless as the stars!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11131,1,0,0,'skyriss SAY_IMAGE'),(-1552009,'I am merely one of... infinite multitudes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11126,1,0,0,'skyriss SAY_DEATH'),(-1552010,'Where in Bonzo\'s brass buttons am I? And who are-- yaaghh, that\'s one mother of a headache!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11171,1,0,0,'millhouse SAY_INTRO_1'),(-1552011,'\"Lowly\"? I don\'t care who you are friend, no one refers to the mighty Millhouse Manastorm as \"Lowly\"! I have no idea what goes on here, but I will gladly join your fight against this impudent imbecile! Prepare to defend yourself, cretin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11172,1,0,0,'millhouse SAY_INTRO_2'),(-1552012,'I just need to get some things ready first. You guys go ahead and get started. I need to summon up some water...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11173,1,0,0,'millhouse SAY_WATER'),(-1552013,'Fantastic! Next, some protective spells. Yes! Now we\'re cookin\'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11174,1,0,0,'millhouse SAY_BUFFS'),(-1552014,'And of course i\'ll need some mana. You guys are gonna love this, just wait.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11175,1,0,0,'millhouse SAY_DRINK'),(-1552015,'Aaalllriiiight!! Who ordered up an extra large can of whoop-ass?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11176,1,0,0,'millhouse SAY_READY'),(-1552016,'I didn\'t even break a sweat on that one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11177,1,0,0,'millhouse SAY_KILL_1'),(-1552017,'You guys, feel free to jump in anytime.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11178,1,0,0,'millhouse SAY_KILL_2'),(-1552018,'I\'m gonna light you up, sweet cheeks!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11179,1,0,0,'millhouse SAY_PYRO'),(-1552019,'Ice, ice, baby!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11180,1,0,0,'millhouse SAY_ICEBLOCK'),(-1552020,'Heal me! Oh, for the love of all that is holy, HEAL me! I\'m dying!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11181,1,0,0,'millhouse SAY_LOWHP'),(-1552021,'You\'ll be hearing from my lawyer...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11182,1,0,0,'millhouse SAY_DEATH'),(-1552022,'Who\'s bad? Who\'s bad? That\'s right: we bad!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11183,1,0,0,'millhouse SAY_COMPLETE'),(-1552023,'I knew the prince would be angry but, I... I have not been myself. I had to let them out! The great one speaks to me, you see. Wait--outsiders. Kael\'thas did not send you! Good... I\'ll just tell the prince you released the prisoners!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11222,1,0,0,'mellichar YELL_INTRO1'),(-1552024,'The naaru kept some of the most dangerous beings in existence here in these cells. Let me introduce you to another...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11223,1,0,0,'mellichar YELL_INTRO2'),(-1552025,'Yes, yes... another! Your will is mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11224,1,0,0,'mellichar YELL_RELEASE1'),(-1552026,'Behold another terrifying creature of incomprehensible power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11225,1,0,0,'mellichar YELL_RELEASE2A'),(-1552027,'What is this? A lowly gnome? I will do better, O\'great one.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11226,1,0,0,'mellichar YELL_RELEASE2B'),(-1552028,'Anarchy! Bedlam! Oh, you are so wise! Yes, I see it now, of course!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11227,1,0,0,'mellichar YELL_RELEASE3'),(-1552029,'One final cell remains. Yes, O\'great one, right away!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11228,1,0,0,'mellichar YELL_RELEASE4'),(-1552030,'Welcome, O\'great one. I am your humble servant.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11229,1,0,0,'mellichar YELL_WELCOME'),(-1553000,'What are you doing? These specimens are very delicate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11144,1,0,0,'freywinn SAY_AGGRO'),(-1553001,'Your life cycle is now concluded!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11145,1,0,0,'freywinn SAY_KILL_1'),(-1553002,'You will feed the worms.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11146,1,0,0,'freywinn SAY_KILL_2'),(-1553003,'Endorel aluminor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11147,1,0,0,'freywinn SAY_TREE_1'),(-1553004,'Nature bends to my will!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11148,1,0,0,'freywinn SAY_TREE_2'),(-1553005,'The specimens...must be preserved.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11149,1,0,0,'freywinn SAY_DEATH'),(-1553006,'emits a strange noise.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'laj EMOTE_SUMMON'),(-1553007,'Who disturbs this sanctuary?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11230,1,0,0,'warp SAY_AGGRO'),(-1553008,'You must die! But wait: this does not--No, no... you must die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11231,1,0,0,'warp SAY_SLAY_1'),(-1553009,'What am I doing? Why do I...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11232,1,0,0,'warp SAY_SLAY_2'),(-1553010,'Children, come to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11233,1,0,0,'warp SAY_SUMMON_1'),(-1553011,'Maybe this is not--No, we fight! Come to my aid.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11234,1,0,0,'warp SAY_SUMMON_2'),(-1553012,'So... confused. Do not... belong here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11235,1,0,0,'warp SAY_DEATH'),(-1554000,'I predict a painful death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11101,1,0,0,'gyro SAY_AGGRO'),(-1554001,'Measure twice; cut once!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11104,1,0,0,'gyro SAY_SAW_ATTACK1'),(-1554002,'If my division is correct, you should be quite dead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11105,1,0,0,'gyro SAY_SAW_ATTACK2'),(-1554003,'Your strategy was flawed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11102,1,0,0,'gyro SAY_SLAY1'),(-1554004,'Yes, the only logical outcome.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11103,1,0,0,'gyro SAY_SLAY2'),(-1554005,'An unforseen... contingency',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11106,1,0,0,'gyro SAY_DEATH'),(-1554006,'You have approximately five seconds to live.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11109,1,0,0,'ironhand SAY_AGGRO_1'),(-1554007,'With the precise angle and velocity...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11112,1,0,0,'ironhand SAY_HAMMER_1'),(-1554008,'Low tech yet quiet effective!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11113,1,0,0,'ironhand SAY_HAMMER_2'),(-1554009,'A foregone conclusion.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11110,1,0,0,'ironhand SAY_SLAY_1'),(-1554010,'The processing will continue a schedule!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11111,1,0,0,'ironhand SAY_SLAY_2'),(-1554011,'My calculations did not...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11114,1,0,0,'ironhand SAY_DEATH_1'),(-1554012,'raises his hammer menacingly...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'ironhand EMOTE_HAMMER'),(-1554013,'Don\'t value your life very much, do you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11186,1,0,0,'sepethrea SAY_AGGRO'),(-1554014,'I am not alone.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11191,1,0,0,'sepethrea SAY_SUMMON'),(-1554015,'Think you can take the heat?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11189,1,0,0,'sepethrea SAY_DRAGONS_BREATH_1'),(-1554016,'Anar\'endal dracon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11190,1,0,0,'sepethrea SAY_DRAGONS_BREATH_2'),(-1554017,'And don\'t come back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11187,1,0,0,'sepethrea SAY_SLAY1'),(-1554018,'En\'dala finel el\'dal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11188,1,0,0,'sepethrea SAY_SLAY2'),(-1554019,'Anu... bala belore...alon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11192,1,0,0,'sepethrea SAY_DEATH'),(-1554020,'We are on a strict timetable. You will not interfere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11193,1,0,0,'pathaleon SAY_AGGRO'),(-1554021,'I\'m looking for a team player...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11197,1,0,0,'pathaleon SAY_DOMINATION_1'),(-1554022,'You work for me now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11198,1,0,0,'pathaleon SAY_DOMINATION_2'),(-1554023,'Time to supplement my work force.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11196,1,0,0,'pathaleon SAY_SUMMON'),(-1554024,'I prefeer to be hands-on...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11199,1,0,0,'pathaleon SAY_ENRAGE'),(-1554025,'A minor inconvenience.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11194,1,0,0,'pathaleon SAY_SLAY_1'),(-1554026,'Looks like you lose.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11195,1,0,0,'pathaleon SAY_SLAY_2'),(-1554027,'The project will... continue.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11200,1,0,0,'pathaleon SAY_DEATH'),(-1555000,'Infidels have invaded the sanctuary! Sniveling pests...You have yet to learn the true meaning of agony!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10473,1,0,0,'hellmaw SAY_INTRO'),(-1555001,'Pathetic mortals! You will pay dearly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10475,1,0,0,'hellmaw SAY_AGGRO1'),(-1555002,'I will break you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10476,1,0,0,'hellmaw SAY_AGGRO2'),(-1555003,'Finally! Something to relieve the tedium!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10477,1,0,0,'hellmaw SAY_AGGRO3'),(-1555004,'Aid me, you fools, before it\'s too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10474,1,0,0,'hellmaw SAY_HELP'),(-1555005,'Do you fear death?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10478,1,0,0,'hellmaw SAY_SLAY1'),(-1555006,'This is the part I enjoy most.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10479,1,0,0,'hellmaw SAY_SLAY2'),(-1555007,'Do not...grow...overconfident, mortal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10480,1,0,0,'hellmaw SAY_DEATH'),(-1555008,'All flesh must burn.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10482,1,0,0,'blackhearth SAY_INTRO1'),(-1555009,'All creation must be unmade!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10483,1,0,0,'blackhearth SAY_INTRO2'),(-1555010,'Power will be yours!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10484,1,0,0,'blackhearth SAY_INTRO3'),(-1555011,'You\'ll be sorry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10486,1,0,0,'blackhearth SAY_AGGRO1'),(-1555012,'Time for fun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10487,1,0,0,'blackhearth SAY_AGGRO2'),(-1555013,'I see dead people!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10488,1,0,0,'blackhearth SAY_AGGRO3'),(-1555014,'No comin\' back for you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10489,1,0,0,'blackhearth SAY_SLAY1'),(-1555015,'Nice try!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10490,1,0,0,'blackhearth SAY_SLAY2'),(-1555016,'Help us, hurry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10485,1,0,0,'blackhearth SAY_HELP'),(-1555017,'This... no... good...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10491,1,0,0,'blackhearth SAY_DEATH'),(-1555018,'Be ready for Dark One\'s return.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10492,1,0,0,'blackhearth SAY2_INTRO1'),(-1555019,'So we have place in new universe.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10493,1,0,0,'blackhearth SAY2_INTRO2'),(-1555020,'Dark one promise!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10494,1,0,0,'blackhearth SAY2_INTRO3'),(-1555021,'You\'ll be sorry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10496,1,0,0,'blackhearth SAY2_AGGRO1'),(-1555022,'Time to kill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10497,1,0,0,'blackhearth SAY2_AGGRO2'),(-1555023,'You be dead people!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10498,1,0,0,'blackhearth SAY2_AGGRO3'),(-1555024,'Now you gone for good.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10499,1,0,0,'blackhearth SAY2_SLAY1'),(-1555025,'You failed, haha haha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10500,1,0,0,'blackhearth SAY2_SLAY2'),(-1555026,'Help us, hurry!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10495,1,0,0,'blackhearth SAY2_HELP'),(-1555027,'Arrgh, aah...ahhh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10501,1,0,0,'blackhearth SAY2_DEATH'),(-1555028,'Keep your minds focused for the days of reckoning are close at hand. Soon, the destroyer of worlds will return to make good on his promise. Soon the destruction of all that is will begin!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10522,1,0,0,'vorpil SAY_INTRO'),(-1555029,'I\'ll make an offering of your blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10524,1,0,0,'vorpil SAY_AGGRO1'),(-1555030,'You\'ll be a fine example, for the others.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10525,1,0,0,'vorpil SAY_AGGRO2'),(-1555031,'Good, a worthy sacrifice.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10526,1,0,0,'vorpil SAY_AGGRO3'),(-1555032,'Come to my aid, heed your master now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10523,1,0,0,'vorpil SAY_HELP'),(-1555033,'I serve with pride.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10527,1,0,0,'vorpil SAY_SLAY1'),(-1555034,'Your death is for the greater cause!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10528,1,0,0,'vorpil SAY_SLAY2'),(-1555035,'I give my life... Gladly.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10529,1,0,0,'vorpil SAY_DEATH'),(-1555036,'draws energy from the air.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'murmur EMOTE_SONIC_BOOM'),(-1556000,'I have pets..<squawk>..of my own!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10502,1,0,0,'syth SAY_SUMMON'),(-1556001,'Hrrmm.. Time to.. hrrm.. make my move.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10503,1,0,0,'syth SAY_AGGRO_1'),(-1556002,'Nice pets..hrm.. Yes! <squawking>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10504,1,0,0,'syth SAY_AGGRO_2'),(-1556003,'Nice pets have.. weapons. No so..<squawk>..nice.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10505,1,0,0,'syth SAY_AGGRO_3'),(-1556004,'Death.. meeting life is.. <squawking>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10506,1,0,0,'syth SAY_SLAY_1'),(-1556005,'Uhn.. Be free..<squawk>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10507,1,0,0,'syth SAY_SLAY_2'),(-1556006,'No more life..hrm. No more pain. <squawks weakly>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10508,1,0,0,'syth SAY_DEATH'),(-1556007,'<squawk>..Trinkets yes pretty Trinkets..<squawk>..power, great power.<squawk>..power in Trinkets..<squawk>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10557,1,0,0,'ikiss SAY_INTRO'),(-1556008,'You make war on Ikiss?..<squawk>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10554,1,0,0,'ikiss SAY_AGGRO_1'),(-1556009,'Ikiss cut you pretty..<squawk>..slice you. Yes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10555,1,0,0,'ikiss SAY_AGGRO_2'),(-1556010,'No escape for..<squawk>..for you',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10556,1,0,0,'ikiss SAY_AGGRO_3'),(-1556011,'You die..<squawk>..stay away from Trinkets',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10558,1,0,0,'ikiss SAY_SLAY_1'),(-1556012,'<squawk>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10559,1,0,0,'ikiss SAY_SLAY_2'),(-1556013,'Ikiss will not..<squawk>..die',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10560,1,0,0,'ikiss SAY_DEATH'),(-1556015,'begins to channel arcane energy...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'ikiss EMOTE_ARCANE_EXP'),(-1557000,'What is this? You must forgive me, but I was not expecting company. As you can see, we are somewhat preoccupied right now. But no matter. As I am a gracious host, I will tend to you... personally.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10539,1,0,0,'shaffar SAY_INTRO'),(-1557001,'We have not yet been properly introduced.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10541,1,0,0,'shaffar SAY_AGGRO_1'),(-1557002,'An epic battle. How exciting!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10542,1,0,0,'shaffar SAY_AGGRO_2'),(-1557003,'I have longed for a good adventure.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10543,1,0,0,'shaffar SAY_AGGRO_3'),(-1557004,'It has been... entertaining.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10544,1,0,0,'shaffar SAY_SLAY_1'),(-1557005,'And now we part company.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10545,1,0,0,'shaffar SAY_SLAY_2'),(-1557006,'I have such fascinating things to show you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10540,1,0,0,'shaffar SAY_SUMMON'),(-1557007,'I must bid you... farewell.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10546,1,0,0,'shaffar SAY_DEAD'),(-1557008,'I will feed on your soul.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10561,1,0,0,'pandemonius SAY_AGGRO_1'),(-1557009,'So... full of life!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10562,1,0,0,'pandemonius SAY_AGGRO_2'),(-1557010,'Do not... resist.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10563,1,0,0,'pandemonius SAY_AGGRO_3'),(-1557011,'Yes! I am... empowered!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10564,1,0,0,'pandemonius SAY_KILL_1'),(-1557012,'More... I must have more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10565,1,0,0,'pandemonius SAY_KILL_2'),(-1557013,'To the void... once... more..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10566,1,0,0,'pandemonius SAY_DEATH'),(-1557014,'shifts into the void...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'pandemonius EMOTE_DARK_SHELL'),(-1558000,'You have defiled the resting place of our ancestors. For this offense, there can be but one punishment. It is fitting that you have come to a place of the dead... for you will soon be joining them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10509,1,0,0,'maladaar SAY_INTRO'),(-1558001,'Rise my fallen brothers. Take form and fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10512,1,0,0,'maladaar SAY_SUMMON'),(-1558002,'You will pay with your life!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10513,1,0,0,'maladaar SAY_AGGRO_1'),(-1558003,'There\'s no turning back now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10514,1,0,0,'maladaar SAY_AGGRO_2'),(-1558004,'Serve your penitence!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10515,1,0,0,'maladaar SAY_AGGRO_3'),(-1558005,'Let your mind be clouded.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10510,1,0,0,'maladaar SAY_ROAR'),(-1558006,'Stare into the darkness of your soul.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10511,1,0,0,'maladaar SAY_SOUL_CLEAVE'),(-1558007,'These walls will be your doom.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10516,1,0,0,'maladaar SAY_SLAY_1'),(-1558008,'<laugh> Now, you\'ll stay for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10517,1,0,0,'maladaar SAY_SLAY_2'),(-1558009,'This is... where.. I belong...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10518,1,0,0,'maladaar SAY_DEATH'),(-1560000,'Thrall! You didn\'t really think you would escape did you? You and your allies shall answer to Blackmoore - after I\'ve had my fun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10406,1,0,0,'skarloc SAY_ENTER'),(-1560001,'You\'re a slave. That\'s all you\'ll ever be.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10407,1,0,0,'skarloc SAY_TAUNT1'),(-1560002,'I don\'t know what Blackmoore sees in you. For my money, you\'re just another ignorant savage!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10408,1,0,0,'skarloc SAY_TAUNT2'),(-1560003,'Thrall will never be free!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10409,1,0,0,'skarloc SAY_SLAY1'),(-1560004,'Did you really think you would leave here alive?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10410,1,0,0,'skarloc SAY_SLAY2'),(-1560005,'Guards! Urgh..Guards..!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10411,1,0,0,'skarloc SAY_DEATH'),(-1560006,'You there, fetch water quickly! Get these flames out before they spread to the rest of the keep! Hurry, damn you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10428,1,0,0,'lieutenant_drake SAY_ENTER'),(-1560007,'I know what you\'re up to, and I mean to put an end to it, permanently!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10429,1,0,0,'lieutenant_drake SAY_AGGRO'),(-1560008,'No more middling for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10432,1,0,0,'lieutenant_drake SAY_SLAY1'),(-1560009,'You will not interfere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10433,1,0,0,'lieutenant_drake SAY_SLAY2'),(-1560010,'Time to bleed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10430,1,0,0,'lieutenant_drake SAY_MORTAL'),(-1560011,'Run, you blasted cowards!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10431,1,0,0,'lieutenant_drake SAY_SHOUT'),(-1560012,'Thrall... must not... go free.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10434,1,0,0,'lieutenant_drake SAY_DEATH'),(-1560013,'Thrall! Come outside and face your fate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10418,1,0,0,'epoch SAY_ENTER1'),(-1560014,'Taretha\'s life hangs in the balance. Surely you care for her. Surely you wish to save her...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10419,1,0,0,'epoch SAY_ENTER2'),(-1560015,'Ah, there you are. I had hoped to accomplish this with a bit of subtlety, but I suppose direct confrontation was inevitable. Your future, Thrall, must not come to pass and so...you and your troublesome friends must die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10420,1,0,0,'epoch SAY_ENTER3'),(-1560016,'Enough! I will erase your very existence!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10421,1,0,0,'epoch SAY_AGGRO1'),(-1560017,'You cannot fight fate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10422,1,0,0,'epoch SAY_AGGRO2'),(-1560018,'You are...irrelevant.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10425,1,0,0,'epoch SAY_SLAY1'),(-1560019,'Thrall will remain a slave. Taretha will die. You have failed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10426,1,0,0,'epoch SAY_SLAY2'),(-1560020,'Not so fast!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10423,1,0,0,'epoch SAY_BREATH1'),(-1560021,'Struggle as much as you like!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10424,1,0,0,'epoch SAY_BREATH2'),(-1560022,'No!...The master... will not... be pleased.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10427,1,0,0,'epoch SAY_DEATH'),(-1560023,'Very well then. Let\'s go!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10465,1,0,0,'thrall hillsbrad SAY_TH_START_EVENT_PART1'),(-1560024,'As long as we\'re going with a new plan, I may aswell pick up a weapon and some armor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'thrall hillsbrad SAY_TH_ARMORY'),(-1560025,'A rider approaches!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10466,0,0,0,'thrall hillsbrad SAY_TH_SKARLOC_MEET'),(-1560026,'I\'ll never be chained again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10467,1,0,0,'thrall hillsbrad SAY_TH_SKARLOC_TAUNT'),(-1560027,'Very well. Tarren Mill lies just west of here. Since time is of the essence...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10468,1,0,0,'thrall hillsbrad SAY_TH_START_EVENT_PART2'),(-1560028,'Let\'s ride!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10469,0,0,1,'thrall hillsbrad SAY_TH_MOUNTS_UP'),(-1560029,'Taretha must be in the inn. Let\'s go.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'thrall hillsbrad SAY_TH_CHURCH_END'),(-1560030,'Taretha! What foul magic is this?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'thrall hillsbrad SAY_TH_MEET_TARETHA'),(-1560031,'Who or what was that?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10470,1,0,1,'thrall hillsbrad SAY_TH_EPOCH_WONDER'),(-1560032,'No!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10471,1,0,5,'thrall hillsbrad SAY_TH_EPOCH_KILL_TARETHA'),(-1560033,'Goodbye, Taretha. I will never forget your kindness.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10472,1,0,0,'thrall hillsbrad SAY_TH_EVENT_COMPLETE'),(-1560034,'Things are looking grim...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10458,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_LOW_HP1'),(-1560035,'I will fight to the last!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10459,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_LOW_HP2'),(-1560036,'Taretha...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10460,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_DIE1'),(-1560037,'A good day...to die...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10461,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_DIE2'),(-1560038,'I have earned my freedom!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10448,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO1'),(-1560039,'This day is long overdue. Out of my way!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10449,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO2'),(-1560040,'I am a slave no longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10450,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO3'),(-1560041,'Blackmoore has much to answer for!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10451,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_AGGRO4'),(-1560042,'You have forced my hand!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10452,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_KILL1'),(-1560043,'It should not have come to this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10453,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_KILL2'),(-1560044,'I did not ask for this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10454,1,0,0,'thrall hillsbrad SAY_TH_RANDOM_KILL3'),(-1560045,'I am truly in your debt, strangers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10455,1,0,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT1'),(-1560046,'Thank you, strangers. You have given me hope.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10456,1,0,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT2'),(-1560047,'I will not waste this chance. I will seek out my destiny.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10457,1,0,0,'thrall hillsbrad SAY_TH_LEAVE_COMBAT3'),(-1560048,'I\'m free! Thank you all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'taretha SAY_TA_FREE'),(-1560049,'Thrall, you escaped!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'taretha SAY_TA_ESCAPED'),(-1564000,'You will die in the name of Lady Vashj!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11450,1,0,0,'SAY_AGGRO'),(-1564001,'Stick around!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11451,1,0,0,'SAY_NEEDLE1'),(-1564002,'I\'ll deal with you later!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11452,1,0,0,'SAY_NEEDLE2'),(-1564003,'Your success was short lived!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11455,1,0,0,'SAY_SLAY1'),(-1564004,'Time for you to go!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11456,1,0,0,'SAY_SLAY2'),(-1564005,'Bel\'anen dal\'lorei!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11453,1,0,0,'SAY_SPECIAL1'),(-1564006,'Blood will flow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11454,1,0,0,'SAY_SPECIAL2'),(-1564007,'Bal\'amer ch\'itah!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11457,1,0,0,'SAY_ENRAGE1'),(-1564008,'My patience has ran out! Die, DIE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11458,1,0,0,'SAY_ENRAGE2'),(-1564009,'Lord Illidan will... crush you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11459,1,0,0,'SAY_DEATH'),(-1564010,'%s acquires a new target!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'supremus EMOTE_NEW_TARGET'),(-1564011,'%s punches the ground in anger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'supremus EMOTE_PUNCH_GROUND'),(-1564012,'The ground begins to crack open!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'supremus EMOTE_GROUND_CRACK'),(-1564013,'No! Not yet...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11385,1,0,0,'akama shade SAY_LOW_HEALTH'),(-1564014,'I will not last much longer...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11386,1,0,0,'akama shade SAY_DEATH'),(-1564015,'Come out from the shadows! I\'ve returned to lead you against our true enemy! Shed your chains and raise your weapons against your Illidari masters!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'akama shade SAY_FREE'),(-1564016,'Hail our leader! Hail Akama!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'akama shade broken SAY_BROKEN_FREE_01'),(-1564017,'Hail Akama!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'akama shade broken SAY_BROKEN_FREE_02'),(-1564018,'You play, you pay.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11501,1,0,0,'shahraz SAY_TAUNT1'),(-1564019,'I\'m not impressed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11502,1,0,0,'shahraz SAY_TAUNT2'),(-1564020,'Enjoying yourselves?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11503,1,0,0,'shahraz SAY_TAUNT3'),(-1564021,'So... business or pleasure?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11504,1,0,0,'shahraz SAY_AGGRO'),(-1564022,'You seem a little tense.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11505,1,0,0,'shahraz SAY_SPELL1'),(-1564023,'Don\'t be shy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11506,1,0,0,'shahraz SAY_SPELL2'),(-1564024,'I\'m all... yours.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11507,1,0,0,'shahraz SAY_SPELL3'),(-1564025,'Easy come, easy go.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11508,1,0,0,'shahraz SAY_SLAY1'),(-1564026,'So much for a happy ending.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11509,1,0,0,'shahraz SAY_SLAY2'),(-1564027,'Stop toying with my emotions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11510,1,0,0,'shahraz SAY_ENRAGE'),(-1564028,'I wasn\'t... finished.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11511,1,0,0,'shahraz SAY_DEATH'),(-1564029,'Horde will... crush you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11432,1,0,0,'bloodboil SOUND_AGGRO'),(-1564030,'Time to feast!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11433,1,0,0,'bloodboil SAY_SLAY1'),(-1564031,'More! I want more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11434,1,0,0,'bloodboil SAY_SLAY2'),(-1564032,'Drink your blood! Eat your flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11435,1,0,0,'bloodboil SAY_SPECIAL1'),(-1564033,'I hunger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11436,1,0,0,'bloodboil SAY_SPECIAL2'),(-1564034,'<babbling>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11437,1,0,0,'bloodboil SAY_ENRAGE1'),(-1564035,'I\'ll rip the meat from your bones!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11438,1,0,0,'bloodboil SAY_ENRAGE2'),(-1564036,'Aaaahrg...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11439,1,0,0,'bloodboil SAY_DEATH'),(-1564037,'I was the first, you know. For me, the wheel of death has spun many times. <laughs> So much time has passed. I have a lot of catching up to do...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11512,1,0,0,'teron SAY_INTRO'),(-1564038,'Vengeance is mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11513,1,0,0,'teron SAY_AGGRO'),(-1564039,'I have use for you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11514,1,0,0,'teron SAY_SLAY1'),(-1564040,'It gets worse...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11515,1,0,0,'teron SAY_SLAY2'),(-1564041,'What are you afraid of?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11517,1,0,0,'teron SAY_SPELL1'),(-1564042,'Death... really isn\'t so bad.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11516,1,0,0,'teron SAY_SPELL2'),(-1564043,'Give in!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11518,1,0,0,'teron SAY_SPECIAL1'),(-1564044,'I have something for you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11519,1,0,0,'teron SAY_SPECIAL2'),(-1564045,'YOU WILL SHOW THE PROPER RESPECT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11520,1,0,0,'teron SAY_ENRAGE'),(-1564046,'The wheel...spins...again....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11521,1,0,0,'teron SAY_DEATH'),(-1564047,'Pain and suffering are all that await you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11415,1,0,0,'essence SUFF_SAY_FREED'),(-1564048,'Don\'t leave me alone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11416,1,0,0,'essence SUFF_SAY_AGGRO'),(-1564049,'Look at what you make me do!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11417,1,0,0,'essence SUFF_SAY_SLAY1'),(-1564050,'I didn\'t ask for this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11418,1,0,0,'essence SUFF_SAY_SLAY2'),(-1564051,'The pain is only beginning!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11419,1,0,0,'essence SUFF_SAY_SLAY3'),(-1564052,'I don\'t want to go back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11420,1,0,0,'essence SUFF_SAY_RECAP'),(-1564053,'Now what do I do?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11421,1,0,0,'essence SUFF_SAY_AFTER'),(-1564054,'%s becomes enraged!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'essence SUFF_EMOTE_ENRAGE'),(-1564055,'You can have anything you desire... for a price.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11408,1,0,0,'essence DESI_SAY_FREED'),(-1564056,'Fulfilment is at hand!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11409,1,0,0,'essence DESI_SAY_SLAY1'),(-1564057,'Yes... you\'ll stay with us now...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11410,1,0,0,'essence DESI_SAY_SLAY2'),(-1564058,'Your reach exceeds your grasp.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11412,1,0,0,'essence DESI_SAY_SLAY3'),(-1564059,'Be careful what you wish for...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11411,1,0,0,'essence DESI_SAY_SPEC'),(-1564060,'I\'ll be waiting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11413,1,0,0,'essence DESI_SAY_RECAP'),(-1564061,'I won\'t be far...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11414,1,0,0,'essence DESI_SAY_AFTER'),(-1564062,'Beware: I live!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11399,1,0,0,'essence ANGER_SAY_FREED'),(-1564063,'So... foolish.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11400,1,0,0,'essence ANGER_SAY_FREED2'),(-1564064,'<maniacal cackle>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11401,1,0,0,'essence ANGER_SAY_SLAY1'),(-1564065,'Enough. No more.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11402,1,0,0,'essence ANGER_SAY_SLAY2'),(-1564066,'On your knees!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11403,1,0,0,'essence ANGER_SAY_SPEC'),(-1564067,'Beware, coward.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11405,1,0,0,'essence ANGER_SAY_BEFORE'),(-1564068,'I won\'t... be... ignored.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11404,1,0,0,'essence ANGER_SAY_DEATH'),(-1564069,'You wish to test me?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11524,1,0,0,'council vera AGGRO'),(-1564070,'I have better things to do...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11422,1,0,0,'council gath AGGRO'),(-1564071,'Flee or die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11482,1,0,0,'council mala AGGRO'),(-1564072,'Common... such a crude language. Bandal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11440,1,0,0,'council zere AGGRO'),(-1564073,'Enough games!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11428,1,0,0,'council gath ENRAGE'),(-1564074,'You wish to kill me? Hahaha, you first!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11530,1,0,0,'council vera ENRAGE'),(-1564075,'For Quel\'Thalas! For the Sunwell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11488,1,0,0,'council mala ENRAGE'),(-1564076,'Sha\'amoor sine menoor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11446,1,0,0,'council zere ENRAGE'),(-1564077,'Enjoy your final moments!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11426,1,0,0,'council gath SPECIAL1'),(-1564078,'You\'re not caught up for this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11528,1,0,0,'council vera SPECIAL1'),(-1564079,'No second chances!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11486,1,0,0,'council mala SPECIAL1'),(-1564080,'Diel fin\'al',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11444,1,0,0,'council zere SPECIAL1'),(-1564081,'You are mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11427,1,0,0,'council gath SPECIAL2'),(-1564082,'Anar\'alah belore!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11529,1,0,0,'council vera SPECIAL2'),(-1564083,'I\'m full of surprises!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11487,1,0,0,'council mala SPECIAL2'),(-1564084,'Sha\'amoor ara mashal?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11445,1,0,0,'council zere SPECIAL2'),(-1564085,'Selama am\'oronor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11423,1,0,0,'council gath SLAY'),(-1564086,'Valiant effort!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11525,1,0,0,'council vera SLAY'),(-1564087,'My work is done.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11483,1,0,0,'council mala SLAY'),(-1564088,'Shorel\'aran.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11441,1,0,0,'council zere SLAY'),(-1564089,'Well done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11424,1,0,0,'council gath SLAY_COMT'),(-1564090,'A glorious kill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11526,1,0,0,'council vera SLAY_COMT'),(-1564091,'As it should be!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11484,1,0,0,'council mala SLAY_COMT'),(-1564092,'Belesa menoor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11442,1,0,0,'council zere SLAY_COMT'),(-1564093,'Lord Illidan... I...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11425,1,0,0,'council gath DEATH'),(-1564094,'You got lucky!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11527,1,0,0,'council vera DEATH'),(-1564095,'Destiny... awaits.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11485,1,0,0,'council mala DEATH'),(-1564096,'Diel ma\'ahn... oreindel\'o',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11443,1,0,0,'council zere DEATH'),(-1564097,'Akama... your duplicity is hardly surprising. I should have slaughtered you and your malformed brethren long ago.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11463,1,0,0,'illidan SAY_CONVO_1'),(-1564098,'We\'ve come to end your reign, Illidan. My people and all of Outland shall be free!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11389,1,0,25,'illidan SAY_CONVO_2'),(-1564099,'Boldly said. But I remain unconvinced.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11464,1,0,396,'illidan SAY_CONVO_3'),(-1564100,'The time has come! The moment is at hand!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11380,1,0,22,'illidan SAY_CONVO_4'),(-1564101,'You are not prepared!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11466,1,0,406,'illidan SAY_CONVO_5'),(-1564102,'Is this it, mortals? Is this all the fury you can muster?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11476,1,0,0,'illidan SAY_CONVO_6'),(-1564103,'Their fury pales before mine, Illidan. We have some unsettled business between us.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11491,1,0,5,'illidan SAY_CONVO_7'),(-1564104,'Maiev... How is this even possible?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11477,1,0,1,'illidan SAY_CONVO_8'),(-1564105,'Ah... my long hunt is finally over. Today, Justice will be done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11492,1,0,15,'illidan SAY_CONVO_9'),(-1564106,'Feel the hatred of ten thousand years!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11470,1,0,0,'illidan SAY_CONVO_10'),(-1564107,'Ahh... It is finished. You are beaten.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11496,1,0,0,'illidan SAY_CONVO_11'),(-1564108,'You have won... Maiev...but the huntress... is nothing...without the hunt... you... are nothing... without me..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11478,1,0,65,'illidan SAY_CONVO_12'),(-1564109,'He is right. I feel nothing... I am nothing...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11497,1,0,0,'illidan SAY_CONVO_13'),(-1564110,'Farewell, champions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11498,1,0,0,'illidan SAY_CONVO_14'),(-1564111,'The Light will fill these dismal halls once again. I swear it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11387,1,0,0,'illidan SAY_CONVO_15'),(-1564112,'I can feel your hatred.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11467,1,0,0,'illidan SAY_TAUNT_1'),(-1564113,'Give in to your fear!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11468,1,0,0,'illidan SAY_TAUNT_2'),(-1564114,'You know nothing of power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11469,1,0,0,'illidan SAY_TAUNT_3'),(-1564115,'Such... arrogance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11471,1,0,0,'illidan SAY_TAUNT_4'),(-1564116,'That is for Naisha!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11493,1,0,0,'illidan SAY_MAIEV_TAUNT_1'),(-1564117,'Bleed as I have bled!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11494,1,0,0,'illidan SAY_MAIEV_TAUNT_2'),(-1564118,'There shall be no prison for you this time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11495,1,0,0,'illidan SAY_MAIEV_TAUNT_3'),(-1564119,'Meet your end, demon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11500,1,0,0,'illidan SAY_MAIEV_TAUNT_4'),(-1564120,'Be wary friends, The Betrayer meditates in the court just beyond.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11388,1,0,0,'illidan SAY_AKAMA_BEWARE'),(-1564121,'Come, my minions. Deal with this traitor as he deserves!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11465,1,0,0,'illidan SAY_AKAMA_MINION'),(-1564122,'I\'ll deal with these mongrels. Strike now, friends! Strike at the betrayer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11390,1,0,0,'illidan SAY_AKAMA_LEAVE'),(-1564123,'Who shall be next to taste my blades?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11473,1,0,0,'illidan SAY_KILL1'),(-1564124,'This is too easy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11472,1,0,0,'illidan SAY_KILL2'),(-1564125,'I will not be touched by rabble such as you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11479,1,0,254,'illidan SAY_TAKEOFF'),(-1564126,'Behold the flames of Azzinoth!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11480,1,0,0,'illidan SAY_SUMMONFLAMES'),(-1564127,'Stare into the eyes of the Betrayer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11481,1,0,0,'illidan SAY_EYE_BLAST'),(-1564128,'Behold the power... of the demon within!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11475,1,0,0,'illidan SAY_MORPH'),(-1564129,'You\'ve wasted too much time mortals, now you shall fall!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11474,1,0,0,'illidan SAY_ENRAGE'),(-1565000,'Gronn are the real power in outland.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11367,1,0,0,'maulgar SAY_AGGRO'),(-1565001,'You will not defeat the hand of Gruul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11368,1,0,0,'maulgar SAY_ENRAGE'),(-1565002,'You won\'t kill next one so easy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11369,1,0,0,'maulgar SAY_OGRE_DEATH1'),(-1565003,'Pah! Does not prove anything!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11370,1,0,0,'maulgar SAY_OGRE_DEATH2'),(-1565004,'I\'m not afraid of you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11371,1,0,0,'maulgar SAY_OGRE_DEATH3'),(-1565005,'Good, now you fight me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11372,1,0,0,'maulgar SAY_OGRE_DEATH4'),(-1565006,'You not so tough afterall!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11373,1,0,0,'maulgar SAY_SLAY1'),(-1565007,'Aha-ha ha ha!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11374,1,0,0,'maulgar SAY_SLAY2'),(-1565008,'Mulgar is king!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11375,1,0,0,'maulgar SAY_SLAY3'),(-1565009,'Gruul... will crush you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11376,1,0,0,'maulgar SAY_DEATH'),(-1565010,'Come... and die.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11355,1,0,0,'gruul SAY_AGGRO'),(-1565011,'Scurry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11356,1,0,0,'gruul SAY_SLAM1'),(-1565012,'No escape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11357,1,0,0,'gruul SAY_SLAM2'),(-1565013,'Stay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11358,1,0,0,'gruul SAY_SHATTER1'),(-1565014,'Beg... for life',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11359,1,0,0,'gruul SAY_SHATTER2'),(-1565015,'No more',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11360,1,0,0,'gruul SAY_SLAY1'),(-1565016,'Unworthy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11361,1,0,0,'gruul SAY_SLAY2'),(-1565017,'Die',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11362,1,0,0,'gruul SAY_SLAY3'),(-1565018,'Aaargh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11363,1,0,0,'gruul SAY_DEATH'),(-1565019,'grows in size!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'gruul EMOTE_GROW'),(-1568000,'Spirits of da wind be your doom!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12031,1,0,0,'janalai SAY_AGGRO'),(-1568001,'I burn ya now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12032,1,0,0,'janalai SAY_FIRE_BOMBS'),(-1568002,'Where ma hatcha? Get to work on dem eggs!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12033,1,0,0,'janalai SAY_SUMMON_HATCHER'),(-1568003,'I show you strength... in numbers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12034,1,0,0,'janalai SAY_ALL_EGGS'),(-1568004,'You done run outta time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12035,1,0,0,'janalai SAY_BERSERK'),(-1568005,'It all be over now, mon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12036,1,0,0,'janalai SAY_SLAY_1'),(-1568006,'Tazaga-choo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12037,1,0,0,'janalai SAY_SLAY_2'),(-1568007,'Zul\'jin... got a surprise for you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12038,1,0,0,'janalai SAY_DEATH'),(-1568008,'Come, strangers. The spirit of the dragonhawk hot be hungry for worthy souls.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12039,1,0,0,'janalai SAY_EVENT_STRANGERS'),(-1568009,'Come, friends. Your bodies gonna feed ma hatchlings, and your souls are going to feed me with power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12040,1,0,0,'janalai SAY_EVENT_FRIENDS'),(-1568010,'Get da move on, guards! It be killin\' time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12066,1,0,0,'nalorakk SAY_WAVE1_AGGRO'),(-1568011,'Guards, go already! Who you more afraid of, dem... or me?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12067,1,0,0,'nalorakk SAY_WAVE2_STAIR1'),(-1568012,'Ride now! Ride out dere and bring me back some heads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12068,1,0,0,'nalorakk SAY_WAVE3_STAIR2'),(-1568013,'I be losin\' me patience! Go on: make dem wish dey was never born!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12069,1,0,0,'nalorakk SAY_WAVE4_PLATFORM'),(-1568014,'What could be better than servin\' da bear spirit for eternity? Come closer now. Bring your souls to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12078,1,0,0,'nalorakk SAY_EVENT1_SACRIFICE'),(-1568015,'Don\'t be delayin\' your fate. Come to me now. I make your sacrifice quick.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12079,1,0,0,'nalorakk SAY_EVENT2_SACRIFICE'),(-1568016,'You be dead soon enough!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12070,1,0,0,'nalorakk SAY_AGGRO'),(-1568017,'I bring da pain!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12071,1,0,0,'nalorakk SAY_SURGE'),(-1568018,'You call on da beast, you gonna get more dan you bargain for!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12072,1,0,0,'nalorakk SAY_TOBEAR'),(-1568019,'Make way for Nalorakk!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12073,1,0,0,'nalorakk SAY_TOTROLL'),(-1568020,'You had your chance, now it be too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12074,1,0,0,'nalorakk SAY_BERSERK'),(-1568021,'Mua-ha-ha! Now whatchoo got to say?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12075,1,0,0,'nalorakk SAY_SLAY1'),(-1568022,'Da Amani gonna rule again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12076,1,0,0,'nalorakk SAY_SLAY2'),(-1568023,'I... be waitin\' on da udda side....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12077,1,0,0,'nalorakk SAY_DEATH'),(-1568024,'Da eagles gonna bear your spirits to me. Your sacrifice is not gonna be in vein!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12122,1,0,0,'akilzon SAY_EVENT1'),(-1568025,'Your death gonna be quick, strangers. You shoulda never have come to this place...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12123,1,0,0,'akilzon SAY_EVENT2'),(-1568026,'I be da predator! You da prey...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12013,1,0,0,'akilzon SAY_AGGRO'),(-1568027,'Feed, me bruddahs!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12014,1,0,0,'akilzon SAY_SUMMON'),(-1568028,'Come, and join me bruddahs!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12015,1,0,0,'akilzon SAY_SUMMON_ALT'),(-1568029,'All you be doing is wasting my time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12016,1,0,0,'akilzon SAY_ENRAGE'),(-1568030,'Ya got nothin\'!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12017,1,0,0,'akilzon SAY_SLAY1'),(-1568031,'Stop your cryin\'!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12018,1,0,0,'akilzon SAY_SLAY2'),(-1568032,'You can\'t... kill... me spirit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12019,1,0,0,'akilzon SAY_DEATH'),(-1568033,'An Electrical Storm Appears!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,0,0,'akilzon EMOTE_STORM'),(-1568034,'Get on ya knees and bow.... to da fang and claw!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12020,1,0,0,'halazzi SAY_AGGRO'),(-1568035,'I fight wit\' untamed spirit....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12021,1,0,0,'halazzi SAY_SPLIT'),(-1568036,'Spirit, come back to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12022,1,0,0,'halazzi SAY_MERGE'),(-1568037,'Me gonna carve ya now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12023,1,0,0,'halazzi SAY_SABERLASH1'),(-1568038,'You gonna leave in pieces!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12024,1,0,0,'halazzi SAY_SABERLASH2'),(-1568039,'Whatch you be doing? Pissin\' yourselves...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12025,1,0,0,'halazzi SAY_BERSERK'),(-1568040,'You cant fight the power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12026,1,0,0,'halazzi SAY_KILL1'),(-1568041,'You gonna fail!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12027,1,0,0,'halazzi SAY_KILL2'),(-1568042,'Chaga... choka\'jinn.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12028,1,0,0,'halazzi SAY_DEATH'),(-1568043,'Come, fools. Fill ma empty cages...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12029,1,0,0,'halazzi SAY_EVENT1'),(-1568044,'I be waitin, strangers. Your deaths gonna make me stronger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12030,1,0,0,'halazzi SAY_EVENT2'),(-1568045,'Da shadow gonna fall on you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12041,1,0,0,'malacrass SAY_AGGRO'),(-1568046,'Ya don\'t kill me yet, ya don\'t get another chance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12042,1,0,0,'malacrass SAY_ENRAGE'),(-1568047,'Dis a nightmare ya don\' wake up from!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12043,1,0,0,'malacrass SAY_KILL1'),(-1568048,'Azzaga choogo zinn!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12044,1,0,0,'malacrass SAY_KILL2'),(-1568049,'Your will belong ta me now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12045,1,0,0,'malacrass SAY_SOUL_SIPHON'),(-1568050,'Darkness comin\' for you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12046,1,0,0,'malacrass SAY_DRAIN_POWER'),(-1568051,'Your soul gonna bleed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12047,1,0,0,'malacrass SAY_SPIRIT_BOLTS'),(-1568052,'It not gonna make no difference.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12048,1,0,0,'malacrass SAY_ADD_DIED1'),(-1568053,'You gonna die worse dan him.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12049,1,0,0,'malacrass SAY_ADD_DIED2'),(-1568054,'Dat no bodda me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12050,1,0,0,'malacrass SAY_ADD_DIED3'),(-1568055,'Dis not... da end of me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12051,1,0,0,'malacrass SAY_DEATH'),(-1568056,'Everybody always wanna take from us. Now we gonna start takin\' back. Anybody who get in our way...gonna drown in dey own blood! Da Amani empire be back now...seekin\' vengeance. And we gonna start wit\' you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12090,1,0,0,'zuljin SAY_INTRO'),(-1568057,'Nobody badduh dan me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12091,1,0,0,'zuljin SAY_AGGRO'),(-1568058,'Got me some new tricks... like me brudda bear....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12092,1,0,0,'zuljin SAY_BEAR_TRANSFORM'),(-1568059,'Dere be no hidin\' from da eagle!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12093,1,0,0,'zuljin SAY_EAGLE_TRANSFORM'),(-1568060,'Let me introduce you to me new bruddas: fang and claw!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12094,1,0,0,'zuljin SAY_LYNX_TRANSFORM'),(-1568061,'Ya don\' have to look to da sky to see da dragonhawk!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12095,1,0,0,'zuljin SAY_DRAGONHAWK_TRANSFORM'),(-1568062,'Fire kill you just as quick!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12096,1,0,0,'zuljin SAY_FIRE_BREATH'),(-1568063,'You too slow! Me too strong!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12097,1,0,0,'zuljin SAY_BERSERK'),(-1568064,'Da Amani de chuka!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12098,1,0,0,'zuljin SAY_KILL1'),(-1568065,'Lot more gonna fall like you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12099,1,0,0,'zuljin SAY_KILL2'),(-1568066,'Mebbe me fall...but da Amani empire...never gonna die...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12100,1,0,0,'zuljin SAY_DEATH'),(-1568067,'Zul\'jin got a surprise for ya...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12052,1,0,0,'zulaman SAY_INST_RELEASE'),(-1568068,'Da spirits gonna feast today! Begin da ceremonies, sacrifice da prisoners... make room for our new guests!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12053,1,0,0,'zulaman SAY_INST_BEGIN'),(-1568069,'Take your pick, trespassers! Any of ma priests be happy to accommodate ya.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12054,1,0,0,'zulaman SAY_INST_PROGRESS_1'),(-1568070,'Don\'t be shy. Thousands have come before you. Ya not be alone in your service.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12055,1,0,0,'zulaman SAY_INST_PROGRESS_2'),(-1568071,'Ya gonna fail, strangers. Many try before you, but dey only make us stronger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12056,1,0,0,'zulaman SAY_INST_PROGRESS_3'),(-1568072,'Your efforts was in vain, trespassers. The rituals nearly be complete.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12057,1,0,0,'zulaman SAY_INST_WARN_1'),(-1568073,'Soon da cages gonna be empty, da sacrifices be complete, and you gonna take dere places.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12058,1,0,0,'zulaman SAY_INST_WARN_2'),(-1568074,'Time be running low, strangers. Soon you gonna join da souls of dem ya failed to save.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12059,1,0,0,'zulaman SAY_INST_WARN_3'),(-1568075,'Make haste, ma priests! Da rituals must not be interrupted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12060,1,0,0,'zulaman SAY_INST_WARN_4'),(-1568076,'Ya make a good try... but now you gonna join da ones who already fall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12061,1,0,0,'zulaman SAY_INST_SACRIF1'),(-1568077,'Ya not do too bad. Ya efforts [...] for a small time. Come to me now. Ya prove yourself worthy offerings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12062,1,0,0,'zulaman SAY_INST_SACRIF2'),(-1568078,'Watch now. Every offering gonna strengthen our ties to da spirit world. Soon, we gonna be unstoppable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12065,1,0,0,'zulaman SAY_INST_COMPLETE'),(-1568079,'Suit yourself. At least five of you must assist me if we\'re to get inside. Follow me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'harrison SAY_START'),(-1568080,'According to my calculations, if enough of us bang the gong at once the seal on these doors will break and we can enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'harrison SAY_AT_GONG'),(-1568081,'I\'ve researched this site extensively and i won\'t allow any dim-witted treasure hunters to swoop in and steal what belongs to in a museum. I\'ll lead this charge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'harrison SAY_OPEN_ENTRANCE'),(-1580000,'Aggh! No longer will I be a slave to Malygos! Challenge me and you will be destroyed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12422,1,0,0,'kalecgos SAY_EVIL_AGGRO'),(-1580001,'I will purge you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12423,1,0,0,'kalecgos SAY_EVIL_SPELL1'),(-1580002,'Your pain has only begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12424,1,0,0,'kalecgos SAY_EVIL_SPELL2'),(-1580003,'In the name of Kil\'jaeden!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12425,1,0,0,'kalecgos SAY_EVIL_SLAY1'),(-1580004,'You were warned!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12426,1,0,0,'kalecgos SAY_EVIL_SLAY2'),(-1580005,'My awakening is complete! You shall all perish!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12427,1,0,0,'kalecgos SAY_EVIL_ENRAGE'),(-1580006,'I need... your help... Cannot... resist him... much longer...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12428,1,0,0,'kalecgos humanoid SAY_GOOD_AGGRO'),(-1580007,'Aaahhh! Help me, before I lose my mind!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12429,1,0,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH'),(-1580008,'Hurry! There is not much of me left!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12430,1,0,0,'kalecgos humanoid SAY_GOOD_NEAR_DEATH2'),(-1580009,'I am forever in your debt. Once we have triumphed over Kil\'jaeden, this entire world will be in your debt as well.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12431,1,0,0,'kalecgos humanoid SAY_GOOD_PLRWIN'),(-1580010,'There will be no reprieve. My work here is nearly finished.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12451,1,0,0,'sathrovarr SAY_SATH_AGGRO'),(-1580011,'I\'m... never on... the losing... side...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12452,1,0,0,'sathrovarr SAY_SATH_DEATH'),(-1580012,'Your misery is my delight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12453,1,0,0,'sathrovarr SAY_SATH_SPELL1'),(-1580013,'I will watch you bleed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12454,1,0,0,'sathrovarr SAY_SATH_SPELL2'),(-1580014,'Pitious mortal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12455,1,0,0,'sathrovarr SAY_SATH_SLAY1'),(-1580015,'Haven\'t you heard? I always win!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12456,1,0,0,'sathrovarr SAY_SATH_SLAY2'),(-1580016,'I have toyed with you long enough!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12457,1,0,0,'sathrovarr SAY_SATH_ENRAGE'),(-1580017,'Puny lizard! Death is the only answer you\'ll find here!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12458,1,0,0,'brutallus YELL_INTRO'),(-1580018,'Grah! Your magic is weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12459,1,0,0,'brutallus YELL_INTRO_BREAK_ICE'),(-1580019,'I will crush you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12460,1,0,0,'brutallus YELL_INTRO_CHARGE'),(-1580020,'That was fun.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12461,1,0,0,'brutallus YELL_INTRO_KILL_MADRIGOSA'),(-1580021,'Come, try your luck!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12462,1,0,0,'brutallus YELL_INTRO_TAUNT'),(-1580022,'Ahh! More lambs to the slaughter!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12463,1,0,0,'brutallus YELL_AGGRO'),(-1580023,'Perish, insect!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12464,1,0,0,'brutallus YELL_KILL1'),(-1580024,'You are meat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12465,1,0,0,'brutallus YELL_KILL2'),(-1580025,'Too easy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12466,1,0,0,'brutallus YELL_KILL3'),(-1580026,'Bring the fight to me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12467,1,0,0,'brutallus YELL_LOVE1'),(-1580027,'Another day, another glorious battle!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12468,1,0,0,'brutallus YELL_LOVE2'),(-1580028,'I live for this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12469,1,0,0,'brutallus YELL_LOVE3'),(-1580029,'So much for a real challenge... Die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12470,1,0,0,'brutallus YELL_BERSERK'),(-1580030,'Gah! Well done... Now... this gets... interesting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12471,1,0,0,'brutallus YELL_DEATH'),(-1580031,'Hold, friends! There is information to be had before this devil meets his fate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12472,1,0,0,'madrigosa YELL_MADR_ICE_BARRIER'),(-1580032,'Where is Anveena, demon? What has become of Kalec?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12473,1,0,0,'madrigosa YELL_MADR_INTRO'),(-1580033,'You will tell me where they are!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12474,1,0,0,'madrigosa YELL_MADR_ICE_BLOCK'),(-1580034,'Speak, I grow weary of asking!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12475,1,0,0,'madrigosa YELL_MADR_TRAP'),(-1580035,'Malygos, my lord! I did my best!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12476,1,0,0,'madrigosa YELL_MADR_DEATH'),(-1585000,'You only waste my time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12378,1,0,0,'selin SAY_AGGRO'),(-1585001,'My hunger knows no bounds!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12381,1,0,0,'selin SAY_ENERGY'),(-1585002,'Yes! I am a god!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12382,1,0,0,'selin SAY_EMPOWERED'),(-1585003,'Enough distractions!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12388,1,0,0,'selin SAY_KILL_1'),(-1585004,'I am invincible!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12385,1,0,0,'selin SAY_KILL_2'),(-1585005,'No! More... I must have more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12383,1,0,0,'selin SAY_DEATH'),(-1585006,'begins to channel from the nearby Fel Crystal...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'selin EMOTE_CRYSTAL'),(-1585007,'Drain...life!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12389,1,0,0,'vexallus SAY_AGGRO'),(-1585008,'Un...con...tainable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12392,1,0,0,'vexallus SAY_ENERGY'),(-1585009,'Un...leash...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12390,1,0,0,'vexallus SAY_OVERLOAD'),(-1585010,'Con...sume.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12393,1,0,0,'vexallus SAY_KILL'),(-1585011,'discharges pure energy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'vexallus EMOTE_DISCHARGE_ENERGY'),(-1585012,'Annihilate them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12395,1,0,0,'delrissa SAY_AGGRO'),(-1585013,'Oh, the horror.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12398,1,0,0,'delrissa LackeyDeath1'),(-1585014,'Well, aren\'t you lucky?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12400,1,0,0,'delrissa LackeyDeath2'),(-1585015,'Now I\'m getting annoyed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12401,1,0,0,'delrissa LackeyDeath3'),(-1585016,'Lackies be damned! I\'ll finish you myself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12403,1,0,0,'delrissa LackeyDeath4'),(-1585017,'I call that a good start.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12405,1,0,0,'delrissa PlayerDeath1'),(-1585018,'I could have sworn there were more of you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12407,1,0,0,'delrissa PlayerDeath2'),(-1585019,'Not really much of a group, anymore, is it?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12409,1,0,0,'delrissa PlayerDeath3'),(-1585020,'One is such a lonely number.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12410,1,0,0,'delrissa PlayerDeath4'),(-1585021,'It\'s been a kick, really.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12411,1,0,0,'delrissa PlayerDeath5'),(-1585022,'Not what I had... planned...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12397,1,0,0,'delrissa SAY_DEATH'),(-1585023,'Don\'t look so smug! I know what you\'re thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Oh no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this, and this time, you will not interfere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12413,1,0,0,'kaelthas MT SAY_AGGRO'),(-1585024,'Vengeance burns!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12415,1,0,0,'kaelthas MT SAY_PHOENIX'),(-1585025,'Felomin ashal!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12417,1,0,0,'kaelthas MT SAY_FLAMESTRIKE'),(-1585026,'I\'ll turn your world... upside... down...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12418,1,0,0,'kaelthas MT SAY_GRAVITY_LAPSE'),(-1585027,'Master... grant me strength.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12419,1,0,0,'kaelthas MT SAY_TIRED'),(-1585028,'Do not... get too comfortable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12420,1,0,0,'kaelthas MT SAY_RECAST_GRAVITY'),(-1585029,'My demise accomplishes nothing! The Master will have you! You will drown in your own blood! This world shall burn! Aaaghh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12421,1,0,0,'kaelthas MT SAY_DEATH'),(-1999900,'Let the games begin.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8280,1,0,0,'example_creature SAY_AGGRO'),(-1999901,'I see endless suffering. I see torment. I see rage. I see everything.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8831,1,0,0,'example_creature SAY_RANDOM_0'),(-1999902,'Muahahahaha',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8818,1,0,0,'example_creature SAY_RANDOM_1'),(-1999903,'These mortal infedels my lord, they have invaded your sanctum and seek to steal your secrets.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8041,1,0,0,'example_creature SAY_RANDOM_2'),(-1999904,'You are already dead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8581,1,0,0,'example_creature SAY_RANDOM_3'),(-1999905,'Where to go? What to do? So many choices that all end in pain, end in death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8791,1,0,0,'example_creature SAY_RANDOM_4'),(-1999906,'$N, I sentance you to death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8588,1,0,0,'example_creature SAY_BESERK'),(-1999907,'The suffering has just begun!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'example_creature SAY_PHASE'),(-1999908,'I always thought I was a good dancer.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_creature SAY_DANCE'),(-1999909,'Move out Soldier!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_creature SAY_SALUTE'),(-1999910,'Help $N! I\'m under attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_AGGRO1'),(-1999911,'Die scum!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_AGGRO2'),(-1999912,'Hmm a nice day for a walk alright',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_WP_1'),(-1999913,'Wild Felboar attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_WP_2'),(-1999914,'Time for me to go! See ya around $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,3,'example_escort SAY_WP_3'),(-1999915,'Bye Bye!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,3,'example_escort SAY_WP_4'),(-1999916,'How dare you leave me like that! I hate you! =*(',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'example_escort SAY_DEATH_1'),(-1999917,'...no...how could you let me die $N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_DEATH_2'),(-1999918,'ugh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_DEATH_3'),(-1999919,'Taste death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_SPELL'),(-1999920,'Fireworks!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_RAND_1'),(-1999921,'Hmm, I think I could use a buff.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_escort SAY_RAND_2'),(-1999922,'Normal select, guess you\'re not interested.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_gossip_codebox SAY_NOT_INTERESTED'),(-1999923,'Wrong!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_gossip_codebox SAY_WRONG'),(-1999924,'You\'re right, you are allowed to see my inner secrets.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_gossip_codebox SAY_CORRECT'),(-1999925,'Hi!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'example_areatrigger SAY_HI'),(-1999827,'Hi!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14432,0,0,0,'at_test SAY_HELLO'),(-1999999,'Archavon the Stone Watcher lunges for $N!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'archavon SAY_LEAP'),(-1999998,'We\'ll see about that, young prince.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13409,0,0,0,'epoch SAY_AGGRO'),(-1999997,'Tick tock, tick tock...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13410,0,0,0,'epoch SAY_TIME_WARP_1'),(-1999996,'Not quick enough!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13411,0,0,0,'epoch SAY_TIME_WARP_2'),(-1999995,'Let\'s get this over with. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13412,0,0,0,'epoch SAY_TIME_WARP_3'),(-1999994,'There is no future for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13413,0,0,0,'epoch SAY_SLAY_1'),(-1999993,'This is the hour of our greatest triumph!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13414,0,0,0,'epoch SAY_SLAY_2'),(-1999992,'You would destined to fail. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13415,0,0,0,'epoch SAY_SLAY_3'),(-1999991,'Prince Arthas Menethil, on this day, a powerful darkness has taken hold of your soul. The death you are destined to visit upon others will this day be your own.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13408,0,0,0,'epoch SAY_INTRO'),(-1999990,'*gurgles*',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13416,0,0,0,'epoch SAY_DEATH'),(-1999989,'These are sacred halls, your intrusion will be met with death',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14343,0,0,0,'jedoga SAY_AGGRO'),(-1999988,'Who among you is devoted',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14344,0,0,0,'jedoga SAY_C_SACRIFICE_1'),(-1999987,'You there! Step foward',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14345,0,0,0,'jedoga SAY_C_SACRIFICE_2'),(-1999986,'Yogg-Saron, grant me your power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14346,0,0,0,'jedoga SAY_SACRIFICE_1'),(-1999985,'Master, a gift for you! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14347,0,0,0,'jedoga SAY_SACRIFICE_2'),(-1999984,'Glory to the Yogg-Saron!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14348,0,0,0,'jedoga SAY_SLAY_1'),(-1999983,'You are unworthy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14349,0,0,0,'jedoga SAY_SLAY_2'),(-1999982,'Get up! You have\'t suffered enough',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14350,0,0,0,'jedoga SAY_SLAY_3'),(-1999981,'Do not expect your sacrilege... to go unpunished. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14351,0,0,0,'jedoga SAY_DEATH'),(-1999980,'The elements themselves will rise up against the civilized world! Only the faithful will be spared!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14352,0,0,0,'jedoga SAY_PREACHING_1'),(-1999979,'Immortality can be yours. But only if you pledge yourself fully to Yogg-Saron!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14353,0,0,0,'jedoga SAY_PREACHING_2'),(-1999978,'Here on the very borders of his domain. You will expirience powers you would never have imagined!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14354,0,0,0,'jedoga SAY_PREACHING_3'),(-1999977,'You have traveled long and risked much to be here. Your devotion shall be rewarded.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14355,0,0,0,'jedoga SAY_PREACHING_4'),(-1999976,'The faithful shall be exalted! But there is more work to be done. We will press on until all of Azeroth lies beneath his shadow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14356,0,0,0,'jedoga SAY_PREACHING_5'),(-1999975,'The secrets of the deep shall remain hidden.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14033,0,0,0,'nadox SAY_AGGRO'),(-1999974,'Sleep now it the cold dark.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14036,0,0,0,'nadox SAY_SLAY_1'),(-1999973,'For the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14037,0,0,0,'nadox SAY_SLAY_2'),(-1999972,'Perhaps we will be allies soon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14038,0,0,0,'nadox SAY_SLAY_3'),(-1999971,'Master! Is my service ... complete?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14039,0,0,0,'nadox SAY_DEATH'),(-1999970,'The jung must not go hungry.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14034,0,0,0,'nadox SAY_EGG_SAC_1'),(-1999969,'????? ?????',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14035,0,0,0,'nadox SAY_EGG_SAC_2'),(-1999968,'I will feast on your remains.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14360,0,0,0,'taldaram SAY_AGGRO'),(-1999967,'(Elfish)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14365,0,0,0,'taldaram SAY_SLAY_1'),(-1999966,'I will drink no blood before it is time.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14366,0,0,0,'taldaram SAY_SLAY_2'),(-1999965,'One final embrace.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14367,0,0,0,'taldaram SAY_SLAY_3'),(-1999964,'Still ... I hunger, still ... I thirst...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14368,0,0,0,'taldaram SAY_DEATH'),(-1999963,'Your heartbeat is music to my ears.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14361,0,0,0,'taldaram SAY_VANISH_1'),(-1999962,'I am nowhere, I am everywhere, I am the watcher unseen.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14362,0,0,0,'taldaram SAY_VANISH_2'),(-1999961,'So appetizing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14363,0,0,0,'taldaram SAY_FEED_1'),(-1999960,'Fresh warm blood ... ah it has been too long.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14364,0,0,0,'taldaram SAY_FEED_2'),(-1999959,'???  ???  ???',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14043,0,0,0,'volazj SAY_AGGRO'),(-1999958,'?!? ?!? ?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14045,0,0,0,'volazj SAY_SLAY_1'),(-1999957,'?!? !?! ?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14046,0,0,0,'volazj SAY_SLAY_2'),(-1999956,'!?! !?! !?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14047,0,0,0,'volazj SAY_SLAY_3'),(-1999955,'... ! ...? ... ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14048,0,0,0,'volazj SAY_DEATH_1'),(-1999954,'... ...! ...? ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14049,0,0,0,'volazj SAY_DEATH_2'),(-1999953,'Phasing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14044,0,0,0,'volazj SAY_PHASE'),(-1999952,'Eternal agony awaits you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14054,0,0,0,'anub_arak SAY_AGGRO'),(-1999951,'You shall expirience my torment first hand.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14055,0,0,0,'anub_arak SAY_SLAY_1'),(-1999950,'You have made you choice.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14056,0,0,0,'anub_arak SAY_SLAY_2'),(-1999949,'Soon the masters voice will call to you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14057,0,0,0,'anub_arak SAY_SLAY_3'),(-1999948,'Awhaaa, ... never thought ... I will be .. free of him',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14069,0,0,0,'anub_arak SAY_DEATH'),(-1999947,'Your armor is useless against my locust',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14060,0,0,0,'anub_arak SAY_LOCUST_1'),(-1999946,'?!!??!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14067,0,0,0,'anub_arak SAY_LOCUST_2'),(-1999945,'The pestilence upon you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14068,0,0,0,'anub_arak SAY_LOCUST_3'),(-1999943,'!!!???!!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14058,0,0,0,'anub_arak SAY_SUBMERGE_1'),(-1999942,'Come forth my brethren, feast on their flesh.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14059,0,0,0,'anub_arak SAY_SUBMERGE_2'),(-1999941,'I was king of this empire long ago, in life I stood as champion in death I return as conqueror. Now I protect the kingdom once more, ironic yes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14053,0,0,0,'anub_arak SAY_INTRO'),(-1999940,'This kingdom belongs to the Scourge, only the dead may enter.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14075,0,0,0,'krik_thir SAY_AGGRO'),(-1999939,'Hash\'tak hi\'tak.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14076,0,0,0,'krik_thir SAY_SLAY_1'),(-1999938,'You were foolish to come.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14077,0,0,0,'krik_thir SAY_SLAY_2'),(-1999937,'As Anub\'arak commands.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14078,0,0,0,'krik_thir SAY_SLAY_3'),(-1999936,'I ... should be grateful ... ,but I long ago lost the capacity.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14087,0,0,0,'krik_thir SAY_DEATH'),(-1999935,'They hunger.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14085,0,0,0,'krik_thir SAY_SWARM_1'),(-1999934,'Dina\'theim my pets.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14086,0,0,0,'krik_thir SAY_SWARM_2'),(-1999933,'We are besiged! Stike out and bring back their corpses.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14079,0,0,0,'krik_thir SAY_SEND_GROUP_1'),(-1999932,'We must hold the gate. Attack! Tear them limb from limb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14080,0,0,0,'krik_thir SAY_SEND_GROUP_2'),(-1999931,'The gate must be protected at all costs. Rip them to shreds.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14081,0,0,0,'krik_thir SAY_SEND_GROUP_3'),(-1999930,'Keep an eye on that tunell, we must not let anyone through.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14082,0,0,0,'krik_thir SAY_PREFIGHT_1'),(-1999929,'I hear footsteps. Be on your gard!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14083,0,0,0,'krik_thir SAY_PREFIGHT_2'),(-1999928,'I sense the living. Be ready!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14084,0,0,0,'krik_thir SAY_PREFIGHT_3'),(-1999927,'Yes...this is the beginning...I\'ve been waiting for you...young prince...I...am Mal\'Ganis..',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14410,0,0,0,'mal_ganis SAY_INTRO_1'),(-1999926,'As you can see, your people...are now mine. I will now turn this city, household by household, until the flame of life has been snuffed out...forever...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14411,0,0,0,'mal_ganis SAY_INTRO_2'),(-1999899,'You only advance... the master\'s plan...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13483,0,0,0,'salramm SAY_DEATH'),(-1999898,'BOOM! Hahahahah...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13478,0,0,0,'salramm SAY_EXPLODE_GHOUL_1'),(-1999897,'Blood... destruction... EXHILARATING! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13479,0,0,0,'salramm SAY_EXPLODE_GHOUL_2'),(-1999896,'I want a sample...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13480,0,0,0,'salramm SAY_STEAL_FLESH_1'),(-1999895,'Such strength... it must be mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13481,0,0,0,'salramm SAY_STEAL_FLESH_2'),(-1999894,'Your flesh betrays you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13482,0,0,0,'salramm SAY_STEAL_FLESH_3'),(-1999893,'Say hello to some friends of mine.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13476,0,0,0,'salramm SAY_SUMMON_GHOULS_1'),(-1999892,'Come, citizen of Stratholme! Meet your saviors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13477,0,0,0,'salramm SAY_SUMMON_GHOULS_2'),(-1999891,'The chill you feel is the herald of your doom.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13173,0,0,0,'novos SAY_AGGRO'),(-1999890,'Such is the faith of all who oppose the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13175,0,0,0,'novos SAY_KILL'),(-1999889,'Come, citizen of Stratholme! Meet your saviors.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13174,0,0,0,'novos SAY_DEATH'),(-1999888,'Surely you can see that you tilted of it old...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13177,0,0,0,'novos SAY_REBUBLE_1'),(-1999887,'Just GIVE UP and DIE already!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13178,0,0,0,'novos SAY_REBUBLE_2'),(-1999886,'Bolster my defences. Hurry, curse you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13176,0,0,0,'novos SAY_NECRO_ADD'),(-1999885,'It is my charge to wathc over these eggs, I will see you burn before any harm comes to them.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14093,0,0,0,'sartharion SAY_SARTHARION_AGGRO'),(-1999884,'This ... ends NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14103,0,0,0,'sartharion SAY_SARTHARION_BERSERK'),(-1999883,'BURN! You miserable wretches!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14098,0,0,0,'sartharion SAY_SARTHARION_BREATH'),(-1999882,'Shadron! Come to me, all is at risk.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14105,0,0,0,'sartharion SARTHARION_CALL_SHADRON'),(-1999881,'Tenebron! The eggs are your to protect as well.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14106,0,0,0,'sartharion SAY_SARTHARION_CALL_TENEBRON'),(-1999880,'Vesperon! The ... is in danger, assist me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14104,0,0,0,'sartharion SAY_SARTHARION_CALL_VESPERON'),(-1999879,'Such ... is the price of failure.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14107,0,0,0,'sartharion SAY_SARTHARION_DEATH'),(-1999878,'Such flamable little insects!.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14099,0,0,0,'sartharion SAY_SARTHARION_SPECIAL_1'),(-1999877,'Your chart bones will litter the floor.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14100,0,0,0,'sartharion SAY_SARTHARION_SPECIAL_2'),(-1999876,'How much heat can you take?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14101,0,0,0,'sartharion SAY_SARTHARION_SPECIAL_3'),(-1999875,'ALL will be reduced to ash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14102,0,0,0,'sartharion SAY_SARTHARION_SPECIAL_4'),(-1999874,'You will make a fine meal for the hatchlings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14094,0,0,0,'sartharion SAY_SARTHARION_SLAY_1'),(-1999873,'You are the grave disadvantage.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14096,0,0,0,'sartharion SAY_SARTHARION_SLAY_2'),(-1999872,'This is why we call you lesser beeings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14097,0,0,0,'sartharion SAY_SARTHARION_SLAY_3'),(-1999871,'You pose no threat lesser beeings! Give me your worst.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14133,0,0,0,'vesperon SAY_VESPERON_AGGRO'),(-1999870,'The least you could do is put up a fight.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14134,0,0,0,'vesperon SAY_VESPERON_SLAY_1'),(-1999869,'*laugh* Was that the best you can do?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14135,0,0,0,'vesperon SAY_VESPERON_SLAY_2'),(-1999868,'I still have .. some fight .. in .. me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14140,0,0,0,'vesperon SAY_VESPERON_DEATH'),(-1999867,'I will pick my teeth with your bones.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14136,0,0,0,'vesperon SAY_VESPERON_BREATH'),(-1999866,'Father was right about you Sartharion you ARE a weakling!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14139,0,0,0,'vesperon SAY_VESPERON_RESPOND'),(-1999865,'Aren\'t you tricky! I have a few tricks of my own.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14137,0,0,0,'vesperon SAY_VESPERON_SPECIAL_1'),(-1999864,'Unlike you I have many talents.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14138,0,0,0,'vesperon SAY_VESPERON_SPECIAL_2'),(-1999863,'I fear NOTHING! Least of all you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14111,0,0,0,'shadron SAY_SHADRON_AGGRO'),(-1999862,'You are insignificant!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14112,0,0,0,'shadron SAY_SHADRON_SLAY_1'),(-1999861,'Such mediocre resistance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14113,0,0,0,'shadron SAY_SHADRON_SLAY_2'),(-1999860,'The chill you feel is the herald of your doom.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14118,0,0,0,'shadron SAY_SHADRON_DEATH'),(-1999859,'You are easily \"bested\".',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14114,0,0,0,'shadron SAY_SHADRON_BREATH'),(-1999858,'I will take pity on you Sartharion, just this once.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14117,0,0,0,'shadron SAY_SHADRON_RESPOND'),(-1999857,'Father tought me well.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14115,0,0,0,'shadron SAY_SHADRON_SPECIAL_1'),(-1999856,'On your KNEES!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14116,0,0,0,'shadron SAY_SHADRON_SPECIAL_2'),(-1999855,'You have no place here. You\'re is among the departed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14122,0,0,0,'tenebron SAY_TENEBRON_AGGRO'),(-1999854,'No contest.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14123,0,0,0,'tenebron SAY_TENEBRON_SLAY_1'),(-1999853,'Typical! Just as I was having fun.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14124,0,0,0,'tenebron SAY_TENEBRON_SLAY_2'),(-1999852,'I should .. have .. hold back.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14129,0,0,0,'tenebron SAY_TENEBRON_DEATH'),(-1999851,'To darkness I condemn you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14125,0,0,0,'tenebron SAY_TENEBRON_BREATH'),(-1999850,'It is amusing to watch you struggle... Very well witness how it is done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14128,0,0,0,'tenebron SAY_TENEBRON_RESPOND'),(-1999849,'Arrogant little creatures to challenge powers you do not yet understand.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14126,0,0,0,'tenebron SAY_TENEBRON_SPECIAL_1'),(-1999848,'I am no mere dragon. You will find that I am much, much more.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14127,0,0,0,'tenebron SAY_TENEBRON_SPECIAL_2'),(-1999847,'Mogas moblath moghuld!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13181,0,0,0,'trollgore SAY_AGGRO'),(-1999846,'... I will eat you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13185,0,0,0,'trollgore SAY_KILL'),(-1999845,'... .. so hungry, .. ... must\'t feed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13182,0,0,0,'trollgore SAY_CONSUME'),(-1999844,'*laugh*',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13184,0,0,0,'trollgore SAY_EXPLODE'),(-1999843,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13183,0,0,0,'trollgore SAY_DEATH'),(-1999842,'I\'m gonna spil your guts, man!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14430,0,0,0,'gal_darah SAY_AGGRO'),(-1999841,'What a rush.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14436,0,0,0,'gal_darah SAY_SLAY_1'),(-1999840,'Who needs gods, when we ARE gods!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14437,0,0,0,'gal_darah SAY_SLAY_2'),(-1999839,'I told ya so ...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14438,0,0,0,'gal_darah SAY_SLAY_3'),(-1999838,'Even the mighty ... can .. fall.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14439,0,0,0,'gal_darah SAY_DEATH'),(-1999837,'God damn! Impale them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14433,0,0,0,'gal_darah SAY_SUMMON_RHINO_1'),(-1999836,'Kill them ALL!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14434,0,0,0,'gal_darah SAY_SUMMON_RHINO_2'),(-1999835,'Say hello to my BIG friend.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14435,0,0,0,'gal_darah SAY_SUMMON_RHINO_3'),(-1999834,'Ain\'t gonna bee nothig left after this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14431,0,0,0,'gal_darah SAY_TRANSFORM_1'),(-1999833,'You wanna see POWER? I\'m gonna show you POWER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14432,0,0,0,'gal_darah SAY_TRANSFORM_2'),(-1999826,'Drak\'thari gonna kill anybody who trespass on this lands.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14443,0,0,0,'slad_ran SAY_AGGRO'),(-1999825,'Can not breath then, good ...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14446,0,0,0,'slad_ran SAY_SLAY_1'),(-1999824,'You\'re scared now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14447,0,0,0,'slad_ran SAY_SLAY_2'),(-1999823,'I eat you next man!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14448,0,0,0,'slad_ran SAY_SLAY_3'),(-1999822,'I ... see now. Scourge was not tha greatest enemy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14449,0,0,0,'slad_ran SAY_DEATH'),(-1999821,'Minions of this ... heed my call.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14444,0,0,0,'slad_ran SAY_SUMMON_SNAKES'),(-1999820,'A thousand fangs gonna rim yar flesh.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14445,0,0,0,'slad_ran SAY_SUMMON_CONSTRICTORS'),(-1999819,'I will teach you IGNORANT children just how little you know of magic...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14524,0,0,0,'malygos SAY_ANTI_MAGIC_SHELL'),(-1999818,'YOU WILL NOT SUCCEED WHILE I DRAW BREATH!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14518,0,0,0,'malygos SAY_BREATH_ATTACK'),(-1999817,'I AM UNSTOPPABLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14533,0,0,0,'malygos SAY_HIGH_DAMAGE_MODE'),(-1999816,'Watch helplessly as your hopes are swept away...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14525,0,0,0,'malygos SAY_MAGIC_BLAST'),(-1999815,'Still standing? Not for long...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14537,0,0,0,'malygos SAY_GENERIC_SPELL_1'),(-1999814,'Your cause is lost!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14538,0,0,0,'malygos SAY_GENERIC_SPELL_2'),(-1999813,'Your fragile mind will be shattered! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14539,0,0,0,'malygos SAY_GENERIC_SPELL_3'),(-1999812,'UNTHINKABLE! The mortals will destroy...e-everything...my sister...what have you-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14540,0,0,0,'malygos SAY_DEATH'),(-1999811,'Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14512,0,0,0,'malygos SAY_PREFIGHT_1'),(-1999810,'None but the blue dragonflight are welcome here! Perhaps this is the work of Alexstrasza? Well then, she has sent you to your deaths.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14513,0,0,0,'malygos SAY_PREFIGHT_2'),(-1999809,'What could you hope to accomplish, to storm brassily into my domain? To employ MAGIC? Against ME? *Laughs*',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14514,0,0,0,'malygos SAY_PREFIGHT_3'),(-1999808,'I am without limits here...the rules of your cherished reality do not apply...In this realm, I am in control...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14515,0,0,0,'malygos SAY_PREFIGHT_4'),(-1999807,'I give you one chance. Pledge loyalty to me, and perhaps I won\'t slaughter you for your insolence!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14516,0,0,0,'malygos SAY_PREFIGHT_5'),(-1999806,'My patience has reached its limit, I WILL BE RID OF YOU!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14517,0,0,0,'malygos SAY_PHASE1_AGGRO'),(-1999805,'I had hoped to end your lives quickly, but you have proven more...resilient then I had anticipated. None the less, your efforts are in vain, it is you reckless, careless mortals who are to blame for this war! I do what I must...And if it means your...extinction...THEN SO BE IT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14522,0,0,0,'malygos SAY_PHASE1_END'),(-1999804,'Your stupidity has finally caught up to you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14519,0,0,0,'malygos SAY_PHASE1_SLAY_1'),(-1999803,'More artifacts to confiscate...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14520,0,0,0,'malygos SAY_PHASE1_SLAY_2'),(-1999802,'*Laughs* How very...naive.. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14521,0,0,0,'malygos SAY_PHASE1_SLAY_3'),(-1999801,'Few have experienced the pain I will now inflict on you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14523,0,0,0,'malygos SAY_PHASE2_AGGRO'),(-1999800,'ENOUGH! If you intend to reclaim Azeroth\'s magic, then you shall have it... ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14529,0,0,0,'malygos SAY_PHASE2_END'),(-1999799,'Your energy will be put to good use!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14526,0,0,0,'malygos SAY_PHASE2_SLAY_1'),(-1999798,'I AM THE SPELL WEAVER! My power is INFINITE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14527,0,0,0,'malygos SAY_PHASE2_SLAY_2'),(-1999797,'Your spirit will linger here forever!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14528,0,0,0,'malygos SAY_PHASE2_SLAY_3'),(-1999796,'Now your benefactors make their appearance...But they are too late. The powers contained here are powerful enough to destroy the world ten times over! What do you think they will do to you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14530,0,0,0,'malygos SAY_PHASE3_INTRO'),(-1999795,'SUBMIT!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14531,0,0,0,'malygos SAY_PHASE3_AGGRO'),(-1999794,'Alexstrasza! Another of your brood falls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14534,0,0,0,'malygos SAY_PHASE3_SLAY_1'),(-1999793,'Little more then gnats!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14535,0,0,0,'malygos SAY_PHASE3_SLAY_2'),(-1999792,'Your red allies will share your fate...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14536,0,0,0,'slad_ran SAY_PHASE3_SLAY_3'),(-1999791,'The powers at work here exceed anything you could possibly imagine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14532,0,0,0,'malygos SAY_PHASE3_BIG_ATTACK'),(-1999790,'Chaos beckons.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13186,0,0,0,'anomalus SAY_AGGRO'),(-1999789,'Expiration... is necessary...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13274,0,0,0,'anomalus SAY_KILL'),(-1999788,'Of course.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13187,0,0,0,'anomalus SAY_DEATH'),(-1999787,'Reality... unwoven.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13188,0,0,0,'anomalus SAY_RIFT'),(-1999786,'Indestructible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13189,0,0,0,'anomalus SAY_SHIELD'),(-1999785,'Preserve? Why? There\'s no truth in it. No no no... only in the taking! I see that now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13450,0,0,0,'keristrasza SAY_AGGRO'),(-1999784,'Now we\'ve come to the truth! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13453,0,0,0,'keristrasza SAY_SLAY'),(-1999783,'Finish it! Finish it! Kill me, or I swear by the Dragonqueen you\'ll never see daylight again!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13452,0,0,0,'keristrasza SAY_ENRAGE'),(-1999782,'Dragonqueen... Life-Binder... preserve... me.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13454,0,0,0,'keristrasza SAY_DEATH'),(-1999781,'Stay. Enjoy your final moments.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13451,0,0,0,'keristrasza SAY_CRYSTAL_NOVA'),(-1999780,'You know what they say about curiosity.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13319,0,0,0,'magus_telestra SAY_AGGRO'),(-1999779,'Death becomes you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13324,0,0,0,'magus_telestra SAY_KILL'),(-1999778,'Damn the... luck.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13320,0,0,0,'magus_telestra SAY_DEATH'),(-1999777,'Now to finish the job!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13323,0,0,0,'magus_telestra SAY_MERGE'),(-1999776,'There\'s plenty of me to go around.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13321,0,0,0,'magus_telestra SAY_SPLIT_1'),(-1999775,'I\'ll give you more than you can handle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13322,0,0,0,'magus_telestra SAY_SPLIT_2'),(-1999774,'Noo!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13328,0,0,0,'ormorok SAY_AGGRO'),(-1999773,'Aargh Kill!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13329,0,0,0,'ormorok SAY_KILL'),(-1999772,'Aaggh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13330,0,0,0,'ormorok SAY_DEATH'),(-1999771,'Back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13331,0,0,0,'ormorok SAY_REFLECT'),(-1999770,'Bleed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13332,0,0,0,'ormorok SAY_ICE_SPIKES'),(-1999769,'The prisoners shall not go free. The word of Malygos is law!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13594,0,0,0,'drakos SAY_AGGRO'),(-1999768,'A fitting punishment!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13602,0,0,0,'drakos SAY_KILL_1'),(-1999767,'Sentence: executed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13603,0,0,0,'drakos SAY_KILL_2'),(-1999766,'Another casualty of war!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13604,0,0,0,'drakos SAY_KILL_3'),(-1999765,'The war... goes on.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13605,0,0,0,'drakos SPELL_DEATH'),(-1999764,'It is too late to run!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13598,0,0,0,'drakos SAY_PULL_1'),(-1999763,'Gather \'round! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13599,0,0,0,'drakos SAY_PULL_2'),(-1999762,'None shall escape!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13600,0,0,0,'drakos SAY_PULL_3'),(-1999761,'I condemn you to death!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13601,0,0,0,'drakos SAY_PULL_4'),(-1999760,'Tremble, worms!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13595,0,0,0,'drakos SAY_STOMP_1'),(-1999759,'I will crush you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13596,0,0,0,'drakos SAY_STOMP_2'),(-1999758,'Can you fly?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13597,0,0,0,'drakos SAY_STOMP_3'),(-1999757,'Poor blind fools!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13638,0,0,0,'urom SAY_AGGRO'),(-1999756,'If only you understood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13641,0,0,0,'urom SAY_KILL_1'),(-1999755,'Now, do you see? DO YOU?!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13642,0,0,0,'urom SAY_KILL_2'),(-1999754,'Unfortunate, but necessary.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13643,0,0,0,'urom SAY_KILL_3'),(-1999753,'Everything I\'ve done... has been for Azeroth...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13644,0,0,0,'urom SAY_DEATH'),(-1999752,'A taste... just a small taste... of the Spell-Weaver\'s power!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13639,0,0,0,'urom SAY_EXPLOSION_1'),(-1999751,'So much unstable energy... but worth the risk to destroy you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13640,0,0,0,'urom SAY_EXPLOSION_2'),(-1999750,'What do we have here... those would defy the Spell-Weaver? Those without foresight or understanding. How could I make you see? Malygos is saving the world from itself! Bah! You are hardly worth my time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13635,0,0,0,'urom SAY_SUMMON_1'),(-1999749,'Clearly my pets failed. Perhaps another demonstration is in order.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13636,0,0,0,'urom SAY_SUMMON_2'),(-1999748,'Still you fight. Still you cling to misguided principles. If you survive, you\'ll find me in the center ring.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13637,0,0,0,'urom SAY_SUMMON_3'),(-1999747,'There will be no mercy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13649,0,0,0,'urom SAY_AGGRO'),(-1999746,'You were warned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13653,0,0,0,'urom SAY_KILL_1'),(-1999745,'The Oculus is ours.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13654,0,0,0,'urom SAY_KILL_2'),(-1999744,'They are... too strong! Underestimated their... fortitude.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13655,0,0,0,'urom SAY_DEATH'),(-1999743,'Blast them! Destroy them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13650,0,0,0,'urom SAY_STRIKE_1'),(-1999742,'Take no prisoners! Attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13651,0,0,0,'urom SAY_STRIKE_2'),(-1999741,'Strike now! Obliterate them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13652,0,0,0,'urom SAY_STRIKE_3'),(-1999740,'Intruders, your victory will be short-lived. I am Commander Varos Cloudstrider. My drakes control the skies and protest this conduit. I will see to it personally that the Oculus does not fall into your hands!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13648,0,0,0,'urom SAY_SPAWN'),(-1999739,'I am the greatest of my father\'s sons! Your end has come!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14149,0,0,0,'bjarngrim SAY_AGGRO'),(-1999738,'So ends your curse!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14153,0,0,0,'bjarngrim SAY_SLAY_1'),(-1999737,'Flesh... is... weak!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14154,0,0,0,'bjarngrim SAY_SLAY_2'),(-1999736,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14155,0,0,0,'bjarngrim SAY_SLAY_3'),(-1999735,'How can it be...? Flesh is not... stronger!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14156,0,0,0,'bjarngrim SAY_DEATH'),(-1999734,'Defend yourself, for all the good it will do!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14151,0,0,0,'bjarngrim SAY_BATTLE_STANCE'),(-1999733,'GRAAAAAH! Behold the fury of iron and steel!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14152,0,0,0,'bjarngrim SAY_BERSEKER_STANCE'),(-1999732,'Give me your worst!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14150,0,0,0,'bjarngrim SAY_DEFENSIVE_STANCE'),(-1999731,'You wish to confront the master? You must weather the storm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14453,0,0,0,'ionar SAY_AGGRO'),(-1999730,'Shocking ... I know!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14456,0,0,0,'ionar SAY_SLAY_1'),(-1999729,'You atempt the unpossible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14457,0,0,0,'ionar SAY_SLAY_2'),(-1999728,'Your spark of light is ... extinguish.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14458,0,0,0,'ionar SAY_SLAY_3'),(-1999727,'Master... you have guests.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14459,0,0,0,'ionar SAY_DEATH'),(-1999726,'The slightest spark shall be your undoing.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14454,0,0,0,'ionar SAY_SPLIT_1'),(-1999725,'No one is safe!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14455,0,0,0,'ionar SAY_SPLIT_2'),(-1999724,'What hope is there for you? None!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14162,0,0,0,'ionar SAY_AGGRO0'),(-1999723,'I have witnessed the rise and fall of empires. The birth and extinction of entire species. Over countless millennia the foolishness of mortals has remained beyond a constant. Your presence here confirms this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14160,0,0,0,'ionar SAY_INTRO_1'),(-1999722,'My master has shown me the future, and you have no place in it. Azeroth will be reborn in darkness. Yogg-Saron shall be released! The Pantheon shall fall!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14162,0,0,0,'ionar SAY_INTRO_2'),(-1999721,'Only mortal...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14166,0,0,0,'ionar SAY_SLAY_1'),(-1999720,'I... am... FOREVER!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14167,0,0,0,'ionar SAY_SLAY_2'),(-1999719,'What little time you had, you wasted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14168,0,0,0,'ionar SAY_SLAY_3'),(-1999718,'My death... heralds the end of this world.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14172,0,0,0,'ionar SAY_DEATH'),(-1999717,'You cannot hide from fate!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14163,0,0,0,'ionar SAY_NOVA_1'),(-1999716,'Come closer. I will make it quick.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14164,0,0,0,'ionar SAY_NOVA_2'),(-1999715,'Your flesh cannot hold out for long.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14165,0,0,0,'ionar SAY_NOVA_3'),(-1999714,'You stare blindly into the abyss!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14169,0,0,0,'ionar SAY_75HEALTH'),(-1999713,'Your ignorance is profound. Can you not see where this path leads?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14170,0,0,0,'ionar SAY_50HEALTH'),(-1999712,'You cross the precipice of oblivion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14171,0,0,0,'ionar SAY_25HEALTH'),(-1999711,'It is you who have destroyed my children? You... shall... pay!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13960,0,0,0,'volkhan SAY_AGGRO'),(-1999710,'The armies of iron will conquer all!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13965,0,0,0,'volkhan SAY_SLAY_1'),(-1999709,'Ha, pathetic!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13966,0,0,0,'volkhan SAY_SLAY_2'),(-1999708,'You have cost me too much work!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13967,0,0,0,'volkhan SAY_SLAY_3'),(-1999707,'The master was right... to be concerned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13968,0,0,0,'volkhan SAY_DEATH'),(-1999706,'I will crush you beneath my boots!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13963,0,0,0,'volkhan SAY_STOMP_1'),(-1999705,'All my work... undone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13964,0,0,0,'volkhan SAY_STOMP_2'),(-1999703,'Life from the lifelessness... death for you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13961,0,0,0,'volkhan SAY_FORGE_1'),(-1999702,'Nothing is wasted in the process. You will see....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13962,0,0,0,'volkhan SAY_FORGE_2'),(-1999701,'Crush....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14176,0,0,0,'krystallus SAY_AGGRO'),(-1999700,'Ha...ha...ha...ha...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14177,0,0,0,'krystallus SAY_KILL'),(-1999699,'Uuuuhhhhhhhhhh......',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14179,0,0,0,'krystallus SAY_DEATH'),(-1999698,'Break.... you....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14178,0,0,0,'krystallus SAY_SHATTER'),(-1999697,'You shouldn\'t have come...now you will die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13487,0,0,0,'maiden_of_grief SAY_AGGRO'),(-1999696,'Why must it be this way?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13488,0,0,0,'maiden_of_grief SAY_SLAY_1'),(-1999695,'You had it coming!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13489,0,0,0,'maiden_of_grief SAY_SLAY_2'),(-1999694,'My burden grows heavier.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13490,0,0,0,'maiden_of_grief SAY_SLAY_3'),(-1999693,'This is your own fault!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13491,0,0,0,'maiden_of_grief SAY_SLAY_4'),(-1999692,'I hope you all rot! I never...wanted...this.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13493,0,0,0,'maiden_of_grief SAY_DEATH'),(-1999691,'So much lost time... that you\'ll never get back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13492,0,0,0,'maiden_of_grief SAY_STUN'),(-1999690,'Soft, vulnerable shells. Brief, fragile lives. You can not escape the curse of flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14180,0,0,0,'sjonnir SAY_AGGRO'),(-1999689,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14181,0,0,0,'sjonnir SAY_SLAY_1'),(-1999688,'Flesh is no match for iron!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14182,0,0,0,'sjonnir SAY_SLAY_2'),(-1999687,'Armies of iron will smother the world!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14183,0,0,0,'sjonnir SAY_SLAY_3'),(-1999686,'Loken will not rest, until the forge is retaken. You changed nothing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14184,0,0,0,'sjonnir SAY_DEATH'),(-1999685,'By all means, don\'t assess the situation, you halfwit! Just jump into the fray!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13199,0,0,0,'dalronn SAY_AGGRO'),(-1999684,'You may serve me yet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13202,0,0,0,'dalronn SAY_KILL'),(-1999683,'See... you... soon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13200,0,0,0,'dalronn SAY_DEATH_1'),(-1999682,'There\'s no... greater... glory.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13201,0,0,0,'dalronn SAY_DEATH_2'),(-1999681,'Skarvald, you incompetent slug! Return and make yourself useful!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13203,0,0,0,'dalronn SAY_RAISES'),(-1999680,'Dalronn! See if you can muster the nerve to join my attack!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13229,0,0,0,'skarvald SAY_AGGRO'),(-1999679,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13232,0,0,0,'skarvald SAY_KILL'),(-1999678,'Not... over... yet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13230,0,0,0,'skarvald SAY_DEATH_1'),(-1999677,'A warrior\'s death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13231,0,0,0,'skarvald SAY_DEATH_2'),(-1999676,'Pagh! What sort of necromancer lets death stop him? I knew you were worthless!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13233,0,0,0,'skarvald SAY_RAISES'),(-1999675,'Your blood is mine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13221,0,0,0,'kelseth SAY_AGGRO'),(-1999674,'The chill you feel is the herald of your doom.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13223,0,0,0,'kelseth SAY_KILL'),(-1999673,'I join... the night.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13225,0,0,0,'kelseth SAY_DEATH'),(-1999672,'Not so fast.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13222,0,0,0,'kelseth SAY_FROST_TOMB'),(-1999671,'Aranal, lidel! Their fate shall be yours!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13224,0,0,0,'kelseth SAY_SKELETONS'),(-1999670,'I\'ll paint my face with your blood!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13207,0,0,0,'ingvar SAY_AGGRO'),(-1999669,'I am a warrior born!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13214,0,0,0,'ingvar SAY_KILL'),(-1999668,'My life for the... death god!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13213,0,0,0,'ingvar SAY_DEATH'),(-1999667,'Fight on or face me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13208,0,0,0,'ingvar SAY_ATTACK_1'),(-1999666,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13240,0,0,0,'ingvar SAY_ATTACK_2'),(-1999665,'Slay them all, no excuses, no mercy, no rest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13241,0,0,0,'ingvar SAY_ATTACK_3'),(-1999664,'... of destruction silence every ...!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13242,0,0,0,'ingvar SAY_ATTACK_4'),(-1999663,'I return! A second chance to carve out your skull!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13208,0,0,0,'ingvar SAY_PHASE2_AGGRO'),(-1999662,'Mjul orm agn gjor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13212,0,0,0,'ingvar SAY_PHASE2_KILL'),(-1999661,'No! I can do... better! I can...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13211,0,0,0,'ingvar SAY_PHASE2_DEATH'),(-1999524,'Ingvar! Your pathetic failure will serve as a warning to all... you are damned! Arise and carry out the master\'s will!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13754,0,0,0,'ingvar SAY_ANNHYLDE_THE_CALLER_RESURECTION'),(-1999660,'What this place? I will destroy you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13464,0,0,0,'palehoof SAY_AGGRO'),(-1999659,'You die! That what master wants!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13465,0,0,0,'palehoof SAY_SLAY_1'),(-1999658,'An easy task!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13466,0,0,0,'palehoof SAY_SLAY_2'),(-1999657,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13467,0,0,0,'palehoof SAY_DEATH'),(-1999656,'What mongrels dare intrude here? Look alive, my brothers! A feast for the one that brings me their heads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13497,0,0,0,'skadi SAY_AGGRO'),(-1999655,'Mjor Na Ul Kaval!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13503,0,0,0,'skadi SAY_KILL_1'),(-1999654,'Not so brash now, are you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13504,0,0,0,'skadi SAY_KILL_2'),(-1999653,'I\'ll mount your skull from the highest tower!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13505,0,0,0,'skadi SAY_KILL_3'),(-1999652,'ARGH! You call that... an attack? I\'ll... show... aghhhh...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13506,0,0,0,'skadi SAY_DEATH'),(-1999651,'You motherless knaves! Your corpses will make fine morsels for my new drake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13507,0,0,0,'skadi SAY_DRAKE_DEATH'),(-1999650,'I ask for ... to kill them, yet all I get is feeble whelps! By Ye.. SLAUGHTER THEM!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13501,0,0,0,'skadi SAY_DRAKE_HIT_1'),(-1999649,'If one more harpoon touches my drake I\'ll flae my miserable heins.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13502,0,0,0,'skadi SAY_DRAKE_HIT_2'),(-1999648,'Sear them to the bone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13498,0,0,0,'skadi SAY_DRAKE_BREATH_1'),(-1999647,'Go now! Leave nothing but ash in your wake!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13499,0,0,0,'skadi SAY_DRAKE_BREATH_2'),(-1999646,'Cleanse our sacred halls with flame!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13500,0,0,0,'skadi SAY_DRAKE_BREATH_3'),(-1999645,'I will vanquish your soul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13842,0,0,0,'skadi SAY_AGGRO'),(-1999644,'You were a fool to challenge the power of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13845,0,0,0,'skadi SAY_SLAY_1'),(-1999643,'Your will is done, my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13847,0,0,0,'skadi SAY_SLAY_2'),(-1999642,'Another soul for my master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13848,0,0,0,'skadi SAY_SLAY_3'),(-1999641,'Nooo! I did not come this far... to...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13855,0,0,0,'skadi SAY_DEATH'),(-1999640,'Your death approaches.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13850,0,0,0,'skadi SAY_SACRIFICE_PLAYER_1'),(-1999639,'Go now to my master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13851,0,0,0,'skadi SAY_SACRIFICE_PLAYER_2'),(-1999638,'Your end is inevitable.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13852,0,0,0,'skadi SAY_SACRIFICE_PLAYER_3'),(-1999637,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13853,0,0,0,'skadi SAY_SACRIFICE_PLAYER_4'),(-1999636,'Any last words?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13854,0,0,0,'skadi SAY_SACRIFICE_PLAYER_5'),(-1999635,'My liege! I have done as you asked, and now beseech you for your blessing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13856,0,0,0,'skadi SAY_SAY_DIALOG_WITH_ARTHAS_1'),(-1999634,'The sensation is... beyond my imagining. I am yours to command, my king.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13857,0,0,0,'skadi SAY_SAY_DIALOG_WITH_ARTHAS_2'),(-1999633,'I will be happy to slaughter them in your name! Come, enemies of the Scourge! I will show you the might of the Lich King!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13858,0,0,0,'skadi SAY_SAY_DIALOG_WITH_ARTHAS_3'),(-1999632,'You invade my home and then dare to challenge me? I will tear the hearts from your chests and offer them as gifts to the death god! Rualg nja gaborr!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13609,0,0,0,'ymiron SAY_AGGRO'),(-1999631,'Your death is only the beginning!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13614,0,0,0,'ymiron SAY_SLAY_1'),(-1999630,'You have failed your people!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13615,0,0,0,'ymiron SAY_SLAY_2'),(-1999629,'There is a reason I am king!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13616,0,0,0,'ymiron SAY_SLAY_3'),(-1999628,'Bleed no more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13617,0,0,0,'ymiron SAY_SLAY_4'),(-1999627,'What... awaits me... now?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13618,0,0,0,'ymiron SAY_DEATH'),(-1999626,'Bjorn of the Black Storm! Honor me now with your presence!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13610,0,0,0,'ymiron SAY_SUMMON_BJORN'),(-1999625,'Haldor of the rocky cliffs, grant me your strength!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13611,0,0,0,'ymiron SAY_SUMMON_HALDOR'),(-1999624,'Ranulf of the screaming abyss, snuff these maggots with darkest night!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13612,0,0,0,'ymiron SAY_SUMMON_RANULF'),(-1999623,'Tor of the Brutal Siege! Bestow your might upon me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13613,0,0,0,'ymiron SAY_SUMMON_TORGYN'),(-1999622,'We finish this now, champions of Kirin Tor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13947,0,0,0,'cyanigosa SAY_AGGRO'),(-1999621,'I will end the Kirin Tor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13952,0,0,0,'cyanigosa SAY_SLAY_1'),(-1999620,'Dalaran will fall!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13953,0,0,0,'cyanigosa SAY_SLAY_2'),(-1999619,'So ends your defiance of the Spell-Weaver!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13954,0,0,0,'cyanigosa SAY_SLAY_3'),(-1999618,'Perhaps... we have... underestimated... you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13955,0,0,0,'cyanigosa SAY_DEATH'),(-1999617,'A valiant defense, but this city must be razed. I will fulfill Malygos\'s wishes myself!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13946,0,0,0,'cyanigosa SAY_SPAWN'),(-1999616,'Am I interrupting?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13951,0,0,0,'cyanigosa SAY_DISRUPTION'),(-1999615,'Shiver and die!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13948,0,0,0,'cyanigosa SAY_BREATH_ATTACK'),(-1999614,'The world has forgotten what true magic is! Let this be a reminder!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13949,0,0,0,'cyanigosa SAY_SPECIAL_ATTACK_1'),(-1999613,'Who among you can withstand my power?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13950,0,0,0,'cyanigosa SAY_SPECIAL_ATTACK_2'),(-1999612,'Not--caww--get in way of--rrak-rrak--flee!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14219,0,0,0,'erekem SAY_AGGRO'),(-1999611,'...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14222,0,0,0,'erekem SAY_SLAY_1'),(-1999610,'Precious life ... wasted.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14223,0,0,0,'erekem SAY_SLAY_2'),(-1999609,'Only strong ... survive.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14224,0,0,0,'erekem SAY_SLAY_3'),(-1999608,'No--kaw, kaw--flee...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14225,0,0,0,'erekem SAY_DEATH'),(-1999607,'Free to--mm--fly onw. Ra-aak... Not find us--ekh-ekh! Escape!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14218,0,0,0,'erekem SAY_SPAWN'),(-1999606,'My---raaak--favorite! Awk awk awk! Raa-kaa!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14220,0,0,0,'erekem SAY_ADD_KILLED'),(-1999605,'Nasty little...A-ak, kaw! Kill! Yes, kill you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14221,0,0,0,'erekem SAY_BOTH_ADDS_KILLED'),(-1999604,'Stand aside, mortals!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14230,0,0,0,'ichoron SAY_AGGRO'),(-1999603,'I am a force of nature!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14234,0,0,0,'ichoron SAY_SLAY_1'),(-1999602,'I shall pass!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14235,0,0,0,'ichoron SAY_SLAY_2'),(-1999601,'You can not stop the tide!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14236,0,0,0,'ichoron SAY_SLAY_3'),(-1999600,'I... recede.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14237,0,0,0,'ichoron SAY_DEATH'),(-1999599,'I... am fury... unrestrained!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14229,0,0,0,'ichoron SAY_SPAWN'),(-1999598,'I shall consume, decimate, devastate, and destroy! Yield now to the wrath of the pounding sea!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14231,0,0,0,'ichoron SAY_ENRAGE'),(-1999597,'I will not be contained! Ngyah!!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14233,0,0,0,'ichoron SAY_SHATTER'),(-1999596,'Water can hold any form, take any shape... overcome any obstacle.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14232,0,0,0,'ichoron SAY_BUBBLE'),(-1999595,'It seems my freedom must be bought with blood...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14499,0,0,0,'xevozz SAY_AGGRO'),(-1999594,'Nothing personal.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14504,0,0,0,'xevozz SAY_SLAY_1'),(-1999593,'Business concluded.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14505,0,0,0,'xevozz SAY_SLAY_2'),(-1999592,'Profit!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14506,0,0,0,'xevozz SAY_SLAY_3'),(-1999591,'This is an... unrecoverable... loss.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14507,0,0,0,'xevozz SAY_DEATH'),(-1999590,'Back in business! Now to execute an exit strategy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14498,0,0,0,'xevozz SAY_SPAWNED'),(-1999589,'It would seem that a renegotiation is in order.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14503,0,0,0,'xevozz SAY_CHARGED'),(-1999588,'The air teems with latent energy... quite the harvest!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14501,0,0,0,'xevozz SAY_REPEAT_SUMMON_1'),(-1999587,'Plentiful, exploitable resources... primed for acquisition!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14502,0,0,0,'xevozz SAY_REPEAT_SUMMON_2'),(-1999586,'Intriguing... a high quantity of arcane energy is near. Time for some prospecting...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14500,0,0,0,'xevozz SAY_SUMMON_ENERGY'),(-1999585,'Eradicate.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13996,0,0,0,'zuramat SAY_AGGRO'),(-1999584,'More... energy.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13999,0,0,0,'zuramat SAY_SLAY_1'),(-1999583,'Relinquish.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14000,0,0,0,'zuramat SAY_SLAY_2'),(-1999582,'Fall... to shadow.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14001,0,0,0,'zuramat SAY_SLAY_3'),(-1999581,'Disperse.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14002,0,0,0,'zuramat SAY_DEATH'),(-1999580,'I am... renewed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13995,0,0,0,'zuramat SAY_SPAWN'),(-1999579,'Know... my... pain.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13997,0,0,0,'zuramat SAY_SHIELD'),(-1999578,'Gaze... into the void.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13998,0,0,0,'zuramat SAY_WHISPER'),(-1615000,'I fear nothing! Least of all you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14111,1,0,0,'shadron SAY_SHADRON_AGGRO'),(-1615001,'You are insignificant!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14112,1,0,0,'shadron SAY_SHADRON_SLAY_1'),(-1615002,'Such mediocre resistance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14113,1,0,0,'shadron SAY_SHADRON_SLAY_2'),(-1615003,'We...are superior! How could this...be...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14118,1,0,0,'shadron SAY_SHADRON_DEATH'),(-1615004,'You are easily bested! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14114,1,0,0,'shadron SAY_SHADRON_BREATH'),(-1615005,'I will take pity on you Sartharion, just this once.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14117,1,0,0,'shadron SAY_SHADRON_RESPOND'),(-1615006,'Father tought me well!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14115,1,0,0,'shadron SAY_SHADRON_SPECIAL_1'),(-1615007,'On your knees!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14116,1,0,0,'shadron SAY_SHADRON_SPECIAL_2'),(-1615008,'You have no place here. Your place is among the departed.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14122,1,0,0,'tenebron SAY_TENEBRON_AGGRO'),(-1615009,'No contest.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14123,1,0,0,'tenebron SAY_TENEBRON_SLAY_1'),(-1615010,'Typical... Just as I was having fun.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14124,1,0,0,'tenebron SAY_TENEBRON_SLAY_2'),(-1615011,'I should not... have held back...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14129,1,0,0,'tenebron SAY_TENEBRON_DEATH'),(-1615012,'To darkness I condemn you...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14125,1,0,0,'tenebron SAY_TENEBRON_BREATH'),(-1615013,'It is amusing to watch you struggle. Very well, witness how it is done.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14128,1,0,0,'tenebron SAY_TENEBRON_RESPOND'),(-1615014,'Arrogant little creatures! To challenge powers you do not yet understand...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14126,1,0,0,'tenebron SAY_TENEBRON_SPECIAL_1'),(-1615015,'I am no mere dragon! You will find I am much, much, more...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14127,1,0,0,'tenebron SAY_TENEBRON_SPECIAL_2'),(-1615016,'It is my charge to watch over these eggs. I will see you burn before any harm comes to them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14093,1,0,0,'sartharion SAY_SARTHARION_AGGRO'),(-1615017,'This pathetic siege ends NOW!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14103,1,0,0,'sartharion SAY_SARTHARION_BERSERK'),(-1615018,'Burn, you miserable wretches!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14098,1,0,0,'sartharion SAY_SARTHARION_BREATH'),(-1615019,'Shadron! Come to me, all is at risk!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14105,1,0,0,'sartharion SARTHARION_CALL_SHADRON'),(-1615020,'Tenebron! The eggs are yours to protect as well!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14106,1,0,0,'sartharion SAY_SARTHARION_CALL_TENEBRON'),(-1615021,'Vesperon! The clutch is in danger! Assist me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14104,1,0,0,'sartharion SAY_SARTHARION_CALL_VESPERON'),(-1615022,'Such is the price... of failure...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14107,1,0,0,'sartharion SAY_SARTHARION_DEATH'),(-1615023,'Such flammable little insects....',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14099,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_1'),(-1615024,'Your charred bones will litter the floor!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14100,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_2'),(-1615025,'How much heat can you take?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14101,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_3'),(-1615026,'All will be reduced to ash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14102,1,0,0,'sartharion SAY_SARTHARION_SPECIAL_4'),(-1615027,'You will make a fine meal for the hatchlings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14094,1,0,0,'sartharion SAY_SARTHARION_SLAY_1'),(-1615028,'You are the grave disadvantage.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14096,1,0,0,'sartharion SAY_SARTHARION_SLAY_2'),(-1615029,'This is why we call you lesser beeings.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14097,1,0,0,'sartharion SAY_SARTHARION_SLAY_3'),(-1615030,'You pose no threat, lesser beings...give me your worst!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14133,1,0,0,'vesperon SAY_VESPERON_AGGRO'),(-1615031,'The least you could do is put up a fight...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14134,1,0,0,'vesperon SAY_VESPERON_SLAY_1'),(-1615032,'Was that the best you can do?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14135,1,0,0,'vesperon SAY_VESPERON_SLAY_2'),(-1615033,'I still have some...fight..in...me...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14140,1,0,0,'vesperon SAY_VESPERON_DEATH'),(-1615034,'I will pick my teeth with your bones!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14136,1,0,0,'vesperon SAY_VESPERON_BREATH'),(-1615035,'Father was right about you, Sartharion...You are a weakling!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14139,1,0,0,'vesperon SAY_VESPERON_RESPOND'),(-1615036,'Aren\'t you tricky...I have a few tricks of my own...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14137,1,0,0,'vesperon SAY_VESPERON_SPECIAL_1'),(-1615037,'Unlike, I have many talents.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14138,1,0,0,'vesperon SAY_VESPERON_SPECIAL_2'),(-1580036,'Glory to Kil\'jaeden! Death to all who oppose!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12477,1,0,0,'felmyst SAY_FELMYST_BIRTH'),(-1580037,'I kill for the master!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12480,1,0,0,'felmyst SAY_FELMYST_KILL1'),(-1580038,'The end has come! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12481,1,0,0,'felmyst SAY_FELMYST_KILL2'),(-1580039,'Choke on your final breath! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12478,1,0,0,'felmyst SAY_FELMYST_BREATH'),(-1580040,'I am stronger than ever before! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12479,1,0,0,'felmyst SAY_FELMYST_TAKEOFF'),(-1580041,'No more hesitation! Your fates are written! ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12482,1,0,0,'felmyst SAY_FELMYST_BERSERK'),(-1580042,'Kil\'jaeden... will... prevail... ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12483,1,0,0,'felmyst SAY_FELMYST_DEATH'),(-1580043,'Madrigosa deserved a far better fate. You did what had to be done, but this battle is far from over.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12439,1,0,0,'felmyst SAY_FELMYST_KALECGOS'),(-1580044,'Misery... Depravity... Confusion... Hatred... Mistrust... Chaos... These are the hallmarks... These are the pillars... ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12484,1,0,0,'Eredar Twins SAY_INTRO'),(-1580045,'Shadow to the aid of fire!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12485,1,0,0,'Sacrolash SAY_SACROLASH_SHADOW_NOVA'),(-1580046,'Alythess! Your fire burns within me!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12488,1,0,0,'Sacrolash SAY_SACROLASH_SISTER_ALYTHESS_DEAD'),(-1580047,'Shadows, engulf!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12486,1,0,0,'Sacrolash SAY_SACROLASH_SAC_KILL_1'),(-1580048,'Ee-nok Kryul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12487,1,0,0,'Sacrolash SAY_SACROLASH_SAC_KILL_2'),(-1580049,'I... fade.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12399,1,0,0,'Sacrolash SAY_SAC_DEAD'),(-1580050,'Fire to the aid of shadow!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12489,1,0,0,'Alythess SAY_ALYTHESS_CANFLAGRATION'),(-1580051,'Sacrolash!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12492,1,0,0,'Alythess SAY_ALYTHESS_SISTER_SACROLASH_DEAD'),(-1580052,'Fire, consume!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12490,1,0,0,'Alythess SAY_ALYTHESS_ALY_KILL_1'),(-1580053,'Ed-ir Halach!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12491,1,0,0,'Alythess SAY_ALYTHESS_ALY_KILL_2'),(-1580054,'De-ek Anur!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12494,1,0,0,'Alythess SAY_ALYTHESS_ALY_DEAD'),(-1580055,'Your luck has run its course!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12493,1,0,0,'Alythess SAY_ALYTHESS_BERSERK'),(-1580056,'All my plans have led to this!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12495,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT1'),(-1580057,'Stay on task! Do not waste time!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12496,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT2'),(-1580058,'I have waited long enough!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12497,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT3'),(-1580059,'Fail me and suffer for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12498,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT4'),(-1580060,'Drain the girl! Drain her power until there is nothing but a vacant shell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12499,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT5'),(-1580061,'The expendible have perished... So be it! Now I shall succeed where Sargeras could not! I will bleed this wretched world and secure my place as the true master of the Burning Legion. The end has come! Let the unraveling of this world commence!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12500,1,0,0,'Kil\'jaeden SAY_KJ_EMERGE'),(-1580062,'Another step towards destruction!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12501,1,0,0,'Kil\'jaeden SAY_KJ_SLAY1'),(-1580063,'Anak-ky\'ri!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12502,1,0,0,'Kil\'jaeden SAY_KJ_SLAY2'),(-1580064,'Who can you trust?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12503,1,0,0,'Kil\'jaeden SAY_KJ_REFLECTION1'),(-1580065,'The enemy is upon you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12504,1,0,0,'Kil\'jaeden SAY_KJ_REFLECTION2'),(-1580066,'Chaos!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12505,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS1'),(-1580067,'Destruction!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12506,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS2'),(-1580068,'Oblivion!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12507,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS3'),(-1580069,'I will not be denied! This world shall fall!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12508,1,0,0,'Kil\'jaeden SAY_KJ_DENINE'),(-1580070,'Do not harbor false hope. You cannot win!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12509,1,0,0,'Kil\'jaeden SAY_KJ_CANNOT_WIN'),(-1580071,'Aggghh! The powers of the Sunwell... turned... against me! What have you done? WHAT HAVE YOU DONE?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12510,1,0,0,'Kil\'jaeden SAY_KJ_LOST_POWER'),(-1580072,'You are not alone. The Blue Dragonflight shall help you vanquish the Deceiver. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12438,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_INTRO'),(-1580073,'Anveena, you must awaken, this world needs you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12445,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_AWAKEN'),(-1580074,'I serve only the Master now.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12511,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_IMPRISONED'),(-1580075,'You must let go! You must become what you were always meant to be! The time is now, Anveena!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12446,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_LETGO'),(-1580076,'But I\'m... lost... I cannot find my way back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12512,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_LOST'),(-1580077,'Anveena, I love you! Focus on my voice, come back for me now! Only you can cleanse the Sunwell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12447,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_FOCUS'),(-1580078,'Kalec... Kalec?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12513,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_KALEC'),(-1580079,'Yes, Anveena! Let fate embrace you now!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12448,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_FATE'),(-1580080,'The nightmare is over, the spell is broken! Goodbye, Kalec, my love!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12514,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_GOODBYE'),(-1580081,'Goodbye, Anveena, my love. Few will remember your name, yet this day you change the course of destiny. What was once corrupt is now pure. Heroes, do not let her sacrifice be in vain.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12450,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_GOODBYE'),(-1580082,'Strike now, heroes, while he is weakened! Vanquish the Deceiver!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12449,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ENCOURAGE'),(-1580083,'I will channel my power into the orbs, be ready!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12440,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB1'),(-1580084,'I have empowered another orb! Use it quickly!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12441,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB2'),(-1580085,'Another orb is ready! Make haste!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12442,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB3'),(-1580086,'I have channeled all I can! The power is in your hands!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12443,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB4'),(-2500024,'You are too late, champion of Lordaeron. The dead shall have their day.','','','Ihr seid zu sp','','','','','',0,1,0,0,'Salramm OnSpawn'),(-2500025,'\"Ah, the entertainment has arrived!','','','Ah, die Unterhaltung ist da!','','','','','',0,1,0,0,'Salramm OnAggro'),(-2500026,'The fun is just beginning!','','','','','','','','',0,1,0,0,'Salramm Slay1'),(-2500027,'Aah, quality materials!','','','','','','','','',0,1,0,0,'Salramm Slay2'),(-2500028,'Don\'t worry, I\'ll make good use of you.','','','','','','','','',0,1,0,0,'Salramm Slay3'),(-2500029,'You only advance... the master\'s plan...','','','Ihr beschleunigt nur den... Plan des Meisters...','','','','','',0,1,0,0,'Salramm Died'),(-2500030,'I want a sample...','','','','','','','','',0,1,0,0,'Salramm Steal1'),(-2500031,'Such strength... it must be mine!','','','','','','','','',0,1,0,0,'Salramm Steal2'),(-2500032,'Your flesh betrays you.','','','Euer Fleisch verr','','','','','',0,1,0,0,'Salramm Steal3'),(-2500033,'BOOM! Hahahahah...','','','BUMM! Hahahahah...','','','','','',0,1,0,0,'Salramm Explode1'),(-2500034,'Blood... destruction... EXHILARATING!','','','Blut... Zerst','','','','','',0,1,0,0,'Salramm Explode1'),(-2500035,'Say hello to some friends of mine.','','','','','','','','',0,1,0,0,'Salramm Summon1'),(-2500036,'Come, citizen of Stratholme! Meet your saviors.','','','','','','','','',0,1,0,0,'Salramm Summon2'),(-2500018,'Play time!','','','Zeit zum Spielen!','','','','','',0,1,0,0,'Meathook OnSpawn'),(-2500019,'New toys!','','','Neues Spielzeug','','','','','',0,1,0,0,'Meathook OnAggro'),(-2500020,'Boring...','','','Langweilig...','','','','','',0,1,0,0,'Meathook Slay1'),(-2500021,'Why you stop moving?','','','Warum du dich nicht mehr bewegen?','','','','','',0,1,0,0,'Meathook Slay2'),(-2500022,'Get up! Me not done!','','','Steh auf! Ich noch nich\' fertig!','','','','','',0,1,0,0,'Meathook Slay3'),(-2500023,'This not fun...','','','','','','','','',0,1,0,0,'Meathook Died'),(-2500011,'Yes, this is the beginning. I\'ve been waiting for you, young prince. I am Mal\'Ganis.','','','','','','','','',0,1,0,0,'Malganis OnMoveInLineOfSight'),(-2500012,'This will be a fine test, Prince Arthas.','','','Das wird ein guter Test, Prinz Arthas.','','','','','',0,1,0,0,'Malganis OnAggro'),(-2500013,'Time out.','','','','','','','','',0,1,0,0,'Malganis Sleep1'),(-2500014,'You seem tired.','','','','','','','','',0,1,0,0,'Malganis Sleep2'),(-2500015,'All too easy.','','','','','','','','',0,1,0,0,'Malganis Slay1'),(-2500016,'The dark lord is displeased with your interference.','','','','','','','','',0,1,0,0,'Malganis Slay2'),(-2500017,'It is Prince Arthas I want, not you.','','','','','','','','',0,1,0,0,'Malganis Slay3'),(-2500003,'Prince Arthas Menethil, on this day, a powerful darkness has taken hold of your soul. The death you are destined to visit upon others will this day be your own.','','','Prinz Arthas Menethil, eine gro','','','','','',0,1,0,0,'Chrono Lord Epoch OnSpawn'),(-2500004,'We\'ll see about that, young prince.','','','Das werden wir noch sehen, junger Prinz.','','','','','',0,1,0,0,'Chrono Lord Epoch OnAggro'),(-2500005,'Tick tock, tick tock...','','','Tick tack, tick tack...','','','','','',0,1,0,0,'Chrono Lord Epoch TimeWarp1'),(-2500006,'Not quick enough!','','','Nicht schnell genug!','','','','','',0,1,0,0,'Chrono Lord Epoch TimeWarp2'),(-2500007,'Let\'s get this over with.','','','Bringen wir es zu Ende.','','','','','',0,1,0,0,'Chrono Lord Epoch TimeWarp3'),(-2500008,'There is no future for you.','','','F','','','','','',0,1,0,0,'Chrono Lord Epoch Slay1'),(-2500009,'This is the hour of our greatest triumph!','','','Dies ist die Stunde unseres gr','','','','','',0,1,0,0,'Chrono Lord Epoch Slay2'),(-2500010,'You would destined to fail.','','','','','','','','',0,1,0,0,'Chrono Lord Epoch Slay3');
/*!40000 ALTER TABLE `script_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `script_waypoint`
--

DROP TABLE IF EXISTS `script_waypoint`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `script_waypoint` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `script_waypoint`
--

LOCK TABLES `script_waypoint` WRITE;
/*!40000 ALTER TABLE `script_waypoint` DISABLE KEYS */;
INSERT INTO `script_waypoint` VALUES (467,0,-10508.4,1068,55.21,0,''),(467,1,-10518.3,1074.84,53.96,0,''),(467,2,-10534.8,1081.92,49.88,0,''),(467,3,-10546.5,1084.88,50.13,0,''),(467,4,-10555.3,1084.45,45.75,0,''),(467,5,-10566.6,1083.53,42.1,0,''),(467,6,-10575.8,1082.34,39.46,0,''),(467,7,-10585.7,1081.08,37.77,0,''),(467,8,-10600.1,1078.19,36.23,0,''),(467,9,-10608.7,1076.08,35.88,0,''),(467,10,-10621.3,1073,35.4,0,''),(467,11,-10638.1,1060.18,33.61,0,''),(467,12,-10655.9,1038.99,33.48,0,''),(467,13,-10664.7,1030.54,32.7,0,''),(467,14,-10708.7,1033.86,33.32,0,''),(467,15,-10754.4,1017.93,32.79,0,''),(467,16,-10802.3,1018.01,32.16,0,''),(467,17,-10832.6,1009.04,32.71,0,''),(467,18,-10866.6,1006.51,31.71,0,''),(467,19,-10880,1005.1,32.84,0,''),(467,20,-10892.5,1001.32,34.46,0,''),(467,21,-10906.1,997.11,36.15,0,''),(467,22,-10922.3,1002.23,35.74,0,''),(467,23,-10936.3,1023.38,36.52,0,''),(467,24,-10933.3,1052.61,35.85,0,''),(467,25,-10940.3,1077.66,36.49,0,''),(467,26,-10957.1,1099.33,36.83,0,''),(467,27,-10956.5,1119.9,36.73,0,''),(467,28,-10939.3,1150.75,37.42,0,''),(467,29,-10915.1,1202.09,36.55,0,''),(467,30,-10892.6,1257.03,33.37,0,''),(467,31,-10891.9,1306.66,35.45,0,''),(467,32,-10896.2,1327.86,37.77,0,''),(467,33,-10906,1368.05,40.91,0,''),(467,34,-10910.2,1389.33,42.62,0,''),(467,35,-10915.4,1417.72,42.93,0,''),(467,36,-10926.4,1421.18,43.04,0,'walk here and say'),(467,37,-10952.3,1421.74,43.4,0,''),(467,38,-10980,1411.38,42.79,0,''),(467,39,-11006.1,1420.47,43.26,0,''),(467,40,-11022,1450.59,43.09,0,''),(467,41,-11025.4,1491.59,43.15,0,''),(467,42,-11036.1,1508.32,43.28,0,''),(467,43,-11060.7,1526.72,43.19,0,''),(467,44,-11072.8,1527.77,43.2,5000,'say and quest credit'),(1978,0,1406.32,1083.1,52.55,0,''),(1978,1,1400.49,1080.42,52.5,0,'SAY_START_2'),(1978,2,1388.48,1083.1,52.52,0,''),(1978,3,1370.16,1084.02,52.3,0,''),(1978,4,1359.02,1080.85,52.46,0,''),(1978,5,1341.43,1087.39,52.69,0,''),(1978,6,1321.93,1090.51,50.66,0,''),(1978,7,1312.98,1095.91,47.49,0,''),(1978,8,1301.09,1102.94,47.76,0,''),(1978,9,1297.73,1106.35,50.18,0,''),(1978,10,1295.49,1124.32,50.49,0,''),(1978,11,1294.84,1137.25,51.75,0,''),(1978,12,1292.89,1158.99,52.65,0,''),(1978,13,1290.75,1168.67,52.56,2000,'quest complete SAY_END'),(1978,14,1287.12,1203.49,52.66,5000,'SAY_RANE'),(1978,15,1288.3,1203.89,52.68,5000,'SAY_RANE_REPLY'),(1978,16,1288.3,1203.89,52.68,5000,'SAY_CHECK_NEXT'),(1978,17,1290.72,1207.44,52.69,0,''),(1978,18,1297.5,1207.18,53.74,0,''),(1978,19,1301.32,1220.9,53.74,0,''),(1978,20,1298.55,1220.43,53.74,0,''),(1978,21,1297.38,1212.87,58.51,0,''),(1978,22,1297.8,1210.04,58.51,0,''),(1978,23,1305.01,1206.1,58.51,0,''),(1978,24,1310.51,1207.36,58.51,5000,'SAY_QUINN'),(1978,25,1312.59,1207.21,58.51,5000,'SAY_QUINN_REPLY'),(1978,26,1312.59,1207.21,58.51,30000,'SAY_BYE'),(2768,0,-2066.45,-2085.96,9.08,0,''),(2768,1,-2077.99,-2105.33,13.24,0,''),(2768,2,-2074.6,-2109.67,14.24,0,''),(2768,3,-2076.6,-2117.46,16.67,0,''),(2768,4,-2073.51,-2123.46,18.42,2000,''),(2768,5,-2073.51,-2123.46,18.42,4000,''),(2768,6,-2066.6,-2131.85,21.56,0,''),(2768,7,-2053.85,-2143.19,20.31,0,''),(2768,8,-2043.49,-2153.73,20.2,10000,''),(2768,9,-2043.49,-2153.73,20.2,20000,''),(2768,10,-2043.49,-2153.73,20.2,10000,''),(2768,11,-2043.49,-2153.73,20.2,2000,''),(2768,12,-2053.85,-2143.19,20.31,0,''),(2768,13,-2066.6,-2131.85,21.56,0,''),(2768,14,-2073.51,-2123.46,18.42,0,''),(2768,15,-2076.6,-2117.46,16.67,0,''),(2768,16,-2074.6,-2109.67,14.24,0,''),(2768,17,-2077.99,-2105.33,13.24,0,''),(2768,18,-2066.45,-2085.96,9.08,0,''),(2768,19,-2066.41,-2086.21,8.97,6000,''),(2768,20,-2066.41,-2086.21,8.97,2000,''),(2917,0,4675.81,598.615,17.6457,0,'SAY_REM_START'),(2917,1,4672.84,599.325,16.4176,0,''),(2917,2,4663.45,607.43,10.4948,0,''),(2917,3,4655.97,613.761,8.52327,0,''),(2917,4,4640.8,623.999,8.37705,0,''),(2917,5,4631.68,630.801,6.415,5000,'SAY_REM_RAMP1_1'),(2917,6,4633.53,632.476,6.50983,0,'ambush'),(2917,7,4639.41,637.121,13.3381,0,''),(2917,8,4642.35,637.668,13.4374,0,''),(2917,9,4645.08,634.464,13.4372,5000,'SAY_REM_RAMP1_2'),(2917,10,4642.35,637.585,13.4352,0,''),(2917,11,4639.63,637.234,13.3398,0,''),(2917,12,4633.36,632.462,6.48844,0,''),(2917,13,4624.71,631.724,6.26403,0,''),(2917,14,4623.53,629.719,6.20134,5000,'SAY_REM_BOOK'),(2917,15,4623.45,630.37,6.21894,0,'SAY_REM_TENT1_1'),(2917,16,4622.62,637.222,6.31285,0,'ambush'),(2917,17,4619.76,637.386,6.31205,5000,'SAY_REM_TENT1_2'),(2917,18,4620.03,637.368,6.31205,0,''),(2917,19,4624.15,637.56,6.3139,0,''),(2917,20,4622.97,634.016,6.29498,0,''),(2917,21,4616.93,630.303,6.23919,0,''),(2917,22,4614.55,616.983,5.68764,0,''),(2917,23,4610.28,610.029,5.44254,0,''),(2917,24,4601.15,604.112,2.05486,0,''),(2917,25,4589.62,597.686,1.05715,0,''),(2917,26,4577.59,592.146,1.12019,0,'SAY_REM_MOSS (?)'),(2917,27,4569.85,592.177,1.26087,5000,'EMOTE_REM_MOSS (?)'),(2917,28,4568.79,590.871,1.21134,3000,'SAY_REM_MOSS_PROGRESS (?)'),(2917,29,4566.72,564.078,1.34308,0,'ambush'),(2917,30,4568.27,551.958,5.0042,0,''),(2917,31,4566.73,551.558,5.42631,5000,'SAY_REM_PROGRESS'),(2917,32,4566.74,560.768,1.70326,0,''),(2917,33,4573.92,582.566,0.749801,0,''),(2917,34,4594.21,598.533,1.03406,0,''),(2917,35,4601.19,604.283,2.06015,0,''),(2917,36,4609.54,610.845,5.40222,0,''),(2917,37,4624.8,618.076,5.85154,0,''),(2917,38,4632.41,623.778,7.28624,0,''),(2917,39,4645.92,621.984,8.57997,0,''),(2917,40,4658.67,611.093,8.89175,0,''),(2917,41,4671.92,599.752,16.0124,5000,'SAY_REM_REMEMBER'),(2917,42,4676.98,600.65,17.8257,5000,'EMOTE_REM_END'),(3439,0,1109.15,-3104.11,82.41,5000,''),(3439,1,1105.39,-3102.86,82.74,1000,'SAY_STARTUP1'),(3439,2,1104.97,-3108.52,83.1,1000,''),(3439,3,1110.01,-3110.48,82.81,1000,''),(3439,4,1111.72,-3103.03,82.21,1000,''),(3439,5,1106.98,-3099.44,82.18,1000,''),(3439,6,1103.74,-3103.29,83.05,1000,''),(3439,7,1112.55,-3106.56,82.31,1000,''),(3439,8,1108.12,-3111.04,82.99,1000,''),(3439,9,1109.32,-3100.39,82.08,1000,''),(3439,10,1109.32,-3100.39,82.08,5000,'SAY_STARTUP2'),(3439,11,1098.92,-3095.14,82.97,0,''),(3439,12,1100.94,-3082.6,82.83,0,''),(3439,13,1101.12,-3068.83,82.53,0,''),(3439,14,1096.97,-3051.99,82.5,0,''),(3439,15,1094.06,-3036.79,82.7,0,''),(3439,16,1098.22,-3027.84,83.79,0,''),(3439,17,1109.51,-3015.92,85.73,0,''),(3439,18,1119.87,-3007.21,87.08,0,''),(3439,19,1130.23,-3002.49,91.27,5000,''),(3439,20,1130.23,-3002.49,91.27,3000,''),(3439,21,1130.23,-3002.49,91.27,4000,'SAY_PROGRESS_1'),(3439,22,1129.73,-2985.89,92.46,0,''),(3439,23,1124.1,-2983.29,92.81,0,''),(3439,24,1111.74,-2992.38,91.59,0,''),(3439,25,1111.06,-2976.54,91.81,0,''),(3439,26,1099.91,-2991.17,91.67,0,''),(3439,27,1096.32,-2981.55,91.73,8000,'SAY_PROGRESS_2'),(3439,28,1091.28,-2985.82,91.74,5000,'SAY_PROGRESS_3'),(3439,29,1091.28,-2985.82,91.74,0,''),(3439,30,1091.28,-2985.82,91.74,5000,'SAY_END'),(3439,31,1091.28,-2985.82,91.74,180000,''),(3849,0,-250.923,2116.26,81.179,0,'SAY_FREE_AD'),(3849,1,-255.049,2119.39,81.179,0,''),(3849,2,-254.129,2123.45,81.179,0,''),(3849,3,-253.898,2130.87,81.179,0,''),(3849,4,-249.889,2142.31,86.972,0,''),(3849,5,-248.205,2144.02,87.013,0,''),(3849,6,-240.553,2140.55,87.012,0,''),(3849,7,-237.514,2142.07,87.012,0,''),(3849,8,-235.638,2149.23,90.587,0,''),(3849,9,-237.188,2151.95,90.624,0,''),(3849,10,-241.162,2153.65,90.624,0,'SAY_OPEN_DOOR_AD'),(3849,11,-241.13,2154.56,90.624,5000,''),(3849,12,-241.13,2154.56,90.624,5000,'SAY_POST1_DOOR_AD'),(3849,13,-241.13,2154.56,90.624,25000,'SAY_POST2_DOOR_AD'),(3850,0,-241.817,2122.9,81.179,0,'SAY_FREE_AS'),(3850,1,-247.139,2124.89,81.179,0,''),(3850,2,-253.179,2127.41,81.179,0,''),(3850,3,-253.898,2130.87,81.179,0,''),(3850,4,-249.889,2142.31,86.972,0,''),(3850,5,-248.205,2144.02,87.013,0,''),(3850,6,-240.553,2140.55,87.012,0,''),(3850,7,-237.514,2142.07,87.012,0,''),(3850,8,-235.638,2149.23,90.587,0,''),(3850,9,-237.188,2151.95,90.624,0,''),(3850,10,-241.162,2153.65,90.624,0,'SAY_OPEN_DOOR_AS'),(3850,11,-241.13,2154.56,90.624,5000,'cast'),(3850,12,-241.13,2154.56,90.624,5000,'SAY_POST_DOOR_AS'),(3850,13,-241.13,2154.56,90.624,25000,''),(6182,0,-11480.7,1545.09,49.8986,0,''),(6182,1,-11466.8,1530.15,50.2636,0,''),(6182,2,-11465.2,1528.34,50.9544,0,'entrance hut'),(6182,3,-11463,1525.24,50.9377,0,''),(6182,4,-11461,1526.61,50.9377,5000,'pick up rifle'),(6182,5,-11463,1525.24,50.9377,0,''),(6182,6,-11465.2,1528.34,50.9544,0,''),(6182,7,-11468.4,1535.08,50.4009,15000,'hold, prepare for wave1'),(6182,8,-11468.4,1535.08,50.4009,15000,'hold, prepare for wave2'),(6182,9,-11468.4,1535.08,50.4009,10000,'hold, prepare for wave3'),(6182,10,-11467.9,1532.46,50.3489,0,'we are done'),(6182,11,-11466.1,1529.86,50.2094,0,''),(6182,12,-11463,1525.24,50.9377,0,''),(6182,13,-11461,1526.61,50.9377,5000,'deliver rifle'),(6182,14,-11463,1525.24,50.9377,0,''),(6182,15,-11465.2,1528.34,50.9544,0,''),(6182,16,-11470.3,1537.28,50.3785,0,''),(6182,17,-11475.6,1548.68,50.1844,0,'complete quest'),(6182,18,-11482.3,1557.41,48.6245,0,''),(6575,0,1945.81,-431.54,16.36,0,''),(6575,1,1946.21,-436.41,16.36,0,''),(6575,2,1950.01,-444.11,14.63,0,''),(6575,3,1956.08,-449.34,13.12,0,''),(6575,4,1966.59,-450.55,11.27,0,''),(6575,5,1976.09,-447.51,11.27,0,''),(6575,6,1983.42,-435.85,11.27,0,''),(6575,7,1978.17,-428.81,11.27,0,''),(6575,8,1973.97,-422.08,9.04,0,''),(6575,9,1963.84,-418.9,6.17,0,''),(6575,10,1961.22,-422.74,6.17,0,''),(6575,11,1964.8,-431.26,6.17,300000,''),(7784,0,-8845.65,-4373.98,43.87,5000,'SAY_START'),(7784,1,-8840.79,-4373.73,44.24,0,''),(7784,2,-8837.43,-4373.56,45.6,0,''),(7784,3,-8832.74,-4373.32,45.68,0,''),(7784,4,-8829.37,-4373.14,44.33,0,''),(7784,5,-8817.38,-4372.41,35.58,0,''),(7784,6,-8803.47,-4371.6,30.34,0,''),(7784,7,-8795.1,-4365.61,26.08,0,''),(7784,8,-8766.78,-4367.13,25.15,0,''),(7784,9,-8755.63,-4367.54,24.63,0,''),(7784,10,-8754.42,-4365.59,24.15,0,''),(7784,11,-8728.82,-4353.13,20.9,0,''),(7784,12,-8706.6,-4356.55,17.93,0,''),(7784,13,-8679,-4380.23,12.64,0,''),(7784,14,-8642.96,-4393.82,12.52,0,''),(7784,15,-8611.19,-4399.11,9.55,0,''),(7784,16,-8554.87,-4409.32,13.05,0,''),(7784,17,-8531.64,-4411.96,11.2,0,''),(7784,18,-8510.4,-4414.38,12.84,0,''),(7784,19,-8476.92,-4418.34,9.71,0,''),(7784,20,-8435.89,-4426.74,9.67,0,''),(7784,21,-8381.89,-4446.4,10.23,0,''),(7784,22,-8351.15,-4447.79,9.99,5000,'first ambush SAY_AMBUSH'),(7784,23,-8324.18,-4445.05,9.71,0,''),(7784,24,-8138.94,-4384.78,10.92,0,''),(7784,25,-8036.87,-4443.38,9.65,0,''),(7784,26,-7780.92,-4761.81,9.5,0,''),(7784,27,-7587.67,-4765.01,8.96,0,''),(7784,28,-7497.65,-4792.86,10.01,0,'second ambush SAY_AMBUSH'),(7784,29,-7391.54,-4774.26,12.44,0,''),(7784,30,-7308.42,-4739.87,12.65,0,''),(7784,31,-7016.11,-4751.12,10.06,0,''),(7784,32,-6985.52,-4777.41,10.26,0,''),(7784,33,-6953.02,-4786,6.32,0,''),(7784,34,-6940.37,-4831.03,0.67,10000,'quest complete SAY_END'),(7807,0,-4943.74,1715.74,62.74,0,'SAY_START'),(7807,1,-4944.93,1706.66,63.16,0,''),(7807,2,-4942.82,1690.22,64.25,0,''),(7807,3,-4946.47,1669.62,63.84,0,''),(7807,4,-4955.93,1651.88,63,0,''),(7807,5,-4967.58,1643.86,64.31,0,''),(7807,6,-4978.12,1607.9,64.3,0,''),(7807,7,-4975.38,1596.16,64.7,0,''),(7807,8,-4972.82,1581.89,61.75,0,''),(7807,9,-4958.65,1581.05,61.81,0,''),(7807,10,-4936.72,1594.89,65.96,0,''),(7807,11,-4885.69,1598.1,67.45,4000,'first ambush SAY_AMBUSH'),(7807,12,-4874.2,1601.73,68.54,0,''),(7807,13,-4816.64,1594.47,78.2,0,''),(7807,14,-4802.2,1571.92,87.01,0,''),(7807,15,-4746.4,1576.11,84.59,0,''),(7807,16,-4739.72,1707.16,94.04,0,''),(7807,17,-4674.03,1840.44,89.17,0,''),(7807,18,-4667.94,1864.11,85.18,0,''),(7807,19,-4668.08,1886.39,81.14,0,''),(7807,20,-4679.43,1932.32,73.76,0,''),(7807,21,-4674.17,1946.66,70.83,5000,'second ambush SAY_AMBUSH'),(7807,22,-4643.94,1967.45,65.27,0,''),(7807,23,-4595.6,2010.75,52.1,0,''),(7807,24,-4562.65,2029.28,45.41,0,''),(7807,25,-4538.56,2032.65,45.28,0,''),(7807,26,-4531.96,2034.15,48.34,0,''),(7807,27,-4507.75,2039.32,51.57,0,''),(7807,28,-4482.74,2045.67,48.15,0,''),(7807,29,-4460.87,2051.54,45.55,0,''),(7807,30,-4449.97,2060.03,45.51,10000,'third ambush SAY_AMBUSH'),(7807,31,-4448.99,2079.05,44.64,0,''),(7807,32,-4436.64,2134.48,28.83,0,''),(7807,33,-4429.25,2170.2,15.44,0,''),(7807,34,-4424.83,2186.11,11.48,0,''),(7807,35,-4416.71,2209.76,7.36,0,''),(7807,36,-4405.25,2231.77,5.94,0,''),(7807,37,-4377.61,2265.45,6.71,15000,'complete quest SAY_END'),(9503,0,883.295,-188.926,-43.7037,0,''),(9503,1,872.764,-185.606,-43.7037,5000,'b1'),(9503,2,867.923,-188.006,-43.7037,5000,'b2'),(9503,3,863.296,-190.795,-43.7037,5000,'b3'),(9503,4,856.14,-194.653,-43.7037,5000,'b4'),(9503,5,851.879,-196.928,-43.7037,15000,'b5'),(9503,6,877.035,-187.048,-43.7037,0,''),(9503,7,891.198,-197.924,-43.6204,0,'home'),(10096,0,604.803,-191.082,-54.0586,0,'ring'),(10096,1,604.073,-222.107,-52.7438,0,'first gate'),(10096,2,621.4,-214.499,-52.8145,0,'hiding in corner'),(10096,3,601.301,-198.557,-53.9503,0,'ring'),(10096,4,631.818,-180.548,-52.6548,0,'second gate'),(10096,5,627.39,-201.076,-52.6929,0,'hiding in corner'),(12423,0,-9509.72,-147.03,58.74,0,''),(12423,1,-9517.07,-172.82,58.66,0,''),(12427,0,-5689.2,-456.44,391.08,0,''),(12427,1,-5700.37,-450.77,393.19,0,''),(12428,0,2454.09,361.26,31.51,0,''),(12428,1,2472.03,378.08,30.98,0,''),(12429,0,9654.19,909.58,1272.11,0,''),(12429,1,9642.53,908.11,1269.1,0,''),(12430,0,161.65,-4779.34,14.64,0,''),(12430,1,140.71,-4813.56,17.04,0,''),(12818,0,3347.25,-694.701,159.926,0,''),(12818,1,3341.53,-694.726,161.125,4000,''),(12818,2,3338.35,-686.088,163.444,0,''),(12818,3,3352.74,-677.722,162.316,0,''),(12818,4,3370.29,-669.367,160.751,0,''),(12818,5,3381.48,-659.449,162.545,0,''),(12818,6,3389.55,-648.5,163.652,0,''),(12818,7,3396.65,-641.509,164.216,0,''),(12818,8,3410.5,-634.3,165.773,0,''),(12818,9,3418.46,-631.792,166.478,0,''),(12818,10,3429.5,-631.589,166.921,0,''),(12818,11,3434.95,-629.245,168.334,0,''),(12818,12,3438.93,-618.503,171.503,0,''),(12818,13,3444.22,-609.294,173.078,1000,'Ambush 1'),(12818,14,3460.51,-593.794,174.342,0,''),(12818,15,3480.28,-578.21,176.652,0,''),(12818,16,3492.91,-562.335,181.396,0,''),(12818,17,3495.23,-550.978,184.652,0,''),(12818,18,3496.25,-529.194,188.172,0,''),(12818,19,3497.62,-510.411,188.345,1000,'Ambush 2'),(12818,20,3498.5,-497.788,185.806,0,''),(12818,21,3484.22,-489.718,182.39,4000,''),(12858,0,1782.63,-2241.11,109.73,5000,''),(12858,1,1788.88,-2240.17,111.71,0,''),(12858,2,1797.49,-2238.11,112.31,0,''),(12858,3,1803.83,-2232.77,111.22,0,''),(12858,4,1806.65,-2217.83,107.36,0,''),(12858,5,1811.81,-2208.01,107.45,0,''),(12858,6,1820.85,-2190.82,100.49,0,''),(12858,7,1829.6,-2177.49,96.44,0,''),(12858,8,1837.98,-2164.19,96.71,0,'prepare'),(12858,9,1839.99,-2149.29,96.78,0,''),(12858,10,1835.14,-2134.98,96.8,0,''),(12858,11,1823.57,-2118.27,97.43,0,''),(12858,12,1814.99,-2110.35,98.38,0,''),(12858,13,1806.6,-2103.09,99.19,0,''),(12858,14,1798.27,-2095.77,100.04,0,''),(12858,15,1783.59,-2079.92,100.81,0,''),(12858,16,1776.79,-2069.48,101.77,0,''),(12858,17,1776.82,-2054.59,109.82,0,''),(12858,18,1776.88,-2047.56,109.83,0,''),(12858,19,1776.86,-2036.55,109.83,0,''),(12858,20,1776.9,-2024.56,109.83,0,'win'),(12858,21,1776.87,-2028.31,109.83,60000,'stay'),(12858,22,1776.9,-2028.3,109.83,0,''),(15420,0,9294.78,-6682.51,22.42,0,''),(15420,1,9298.27,-6667.99,22.42,0,''),(15420,2,9309.63,-6658.84,22.43,0,''),(15420,3,9304.43,-6649.31,26.46,0,''),(15420,4,9298.83,-6648,28.61,0,''),(15420,5,9291.06,-6653.46,31.83,2500,''),(15420,6,9289.08,-6660.17,31.85,5000,''),(15420,7,9291.06,-6653.46,31.83,0,''),(16295,0,7545.07,-7359.87,162.354,4000,'SAY_START'),(16295,1,7550.05,-7362.24,162.236,0,''),(16295,2,7566.98,-7364.32,161.739,0,''),(16295,3,7578.83,-7361.68,161.739,0,''),(16295,4,7590.97,-7359.05,162.258,0,''),(16295,5,7598.35,-7362.82,162.257,4000,'SAY_PROGRESS_1'),(16295,6,7605.86,-7380.42,161.937,0,''),(16295,7,7605.3,-7387.38,157.254,0,''),(16295,8,7606.13,-7393.89,156.942,0,''),(16295,9,7615.21,-7400.19,157.143,0,''),(16295,10,7618.96,-7402.65,158.202,0,''),(16295,11,7636.85,-7401.76,162.145,0,'SAY_PROGRESS_2'),(16295,12,7637.06,-7404.94,162.207,4000,''),(16295,13,7636.91,-7412.59,162.366,0,''),(16295,14,7637.61,-7425.59,162.631,0,''),(16295,15,7637.82,-7459.06,163.303,0,''),(16295,16,7638.86,-7470.9,162.517,0,''),(16295,17,7641.4,-7488.22,157.381,0,''),(16295,18,7634.46,-7505.45,154.682,0,'SAY_PROGRESS_3'),(16295,19,7631.91,-7516.95,153.597,0,''),(16295,20,7622.23,-7537.04,151.587,0,''),(16295,21,7610.92,-7550.67,149.639,0,''),(16295,22,7598.23,-7562.55,145.954,0,''),(16295,23,7588.51,-7577.76,148.294,0,''),(16295,24,7567.34,-7608.46,146.006,0,''),(16295,25,7562.55,-7617.42,148.098,0,''),(16295,26,7561.51,-7645.06,151.245,0,''),(16295,27,7563.34,-7654.65,151.227,0,''),(16295,28,7565.53,-7658.3,151.249,0,''),(16295,39,7571.16,-7659.12,151.245,0,''),(16295,30,7579.12,-7662.21,151.652,0,'quest complete'),(16295,31,7603.77,-7667,153.998,0,''),(16295,32,7603.77,-7667,153.998,4000,'SAY_END_1'),(16295,33,7603.77,-7667,153.998,8000,'SAY_END_2'),(16295,34,7603.77,-7667,153.998,0,''),(16993,0,-1137.72,4272.1,14.04,5000,''),(16993,1,-1141.34,4232.42,14.63,0,''),(16993,2,-1133.47,4220.88,11.78,0,''),(16993,3,-1126.18,4213.26,13.51,0,''),(16993,4,-1100.12,4204.32,16.41,0,''),(16993,5,-1063.68,4197.92,15.51,0,''),(16993,6,-1027.28,4194.36,15.52,0,''),(16993,7,-995.68,4189.59,19.84,0,''),(16993,8,-970.9,4188.6,24.61,0,''),(16993,9,-961.93,4193.34,26.11,15000,'Summon 1'),(16993,10,-935.52,4210.99,31.98,0,''),(16993,11,-913.42,4218.27,37.29,0,''),(16993,12,-896.53,4207.73,43.23,0,''),(16993,13,-868.49,4194.77,46.75,30000,'Kneel and Rest Here'),(16993,14,-852.83,4198.29,47.28,15000,'Summon 2'),(16993,15,-819.85,4200.5,46.37,0,''),(16993,16,-791.92,4201.96,44.19,0,''),(16993,17,-774.42,4202.46,47.41,0,''),(16993,18,-762.9,4202.17,48.81,0,''),(16993,19,-728.25,4195.35,50.68,0,''),(16993,20,-713.58,4192.07,53.98,0,''),(16993,21,-703.09,4189.74,56.96,0,''),(16993,22,-693.7,4185.43,57.06,0,''),(16993,23,-686.38,4159.81,60.26,0,''),(16993,24,-679.88,4147.04,64.2,0,''),(16993,25,-656.74,4147.72,64.11,0,''),(16993,26,-652.22,4137.5,64.58,0,''),(16993,27,-649.99,4136.38,64.63,30000,'Quest Credit'),(17312,0,-4784.53,-11051.1,3.48426,0,''),(17312,1,-4805.51,-11037.3,3.04394,0,''),(17312,2,-4827.83,-11034.4,1.74196,0,''),(17312,3,-4852.63,-11033.7,2.20866,0,''),(17312,4,-4876.79,-11034.5,3.17523,0,''),(17312,5,-4895.49,-11038.3,9.39089,0,''),(17312,6,-4915.46,-11048.4,12.3698,0,''),(17312,7,-4937.29,-11067,13.858,0,''),(17312,8,-4966.58,-11067.5,15.7548,0,''),(17312,9,-4993.8,-11056.5,19.1753,0,''),(17312,10,-5017.84,-11052.6,22.4766,0,''),(17312,11,-5039.71,-11058.5,25.8316,0,''),(17312,12,-5057.29,-11045.5,26.9725,0,''),(17312,13,-5078.83,-11037.6,29.0534,0,''),(17312,14,-5104.16,-11039.2,29.4402,0,''),(17312,15,-5120.78,-11039.5,30.1421,0,''),(17312,16,-5140.83,-11039.8,28.7881,0,''),(17312,17,-5161.2,-11040.1,27.8795,4000,''),(17312,18,-5171.84,-11046.8,27.1838,0,''),(17312,19,-5186,-11056.4,20.2349,0,''),(17312,20,-5198.49,-11065.1,18.8726,0,''),(17312,21,-5214.06,-11074.7,19.2157,0,''),(17312,22,-5220.16,-11088.4,19.8185,0,''),(17312,23,-5233.65,-11098.8,18.3494,0,''),(17312,24,-5250.16,-11111.7,16.439,0,''),(17312,25,-5268.19,-11125.6,12.6683,0,''),(17312,26,-5286.27,-11130.7,6.91225,0,''),(17312,27,-5317.45,-11137.4,4.96345,0,''),(17312,28,-5334.85,-11154.4,6.74266,0,''),(17312,29,-5353.87,-11171.6,6.90391,20000,''),(17312,30,-5354.24,-11171.9,6.89,0,''),(17876,0,2230.91,118.765,82.2947,5000,''),(17876,1,2230.33,114.98,82.2946,0,''),(17876,2,2233.36,111.057,82.2996,0,''),(17876,3,2231.17,108.486,82.6624,0,''),(17876,4,2220.22,114.605,89.4264,0,''),(17876,5,2215.23,115.99,89.4549,0,''),(17876,6,2210,106.849,89.4549,0,''),(17876,7,2205.66,105.234,89.4549,0,''),(17876,8,2192.26,112.618,89.4549,0,'spawn armorer'),(17876,9,2181.28,118.612,89.4549,8000,'get weapon'),(17876,10,2181.62,120.385,89.4549,5000,'get armor'),(17876,11,2189.44,113.922,89.4549,0,''),(17876,12,2195.63,110.584,89.4549,0,''),(17876,13,2201.09,115.115,89.4549,0,''),(17876,14,2204.34,121.036,89.4355,0,''),(17876,15,2208.66,129.127,87.956,0,'first ambush'),(17876,16,2193.09,137.94,88.2164,0,''),(17876,17,2173.39,149.064,87.9227,0,''),(17876,18,2164.25,137.965,85.0595,0,''),(17876,19,2149.31,125.645,77.0858,0,''),(17876,20,2142.78,127.173,75.5954,0,''),(17876,21,2139.28,133.952,73.6386,0,'second ambush'),(17876,22,2139.54,155.235,67.1269,0,''),(17876,23,2145.38,167.551,64.8974,0,''),(17876,24,2134.28,175.304,67.9446,0,''),(17876,25,2118.08,187.387,68.8141,0,''),(17876,26,2105.88,195.461,65.1854,0,'third ambush'),(17876,27,2096.77,196.939,65.2117,0,''),(17876,28,2083.9,209.395,64.8736,0,''),(17876,29,2067.84,224.376,64.8022,30000,'meeting scarloc'),(17876,30,2055.4,242.9,63.3418,0,'after skarloc'),(17876,31,2039.2,266.46,63.0182,10000,'mount up'),(17876,32,2011.77,278.478,65.3388,0,''),(17876,33,2005.08,289.676,66.1179,0,''),(17876,34,2033.11,337.45,66.0948,0,''),(17876,35,2070.3,416.208,66.0893,0,''),(17876,36,2086.76,469.768,65.9182,0,''),(17876,37,2101.7,497.955,61.7881,0,'road ambush'),(17876,38,2133.39,530.933,55.37,5000,''),(17876,39,2157.91,559.635,48.5157,0,''),(17876,40,2167.34,586.191,42.4394,0,''),(17876,41,2174.17,637.643,33.9002,0,''),(17876,42,2179.31,656.053,34.723,0,''),(17876,43,2183.65,670.941,34.0318,0,''),(17876,44,2201.5,668.616,36.1236,0,''),(17876,45,2221.56,652.747,36.6153,0,''),(17876,46,2238.97,640.125,37.2214,0,''),(17876,47,2251.17,620.574,40.1473,0,''),(17876,48,2261.98,595.303,41.4117,0,''),(17876,49,2278.67,560.172,38.909,0,''),(17876,50,2336.72,528.327,40.9369,0,''),(17876,51,2381.04,519.612,37.7312,0,''),(17876,52,2412.2,515.425,39.2068,0,''),(17876,53,2452.39,516.174,42.9387,0,''),(17876,54,2467.38,539.389,47.4992,0,''),(17876,55,2470.7,554.333,46.6668,0,''),(17876,56,2478.07,575.321,55.4549,0,''),(17876,57,2480,585.408,56.6921,0,''),(17876,58,2482.67,608.817,55.6643,0,''),(17876,59,2485.62,626.061,58.0132,2000,'dismount'),(17876,60,2486.91,626.356,58.0761,0,'scare horse'),(17876,61,2488.58,660.94,57.3913,0,''),(17876,62,2502.56,686.059,55.6252,0,''),(17876,63,2502.08,694.36,55.5083,0,''),(17876,64,2491.46,694.321,55.7163,0,''),(17876,65,2491.1,703.3,55.763,0,''),(17876,66,2485.64,702.992,55.7917,0,''),(17876,67,2479.1,695.291,55.7901,10000,''),(17876,68,2476.75,693.689,55.796,0,'spawn mobs'),(17876,69,2475.39,695.983,55.8146,0,''),(17876,70,2477.75,694.473,55.7945,0,''),(17876,71,2481.27,697.747,55.791,0,'mobs in doorway'),(17876,72,2486.31,703.131,55.7861,5000,''),(17876,73,2490.76,703.511,55.7662,0,''),(17876,74,2491.3,694.792,55.7195,0,''),(17876,75,2518.69,693.876,55.1383,0,''),(17876,76,2531.33,681.914,55.1383,0,''),(17876,77,2568.25,682.654,55.1778,0,''),(17876,78,2589.61,689.981,55.1421,0,''),(17876,79,2634.74,679.833,54.6613,0,''),(17876,80,2630.41,661.464,54.2761,0,''),(17876,81,2629,656.982,56.0651,0,''),(17876,82,2620.84,633.007,56.03,3000,'stop in church'),(17876,83,2622.99,639.178,56.03,0,'summon'),(17876,84,2628.73,656.693,56.061,5000,''),(17876,85,2630.34,661.135,54.2738,0,''),(17876,86,2635.38,672.243,54.4508,0,''),(17876,87,2644.13,668.158,55.3797,0,''),(17876,88,2646.82,666.74,56.9898,0,''),(17876,89,2658.22,665.432,57.1725,0,''),(17876,90,2661.88,674.849,57.1725,0,''),(17876,91,2656.23,677.208,57.1725,0,''),(17876,92,2652.28,670.27,61.9353,0,''),(17876,93,2650.79,664.29,61.9302,0,'summon inn'),(17876,94,2658.19,660.454,61.932,5000,''),(17876,95,2660.57,659.173,61.937,0,'speak with Taretha'),(17876,96,2658.19,660.454,61.932,5000,'epoch calls'),(17876,97,2659.84,659.482,61.9361,5000,'taretha \"dies\"'),(17876,98,2654.28,662.722,61.9313,0,''),(17876,99,2652.37,670.561,61.9368,0,''),(17876,100,2656.05,676.761,57.1727,0,''),(17876,101,2658.49,677.166,57.1727,0,''),(17876,102,2659.28,667.117,57.1727,0,''),(17876,103,2649.71,665.387,57.1727,0,''),(17876,104,2634.79,672.964,54.4577,0,'outside inn'),(17876,105,2635.06,673.892,54.4713,30000,'getting ready'),(17876,106,2634.79,672.964,54.4577,60000,'when all dead and meet Taretha'),(17876,107,2631.72,665.629,54.2923,0,'run off'),(17876,108,2647.4,640.53,55.7634,0,''),(17969,0,-930.049,5288.08,23.8484,0,''),(17969,1,-925.678,5296.48,18.1837,0,''),(17969,2,-924.297,5299.02,17.7109,0,''),(17969,3,-928.39,5317.02,18.2086,0,''),(17969,4,-930.621,5329.92,18.7734,0,'SAY_AMBUSH1'),(17969,5,-931.49,5357.65,18.0272,0,'SAY_PROGRESS'),(17969,6,-934.778,5369.34,22.278,0,''),(17969,7,-934.522,5373.41,22.8347,0,''),(17969,8,-937.009,5382.98,22.6991,0,''),(17969,9,-941.948,5404.14,22.6697,0,''),(17969,10,-931.244,5415.85,23.064,0,'at crossroad'),(17969,11,-901.498,5420.32,24.2133,0,''),(17969,12,-860.312,5415.62,23.6711,0,''),(17969,13,-777.989,5391.98,23.0017,0,''),(17969,14,-750.362,5385.79,22.7658,0,''),(17969,15,-731.339,5382.45,22.5171,0,''),(17969,16,-681.236,5381.38,22.0502,2500,'end bridge SAY_AMBUSH2'),(17969,17,-637.944,5384.34,22.2056,0,'SAY_END'),(17969,18,-608.954,5408.72,21.6304,0,''),(17969,19,-598.134,5413.61,21.4123,0,''),(17969,20,-571.269,5420.77,21.1849,0,''),(17969,21,-553.1,5424.62,21.1937,0,''),(17969,22,-524.745,5443.95,20.977,0,''),(17969,23,-502.985,5446.28,22.1494,0,''),(17969,24,-472.464,5449.55,22.5615,0,''),(17969,25,-454.533,5461.3,22.6028,30000,'quest complete'),(18887,0,2650.06,665.473,61.9305,0,''),(18887,1,2652.44,670.761,61.937,0,''),(18887,2,2655.96,676.913,57.1725,0,''),(18887,3,2659.4,677.317,57.1725,0,''),(18887,4,2651.75,664.482,57.1725,0,''),(18887,5,2647.49,666.595,57.0824,0,''),(18887,6,2644.37,668.167,55.4182,0,''),(18887,7,2640.96,669.89,54.7567,60000,''),(19685,0,-1863.37,5419.52,-10.4637,5000,''),(19685,1,-1861.75,5416.47,-10.5081,0,''),(19685,2,-1857.04,5410.97,-12.428,0,''),(19685,3,-1831.54,5365.47,-12.428,0,''),(19685,4,-1813.42,5333.78,-12.428,0,''),(19685,5,-1800.35,5313.29,-12.428,0,''),(19685,6,-1775.62,5268.79,-38.8092,0,''),(19685,7,-1770.15,5259.27,-38.8292,0,''),(19685,8,-1762.81,5261.1,-38.849,0,''),(19685,9,-1740.11,5268.86,-40.209,0,''),(19685,10,-1725.84,5270.94,-40.209,0,''),(19685,11,-1701.58,5290.32,-40.2092,0,''),(19685,12,-1682.88,5291.41,-34.4296,0,''),(19685,13,-1670.1,5291.2,-32.786,0,''),(19685,14,-1656.67,5294.33,-37.8626,0,''),(19685,15,-1652.04,5295.41,-40.2455,0,''),(19685,16,-1620.86,5300.13,-40.209,0,''),(19685,17,-1607.63,5293.98,-38.577,5000,''),(19685,18,-1607.63,5293.98,-38.577,5000,''),(19685,19,-1607.63,5293.98,-38.577,5000,''),(19685,20,-1622.14,5301.96,-40.2089,0,''),(19685,21,-1621.13,5333.11,-40.2089,0,''),(19685,22,-1637.6,5342.13,-40.2088,0,''),(19685,23,-1648.52,5352.31,-47.4962,0,''),(19685,24,-1654.61,5357.42,-45.8709,0,''),(19685,25,-1633.67,5422.07,-42.8355,0,''),(19685,26,-1656.57,5426.24,-40.4058,0,''),(19685,27,-1664.93,5425.69,-38.8464,0,''),(19685,28,-1681.41,5425.87,-38.8109,0,''),(19685,29,-1730.88,5427.41,-12.4279,0,''),(19685,30,-1743.51,5369.6,-12.4279,0,''),(19685,31,-1877.22,5303.71,-12.428,0,''),(19685,32,-1890.37,5289.27,-12.4283,0,''),(19685,33,-1905.51,5266.53,2.63067,0,''),(19685,34,-1909.38,5273.01,1.66371,10000,''),(19685,35,-1909.38,5273.01,1.66371,12000,''),(19685,36,-1909.38,5273.01,1.66371,8000,''),(19685,37,-1909.38,5273.01,1.66371,15000,''),(19685,38,-1927.56,5275.32,1.98499,0,''),(19685,39,-1927.39,5300.88,-12.4272,0,''),(19685,40,-1921.06,5314.32,-12.4272,0,''),(19685,41,-1965.43,5379.3,-12.4272,0,''),(19685,42,-1981.23,5450.74,-12.4272,0,''),(19685,43,-1958.02,5455.9,0.487659,0,''),(19685,44,-1951.99,5463.58,0.87449,10000,''),(19685,45,-1951.99,5463.58,0.87449,12000,''),(19685,46,-1968.73,5481.75,-12.4278,0,''),(19685,47,-1881.84,5554.04,-12.4278,0,''),(19685,48,-1841.57,5545.97,-12.4278,0,''),(19685,49,-1837.66,5523.78,0.558756,0,''),(19685,50,-1831.32,5534.82,1.22182,6000,''),(19685,51,-1831.32,5534.82,1.22182,8000,''),(19685,52,-1831.32,5534.82,1.22182,5000,''),(19685,53,-1850.06,5472.61,0.85732,6000,''),(19685,54,-1850.06,5472.61,0.85732,8000,''),(19685,55,-1850.06,5472.61,0.85732,9000,''),(19685,56,-1850.06,5472.61,0.85732,9000,''),(19685,57,-1850.06,5472.61,0.85732,4000,''),(20129,0,-8374.93,-4250.21,-204.38,5000,''),(20129,1,-8374.93,-4250.21,-204.38,16000,''),(20129,2,-8374.93,-4250.21,-204.38,10000,''),(20129,3,-8374.93,-4250.21,-204.38,2000,''),(20129,4,-8439.4,-4180.05,-209.25,0,''),(20129,5,-8437.82,-4120.84,-208.59,10000,''),(20129,6,-8437.82,-4120.84,-208.59,16000,''),(20129,7,-8437.82,-4120.84,-208.59,13000,''),(20129,8,-8437.82,-4120.84,-208.59,18000,''),(20129,9,-8437.82,-4120.84,-208.59,15000,''),(20129,10,-8437.82,-4120.84,-208.59,2000,''),(20129,11,-8467.26,-4198.63,-214.21,0,''),(20129,12,-8667.76,-4252.13,-209.56,0,''),(20129,13,-8703.71,-4234.58,-209.5,14000,''),(20129,14,-8703.71,-4234.58,-209.5,2000,''),(20129,15,-8642.81,-4304.37,-209.57,0,''),(20129,16,-8649.06,-4394.36,-208.46,6000,''),(20129,17,-8649.06,-4394.36,-208.46,18000,''),(20129,18,-8649.06,-4394.36,-208.46,2000,''),(20129,19,-8468.72,-4437.67,-215.45,0,''),(20129,20,-8427.54,-4426,-211.13,0,''),(20129,21,-8364.83,-4393.32,-205.91,0,''),(20129,22,-8304.54,-4357.2,-208.2,18000,''),(20129,23,-8304.54,-4357.2,-208.2,2000,''),(20129,24,-8375.42,-4250.41,-205.14,5000,''),(20129,25,-8375.42,-4250.41,-205.14,5000,''),(22916,0,7461.49,-3121.06,438.21,7000,'SAY_START'),(22916,1,7465.26,-3115.5,439.315,0,''),(22916,2,7470.03,-3109.29,439.333,0,''),(22916,3,7473.77,-3104.65,442.366,0,''),(22916,4,7478.67,-3098.55,443.551,0,''),(22916,5,7482.78,-3093.35,441.883,0,''),(22916,6,7486.23,-3089.19,439.698,0,''),(22916,7,7484.64,-3084.55,439.566,0,''),(22916,8,7477.09,-3084.43,442.132,0,''),(22916,9,7470.66,-3084.86,443.194,0,''),(22916,10,7456.51,-3085.83,438.863,0,''),(22916,11,7446,-3085.59,438.21,0,''),(22916,12,7444.6,-3084.1,438.323,0,''),(22916,13,7445.58,-3080.92,439.374,5000,'collect 1'),(22916,14,7446.18,-3085.36,438.21,5000,'SAY_RELIC1'),(22916,15,7453.9,-3086.69,439.454,0,''),(22916,16,7459.41,-3085.5,439.158,0,''),(22916,17,7465.9,-3085.01,442.329,0,''),(22916,18,7472.8,-3084.81,443.085,0,''),(22916,19,7480.58,-3084.56,440.642,0,''),(22916,20,7484.59,-3084.71,439.568,0,''),(22916,21,7491.81,-3090.55,440.052,0,''),(22916,22,7497.13,-3095.34,437.505,0,''),(22916,23,7496.61,-3113.62,434.554,0,''),(22916,24,7501.79,-3123.79,435.347,0,''),(22916,25,7506.6,-3130.78,434.179,0,''),(22916,26,7504.53,-3133.46,435.579,5000,'collect 2'),(22916,27,7505.2,-3130.03,434.151,15000,'SAY_RELIC2'),(22916,28,7502.04,-3124.44,435.298,0,''),(22916,29,7495.9,-3113.93,434.538,0,''),(22916,30,7488.79,-3111.1,434.31,0,''),(22916,31,7477.81,-3105.37,430.541,0,'summon'),(22916,32,7471.49,-3092.55,429.006,0,''),(22916,33,7472.35,-3062.72,428.341,0,''),(22916,34,7472.26,-3054.92,427.15,0,''),(22916,35,7475.03,-3053.39,428.672,5000,'collect 3'),(22916,36,7472.4,-3057.21,426.87,5000,'SAY_RELIC3'),(22916,37,7472.39,-3062.86,428.301,0,''),(22916,38,7470.24,-3087.69,429.045,0,''),(22916,39,7475.24,-3099.03,429.917,0,''),(22916,40,7484.24,-3109.85,432.719,0,''),(22916,41,7489.1,-3111.31,434.4,0,''),(22916,42,7497.02,-3108.54,434.798,0,''),(22916,43,7497.75,-3097.7,437.031,0,''),(22916,44,7492.53,-3090.12,440.041,0,''),(22916,45,7490.43,-3085.44,439.807,0,''),(22916,46,7501.02,-3069.7,441.875,0,''),(22916,47,7509.15,-3064.67,445.012,0,''),(22916,48,7515.78,-3060.16,445.727,0,''),(22916,49,7516.46,-3058.11,445.682,10000,'quest credit'),(24358,0,121.194,1645.62,42.021,0,''),(24358,1,132.051,1642.18,42.021,5000,'SAY_AT_GONG'),(24358,2,120.671,1636.35,42.415,0,''),(24358,3,120.536,1611.65,43.473,30000,'SAY_OPEN_ENTRANCE');
/*!40000 ALTER TABLE `script_waypoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sd2_db_version`
--

DROP TABLE IF EXISTS `sd2_db_version`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sd2_db_version` (
  `version` varchar(255) NOT NULL DEFAULT '' COMMENT 'Database version string'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sd2_db_version`
--

LOCK TABLES `sd2_db_version` WRITE;
/*!40000 ALTER TABLE `sd2_db_version` DISABLE KEYS */;
INSERT INTO `sd2_db_version` VALUES ('ScriptDev2 (for MaNGOS 7672+) ');
/*!40000 ALTER TABLE `sd2_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_discovery_template`
--

DROP TABLE IF EXISTS `skill_discovery_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skill_discovery_template`
--

LOCK TABLES `skill_discovery_template` WRITE;
/*!40000 ALTER TABLE `skill_discovery_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_discovery_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_extra_item_template`
--

DROP TABLE IF EXISTS `skill_extra_item_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skill_extra_item_template`
--

LOCK TABLES `skill_extra_item_template` WRITE;
/*!40000 ALTER TABLE `skill_extra_item_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_extra_item_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_fishing_base_level`
--

DROP TABLE IF EXISTS `skill_fishing_base_level`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skill_fishing_base_level`
--

LOCK TABLES `skill_fishing_base_level` WRITE;
/*!40000 ALTER TABLE `skill_fishing_base_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_fishing_base_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skinning_loot_template`
--

DROP TABLE IF EXISTS `skinning_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `skinning_loot_template`
--

LOCK TABLES `skinning_loot_template` WRITE;
/*!40000 ALTER TABLE `skinning_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `skinning_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_affect`
--

DROP TABLE IF EXISTS `spell_affect`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_affect` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask0` int(5) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask1` int(5) unsigned NOT NULL DEFAULT '0',
  `SpellClassMask2` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`effectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_affect`
--

LOCK TABLES `spell_affect` WRITE;
/*!40000 ALTER TABLE `spell_affect` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_affect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_area`
--

DROP TABLE IF EXISTS `spell_area`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_area` (
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_start_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint(8) NOT NULL DEFAULT '0',
  `racemask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `autocast` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`quest_start_active`,`aura_spell`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_area`
--

LOCK TABLES `spell_area` WRITE;
/*!40000 ALTER TABLE `spell_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_bonus_data`
--

DROP TABLE IF EXISTS `spell_bonus_data`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_bonus_data` (
  `entry` smallint(5) unsigned NOT NULL,
  `direct_bonus` float NOT NULL DEFAULT '0',
  `dot_bonus` float NOT NULL DEFAULT '0',
  `ap_bonus` float NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_bonus_data`
--

LOCK TABLES `spell_bonus_data` WRITE;
/*!40000 ALTER TABLE `spell_bonus_data` DISABLE KEYS */;
INSERT INTO `spell_bonus_data` VALUES (5185,1.6104,0,0,'Druid - Healing Touch'),(33763,0,0.09518,0,'Druid - Lifebloom'),(774,0,0.37604,0,'Druid - Rejuvenation'),(8936,0.539,0.188,0,'Druid - Regrowth'),(50288,0.05,0,0,'Druid - Starfall'),(50294,0.012,0,0,'Druid - Starfall AOE'),(18562,0,0,0,'Druid - Swiftmend'),(44203,0.538,0,0,'Druid - Tranquility Triggered'),(48438,0,0.11505,0,'Druid - Wild Growth'),(50464,0.6611,0,0,'Druid - Nourish'),(339,0,0.1,0,'Druid - Entangling Roots'),(42231,0.12898,0,0,'Druid - Hurricane Triggered'),(5570,0,0.127,0,'Druid - Insect Swarm'),(8921,0.1515,0.13,0,'Druid - Moonfire'),(2912,1,0,0,'Druid - Starfire'),(5176,0.5714,0,0,'Druid - Wrath'),(30451,0.7143,0,0,'Mage - Arcane Blast'),(1449,0.2128,0,0,'Mage - Arcane Explosion'),(7268,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 1'),(7269,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 2'),(7270,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 3'),(8419,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 4'),(8418,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 5'),(10273,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 6'),(10274,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 7'),(25346,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 8'),(27076,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 9'),(38700,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 10'),(38703,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 11'),(42844,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 12'),(42845,0.2857,0,0,'Mage - Arcane Missiles Triggered Spell Rank 13'),(1463,0.8053,0,0,'Mage - Mana Shield'),(44425,0.8571,0,0,'Mage - Arcane Barrage'),(11113,0.1357,0,0,'Mage - Blast Wave Rank'),(31661,0.1357,0,0,'Mage - Dragons Breath'),(2136,0.4286,0,0,'Mage - Fire Blast'),(133,1,0,0,'Mage - Fire Ball'),(2120,0.2357,0.122,0,'Mage - Flamestrike'),(11366,1.15,0.05,0,'Mage - Pyroblast'),(2948,0.4286,0,0,'Mage - Scorch'),(44614,0.8571,0,0,'Mage - Frostfire Bolt'),(44457,0.4,0.2,0,'Mage - Living Bomb'),(42208,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 1'),(42209,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 2'),(42210,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 3'),(42211,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 4'),(42212,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 5'),(42213,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 6'),(42198,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 7'),(42937,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 8'),(42938,0.0952,0,0,'Mage - Blizzard Triggered Spell Rank 9'),(120,0.1357,0,0,'Mage - Cone of Cold'),(122,0.193,0,0,'Mage - Frost Nova'),(116,0.8143,0,0,'Mage - Frost Bolt'),(11426,0.8053,0,0,'Mage - Ice Barrier'),(30455,0.1429,0,0,'Mage - Ice Lance'),(34913,0,0,0,'Mage - Molten Armor Triggered Rank 1'),(43043,0,0,0,'Mage - Molten Armor Triggered Rank 2'),(43044,0,0,0,'Mage - Molten Armor Triggered Rank 3'),(19750,0.4286,0,0,'Paladin - Flash of Light'),(635,0.7143,0,0,'Paladin - Holy Light'),(25912,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 1'),(25911,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 2'),(25902,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 3'),(27176,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 4'),(33073,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 5'),(48822,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 6'),(48823,0.4286,0,0,'Paladin - Holy Shock Triggered Hurt Rank 7'),(25914,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 1'),(25913,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 2'),(25903,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 3'),(27175,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 4'),(33074,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 5'),(48820,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 6'),(48821,0.4286,0,0,'Paladin - Holy Shock Triggered Heal Rank 7'),(31935,0.07,0,0.07,'Paladin - Avengers Shiled'),(26573,0,0.04,0.04,'Paladin - Consecration'),(879,0.15,0,0.15,'Paladin - Exorcism'),(24275,0.15,0,0.15,'Paladin - Hammer of Wrath'),(20925,0.09,0,0.056,'Paladin - Holy Shield'),(2812,0.07,0,0.07,'Paladin - Holy Wrath'),(31893,0.25,0,0.16,'Paladin - Seal of Blood Enemy Proc'),(32221,0.25,0,0.16,'Paladin - Seal of Blood Self Proc'),(20424,0.25,0,0.16,'Paladin - Seal of Command Proc'),(379,0,0,0,'Shaman - Earth Shield Triggered'),(20167,0.25,0,0.16,'Paladin - Seal of Light Proc'),(53719,0.25,0,0.16,'Paladin - Seal of The Martyr Enemy Proc'),(53718,0.25,0,0.16,'Paladin - Seal of The Martyr Self Proc'),(25742,0.07,0,0.039,'Paladin - Seal of Righteousness Dummy Proc'),(53595,0,0,0,'Paladin - Hammer of the Righteous'),(31803,0,0.013,0.15,'Paladin - Holy Vengeance'),(52042,0.045,0,0,'Shaman - Healing Stream Totem Triggered Heal'),(32546,0.8068,0,0,'Priest - Binding Heal'),(34861,0.402,0,0,'Priest - Circle of Healing'),(19236,0.8068,0,0,'Priest - Desperate Prayer'),(2061,0.8068,0,0,'Priest - Flash Heal'),(2060,1.6135,0,0,'Priest - Greater Heal'),(23455,0.3035,0,0,'Priest - Holy Nova Heal Rank 1'),(23458,0.3035,0,0,'Priest - Holy Nova Heal Rank 2'),(23459,0.3035,0,0,'Priest - Holy Nova Heal Rank 3'),(27803,0.3035,0,0,'Priest - Holy Nova Heal Rank 4'),(27804,0.3035,0,0,'Priest - Holy Nova Heal Rank 5'),(27805,0.3035,0,0,'Priest - Holy Nova Heal Rank 6'),(25329,0.3035,0,0,'Priest - Holy Nova Heal Rank 7'),(17,0.8068,0,0,'Priest - Power Word: Shield'),(596,0.8086,0,0,'Priest - Prayer of Healing'),(33110,0.8068,0,0,'Priest - Prayer of Mending Heal Proc'),(139,0,0.376,0,'Priest - Renew'),(2944,0.1849,0,0,'Priest - Devouring Plague'),(14914,0.5711,0.024,0,'Priest - Holy Fire'),(15237,0.1606,0,0,'Priest - Holy Nova Damage'),(8129,0,0,0,'Priest - Mana Burn'),(8092,0.4296,0,0,'Priest - Mind Blast'),(15407,0.257,0,0,'Priest - Mind Flay'),(49821,0.14286,0,0,'Priest - Mind Sear Trigger Rank 1'),(53022,0.14286,0,0,'Priest - Mind Sear Trigger Rank 2'),(34433,0.65,0,0,'Priest - Shadowfiend'),(32379,0.4296,0,0,'Priest - Shadow Word: Death'),(589,0,0.1829,0,'Priest - Shadow Word: Pain'),(585,0.714,0,0,'Priest - Smite'),(34914,0,0.4,0,'Priest - Vampiric Touch'),(974,0.4762,0,0,'Shaman - Earth Shield'),(1064,1.34,0,0,'Shaman - Chain Heal'),(331,1.6106,0,0,'Shaman - Healing Wave'),(8004,0.8082,0,0,'Shaman - Lesser Healing Wave'),(61295,0.4,0.18,0,'Shaman - Riptide'),(421,0.57,0,0,'Shaman - Chain Lightning'),(8042,0.3858,0,0,'Shaman - Earth Shock'),(8443,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 1'),(8504,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 2'),(8505,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 3'),(11310,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 4'),(11311,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 5'),(25538,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 6'),(25539,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 7'),(61651,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 8'),(61660,0.2142,0,0,'Shaman - Fire Nova Totem Casted by Totem Rank 9'),(8050,0.2142,0.1,0,'Shaman - Flame Shock'),(8026,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 1'),(8028,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 2'),(8029,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 3'),(10445,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 4'),(16343,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 5'),(16344,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 6'),(25488,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 7'),(58786,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 8'),(58787,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 9'),(58788,0.1,0,0,'Shaman - Flametongue Weapon Proc Rank 10'),(8056,0.3858,0,0,'Shaman - Frost Shock'),(8034,0.1,0,0,'Shaman - Frostbrand Attack Rank 1'),(8037,0.1,0,0,'Shaman - Frostbrand Attack Rank 2'),(10458,0.1,0,0,'Shaman - Frostbrand Attack Rank 3'),(16352,0.1,0,0,'Shaman - Frostbrand Attack Rank 4'),(16353,0.1,0,0,'Shaman - Frostbrand Attack Rank 5'),(25501,0.1,0,0,'Shaman - Frostbrand Attack Rank 6'),(58797,0.1,0,0,'Shaman - Frostbrand Attack Rank 7'),(58798,0.1,0,0,'Shaman - Frostbrand Attack Rank 8'),(58799,0.1,0,0,'Shaman - Frostbrand Attack Rank 9'),(51505,0.5714,0,0,'Shaman - Lava Burst'),(403,0.7143,0,0,'Shaman - Lightning Bolt'),(26364,0.33,0,0,'Shaman - Lightning Shield Proc Rank 1'),(26365,0.33,0,0,'Shaman - Lightning Shield Proc Rank 2'),(26366,0.33,0,0,'Shaman - Lightning Shield Proc Rank 3'),(26367,0.33,0,0,'Shaman - Lightning Shield Proc Rank 4'),(26369,0.33,0,0,'Shaman - Lightning Shield Proc Rank 5'),(26370,0.33,0,0,'Shaman - Lightning Shield Proc Rank 6'),(26363,0.33,0,0,'Shaman - Lightning Shield Proc Rank 7'),(26371,0.33,0,0,'Shaman - Lightning Shield Proc Rank 8'),(26372,0.33,0,0,'Shaman - Lightning Shield Proc Rank 9'),(49278,0.33,0,0,'Shaman - Lightning Shield Proc Rank 10'),(49279,0.33,0,0,'Shaman - Lightning Shield Proc Rank 11'),(8188,0.1,0,0,'Shaman - Magma Totam Passive Rank 1'),(10582,0.1,0,0,'Shaman - Magma Totam Passive Rank 2'),(10583,0.1,0,0,'Shaman - Magma Totam Passive Rank 3'),(10584,0.1,0,0,'Shaman - Magma Totam Passive Rank 4'),(25551,0.1,0,0,'Shaman - Magma Totam Passive Rank 5'),(58733,0.1,0,0,'Shaman - Magma Totam Passive Rank 6'),(58736,0.1,0,0,'Shaman - Magma Totam Passive Rank 7'),(3606,0.1667,0,0,'Shaman - Searing Totem Attack Rank 1'),(6350,0.1667,0,0,'Shaman - Searing Totem Attack Rank 2'),(6351,0.1667,0,0,'Shaman - Searing Totem Attack Rank 3'),(6352,0.1667,0,0,'Shaman - Searing Totem Attack Rank 4'),(10435,0.1667,0,0,'Shaman - Searing Totem Attack Rank 5'),(10436,0.1667,0,0,'Shaman - Searing Totem Attack Rank 6'),(25530,0.1667,0,0,'Shaman - Searing Totem Attack Rank 7'),(58700,0.1667,0,0,'Shaman - Searing Totem Attack Rank 8'),(58701,0.1667,0,0,'Shaman - Searing Totem Attack Rank 9'),(58702,0.1667,0,0,'Shaman - Searing Totem Attack Rank 10'),(980,0,0.1,0,'Warlock - Curse of Agony'),(603,0,2,0,'Warlock - Curse of Doom'),(172,0,0.3,0,'Warlock - Corruption'),(348,0.2,0.2,0,'Warlock - Immolate'),(27243,0.22,0.25,0,'Warlock - Seed of Corruption'),(18265,0,0.1,0,'Warlock - Siphon Life'),(30108,0,0.24,0,'Warlock - Unstable Affliction'),(31117,1.8,0,0,'Warlock - Unstable Affliction Dispell'),(17962,0.4286,0,0,'Warlock - Conflagrate'),(6789,0.22,0,0,'Warlock - Death Coil'),(28176,0,0,0,'Warlock - Fel Armor'),(48181,0.4729,0,0,'Warlock - Haunt'),(29722,0.7143,0,0,'Warlock - Incinerate'),(5676,0.4286,0,0,'Warlock - Searing Pain'),(686,0.8571,0,0,'Warlock - Shadow Bolt'),(17877,0.4286,0,0,'Warlock - Shadowburn'),(30283,0.195,0,0,'Warlock - Shadowfury'),(6353,1.15,0,0,'Warlock - Soul Fire'),(689,0,0.1428,0,'Warlock - Drain Life'),(5138,0,0,0,'Warlock - Drain Mana'),(1120,0,0.4286,0,'Warlock - Drain Soul'),(755,0,0.4485,0,'Warlock - Health Funnel'),(1949,0,0.0946,0,'Warlock - Hellfire'),(5857,0.1428,0,0,'Warlock - Hellfire Effect on Enemy Rank 1'),(11681,0.1428,0,0,'Warlock - Hellfire Effect on Enemy Rank 2'),(11682,0.1428,0,0,'Warlock - Hellfire Effect on Enemy Rank 3'),(27214,0.1428,0,0,'Warlock - Hellfire Effect on Enemy Rank 4'),(47822,0.1428,0,0,'Warlock - Hellfire Effect on Enemy Rank 5'),(42223,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 1'),(42224,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 2'),(42225,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 3'),(42226,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 4'),(42218,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 5'),(47817,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 6'),(47818,0.952,0,0,'Warlock - Rain of Fire Triggered Rank 7'),(18220,0.96,0,0,'Warlock - Dark Pact Rank 1'),(18937,0.96,0,0,'Warlock - Dark Pact Rank 2'),(18938,0.96,0,0,'Warlock - Dark Pact Rank 3'),(27265,0.96,0,0,'Warlock - Dark Pact Rank 4'),(59092,0.96,0,0,'Warlock - Dark Pact Rank 5'),(6229,0.3,0,0,'Warlock - Shadow Ward');
/*!40000 ALTER TABLE `spell_bonus_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_chain`
--

DROP TABLE IF EXISTS `spell_chain`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_chain` (
  `spell_id` mediumint(9) NOT NULL DEFAULT '0',
  `prev_spell` mediumint(9) NOT NULL DEFAULT '0',
  `first_spell` mediumint(9) NOT NULL DEFAULT '0',
  `rank` tinyint(4) NOT NULL DEFAULT '0',
  `req_spell` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_chain`
--

LOCK TABLES `spell_chain` WRITE;
/*!40000 ALTER TABLE `spell_chain` DISABLE KEYS */;
INSERT INTO spell_chain VALUES
/*------------------
--(6) Frost
------------------*/
/*Blizzard*/
(10,0,10,1,0),
(6141,10,10,2,0),
(8427,6141,10,3,0),
(10185,8427,10,4,0),
(10186,10185,10,5,0),
(10187,10186,10,6,0),
(27085,10187,10,7,0),
(42939,27085,10,8,0),
(42940,42939,10,9,0),
/*ConeofCold*/
(120,0,120,1,0),
(8492,120,120,2,0),
(10159,8492,120,3,0),
(10160,10159,120,4,0),
(10161,10160,120,5,0),
(27087,10161,120,6,0),
(42930,27087,120,7,0),
(42931,42930,120,8,0),
/*FrostArmor*/
(168,0,168,1,0),
(7300,168,168,2,0),
(7301,7300,168,3,0),
/*FrostNova*/
(122,0,122,1,0),
(865,122,122,2,0),
(6131,865,122,3,0),
(10230,6131,122,4,0),
(27088,10230,122,5,0),
(42917,27088,122,6,0),
/*FrostWard*/
(6143,0,6143,1,0),
(8461,6143,6143,2,0),
(8462,8461,6143,3,0),
(10177,8462,6143,4,0),
(28609,10177,6143,5,0),
(32796,28609,6143,6,0),
(43012,32796,6143,7,0),
/*Frostbolt*/
(116,0,116,1,0),
(205,116,116,2,0),
(837,205,116,3,0),
(7322,837,116,4,0),
(8406,7322,116,5,0),
(8407,8406,116,6,0),
(8408,8407,116,7,0),
(10179,8408,116,8,0),
(10180,10179,116,9,0),
(10181,10180,116,10,0),
(25304,10181,116,11,0),
(27071,25304,116,12,0),
(27072,27071,116,13,0),
(38697,27072,116,14,0),
(42841,38697,116,15,0),
(42842,42841,116,16,0),
/*IceArmor*/
(7302,0,7302,1,0),
(7320,7302,7302,2,0),
(10219,7320,7302,3,0),
(10220,10219,7302,4,0),
(27124,10220,7302,5,0),
(43008,27124,7302,6,0),
/*IceBarrier*/
(11426,0,11426,1,0),
(13031,11426,11426,2,0),
(13032,13031,11426,3,0),
(13033,13032,11426,4,0),
(27134,13033,11426,5,0),
(33405,27134,11426,6,0),
(43038,33405,11426,7,0),
(43039,43038,11426,8,0),
/*IceLance*/
(30455,0,30455,1,0),
(42913,30455,30455,2,0),
(42914,42913,30455,3,0),
/*------------------
--(8)Fire
------------------*/
/*BlastWave*/
(11113,0,11113,1,0),
(13018,11113,11113,2,0),
(13019,13018,11113,3,0),
(13020,13019,11113,4,0),
(13021,13020,11113,5,0),
(27133,13021,11113,6,0),
(33933,27133,11113,7,0),
(42944,33933,11113,8,0),
(42945,42944,11113,9,0),
/*Dragon'sBreath*/
(31661,0,31661,1,0),
(33041,31661,31661,2,0),
(33042,33041,31661,3,0),
(33043,33042,31661,4,0),
(42949,33043,31661,5,0),
(42950,42949,31661,6,0),
/*FireBlast*/
(2136,0,2136,1,0),
(2137,2136,2136,2,0),
(2138,2137,2136,3,0),
(8412,2138,2136,4,0),
(8413,8412,2136,5,0),
(10197,8413,2136,6,0),
(10199,10197,2136,7,0),
(27078,10199,2136,8,0),
(27079,27078,2136,9,0),
(42872,27079,2136,10,0),
(42873,42872,2136,11,0),
/*FireWard*/
(543,0,543,1,0),
(8457,543,543,2,0),
(8458,8457,543,3,0),
(10223,8458,543,4,0),
(10225,10223,543,5,0),
(27128,10225,543,6,0),
(43010,27128,543,7,0),
/*Fireball*/
(133,0,133,1,0),
(143,133,133,2,0),
(145,143,133,3,0),
(3140,145,133,4,0),
(8400,3140,133,5,0),
(8401,8400,133,6,0),
(8402,8401,133,7,0),
(10148,8402,133,8,0),
(10149,10148,133,9,0),
(10150,10149,133,10,0),
(10151,10150,133,11,0),
(25306,10151,133,12,0),
(27070,25306,133,13,0),
(38692,27070,133,14,0),
(42832,38692,133,15,0),
(42833,42832,133,16,0),
/*Flamestrike*/
(2120,0,2120,1,0),
(2121,2120,2120,2,0),
(8422,2121,2120,3,0),
(8423,8422,2120,4,0),
(10215,8423,2120,5,0),
(10216,10215,2120,6,0),
(27086,10216,2120,7,0),
(42925,27086,2120,8,0),
(42926,42925,2120,9,0),
/*FrostfireBolt*/
(44614,0,44614,1,0),
(47610,44614,44614,2,0),
/*LivingBomb*/
(44457,0,44457,1,0),
(55359,44457,44457,2,0),
(55360,55359,44457,3,0),
/*MoltenArmor*/
(30482,0,30482,1,0),
(43045,30482,30482,2,0),
(43046,43045,30482,3,0),
/*Pyroblast*/
(11366,0,11366,1,0),
(12505,11366,11366,2,0),
(12522,12505,11366,3,0),
(12523,12522,11366,4,0),
(12524,12523,11366,5,0),
(12525,12524,11366,6,0),
(12526,12525,11366,7,0),
(18809,12526,11366,8,0),
(27132,18809,11366,9,0),
(33938,27132,11366,10,0),
(42890,33938,11366,11,0),
(42891,42890,11366,12,0),
/*Scorch*/
(2948,0,2948,1,0),
(8444,2948,2948,2,0),
(8445,8444,2948,3,0),
(8446,8445,2948,4,0),
(10205,8446,2948,5,0),
(10206,10205,2948,6,0),
(10207,10206,2948,7,0),
(27073,10207,2948,8,0),
(27074,27073,2948,9,0),
(42858,27074,2948,10,0),
(42859,42858,2948,11,0),
/*------------------
--(26)Arms
------------------*/
/*Charge*/
(100,0,100,1,0),
(6178,100,100,2,0),
(11578,6178,100,3,0),
/*HeroicStrike*/
(78,0,78,1,0),
(284,78,78,2,0),
(285,284,78,3,0),
(1608,285,78,4,0),
(11564,1608,78,5,0),
(11565,11564,78,6,0),
(11566,11565,78,7,0),
(11567,11566,78,8,0),
(25286,11567,78,9,0),
(29707,25286,78,10,0),
(30324,29707,78,11,0),
(47449,30324,78,12,0),
(47450,47449,78,13,0),
/*MortalStrike*/
(12294,0,12294,1,0),
(21551,12294,12294,2,0),
(21552,21551,12294,3,0),
(21553,21552,12294,4,0),
(25248,21553,12294,5,0),
(30330,25248,12294,6,0),
(47485,30330,12294,7,0),
(47486,47485,12294,8,0),
/*Rend*/
(772,0,772,1,0),
(6546,772,772,2,0),
(6547,6546,772,3,0),
(6548,6547,772,4,0),
(11572,6548,772,5,0),
(11573,11572,772,6,0),
(11574,11573,772,7,0),
(25208,11574,772,8,0),
(46845,25208,772,9,0),
(47465,46845,772,10,0),
/*ThunderClap*/
(6343,0,6343,1,0),
(8198,6343,6343,2,0),
(8204,8198,6343,3,0),
(8205,8204,6343,4,0),
(11580,8205,6343,5,0),
(11581,11580,6343,6,0),
(25264,11581,6343,7,0),
(47501,25264,6343,8,0),
(47502,47501,6343,9,0),
/*------------------
-- (38) Combat (Rogue)
------------------*/
/*Backstab*/
(53,0,53,1,0),
(2589,53,53,2,0),
(2590,2589,53,3,0),
(2591,2590,53,4,0),
(8721,2591,53,5,0),
(11279,8721,53,6,0),
(11280,11279,53,7,0),
(11281,11280,53,8,0),
(25300,11281,53,9,0),
(26863,25300,53,10,0),
(48656,26863,53,11,0),
(48657,48656,53,12,0),
/*Evasion*/
(5277,0,5277,1,0),
(26669,5277,5277,2,0),
/*Feint*/
(1966,0,1966,1,0),
(6768,1966,1966,2,0),
(8637,6768,1966,3,0),
(11303,8637,1966,4,0),
(25302,11303,1966,5,0),
(27448,25302,1966,6,0),
(48658,27448,1966,7,0),
(48659,48658,1966,8,0),
/*Sinister Strike*/
(1752,0,1752,1,0),
(1757,1752,1752,2,0),
(1758,1757,1752,3,0),
(1759,1758,1752,4,0),
(1760,1759,1752,5,0),
(8621,1760,1752,6,0),
(11293,8621,1752,7,0),
(11294,11293,1752,8,0),
(26861,11294,1752,9,0),
(26862,26861,1752,10,0),
(48637,26862,1752,11,0),
(48638,48637,1752,12,0),
/*Sprint*/
(2983,0,2983,1,0),
(8696,2983,2983,2,0),
(11305,8696,2983,3,0),
/*------------------
--(39)Subtlety
------------------*/
/*Hemorrhage*/
(16511,0,16511,1,0),
(17347,16511,16511,2,0),
(17348,17347,16511,3,0),
(26864,17348,16511,4,0),
(48660,26864,16511,5,0),
/*Sap*/
(6770,0,6770,1,0),
(2070,6770,6770,2,0),
(11297,2070,6770,3,0),
(51724,11297,6770,4,0),
/*Stealth*/
(1784,0,1784,1,0),
(1785,1784,1784,2,0),
(1786,1785,1784,3,0),
(1787,1786,1784,4,0),
/*Vanish*/
(1856,0,1856,1,0),
(1857,1856,1856,2,0),
(26889,1857,1856,3,0),
/*------------------
-- (50) Beast Mastery
------------------*/
/*Aspect of the Hawk*/
(13165,0,13165,1,0),
(14318,13165,13165,2,0),
(14319,14318,13165,3,0),
(14320,14319,13165,4,0),
(14321,14320,13165,5,0),
(14322,14321,13165,6,0),
(25296,14322,13165,7,0),
(27044,25296,13165,8,0),
/*Aspect of the Wild*/
(20043,0,20043,1,0),
(20190,20043,20043,2,0),
(27045,20190,20043,3,0),
(49071,27045,20043,4,0),
/*MendPet*/
(136,0,136,1,0),
(3111,136,136,2,0),
(3661,3111,136,3,0),
(3662,3661,136,4,0),
(13542,3662,136,5,0),
(13543,13542,136,6,0),
(13544,13543,136,7,0),
(27046,13544,136,8,0),
(48989,27046,136,9,0),
(48990,48989,136,10,0),
/*ScareBeast*/
(1513,0,1513,1,0),
(14326,1513,1513,2,0),
(14327,14326,1513,3,0),
/*------------------
--(51)Survival
------------------*/
/*Counterattack*/
(19306,0,19306,1,0),
(20909,19306,19306,2,0),
(20910,20909,19306,3,0),
(27067,20910,19306,4,0),
(48998,27067,19306,5,0),
(48999,48998,19306,6,0),
/*ExplosiveShot*/
(53301,0,53301,1,0),
(60051,53301,53301,2,0),
(60052,60051,53301,3,0),
(60053,60052,53301,4,0),
/*ExplosiveTrap*/
(13813,0,13813,1,0),
(14316,13813,13813,2,0),
(14317,14316,13813,3,0),
(27025,14317,13813,4,0),
(49066,27025,13813,5,0),
(49067,49066,13813,6,0),
/*FreezingTrap*/
(1499,0,1499,1,0),
(14310,1499,1499,2,0),
(14311,14310,1499,3,0),
/*ImmolationTrap*/
(13795,0,13795,1,0),
(14302,13795,13795,2,0),
(14303,14302,13795,3,0),
(14304,14303,13795,4,0),
(14305,14304,13795,5,0),
(27023,14305,13795,6,0),
(49055,27023,13795,7,0),
(49056,49055,13795,8,0),
/*MongooseBite*/
(1495,0,1495,1,0),
(14269,1495,1495,2,0),
(14270,14269,1495,3,0),
(14271,14270,1495,4,0),
(36916,14271,1495,5,0),
(53339,36916,1495,6,0),
/*RaptorStrike*/
(2973,0,2973,1,0),
(14260,2973,2973,2,0),
(14261,14260,2973,3,0),
(14262,14261,2973,4,0),
(14263,14262,2973,5,0),
(14264,14263,2973,6,0),
(14265,14264,2973,7,0),
(14266,14265,2973,8,0),
(27014,14266,2973,9,0),
(48995,27014,2973,10,0),
(48996,48995,2973,11,0),
/*WyvernSting*/
(19386,0,19386,1,0),
(24132,19386,19386,2,0),
(24133,24132,19386,3,0),
(27068,24133,19386,4,0),
(49011,27068,19386,5,0),
(49012,49011,19386,6,0),
/*------------------
-- (56) Holy (Priest)
------------------*/
/*Binding Heal*/
(32546,0,32546,1,0),
(48119,32546,32546,2,0),
(48120,48119,32546,3,0),
/*Circle of Healing*/
(34861,0,34861,1,0),
(34863,34861,34861,2,0),
(34864,34863,34861,3,0),
(34865,34864,34861,4,0),
(34866,34865,34861,5,0),
(48088,34866,34861,6,0),
(48089,48088,34861,7,0),
/*DesperatePrayer*/
(19236,0,19236,1,0),
(19238,19236,19236,2,0),
(19240,19238,19236,3,0),
(19241,19240,19236,4,0),
(19242,19241,19236,5,0),
(19243,19242,19236,6,0),
(25437,19243,19236,7,0),
(48172,25437,19236,8,0),
(48173,48172,19236,9,0),
/*FlashHeal*/
(2061,0,2061,1,0),
(9472,2061,2061,2,0),
(9473,9472,2061,3,0),
(9474,9473,2061,4,0),
(10915,9474,2061,5,0),
(10916,10915,2061,6,0),
(10917,10916,2061,7,0),
(25233,10917,2061,8,0),
(25235,25233,2061,9,0),
(48070,25235,2061,10,0),
(48071,48070,2061,11,0),
/*GreaterHeal*/
(2060,0,2060,1,0),
(10963,2060,2060,2,0),
(10964,10963,2060,3,0),
(10965,10964,2060,4,0),
(25314,10965,2060,5,0),
(25210,25314,2060,6,0),
(25213,25210,2060,7,0),
(48062,25213,2060,8,0),
(48063,48062,2060,9,0),
/*Heal*/
(2054,0,2054,1,0),
(2055,2054,2054,2,0),
(6063,2055,2054,3,0),
(6064,6063,2054,4,0),
/*Holy Fire*/
(14914,0,14914,1,0),
(15262,14914,14914,2,0),
(15263,15262,14914,3,0),
(15264,15263,14914,4,0),
(15265,15264,14914,5,0),
(15266,15265,14914,6,0),
(15267,15266,14914,7,0),
(15261,15267,14914,8,0),
(25384,15261,14914,9,0),
(48134,25384,14914,10,0),
(48135,48134,14914,11,0),
/*Holy Nova*/
(15237,0,15237,1,0),
(15430,15237,15237,2,0),
(15431,15430,15237,3,0),
(27799,15431,15237,4,0),
(27800,27799,15237,5,0),
(27801,27800,15237,6,0),
(25331,27801,15237,7,0),
(48077,25331,15237,8,0),
(48078,48077,15237,9,0),
/*LesserHeal*/
(2050,0,2050,1,0),
(2052,2050,2050,2,0),
(2053,2052,2050,3,0),
/*Lightwell*/
(724,0,724,1,0),
(27870,724,724,2,0),
(27871,27870,724,3,0),
(28275,27871,724,4,0),
(48086,28275,724,5,0),
(48087,48086,724,6,0),
/*Prayer of Healing*/
(596,0,596,1,0),
(996,596,596,2,0),
(10960,996,596,3,0),
(10961,10960,596,4,0),
(25316,10961,596,5,0),
(25308,25316,596,6,0),
(48072,25308,596,7,0),
/*Prayer of Mending*/
(33076,0,33076,1,0),
(48112,33076,33076,2,0),
(48113,48112,33076,3,0),
/*Renew*/
(139,0,139,1,0),
(6074,139,139,2,0),
(6075,6074,139,3,0),
(6076,6075,139,4,0),
(6077,6076,139,5,0),
(6078,6077,139,6,0),
(10927,6078,139,7,0),
(10928,10927,139,8,0),
(10929,10928,139,9,0),
(25315,10929,139,10,0),
(25221,25315,139,11,0),
(25222,25221,139,12,0),
(48067,25222,139,13,0),
(48068,48067,139,14,0),
/*Resurrection*/
(2006,0,2006,1,0),
(2010,2006,2006,2,0),
(10880,2010,2006,3,0),
(10881,10880,2006,4,0),
(20770,10881,2006,5,0),
(25435,20770,2006,6,0),
(48171,25435,2006,7,0),
/*Smite*/
(585,0,585,1,0),
(591,585,585,2,0),
(598,591,585,3,0),
(984,598,585,4,0),
(1004,984,585,5,0),
(6060,1004,585,6,0),
(10933,6060,585,7,0),
(10934,10933,585,8,0),
(25363,10934,585,9,0),
(25364,25363,585,10,0),
(48122,25364,585,11,0),
(48123,48122,585,12,0),
/*------------------
-- (78) Shadow Magic
------------------*/
/*Devouring Plague*/
(2944,0,2944,1,0),
(19276,2944,2944,2,0),
(19277,19276,2944,3,0),
(19278,19277,2944,4,0),
(19279,19278,2944,5,0),
(19280,19279,2944,6,0),
(25467,19280,2944,7,0),
(48299,25467,2944,8,0),
(48300,48299,2944,9,0),
/*Mind Blast*/
(8092,0,8092,1,0),
(8102,8092,8092,2,0),
(8103,8102,8092,3,0),
(8104,8103,8092,4,0),
(8105,8104,8092,5,0),
(8106,8105,8092,6,0),
(10945,8106,8092,7,0),
(10946,10945,8092,8,0),
(10947,10946,8092,9,0),
(25372,10947,8092,10,0),
(25375,25372,8092,11,0),
(48126,25375,8092,12,0),
(48127,48126,8092,13,0),
/*MindFlay*/
(15407,0,15407,1,0),
(17311,15407,15407,2,0),
(17312,17311,15407,3,0),
(17313,17312,15407,4,0),
(17314,17313,15407,5,0),
(18807,17314,15407,6,0),
(25387,18807,15407,7,0),
(48155,25387,15407,8,0),
(48156,48155,15407,9,0),
/*MindSear*/
(48045,0,48045,1,0),
(53023,48045,48045,2,0),
/*MindVision*/
(2096,0,2096,1,0),
(10909,2096,2096,2,0),
/*Prayer of Shadow Protection*/
(27683,0,27683,1,0),
(39374,27683,27683,2,0),
(48170,39374,27683,3,0),
/*PsychicScream*/
(8122,0,8122,1,0),
(8124,8122,8122,2,0),
(10888,8124,8122,3,0),
(10890,10888,8122,4,0),
/*Shadow Protection*/
(976,0,976,1,0),
(10957,976,976,2,0),
(10958,10957,976,3,0),
(25433,10958,976,4,0),
(48169,25433,976,5,0),
/*ShadowWord:Death*/
(32379,0,32379,1,0),
(32996,32379,32379,2,0),
(48157,32996,32379,3,0),
(48158,48157,32379,4,0),
/*ShadowWord:Pain*/
(589,0,589,1,0),
(594,589,589,2,0),
(970,594,589,3,0),
(992,970,589,4,0),
(2767,992,589,5,0),
(10892,2767,589,6,0),
(10893,10892,589,7,0),
(10894,10893,589,8,0),
(25367,10894,589,9,0),
(25368,25367,589,10,0),
(48124,25368,589,11,0),
(48125,48124,589,12,0),
/*Vampiric Touch*/
(34914,0,34914,1,0),
(34916,34914,34914,2,0),
(34917,34916,34914,3,0),
(48159,34917,34914,4,0),
(48160,48159,34914,5,0),
/*------------------
-- (129) First Aid
------------------*/
/*First Aid*/
(3273,0,3273,1,0),
(3274,3273,3273,2,0),
(7924,3274,3273,3,0),
(10846,7924,3273,4,0),
(27028,10846,3273,5,0),
(45542,27028,3273,6,0),
/*------------------
-- (134) Feral Combat (Druid)
------------------*/
/*Bash*/
(5211,0,5211,1,0),
(6798,5211,5211,2,0),
(8983,6798,5211,3,0),
/*Bear Form*/
(5487,0,5487,1,0),
(9634,5487,5487,2,0),
/*Claw*/
(1082,0,1082,1,0),
(3029,1082,1082,2,0),
(5201,3029,1082,3,0),
(9849,5201,1082,4,0),
(9850,9849,1082,5,0),
(27000,9850,1082,6,0),
(48569,27000,1082,7,0),
(48570,48569,1082,8,0),
/*Cower*/
(8998,0,8998,1,0),
(9000,8998,8998,2,0),
(9892,9000,8998,3,0),
(31709,9892,8998,4,0),
(27004,31709,8998,5,0),
(48575,27004,8998,6,0),
/*Dash*/
(1850,0,1850,1,0),
(9821,1850,1850,2,0),
(33357,9821,1850,3,0),
/*Demoralizing Roar*/
(99,0,99,1,0),
(1735,99,99,2,0),
(9490,1735,99,3,0),
(9747,9490,99,4,0),
(9898,9747,99,5,0),
(26998,9898,99,6,0),
(48559,26998,99,7,0),
(48560,48559,99,8,0),
/*Faerie Fire (Feral)*/
(16857,0,16857,1,0),
(17390,16857,16857,2,0),
(17391,17390,16857,3,0),
(17392,17391,16857,4,0),
(27011,17392,16857,5,0),
(48475,27011,16857,6,0),
/*Ferocious Bite*/
(22568,0,22568,1,0),
(22827,22568,22568,2,0),
(22828,22827,22568,3,0),
(22829,22828,22568,4,0),
(31018,22829,22568,5,0),
(24248,31018,22568,6,0),
(48576,24248,22568,7,0),
(48577,48576,22568,8,0),
/*Flight Form*/
(33943,0,33943,1,0),
(40120,33943,33943,2,0),
/*Lacerate*/
(33745,0,33745,1,0),
(48567,33745,33745,2,0),
(48568,48567,33745,3,0),
/*Maim*/
(22570,0,22570,1,0),
(49802,22570,22570,2,0),
/*Mangle-Bear*/
(33878,0,33878,1,0),
(33986,33878,33878,2,0),
(33987,33986,33878,3,0),
(48563,33987,33878,4,0),
(48564,48563,33878,5,0),
/*Mangle-Cat*/
(33876,0,33876,1,0),
(33982,33876,33876,2,0),
(33983,33982,33876,3,0),
(48565,33983,33876,4,0),
(48566,48565,33876,5,0),
/*Maul*/
(6807,0,6807,1,0),
(6808,6807,6807,2,0),
(6809,6808,6807,3,0),
(8972,6809,6807,4,0),
(9745,8972,6807,5,0),
(9880,9745,6807,6,0),
(9881,9880,6807,7,0),
(26996,9881,6807,8,0),
(48479,26996,6807,9,0),
(48480,48479,6807,10,0),
/*Pounce*/
(9005,0,9005,1,0),
(9823,9005,9005,2,0),
(9827,9823,9005,3,0),
(27006,9827,9005,4,0),
(49803,27006,9005,5,0),
/*Prowl*/
(5215,0,5215,1,0),
(6783,5215,5215,2,0),
(9913,6783,5215,3,0),
/*Rake*/
(1822,0,1822,1,0),
(1823,1822,1822,2,0),
(1824,1823,1822,3,0),
(9904,1824,1822,4,0),
(27003,9904,1822,5,0),
(48573,27003,1822,6,0),
(48574,48573,1822,7,0),
/*Ravage*/
(6785,0,6785,1,0),
(6787,6785,6785,2,0),
(9866,6787,6785,3,0),
(9867,9866,6785,4,0),
(27005,9867,6785,5,0),
(48578,27005,6785,6,0),
(48579,48578,6785,7,0),
/*Rip*/
(1079,0,1079,1,0),
(9492,1079,1079,2,0),
(9493,9492,1079,3,0),
(9752,9493,1079,4,0),
(9894,9752,1079,5,0),
(9896,9894,1079,6,0),
(27008,9896,1079,7,0),
(49799,27008,1079,8,0),
(49800,49799,1079,9,0),
/*Shred*/
(5221,0,5221,1,0),
(6800,5221,5221,2,0),
(8992,6800,5221,3,0),
(9829,8992,5221,4,0),
(9830,9829,5221,5,0),
(27001,9830,5221,6,0),
(27002,27001,5221,7,0),
(48571,27002,5221,8,0),
(48572,48571,5221,9,0),
/*Swipe*/
(779,0,779,1,0),
(780,779,779,2,0),
(769,780,779,3,0),
(9754,769,779,4,0),
(9908,9754,779,5,0),
(26997,9908,779,6,0),
(48561,26997,779,7,0),
(48562,48561,779,8,0),
/*Tiger's Fury*/
(5217,0,5217,1,0),
(6793,5217,5217,2,0),
(9845,6793,5217,3,0),
(9846,9845,5217,4,0),
(50212,9846,5217,5,0),
(50213,50212,5217,6,0),
/*------------------
--(163)Marksmanship
------------------*/
/*AimedShot*/
(19434,0,19434,1,0),
(20900,19434,19434,2,0),
(20901,20900,19434,3,0),
(20902,20901,19434,4,0),
(20903,20902,19434,5,0),
(20904,20903,19434,6,0),
(27065,20904,19434,7,0),
(49049,27065,19434,8,0),
(49050,49049,19434,9,0),
/*ArcaneShot*/
(3044,0,3044,1,0),
(14281,3044,3044,2,0),
(14282,14281,3044,3,0),
(14283,14282,3044,4,0),
(14284,14283,3044,5,0),
(14285,14284,3044,6,0),
(14286,14285,3044,7,0),
(14287,14286,3044,8,0),
(27019,14287,3044,9,0),
(49044,27019,3044,10,0),
(49045,49044,3044,11,0),
/*Hunter'sMark*/
(1130,0,1130,1,0),
(14323,1130,1130,2,0),
(14324,14323,1130,3,0),
(14325,14324,1130,4,0),
(53338,14325,1130,5,0),
/*KillShot*/
(53351,0,53351,1,0),
(61005,53351,53351,2,0),
(61006,61005,53351,3,0),
/*Multi-Shot*/
(2643,0,2643,1,0),
(14288,2643,2643,2,0),
(14289,14288,2643,3,0),
(14290,14289,2643,4,0),
(25294,14290,2643,5,0),
(27021,25294,2643,6,0),
(49047,27021,2643,7,0),
(49048,49047,2643,8,0),
/*SerpentSting*/
(1978,0,1978,1,0),
(13549,1978,1978,2,0),
(13550,13549,1978,3,0),
(13551,13550,1978,4,0),
(13552,13551,1978,5,0),
(13553,13552,1978,6,0),
(13554,13553,1978,7,0),
(13555,13554,1978,8,0),
(25295,13555,1978,9,0),
(27016,25295,1978,10,0),
(49000,27016,1978,11,0),
(49001,49000,1978,12,0),
/*SteadyShot*/
(56641,0,56641,1,0),
(34120,56641,56641,2,0),
(49051,34120,56641,3,0),
(49052,49051,56641,4,0),
/*Volley*/
(1510,0,1510,1,0),
(14294,1510,1510,2,0),
(14295,14294,1510,3,0),
(27022,14295,1510,4,0),
(58431,27022,1510,5,0),
(58434,58431,1510,6,0),
/*------------------
-- (164) Blacksmithing
------------------*/
/*Blacksmithing*/
(2018,0,2018,1,0),
(3100,2018,2018,2,0),
(3538,3100,2018,3,0),
(9785,3538,2018,4,0),
(9787,9785,2018,5,0),
(9788,9785,2018,5,0),
(29844,9785,2018,5,0),
(17039,9787,2018,6,0),
(17040,9787,2018,6,0),
(17041,9787,2018,6,0),
(51300,29844,2018,6,0),
/*------------------
-- (165) Leatherworking
------------------*/
/*Leatherworking*/
(2108,0,2108,1,0),
(3104,2108,2108,2,0),
(3811,3104,2108,3,0),
(10662,3811,2108,4,0),
(10656,10662,2108,5,0),
(10658,10662,2108,5,0),
(10660,10662,2108,5,0),
(32549,10662,2108,5,0),
(51302,32549,2108,6,0),
/*------------------
-- (171) Alchemy
------------------*/
/* Alchemy */
(2259,0,2259,1,0),
(3101,2259,2259,2,0),
(3464,3101,2259,3,0),
(11611,3464,2259,4,0),
(28596,11611,2259,5,0),
(28672,11611,2259,5,0),
(28675,11611,2259,5,0),
(28677,11611,2259,5,0),
(51304,28596,2259,6,0),
/*------------------
-- (182) Herbalizm
------------------*/
/*Herb Gathering*/
(2366,0,2366,1,0),
(2368,2366,2366,2,0),
(3570,2368,2366,3,0),
(11993,3570,2366,4,0),
(28695,11993,2366,5,0),
(50300,28695,2366,6,0),
/*Lifeblood*/
(55428,0,55428,1,0),
(55480,55428,55428,2,0),
(55500,55480,55428,3,0),
(55501,55500,55428,4,0),
(55502,55501,55428,5,0),
(55503,55502,55428,6,0),
/*------------------
-- (184) Retribution (Paladin)
------------------*/
/*Blessingof Might*/
(19740,0,19740,1,0),
(19834,19740,19740,2,0),
(19835,19834,19740,3,0),
(19836,19835,19740,4,0),
(19837,19836,19740,5,0),
(19838,19837,19740,6,0),
(25291,19838,19740,7,0),
(27140,25291,19740,8,0),
(48931,27140,19740,9,0),
(48932,48931,19740,10,0),
/*Greater Blessing of Might*/
(25782,0,25782,1,19838),
(25916,25782,25782,2,25291),
(27141,25916,25782,3,27140),
(48933,27141,25782,4,48931),
(48934,48933,25782,5,48932),
/*Hammer of Wrath*/
(24275,0,24275,1,0),
(24274,24275,24275,2,0),
(24239,24274,24275,3,0),
(27180,24239,24275,4,0),
(48805,27180,24275,5,0),
(48806,48805,24275,6,0),
/*Retribution Aura*/
(7294,0,7294,1,0),
(10298,7294,7294,2,0),
(10299,10298,7294,3,0),
(10300,10299,7294,4,0),
(10301,10300,7294,5,0),
(27150,10301,7294,6,0),
(54043,27150,7294,7,0),
/*------------------
-- (185) Cooking
------------------*/
/*Cooking*/
(2550,0,2550,1,0),
(3102,2550,2550,2,0),
(3413,3102,2550,3,0),
(18260,3413,2550,4,0),
(33359,18260,2550,5,0),
(51296,33359,2550,6,0),
/*------------------
-- (186) Mining
------------------*/
/*Mining*/
(2575,0,2575,1,0),
(2576,2575,2575,2,0),
(3564,2576,2575,3,0),
(10248,3564,2575,4,0),
(29354,10248,2575,5,0),
(50310,29354,2575,6,0),
/*Toughness*/
(53120,0,53120,1,0),
(53121,53120,53120,2,0),
(53122,53121,53120,3,0),
(53123,53122,53120,4,0),
(53124,53123,53120,5,0),
(53040,53124,53120,6,0),
/*------------------
-- (188) Pet - Imp
------------------*/
/*Blood Pact*/
(6307,0,6307,1,0),
(7804,6307,6307,2,0),
(7805,7804,6307,3,0),
(11766,7805,6307,4,0),
(11767,11766,6307,5,0),
(27268,11767,6307,6,0),
(47982,27268,6307,7,0),
/*FireShield*/
(2947,0,2947,1,0),
(8316,2947,2947,2,0),
(8317,8316,2947,3,0),
(11770,8317,2947,4,0),
(11771,11770,2947,5,0),
(27269,11771,2947,6,0),
(47983,27269,2947,7,0),
/*Firebolt*/
(3110,0,3110,1,0),
(7799,3110,3110,2,0),
(7800,7799,3110,3,0),
(7801,7800,3110,4,0),
(7802,7801,3110,5,0),
(11762,7802,3110,6,0),
(11763,11762,3110,7,0),
(27267,11763,3110,8,0),
(47964,27267,3110,9,0),
/*------------------
--(189)Pet-Felhunter
------------------*/
/*Devour Magic*/
(19505,0,19505,1,0),
(19731,19505,19505,2,0),
(19734,19731,19505,3,0),
(19736,19734,19505,4,0),
(27276,19736,19505,5,0),
(27277,27276,19505,6,0),
(48011,27277,19505,7,0),
/*Fel Intelligence*/
(54424,0,54424,1,0),
(57564,54424,54424,2,0),
(57565,57564,54424,3,0),
(57566,57565,54424,4,0),
(57567,57566,54424,5,0),
/*Shadow Bite*/
(54049,0,54049,1,0),
(54050,54049,54049,2,0),
(54051,54050,54049,3,0),
(54052,54051,54049,4,0),
(54053,54052,54049,5,0),
/*Spell Lock*/
(19244,0,19244,1,0),
(19647,19244,19244,2,0),
/*------------------
-- (197) Tailoring
------------------*/
/*Tailoring*/
(3908,0,3908,1,0),
(3909,3908,3908,2,0),
(3910,3909,3908,3,0),
(12180,3910,3908,4,0),
(26790,12180,3908,5,0),
(26797,12180,3908,5,0),
(26798,12180,3908,5,0),
(26801,12180,3908,5,0),
(51309,26790,3908,6,0),
/*------------------
--(203)Pet-Spider
--(208)Pet-Wolf
--(212)Pet-Crocolisk
--(251)Pet-Turtle
--(653)Pet-Bat
--(766)Pet-WarpStalker
--(767)Pet-Ravager
------------------*/
/*Bite*/
(17253,0,17253,1,0),
(17255,17253,17253,2,0),
(17256,17255,17253,3,0),
(17257,17256,17253,4,0),
(17258,17257,17253,5,0),
(17259,17258,17253,6,0),
(17260,17259,17253,7,0),
(17261,17260,17253,8,0),
(27050,17261,17253,9,0),
(52473,27050,17253,10,0),
(52474,52473,17253,11,0),
/*------------------
-- (202) Engineering
------------------*/
/*Engineering*/
(4036,0,4036,1,0),
(4037,4036,4036,2,0),
(4038,4037,4036,3,0),
(12656,4038,4036,4,0),
(20219,12656,4036,5,0),
(20222,12656,4036,5,0),
(30350,12656,4036,5,0),
(51306,30350,4036,6,0),
/*------------------
-- (204) Pet - Voidwalker
------------------*/
/*Consume Shadows*/
(17767,0,17767,1,0),
(17850,17767,17767,2,0),
(17851,17850,17767,3,0),
(17852,17851,17767,4,0),
(17853,17852,17767,5,0),
(17854,17853,17767,6,0),
(27272,17854,17767,7,0),
(47987,27272,17767,8,0),
(47988,47987,17767,9,0),
/*Sacrifice*/
(7812,0,7812,1,0),
(19438,7812,7812,2,0),
(19440,19438,7812,3,0),
(19441,19440,7812,4,0),
(19442,19441,7812,5,0),
(19443,19442,7812,6,0),
(27273,19443,7812,7,0),
(47985,27273,7812,8,0),
(47986,47985,7812,9,0),
/*Suffering*/
(17735,0,17735,1,0),
(17750,17735,17735,2,0),
(17751,17750,17735,3,0),
(17752,17751,17735,4,0),
(27271,17752,17735,5,0),
(33701,27271,17735,6,0),
(47989,33701,17735,7,0),
(47990,47989,17735,8,0),
/*Torment*/
(3716,0,3716,1,0),
(7809,3716,3716,2,0),
(7810,7809,3716,3,0),
(7811,7810,3716,4,0),
(11774,7811,3716,5,0),
(11775,11774,3716,6,0),
(27270,11775,3716,7,0),
(47984,27270,3716,8,0),
/*------------------
--(205)Pet-Succubus
------------------*/
/*LashofPain*/
(7814,0,7814,1,0),
(7815,7814,7814,2,0),
(7816,7815,7814,3,0),
(11778,7816,7814,4,0),
(11779,11778,7814,5,0),
(11780,11779,7814,6,0),
(27274,11780,7814,7,0),
(47991,27274,7814,8,0),
(47992,47991,7814,9,0),
/*SoothingKiss*/
(6360,0,6360,1,0),
(7813,6360,6360,2,0),
(11784,7813,6360,3,0),
(11785,11784,6360,4,0),
(27275,11785,6360,5,0),
/*------------------
-- (209) Pet - Cat
------------------*/
/*Prowl*/
(24450,0,24450,1,0),
(24452,24450,24450,2,0),
(24453,24452,24450,3,0),
/*Rake*/
(59881,0,59881,1,0),
(59882,59881,59881,2,0),
(59883,59882,59881,3,0),
(59884,59883,59881,4,0),
(59885,59884,59881,5,0),
(59886,59885,59881,6,0),
/*------------------
--(210)Pet-Bear
------------------*/
/*Swipe*/
(50256,0,50256,1,0),
(53526,50256,50256,2,0),
(53528,53526,50256,3,0),
(53529,53528,50256,4,0),
(53532,53529,50256,5,0),
(53533,53532,50256,6,0),
/*------------------
--(211)Pet-Boar
------------------*/
/*Gore*/
(35290,0,35290,1,0),
(35291,35290,35290,2,0),
(35292,35291,35290,3,0),
(35293,35292,35290,4,0),
(35294,35293,35290,5,0),
(35295,35294,35290,6,0),
/*------------------
--(213)Pet-CarrionBird
------------------*/
/*DemoralizingScreech*/
(24423,0,24423,1,0),
(24577,24423,24423,2,0),
(24578,24577,24423,3,0),
(24579,24578,24423,4,0),
(27051,24579,24423,5,0),
(55487,27051,24423,6,0),
/*------------------
--(215)Pet-Gorilla
--(786)Pet-ExoticRhino
--(775)Pet-Moth
------------------*/
/*Smack*/
(49966,0,49966,1,0),
(49967,49966,49966,2,0),
(49968,49967,49966,3,0),
(49969,49968,49966,4,0),
(49970,49969,49966,5,0),
(49971,49970,49966,6,0),
(49972,49971,49966,7,0),
(49973,49972,49966,8,0),
(49974,49973,49966,9,0),
(52475,49974,49966,10,0),
(52476,52475,49966,11,0),
/*Thunderstomp*/
(26090,0,26090,1,0),
(26187,26090,26090,2,0),
(26188,26187,26090,3,0),
(27063,26188,26090,4,0),
(55572,27063,26090,5,0),
(55573,55572,26090,6,0),
/*------------------
--(217)Pet-Raptor
------------------*/
/*SavageRend*/
(50498,0,50498,1,0),
(53578,50498,50498,2,0),
(53579,53578,50498,3,0),
(53580,53579,50498,4,0),
(53581,53580,50498,5,0),
(53582,53581,50498,6,0),
/*------------------
--(214)Pet-Crab
--(218)Pet-Tallstrider
--(783)Pet-ExoticSilithid
------------------*/
/*Claw*/
(16827,0,16827,1,0),
(16828,16827,16827,2,0),
(16829,16828,16827,3,0),
(16830,16829,16827,4,0),
(16831,16830,16827,5,0),
(16832,16831,16827,6,0),
(3010,16832,16827,7,0),
(3009,3010,16827,8,0),
(27049,3009,16827,9,0),
(52471,27049,16827,10,0),
(52472,52471,16827,11,0),
/*------------------
--(236)Pet-Scorpid
------------------*/
/*ScorpidPoison*/
(24640,0,24640,1,0),
(24583,24640,24640,2,0),
(24586,24583,24640,3,0),
(24587,24586,24640,4,0),
(27060,24587,24640,5,0),
(55728,27060,24640,6,0),
/*------------------
--(237)Arcane
------------------*/
/*AmplifyMagic*/
(1008,0,1008,1,0),
(8455,1008,1008,2,0),
(10169,8455,1008,3,0),
(10170,10169,1008,4,0),
(27130,10170,1008,5,0),
(33946,27130,1008,6,0),
(43017,33946,1008,7,0),
/*ArcaneBarrage*/
(44425,0,44425,1,0),
(44780,44425,44425,2,0),
(44781,44780,44425,3,0),
/*ArcaneBlast*/
(30451,0,30451,1,0),
(42894,30451,30451,2,0),
(42896,42894,30451,3,0),
(42897,42896,30451,4,0),
/*ArcaneBrilliance*/
(23028,0,23028,1,0),
(27127,23028,23028,2,0),
(43002,27127,23028,3,0),
/*ArcaneExplosion*/
(1449,0,1449,1,0),
(8437,1449,1449,2,0),
(8438,8437,1449,3,0),
(8439,8438,1449,4,0),
(10201,8439,1449,5,0),
(10202,10201,1449,6,0),
(27080,10202,1449,7,0),
(27082,27080,1449,8,0),
(42920,27082,1449,9,0),
(42921,42920,1449,10,0),
/*ArcaneIntellect*/
(1459,0,1459,1,0),
(1460,1459,1459,2,0),
(1461,1460,1459,3,0),
(10156,1461,1459,4,0),
(10157,10156,1459,5,0),
(27126,10157,1459,6,0),
(42995,27126,1459,7,0),
/*ArcaneMissiles*/
(5143,0,5143,1,0),
(5144,5143,5143,2,0),
(5145,5144,5143,3,0),
(8416,5145,5143,4,0),
(8417,8416,5143,5,0),
(10211,8417,5143,6,0),
(10212,10211,5143,7,0),
(25345,10212,5143,8,0),
(27075,25345,5143,9,0),
(38699,27075,5143,10,0),
(38704,38699,5143,11,0),
(42843,38704,5143,12,0),
(42846,42843,5143,13,0),
/*ConjureFood*/
(587,0,587,1,0),
(597,587,587,2,0),
(990,597,587,3,0),
(6129,990,587,4,0),
(10144,6129,587,5,0),
(10145,10144,587,6,0),
(28612,10145,587,7,0),
(33717,28612,587,8,0),
/*ConjureManaGem*/
(759,0,759,1,0),
(3552,759,759,2,0),
(10053,3552,759,3,0),
(10054,10053,759,4,0),
(27101,10054,759,5,0),
(42985,27101,759,6,0),
/*ConjureRefreshment*/
(42955,0,42955,1,0),
(42956,42955,42955,2,0),
/*ConjureWater*/
(5504,0,5504,1,0),
(5505,5504,5504,2,0),
(5506,5505,5504,3,0),
(6127,5506,5504,4,0),
(10138,6127,5504,5,0),
(10139,10138,5504,6,0),
(10140,10139,5504,7,0),
(37420,10140,5504,8,0),
(27090,37420,5504,9,0),
/*DampenMagic*/
(604,0,604,1,0),
(8450,604,604,2,0),
(8451,8450,604,3,0),
(10173,8451,604,4,0),
(10174,10173,604,5,0),
(33944,10174,604,6,0),
(43015,33944,604,7,0),
/*MageArmor*/
(6117,0,6117,1,0),
(22782,6117,6117,2,0),
(22783,22782,6117,3,0),
(27125,22783,6117,4,0),
(43023,27125,6117,5,0),
(43024,43023,6117,6,0),
/*ManaShield*/
(1463,0,1463,1,0),
(8494,1463,1463,2,0),
(8495,8494,1463,3,0),
(10191,8495,1463,4,0),
(10192,10191,1463,5,0),
(10193,10192,1463,6,0),
(27131,10193,1463,7,0),
(43019,27131,1463,8,0),
(43020,43019,1463,9,0),
/*Polymorph*/
(118,0,118,1,0),
(12824,118,118,2,0),
(12825,12824,118,3,0),
(12826,12825,118,4,0),
/*RitualofRefreshment*/
(43987,0,43987,1,0),
(58659,43987,43987,2,0),
/*------------------
--(253)Assassination
------------------*/
/*Ambush*/
(8676,0,8676,1,0),
(8724,8676,8676,2,0),
(8725,8724,8676,3,0),
(11267,8725,8676,4,0),
(11268,11267,8676,5,0),
(11269,11268,8676,6,0),
(27441,11269,8676,7,0),
(48689,27441,8676,8,0),
(48690,48689,8676,9,0),
(48691,48690,8676,10,0),
/*DeadlyThrow*/
(26679,0,26679,1,0),
(48673,26679,26679,2,0),
(48674,48673,26679,3,0),
/*Envenom*/
(32645,0,32645,1,0),
(32684,32645,32645,2,0),
(57992,32684,32645,3,0),
(57993,57992,32645,4,0),
/*Eviscerate*/
(2098,0,2098,1,0),
(6760,2098,2098,2,0),
(6761,6760,2098,3,0),
(6762,6761,2098,4,0),
(8623,6762,2098,5,0),
(8624,8623,2098,6,0),
(11299,8624,2098,7,0),
(11300,11299,2098,8,0),
(31016,11300,2098,9,0),
(26865,31016,2098,10,0),
(48667,26865,2098,11,0),
(48668,48667,2098,12,0),
/*ExposeArmor*/
(8647,0,8647,1,0),
(8649,8647,8647,2,0),
(8650,8649,8647,3,0),
(11197,8650,8647,4,0),
(11198,11197,8647,5,0),
(26866,11198,8647,6,0),
(48669,26866,8647,7,0),
/*Garrote*/
(703,0,703,1,0),
(8631,703,703,2,0),
(8632,8631,703,3,0),
(8633,8632,703,4,0),
(11289,8633,703,5,0),
(11290,11289,703,6,0),
(26839,11290,703,7,0),
(26884,26839,703,8,0),
(48675,26884,703,9,0),
(48676,48675,703,10,0),
/*KidneyShot*/
(408,0,408,1,0),
(8643,408,408,2,0),
/*Mutilate*/
(1329,0,1329,1,0),
(34411,1329,1329,2,0),
(34412,34411,1329,3,0),
(34413,34412,1329,4,0),
(48663,34413,1329,5,0),
(48666,48663,1329,6,0),
/*Rupture*/
(1943,0,1943,1,0),
(8639,1943,1943,2,0),
(8640,8639,1943,3,0),
(11273,8640,1943,4,0),
(11274,11273,1943,5,0),
(11275,11274,1943,6,0),
(26867,11275,1943,7,0),
(48671,26867,1943,8,0),
(48672,48671,1943,9,0),
/*SliceandDice*/
(5171,0,5171,1,0),
(6774,5171,5171,2,0),
/*------------------
--(256)Fury
------------------*/
/*BattleShout*/
(6673,0,6673,1,0),
(5242,6673,6673,2,0),
(6192,5242,6673,3,0),
(11549,6192,6673,4,0),
(11550,11549,6673,5,0),
(11551,11550,6673,6,0),
(25289,11551,6673,7,0),
(2048,25289,6673,8,0),
(47436,2048,6673,9,0),
/*Cleave*/
(845,0,845,1,0),
(7369,845,845,2,0),
(11608,7369,845,3,0),
(11609,11608,845,4,0),
(20569,11609,845,5,0),
(25231,20569,845,6,0),
(47519,25231,845,7,0),
(47520,47519,845,8,0),
/*CommandingShout*/
(469,0,469,1,0),
(47439,469,469,2,0),
(47440,47439,469,3,0),
/*DemoralizingShout*/
(1160,0,1160,1,0),
(6190,1160,1160,2,0),
(11554,6190,1160,3,0),
(11555,11554,1160,4,0),
(11556,11555,1160,5,0),
(25202,11556,1160,6,0),
(25203,25202,1160,7,0),
(47437,25203,1160,8,0),
/*Execute*/
(5308,0,5308,1,0),
(20658,5308,5308,2,0),
(20660,20658,5308,3,0),
(20661,20660,5308,4,0),
(20662,20661,5308,5,0),
(25234,20662,5308,6,0),
(25236,25234,5308,7,0),
(47470,25236,5308,8,0),
(47471,47470,5308,9,0),
/*Slam*/
(1464,0,1464,1,0),
(8820,1464,1464,2,0),
(11604,8820,1464,3,0),
(11605,11604,1464,4,0),
(25241,11605,1464,5,0),
(25242,25241,1464,6,0),
(47474,25242,1464,7,0),
(47475,47474,1464,8,0),
/*------------------
--(257) Protection (Warrior)
------------------*/
/*Devastate*/
(20243,0,20243,1,0),
(30016,20243,20243,2,0),
(30022,30016,20243,3,0),
(47497,30022,20243,4,0),
(47498,47497,20243,5,0),
/*Revenge*/
(6572,0,6572,1,0),
(6574,6572,6572,2,0),
(7379,6574,6572,3,0),
(11600,7379,6572,4,0),
(11601,11600,6572,5,0),
(25288,11601,6572,6,0),
(25269,25288,6572,7,0),
(30357,25269,6572,8,0),
(57823,30357,6572,9,0),
/*ShieldSlam*/
(23922,0,23922,1,0),
(23923,23922,23922,2,0),
(23924,23923,23922,3,0),
(23925,23924,23922,4,0),
(25258,23925,23922,5,0),
(30356,25258,23922,6,0),
(47487,30356,23922,7,0),
(47488,47487,23922,8,0),
/*SunderArmor*/
(7386,0,7386,1,0),
(7405,7386,7386,2,0),
(8380,7405,7386,3,0),
(11596,8380,7386,4,0),
(11597,11596,7386,5,0),
(25225,11597,7386,6,0),
(47467,25225,7386,7,0),
/*------------------
-- (267) Protection (Paladin)
------------------*/
/*Avenger'sShield*/
(31935,0,31935,1,0),
(32699,31935,31935,2,0),
(32700,32699,31935,3,0),
(48826,32700,31935,4,0),
(48827,48826,31935,5,0),
/*Devotion Aura*/
(465,0,465,1,0),
(10290,465,465,2,0),
(643,10290,465,3,0),
(10291,643,465,4,0),
(1032,10291,465,5,0),
(10292,1032,465,6,0),
(10293,10292,465,7,0),
(27149,10293,465,8,0),
(48941,27149,465,9,0),
(48942,48941,465,10,0),
/*Fire Resistance Aura*/
(19891,0,19891,1,0),
(19899,19891,19891,2,0),
(19900,19899,19891,3,0),
(27153,19900,19891,4,0),
(48947,27153,19891,5,0),
/*Frost Resistance Aura*/
(19888,0,19888,1,0),
(19897,19888,19888,2,0),
(19898,19897,19888,3,0),
(27152,19898,19888,4,0),
(48945,27152,19888,5,0),
/*Greater Blessing of Kings*/
(20217,0,20217,1,0),
(25898,20217,20217,2,0),
/*Greater Blessing of Sanctuary*/
(20911,0,20911,1,0),
(25899,20911,20911,2,0),
/*HammerofJustice*/
(853,0,853,1,0),
(5588,853,853,2,0),
(5589,5588,853,3,0),
(10308,5589,853,4,0),
/*HandofProtection*/
(1022,0,1022,1,0),
(5599,1022,1022,2,0),
(10278,5599,1022,3,0),
/*Holy Shield*/
(20925,0,20925,1,0),
(20927,20925,20925,2,0),
(20928,20927,20925,3,0),
(27179,20928,20925,4,0),
(48951,27179,20925,5,0),
(48952,48951,20925,6,0),
/*Shadow Resistance Aura*/
(19876,0,19876,1,0),
(19895,19876,19876,2,0),
(19896,19895,19876,3,0),
(27151,19896,19876,4,0),
(48943,27151,19876,5,0),
/*Shield of Righteousness*/
(53600,0,53600,1,0),
(61411,53600,53600,2,0),
/*Spiritual Attunement*/
(31785,0,31785,1,0),
(33776,31785,31785,2,0),
/*------------------
--(270)Pet-GenericHunter
------------------*/
/*Cower*/
(1742,0,1742,1,0),
(1753,1742,1742,2,0),
(1754,1753,1742,3,0),
(1755,1754,1742,4,0),
(1756,1755,1742,5,0),
(16697,1756,1742,6,0),
(27048,16697,1742,7,0),
/*GreatResistance*/
(53427,0,53427,1,0),
(53429,53427,53427,2,0),
(53430,53429,53427,3,0),
/*Growl*/
(2649,0,2649,1,0),
(14916,2649,2649,2,0),
(14917,14916,2649,3,0),
(14918,14917,2649,4,0),
(14919,14918,2649,5,0),
(14920,14919,2649,6,0),
(14921,14920,2649,7,0),
(27047,14921,2649,8,0),
(61676,27047,2649,9,0),
/*------------------
-- (333) Enchanting
------------------*/
/*Enchanting*/
(7411,0,7411,1,0),
(7412,7411,7411,2,0),
(7413,7412,7411,3,0),
(13920,7413,7411,4,0),
(28029,13920,7411,5,0),
(51313,28029,7411,6,0),
/*------------------
--(354)Demonology
------------------*/
/*Banish*/
(710,0,710,1,0),
(18647,710,710,2,0),
/*CreateFirestone*/
(6366,0,6366,1,0),
(17951,6366,6366,2,0),
(17952,17951,6366,3,0),
(17953,17952,6366,4,0),
(27250,17953,6366,5,0),
(60219,27250,6366,6,0),
(60220,60219,6366,7,0),
/*CreateHealthstone*/
(6201,0,6201,1,0),
(6202,6201,6201,2,0),
(5699,6202,6201,3,0),
(11729,5699,6201,4,0),
(11730,11729,6201,5,0),
(27230,11730,6201,6,0),
(47871,27230,6201,7,0),
(47878,47871,6201,8,0),
/*CreateSoulstone*/
(693,0,693,1,0),
(20752,693,693,2,0),
(20755,20752,693,3,0),
(20756,20755,693,4,0),
(20757,20756,693,5,0),
(27238,20757,693,6,0),
(47884,27238,693,7,0),
/*CreateSpellstone*/
(2362,0,2362,1,0),
(17727,2362,2362,2,0),
(17728,17727,2362,3,0),
(28172,17728,2362,4,0),
(47886,28172,2362,5,0),
(47888,47886,2362,6,0),
/*DemonArmor*/
(706,0,706,1,0),
(1086,706,706,2,0),
(11733,1086,706,3,0),
(11734,11733,706,4,0),
(11735,11734,706,5,0),
(27260,11735,706,6,0),
(47793,27260,706,7,0),
(47889,47793,706,8,0),
/*DemonSkin*/
(687,0,687,1,0),
(696,687,687,2,0),
/*EnslaveDemon*/
(1098,0,1098,1,0),
(11725,1098,1098,2,0),
(11726,11725,1098,3,0),
(61191,11726,1098,4,0),
/*FelArmor*/
(28176,0,28176,1,0),
(28189,28176,28176,2,0),
(47892,28189,28176,3,0),
(47893,47892,28176,4,0),
/*HealthFunnel*/
(755,0,755,1,0),
(3698,755,755,2,0),
(3699,3698,755,3,0),
(3700,3699,755,4,0),
(11693,3700,755,5,0),
(11694,11693,755,6,0),
(11695,11694,755,7,0),
(27259,11695,755,8,0),
(47856,27259,755,9,0),
/*RitualofSouls*/
(29893,0,29893,1,0),
(58887,29893,29893,2,0),
/*ShadowWard*/
(6229,0,6229,1,0),
(11739,6229,6229,2,0),
(11740,11739,6229,3,0),
(28610,11740,6229,4,0),
(47890,28610,6229,5,0),
(47891,47890,6229,6,0),
/*------------------
--(355)Affliction
------------------*/
/*Corruption*/
(172,0,172,1,0),
(6222,172,172,2,0),
(6223,6222,172,3,0),
(7648,6223,172,4,0),
(11671,7648,172,5,0),
(11672,11671,172,6,0),
(25311,11672,172,7,0),
(27216,25311,172,8,0),
(47812,27216,172,9,0),
(47813,47812,172,10,0),
/*Curse of Agony*/
(980,0,980,1,0),
(1014,980,980,2,0),
(6217,1014,980,3,0),
(11711,6217,980,4,0),
(11712,11711,980,5,0),
(11713,11712,980,6,0),
(27218,11713,980,7,0),
(47863,27218,980,8,0),
(47864,47863,980,9,0),
/*Curse of Doom*/
(603,0,603,1,0),
(30910,603,603,2,0),
(47867,30910,603,3,0),
/*Curse of Recklessness*/
(704,0,704,1,0),
(7658,704,704,2,0),
(7659,7658,704,3,0),
(11717,7659,704,4,0),
(27226,11717,704,5,0),
(57595,27226,704,6,0),
/*Curse of the Elements*/
(1490,0,1490,1,0),
(11721,1490,1490,2,0),
(11722,11721,1490,3,0),
(27228,11722,1490,4,0),
(47865,27228,1490,5,0),
/*Curse of Tongues*/
(1714,0,1714,1,0),
(11719,1714,1714,2,0),
/*Curse of Weakness*/
(702,0,702,1,0),
(1108,702,702,2,0),
(6205,1108,702,3,0),
(7646,6205,702,4,0),
(11707,7646,702,5,0),
(11708,11707,702,6,0),
(27224,11708,702,7,0),
(30909,27224,702,8,0),
(50511,30909,702,9,0),
/*Dark Pact*/
(18220,0,    18220,1,0),
(18937,18220,18220,2,0),
(18938,18937,18220,3,0),
(27265,18938,18220,4,0),
(59092,27265,18220,5,0),
/*Death Coil*/
(6789,0,6789,1,0),
(17925,6789,6789,2,0),
(17926,17925,6789,3,0),
(27223,17926,6789,4,0),
(47859,27223,6789,5,0),
(47860,47859,6789,6,0),
/*Drain Life*/
(689,0,689,1,0),
(699,689,689,2,0),
(709,699,689,3,0),
(7651,709,689,4,0),
(11699,7651,689,5,0),
(11700,11699,689,6,0),
(27219,11700,689,7,0),
(27220,27219,689,8,0),
(47857,27220,689,9,0),
/*DrainSoul*/
(1120,0,1120,1,0),
(8288,1120,1120,2,0),
(8289,8288,1120,3,0),
(11675,8289,1120,4,0),
(27217,11675,1120,5,0),
(47855,27217,1120,6,0),
/*Fear*/
(5782,0,5782,1,0),
(6213,5782,5782,2,0),
(6215,6213,5782,3,0),
/*Haunt*/
(48181,0,48181,1,0),
(59161,48181,48181,2,0),
(59163,59161,48181,3,0),
(59164,59163,48181,4,0),
/*HowlofTerror*/
(5484,0,5484,1,0),
(17928,5484,5484,2,0),
/*SeedofCorruption*/
(27243,0,27243,1,0),
(47835,27243,27243,2,0),
(47836,47835,27243,3,0),
/*SiphonLife*/
(18265,0,18265,1,0),
(18879,18265,18265,2,0),
(18880,18879,18265,3,0),
(18881,18880,18265,4,0),
(27264,18881,18265,5,0),
(30911,27264,18265,6,0),
(47861,30911,18265,7,0),
(47862,47861,18265,8,0),
/*UnstableAffliction*/
(30108,0,30108,1,0),
(30404,30108,30108,2,0),
(30405,30404,30108,3,0),
(47841,30405,30108,4,0),
(47843,47841,30108,5,0),
/*------------------
-- (356) Fishing
------------------*/
/*Fishing*/
(7620,0,7620,1,0),
(7731,7620,7620,2,0),
(7732,7731,7620,3,0),
(18248,7732,7620,4,0),
(33095,18248,7620,5,0),
(51294,33095,7620,6,0),
/*------------------
--(373) Enhancement
------------------*/
/*Fire Resistance Totem*/
(8184,0,8184,1,0),
(10537,8184,8184,2,0),
(10538,10537,8184,3,0),
(25563,10538,8184,4,0),
(58737,25563,8184,5,0),
(58739,58737,8184,6,0),
/*Flametongue Totem*/
(8227,0,8227,1,0),
(8249,8227,8227,2,0),
(10526,8249,8227,3,0),
(16387,10526,8227,4,0),
(25557,16387,8227,5,0),
(58649,25557,8227,6,0),
(58652,58649,8227,7,0),
(58656,58652,8227,8,0),
/*Flametongue Weapon*/
(8024,0,8024,1,0),
(8027,8024,8024,2,0),
(8030,8027,8024,3,0),
(16339,8030,8024,4,0),
(16341,16339,8024,5,0),
(16342,16341,8024,6,0),
(25489,16342,8024,7,0),
(58785,25489,8024,8,0),
(58789,58785,8024,9,0),
(58790,58789,8024,10,0),
/*Frost Resistance Totem*/
(8181,0,8181,1,0),
(10478,8181,8181,2,0),
(10479,10478,8181,3,0),
(25560,10479,8181,4,0),
(58741,25560,8181,5,0),
(58745,58741,8181,6,0),
/*Frostbrand Weapon*/
(8033,0,8033,1,0),
(8038,8033,8033,2,0),
(10456,8038,8033,3,0),
(16355,10456,8033,4,0),
(16356,16355,8033,5,0),
(25500,16356,8033,6,0),
(58794,25500,8033,7,0),
(58795,58794,8033,8,0),
(58796,58795,8033,9,0),
/*Life Tap*/
(1454,0,1454,1,0),
(1455,1454,1454,2,0),
(1456,1455,1454,3,0),
(11687,1456,1454,4,0),
(11688,11687,1454,5,0),
(11689,11688,1454,6,0),
(27222,11689,1454,7,0),
(57946,27222,1454,8,0),
/*Lightning Shield*/
(324,0,324,1,0),
(325,324,324,2,0),
(905,325,324,3,0),
(945,905,324,4,0),
(8134,945,324,5,0),
(10431,8134,324,6,0),
(10432,10431,324,7,0),
(25469,10432,324,8,0),
(25472,25469,324,9,0),
(49280,25472,324,10,0),
(49281,49280,324,11,0),
/*Nature Resistance Totem*/
(10595,0,10595,1,0),
(10600,10595,10595,2,0),
(10601,10600,10595,3,0),
(25574,10601,10595,4,0),
(58746,25574,10595,5,0),
(58749,58746,10595,6,0),
/*Rockbiter Weapon*/
(8017,0,8017,1,0),
(8018,8017,8017,2,0),
(8019,8018,8017,3,0),
(10399,8019,8017,4,0),
/*Stoneskin Totem*/
(8071,0,8071,1,0),
(8154,8071,8071,2,0),
(8155,8154,8071,3,0),
(10406,8155,8071,4,0),
(10407,10406,8071,5,0),
(10408,10407,8071,6,0),
(25508,10408,8071,7,0),
(25509,25508,8071,8,0),
(58751,25509,8071,9,0),
(58753,58751,8071,10,0),
/*Strength of Earth Totem*/
(8075,0,8075,1,0),
(8160,8075,8075,2,0),
(8161,8160,8075,3,0),
(10442,8161,8075,4,0),
(25361,10442,8075,5,0),
(25528,25361,8075,6,0),
(57622,25528,8075,7,0),
(58643,57622,8075,8,0),
/*WindfuryWeapon*/
(8232,0,8232,1,0),
(8235,8232,8232,2,0),
(10486,8235,8232,3,0),
(16362,10486,8232,4,0),
(25505,16362,8232,5,0),
(58801,25505,8232,6,0),
(58803,58801,8232,7,0),
(58804,58803,8232,8,0),
/*------------------
-- (374) Restoration (Shaman)
------------------*/
/*AncestralSpirit*/
(2008,0,2008,1,0),
(20609,2008,2008,2,0),
(20610,20609,2008,3,0),
(20776,20610,2008,4,0),
(20777,20776,2008,5,0),
(25590,20777,2008,6,0),
(49277,25590,2008,7,0),
/*ChainHeal*/
(1064,0,1064,1,0),
(10622,1064,1064,2,0),
(10623,10622,1064,3,0),
(25422,10623,1064,4,0),
(25423,25422,1064,5,0),
(55458,25423,1064,6,0),
(55459,55458,1064,7,0),
/*EarthShield*/
(974,0,974,1,0),
(32593,974,974,2,0),
(32594,32593,974,3,0),
(49283,32594,974,4,0),
(49284,49283,974,5,0),
/*EarthlivingWeapon*/
(51730,0,51730,1,0),
(51988,51730,51730,2,0),
(51991,51988,51730,3,0),
(51992,51991,51730,4,0),
(51993,51992,51730,5,0),
(51994,51993,51730,6,0),
/*HealingStreamTotem*/
(5394,0,5394,1,0),
(6375,5394,5394,2,0),
(6377,6375,5394,3,0),
(10462,6377,5394,4,0),
(10463,10462,5394,5,0),
(25567,10463,5394,6,0),
(58755,25567,5394,7,0),
(58756,58755,5394,8,0),
(58757,58756,5394,9,0),
/*HealingWave*/
(331,0,331,1,0),
(332,331,331,2,0),
(547,332,331,3,0),
(913,547,331,4,0),
(939,913,331,5,0),
(959,939,331,6,0),
(8005,959,331,7,0),
(10395,8005,331,8,0),
(10396,10395,331,9,0),
(25357,10396,331,10,0),
(25391,25357,331,11,0),
(25396,25391,331,12,0),
(49272,25396,331,13,0),
(49273,49272,331,14,0),
/*LesserHealingWave*/
(8004,0,8004,1,0),
(8008,8004,8004,2,0),
(8010,8008,8004,3,0),
(10466,8010,8004,4,0),
(10467,10466,8004,5,0),
(10468,10467,8004,6,0),
(25420,10468,8004,7,0),
(49275,25420,8004,8,0),
(49276,49275,8004,9,0),
/*Mana Spring Totem*/
(5675,0,5675,1,0),
(10495,5675,5675,2,0),
(10496,10495,5675,3,0),
(10497,10496,5675,4,0),
(25570,10497,5675,5,0),
(58771,25570,5675,6,0),
(58773,58771,5675,7,0),
(58774,58773,5675,8,0),
/*Riptide*/
(61295,0,61295,1,0),
(61299,61295,61295,2,0),
(61300,61299,61295,3,0),
(61301,61300,61295,4,0),
/*Water Shield*/
(52127,0,52127,1,0),
(52129,52127,52127,2,0),
(52131,52129,52127,3,0),
(52134,52131,52127,4,0),
(52136,52134,52127,5,0),
(52138,52136,52127,6,0),
(24398,52138,52127,7,0),
(33736,24398,52127,8,0),
(57960,33736,52127,9,0),
/*------------------
-- (375) Elemental Combat
------------------*/
/*Chain Lightning*/
(421,0,421,1,0),
(930,421,421,2,0),
(2860,930,421,3,0),
(10605,2860,421,4,0),
(25439,10605,421,5,0),
(25442,25439,421,6,0),
(49270,25442,421,7,0),
(49271,49270,421,8,0),
/*Earth Shock*/
(8042,0,8042,1,0),
(8044,8042,8042,2,0),
(8045,8044,8042,3,0),
(8046,8045,8042,4,0),
(10412,8046,8042,5,0),
(10413,10412,8042,6,0),
(10414,10413,8042,7,0),
(25454,10414,8042,8,0),
(49230,25454,8042,9,0),
(49231,49230,8042,10,0),
/*Fire Nova Totem*/
(1535,0,1535,1,0),
(8498,1535,1535,2,0),
(8499,8498,1535,3,0),
(11314,8499,1535,4,0),
(11315,11314,1535,5,0),
(25546,11315,1535,6,0),
(25547,25546,1535,7,0),
(61649,25547,1535,8,0),
(61657,61649,1535,9,0),
/*Flame Shock*/
(8050,0,8050,1,0),
(8052,8050,8050,2,0),
(8053,8052,8050,3,0),
(10447,8053,8050,4,0),
(10448,10447,8050,5,0),
(29228,10448,8050,6,0),
(25457,29228,8050,7,0),
(49232,25457,8050,8,0),
(49233,49232,8050,9,0),
/*Frost Shock*/
(8056,0,8056,1,0),
(8058,8056,8056,2,0),
(10472,8058,8056,3,0),
(10473,10472,8056,4,0),
(25464,10473,8056,5,0),
(49235,25464,8056,6,0),
(49236,49235,8056,7,0),
/*Lava Burst*/
(51505,0,51505,1,0),
(60043,51505,51505,2,0),
/*Lightning Bolt*/
(403,0,403,1,0),
(529,403,403,2,0),
(548,529,403,3,0),
(915,548,403,4,0),
(943,915,403,5,0),
(6041,943,403,6,0),
(10391,6041,403,7,0),
(10392,10391,403,8,0),
(15207,10392,403,9,0),
(15208,15207,403,10,0),
(25448,15208,403,11,0),
(25449,25448,403,12,0),
(49237,25449,403,13,0),
(49238,49237,403,14,0),
/*Magma Totem*/
(8190,0,8190,1,0),
(10585,8190,8190,2,0),
(10586,10585,8190,3,0),
(10587,10586,8190,4,0),
(25552,10587,8190,5,0),
(58731,25552,8190,6,0),
(58734,58731,8190,7,0),
/*Purge*/
(370,0,370,1,0),
(8012,370,370,2,0),
/*Searing Totem*/
(3599,0,3599,1,0),
(6363,3599,3599,2,0),
(6364,6363,3599,3,0),
(6365,6364,3599,4,0),
(10437,6365,3599,5,0),
(10438,10437,3599,6,0),
(25533,10438,3599,7,0),
(58699,25533,3599,8,0),
(58703,58699,3599,9,0),
(58704,58703,3599,10,0),
/*Stoneclaw Totem*/
(5730,0,5730,1,0),
(6390,5730,5730,2,0),
(6391,6390,5730,3,0),
(6392,6391,5730,4,0),
(10427,6392,5730,5,0),
(10428,10427,5730,6,0),
(25525,10428,5730,7,0),
(58580,25525,5730,8,0),
(58581,58580,5730,9,0),
(58582,58581,5730,10,0),
/*Totemof Wrath*/
(30706,0,30706,1,0),
(57720,30706,30706,2,0),
(57721,57720,30706,3,0),
(57722,57721,30706,4,0),
/*Thunderstorm*/
(51490,0,51490,1,0),
(59156,51490,51490,2,0),
(59158,59156,51490,3,0),
(59159,59158,51490,4,0),
/*------------------
-- (393) Skinning
------------------*/
/*Skinning*/
(8613,0,8613,1,0),
(8617,8613,8613,2,0),
(8618,8617,8613,3,0),
(10768,8618,8613,4,0),
(32678,10768,8613,5,0),
(50305,32678,8613,6,0),
/*Master of Anatomy*/
(53125,0,53125,1,0),
(53662,53125,53125,2,0),
(53663,53662,53125,3,0),
(53664,53663,53125,4,0),
(53665,53664,53125,5,0),
(53666,53665,53125,6,0),
/*------------------
--(573)Restoration
------------------*/
/*GiftoftheWild*/
(21849,0,21849,1,0),
(21850,21849,21849,2,0),
(26991,21850,21849,3,0),
(48470,26991,21849,4,0),
/*HealingTouch*/
(5185,0,5185,1,0),
(5186,5185,5185,2,0),
(5187,5186,5185,3,0),
(5188,5187,5185,4,0),
(5189,5188,5185,5,0),
(6778,5189,5185,6,0),
(8903,6778,5185,7,0),
(9758,8903,5185,8,0),
(9888,9758,5185,9,0),
(9889,9888,5185,10,0),
(25297,9889,5185,11,0),
(26978,25297,5185,12,0),
(26979,26978,5185,13,0),
(48377,26979,5185,14,0),
(48378,48377,5185,15,0),
/*Lifebloom*/
(33763,0,33763,1,0),
(48450,33763,33763,2,0),
(48451,48450,33763,3,0),
/*MarkoftheWild*/
(1126,0,1126,1,0),
(5232,1126,1126,2,0),
(6756,5232,1126,3,0),
(5234,6756,1126,4,0),
(8907,5234,1126,5,0),
(9884,8907,1126,6,0),
(9885,9884,1126,7,0),
(26990,9885,1126,8,0),
(48469,26990,1126,9,0),
/*Nourish*/
(50464,0,50464,1,0),
/*Rebirth*/
(20484,0,20484,1,0),
(20739,20484,20484,2,0),
(20742,20739,20484,3,0),
(20747,20742,20484,4,0),
(20748,20747,20484,5,0),
(26994,20748,20484,6,0),
(48477,26994,20484,7,0),
/*Regrowth*/
(8936,0,8936,1,0),
(8938,8936,8936,2,0),
(8939,8938,8936,3,0),
(8940,8939,8936,4,0),
(8941,8940,8936,5,0),
(9750,8941,8936,6,0),
(9856,9750,8936,7,0),
(9857,9856,8936,8,0),
(9858,9857,8936,9,0),
(26980,9858,8936,10,0),
(48442,26980,8936,11,0),
(48443,48442,8936,12,0),
/*Rejuvenation*/
(774,0,774,1,0),
(1058,774,774,2,0),
(1430,1058,774,3,0),
(2090,1430,774,4,0),
(2091,2090,774,5,0),
(3627,2091,774,6,0),
(8910,3627,774,7,0),
(9839,8910,774,8,0),
(9840,9839,774,9,0),
(9841,9840,774,10,0),
(25299,9841,774,11,0),
(26981,25299,774,12,0),
(26982,26981,774,13,0),
(48440,26982,774,14,0),
(48441,48440,774,15,0),
/*Revive*/
(50769,0,50769,1,0),
(50768,50769,50769,2,0),
(50767,50768,50769,3,0),
(50766,50767,50769,4,0),
(50765,50766,50769,5,0),
(50764,50765,50769,6,0),
(50763,50764,50769,7,0),
/*Tranquility*/
(740,0,740,1,0),
(8918,740,740,2,0),
(9862,8918,740,3,0),
(9863,9862,740,4,0),
(26983,9863,740,5,0),
(48446,26983,740,6,0),
(48447,48446,740,7,0),
/*WildGrowth*/
(48438,0,48438,1,0),
(53248,48438,48438,2,0),
(53249,53248,48438,3,0),
(53251,53249,48438,4,0),
/*------------------
--(574)Balance
------------------*/
/*EntanglingRoots*/
(339,0,339,1,0),
(1062,339,339,2,0),
(5195,1062,339,3,0),
(5196,5195,339,4,0),
(9852,5196,339,5,0),
(9853,9852,339,6,0),
(26989,9853,339,7,0),
(53308,26989,339,8,0),
/*Nature'sGrasp*/
(16689,0,16689,1,339),
(16810,16689,16689,2,1062),
(16811,16810,16689,3,5195),
(16812,16811,16689,4,5196),
(16813,16812,16689,5,9852),
(17329,16813,16689,6,9853),
(27009,17329,16689,7,26989),
(53312,27009,16689,8,53308),
/*FaerieFire*/
(770,0,770,1,0),
(778,770,770,2,0),
(9749,778,770,3,0),
(9907,9749,770,4,0),
(26993,9907,770,5,0),
(48476,26993,770,6,0),
/*Hibernate*/
(2637,0,2637,1,0),
(18657,2637,2637,2,0),
(18658,18657,2637,3,0),
/*Hurricane*/
(16914,0,16914,1,0),
(17401,16914,16914,2,0),
(17402,17401,16914,3,0),
(27012,17402,16914,4,0),
(48467,27012,16914,5,0),
/*InsectSwarm*/
(5570,0,5570,1,0),
(24974,5570,5570,2,0),
(24975,24974,5570,3,0),
(24976,24975,5570,4,0),
(24977,24976,5570,5,0),
(27013,24977,5570,6,0),
(48468,27013,5570,7,0),
/*Moonfire*/
(8921,0,8921,1,0),
(8924,8921,8921,2,0),
(8925,8924,8921,3,0),
(8926,8925,8921,4,0),
(8927,8926,8921,5,0),
(8928,8927,8921,6,0),
(8929,8928,8921,7,0),
(9833,8929,8921,8,0),
(9834,9833,8921,9,0),
(9835,9834,8921,10,0),
(26987,9835,8921,11,0),
(26988,26987,8921,12,0),
(48462,26988,8921,13,0),
(48463,48462,8921,14,0),
/*SootheAnimal*/
(2908,0,2908,1,0),
(8955,2908,2908,2,0),
(9901,8955,2908,3,0),
(26995,9901,2908,4,0),
/*Starfall*/
(48505,0,48505,1,0),
(53199,48505,48505,2,0),
(53200,53199,48505,3,0),
(53201,53200,48505,4,0),
/*Starfall AOE*/
(50294,0,50294,1,0),
(53188,50294,50294,2,0),
(53189,53188,50294,3,0),
(53190,53189,50294,4,0),
/*Starfall Direct*/
(50288,0,50288,1,0),
(53191,50288,50288,2,0),
(53194,53191,50288,3,0),
(53195,53194,50288,4,0),
/*Starfire*/
(2912,0,2912,1,0),
(8949,2912,2912,2,0),
(8950,8949,2912,3,0),
(8951,8950,2912,4,0),
(9875,8951,2912,5,0),
(9876,9875,2912,6,0),
(25298,9876,2912,7,0),
(26986,25298,2912,8,0),
(48464,26986,2912,9,0),
(48465,48464,2912,10,0),
/*Thorns*/
(467,0,467,1,0),
(782,467,467,2,0),
(1075,782,467,3,0),
(8914,1075,467,4,0),
(9756,8914,467,5,0),
(9910,9756,467,6,0),
(26992,9910,467,7,0),
(53307,26992,467,8,0),
/*Typhoon*/
(50516,0,50516,1,0),
(53223,50516,50516,2,0),
(53225,53223,50516,3,0),
(53226,53225,50516,4,0),
(61384,53226,50516,5,0),
/*Wrath*/
(5176,0,5176,1,0),
(5177,5176,5176,2,0),
(5178,5177,5176,3,0),
(5179,5178,5176,4,0),
(5180,5179,5176,5,0),
(6780,5180,5176,6,0),
(8905,6780,5176,7,0),
(9912,8905,5176,8,0),
(26984,9912,5176,9,0),
(26985,26984,5176,10,0),
(48459,26985,5176,11,0),
(48461,48459,5176,12,0),
/*------------------
--(593)Destruction
------------------*/
/*ChaosBolt*/
(50796,0,50796,1,0),
(59170,50796,50796,2,0),
(59171,59170,50796,3,0),
(59172,59171,50796,4,0),
/*Conflagrate*/
(17962,0,17962,1,0),
(18930,17962,17962,2,0),
(18931,18930,17962,3,0),
(18932,18931,17962,4,0),
(27266,18932,17962,5,0),
(30912,27266,17962,6,0),
(47828,30912,17962,7,0),
(47829,47828,17962,8,0),
/*Hellfire*/
(1949,0,1949,1,0),
(11683,1949,1949,2,0),
(11684,11683,1949,3,0),
(27213,11684,1949,4,0),
(47823,27213,1949,5,0),
/*Immolate*/
(348,0,348,1,0),
(707,348,348,2,0),
(1094,707,348,3,0),
(2941,1094,348,4,0),
(11665,2941,348,5,0),
(11667,11665,348,6,0),
(11668,11667,348,7,0),
(25309,11668,348,8,0),
(27215,25309,348,9,0),
(47810,27215,348,10,0),
(47811,47810,348,11,0),
/*Incinerate*/
(29722,0,29722,1,0),
(32231,29722,29722,2,0),
(47837,32231,29722,3,0),
(47838,47837,29722,4,0),
/*RainofFire*/
(5740,0,5740,1,0),
(6219,5740,5740,2,0),
(11677,6219,5740,3,0),
(11678,11677,5740,4,0),
(27212,11678,5740,5,0),
(47819,27212,5740,6,0),
(47820,47819,5740,7,0),
/*SearingPain*/
(5676,0,5676,1,0),
(17919,5676,5676,2,0),
(17920,17919,5676,3,0),
(17921,17920,5676,4,0),
(17922,17921,5676,5,0),
(17923,17922,5676,6,0),
(27210,17923,5676,7,0),
(30459,27210,5676,8,0),
(47814,30459,5676,9,0),
(47815,47814,5676,10,0),
/*ShadowBolt*/
(686,0,686,1,0),
(695,686,686,2,0),
(705,695,686,3,0),
(1088,705,686,4,0),
(1106,1088,686,5,0),
(7641,1106,686,6,0),
(11659,7641,686,7,0),
(11660,11659,686,8,0),
(11661,11660,686,9,0),
(25307,11661,686,10,0),
(27209,25307,686,11,0),
(47808,27209,686,12,0),
(47809,47808,686,13,0),
/*Shadowburn*/
(17877,0,17877,1,0),
(18867,17877,17877,2,0),
(18868,18867,17877,3,0),
(18869,18868,17877,4,0),
(18870,18869,17877,5,0),
(18871,18870,17877,6,0),
(27263,18871,17877,7,0),
(30546,27263,17877,8,0),
(47826,30546,17877,9,0),
(47827,47826,17877,10,0),
/*Shadowflame*/
(47897,0,47897,1,0),
(61290,47897,47897,2,0),
/*Shadowfury*/
(30283,0,30283,1,0),
(30413,30283,30283,2,0),
(30414,30413,30283,3,0),
(47846,30414,30283,4,0),
(47847,47846,30283,5,0),
/*SoulFire*/
(6353,0,6353,1,0),
(17924,6353,6353,2,0),
(27211,17924,6353,3,0),
(30545,27211,6353,4,0),
(47824,30545,6353,5,0),
(47825,47824,6353,6,0),
/*------------------
--(594) Holy (Paladin)
------------------*/
/*Blessing of Wisdom*/
(19742,0,19742,1,0),
(19850,19742,19742,2,0),
(19852,19850,19742,3,0),
(19853,19852,19742,4,0),
(19854,19853,19742,5,0),
(25290,19854,19742,6,0),
(27142,25290,19742,7,0),
(48935,27142,19742,8,0),
(48936,48935,19742,9,0),
/*Consecration*/
(26573,0,26573,1,0),
(20116,26573,26573,2,0),
(20922,20116,26573,3,0),
(20923,20922,26573,4,0),
(20924,20923,26573,5,0),
(27173,20924,26573,6,0),
(48818,27173,26573,7,0),
(48819,48818,26573,8,0),
/*Exorcism*/
(879,0,879,1,0),
(5614,879,879,2,0),
(5615,5614,879,3,0),
(10312,5615,879,4,0),
(10313,10312,879,5,0),
(10314,10313,879,6,0),
(27138,10314,879,7,0),
(48800,27138,879,8,0),
(48801,48800,879,9,0),
/*Flash of Light*/
(19750,0,19750,1,0),
(19939,19750,19750,2,0),
(19940,19939,19750,3,0),
(19941,19940,19750,4,0),
(19942,19941,19750,5,0),
(19943,19942,19750,6,0),
(27137,19943,19750,7,0),
(48784,27137,19750,8,0),
(48785,48784,19750,9,0),
/*Greater Blessing of Wisdom*/
(25894,0,25894,1,19854),
(25918,25894,25894,2,25290),
(27143,25918,25894,3,27142),
(48937,27143,25894,4,48935),
(48938,48937,25894,5,48936),
/*Holy Light*/
(635,0,635,1,0),
(639,635,635,2,0),
(647,639,635,3,0),
(1026,647,635,4,0),
(1042,1026,635,5,0),
(3472,1042,635,6,0),
(10328,3472,635,7,0),
(10329,10328,635,8,0),
(25292,10329,635,9,0),
(27135,25292,635,10,0),
(27136,27135,635,11,0),
(48781,27136,635,12,0),
(48782,48781,635,13,0),
/*HolyShock*/
(20473,0,20473,1,0),
(20929,20473,20473,2,0),
(20930,20929,20473,3,0),
(27174,20930,20473,4,0),
(33072,27174,20473,5,0),
(48824,33072,20473,6,0),
(48825,48824,20473,7,0),
/*HolyWrath*/
(2812,0,2812,1,0),
(10318,2812,2812,2,0),
(27139,10318,2812,3,0),
(48816,27139,2812,4,0),
(48817,48816,2812,5,0),
/*Lay on Hands*/
(633,0,633,1,0),
(2800,633,633,2,0),
(10310,2800,633,3,0),
(27154,10310,633,4,0),
(48788,27154,633,5,0),
/*Redemption*/
(7328,0,7328,1,0),
(10322,7328,7328,2,0),
(10324,10322,7328,3,0),
(20772,10324,7328,4,0),
(20773,20772,7328,5,0),
(48949,20773,7328,6,0),
(48950,48949,7328,7,0),
/*------------------
--(613)Discipline
------------------*/
/*DispelMagic*/
(527,0,527,1,0),
(988,527,527,2,0),
/*DivineSpirit*/
(14752,0,14752,1,0),
(14818,14752,14752,2,0),
(14819,14818,14752,3,0),
(27841,14819,14752,4,0),
(25312,27841,14752,5,0),
(48073,25312,14752,6,0),
/*InnerFire*/
(588,0,588,1,0),
(7128,588,588,2,0),
(602,7128,588,3,0),
(1006,602,588,4,0),
(10951,1006,588,5,0),
(10952,10951,588,6,0),
(25431,10952,588,7,0),
(48040,25431,588,8,0),
(48168,48040,588,9,0),
/*Penance*/
(47540,0,47540,1,0),
(53005,47540,47540,2,0),
(53006,53005,47540,3,0),
(53007,53006,47540,4,0),
/*PowerWord:Fortitude*/
(1243,0,1243,1,0),
(1244,1243,1243,2,0),
(1245,1244,1243,3,0),
(2791,1245,1243,4,0),
(10937,2791,1243,5,0),
(10938,10937,1243,6,0),
(25389,10938,1243,7,0),
(48161,25389,1243,8,0),
/*PowerWord:Shield*/
(17,0,17,1,0),
(592,17,17,2,0),
(600,592,17,3,0),
(3747,600,17,4,0),
(6065,3747,17,5,0),
(6066,6065,17,6,0),
(10898,6066,17,7,0),
(10899,10898,17,8,0),
(10900,10899,17,9,0),
(10901,10900,17,10,0),
(25217,10901,17,11,0),
(25218,25217,17,12,0),
(48065,25218,17,13,0),
(48066,48065,17,14,0),
/*PrayerofFortitude*/
(21562,0,21562,1,0),
(21564,21562,21562,2,0),
(25392,21564,21562,3,0),
(48162,25392,21562,4,0),
/*Prayer of Spirit*/
(27681,0,27681,1,14752),
(32999,27681,27681,2,0),
(48074,32999,27681,3,0),
/*ShackleUndead*/
(9484,0,9484,1,0),
(9485,9484,9484,2,0),
(10955,9485,9484,3,0),
/*------------------
--(654)Pet-Hyena
------------------*/
/*TendonRip*/
(50271,0,50271,1,0),
(53571,50271,50271,2,0),
(53572,53571,50271,3,0),
(53573,53572,50271,4,0),
(53574,53573,50271,5,0),
(53575,53574,50271,6,0),
/*------------------
--(655)Pet-BirdofPrey
------------------*/
/*Snatch*/
(50541,0,50541,1,0),
(53537,50541,50541,2,0),
(53538,53537,50541,3,0),
(53540,53538,50541,4,0),
(53542,53540,50541,5,0),
(53543,53542,50541,6,0),
/*------------------
--(656)Pet-WindSerpent
------------------*/
/*LightningBreath*/
(24844,0,24844,1,0),
(25008,24844,24844,2,0),
(25009,25008,24844,3,0),
(25010,25009,24844,4,0),
(25011,25010,24844,5,0),
(25012,25011,24844,6,0),
/*------------------
-- (755) Jewelcrafting
------------------*/
/*Jewelcrafting*/
(25229,0,25229,1,0),
(25230,25229,25229,2,0),
(28894,25230,25229,3,0),
(28895,28894,25229,4,0),
(28897,28895,25229,5,0),
(51311,28897,25229,6,0),
/*------------------
--(761)Pet-Felguard
------------------*/
/*Anguish*/
(33698,0,33698,1,0),
(33699,33698,33698,2,0),
(33700,33699,33698,3,0),
(47993,33700,33698,4,0),
/*Cleave*/
(30213,0,30213,1,0),
(30219,30213,30213,2,0),
(30223,30219,30213,3,0),
(47994,30223,30213,4,0),
/*Intercept*/
(30151,0,30151,1,0),
(30194,30151,30151,2,0),
(30198,30194,30151,3,0),
(47996,30198,30151,4,0),
/*------------------
-- (762) Riding
------------------*/
/*Riding*/
(33388,0,33388,1,0),
(33391,33388,33388,2,0),
(34090,33391,33388,3,0),
(34091,34090,33388,4,0),
/*------------------
--(763)Pet-Dragonhawk
------------------*/
/*FireBreath*/
(34889,0,34889,1,0),
(35323,34889,34889,2,0),
(55482,35323,34889,3,0),
(55483,55482,34889,4,0),
(55484,55483,34889,5,0),
(55485,55484,34889,6,0),
/*------------------
--(764)Pet-NetherRay
--(765)Pet-Sporebat
------------------*/
/*SporeCloud*/
(50274,0,50274,1,0),
(53593,50274,50274,2,0),
(53594,53593,50274,3,0),
(53596,53594,50274,4,0),
(53597,53596,50274,5,0),
(53598,53597,50274,6,0),
/*------------------
--(768)Pet-Serpent
------------------*/
/*PoisonSpit*/
(35387,0,35387,1,0),
(35389,35387,35387,2,0),
(35392,35389,35387,3,0),
(55555,35392,35387,4,0),
(55556,55555,35387,5,0),
(55557,55556,35387,6,0),
/*------------------
--(770)Blood
------------------*/
/*BloodBoil*/
(48721,0,48721,1,0),
(49939,48721,48721,2,0),
(49940,49939,48721,3,0),
(49941,49940,48721,4,0),
/*BloodStrike*/
(45902,0,45902,1,0),
(49926,45902,45902,2,0),
(49927,49926,45902,3,0),
(49928,49927,45902,4,0),
(49929,49928,45902,5,0),
(49930,49929,45902,6,0),
/*HeartStrike*/
(55050,0,55050,1,0),
(55258,55050,55050,2,0),
(55259,55258,55050,3,0),
(55260,55259,55050,4,0),
(55261,55260,55050,5,0),
(55262,55261,55050,6,0),
/*ImprovedRuneTap*/
(48985,0,48985,1,0),
(49488,48985,48985,2,0),
(49489,49488,48985,3,0),
/*Pestilence*/
(50842,0,50842,1,0),
(51426,50842,50842,2,0),
(51427,51426,50842,3,0),
(51428,51427,50842,4,0),
(51429,51428,50842,5,0),
/*Strangulate*/
(47476,0,47476,1,0),
(49913,47476,47476,2,0),
(49914,49913,47476,3,0),
(49915,49914,47476,4,0),
(49916,49915,47476,5,0),
/*Vendetta*/
(49015,0,49015,1,0),
(50154,49015,49015,2,0),
(55136,50154,49015,3,0),
/*------------------
--(771)Frost
------------------*/
/*FrostStrike*/
(49143,0,49143,1,0),
(51416,49143,49143,2,0),
(51417,51416,49143,3,0),
(51418,51417,49143,4,0),
(51419,51418,49143,5,0),
(55268,51419,49143,6,0),
/*HornofWinter*/
(57330,0,57330,1,0),
(57623,57330,57330,2,0),
/*HowlingBlast*/
(49184,0,49184,1,0),
(51408,49184,49184,2,0),
(51409,51408,49184,3,0),
(51410,51409,49184,4,0),
(51411,51410,49184,5,0),
/*IcyTalons*/
(50880,0,50880,1,0),
(50884,50880,50880,2,0),
(50885,50884,50880,3,0),
(50886,50885,50880,4,0),
(50887,50886,50880,5,0),
/*IcyTouch*/
(45477,0,45477,1,0),
(49896,45477,45477,2,0),
(49903,49896,45477,3,0),
(49904,49903,45477,4,0),
(49909,49904,45477,5,0),
/*ImprovedIcyTouch*/
(49175,0,49175,1,0),
(50031,49175,49175,2,0),
(51456,50031,49175,3,0),
/*Obliterate*/
(49020,0,49020,1,0),
(51423,49020,49020,2,0),
(51424,51423,49020,3,0),
(51425,51424,49020,4,0),
/*------------------
--(772)Unholy
------------------*/
/*CorpseExplosion*/
(49158,0,49158,1,0),
(51325,49158,49158,2,0),
(51326,51325,49158,3,0),
(51327,51326,49158,4,0),
(51328,51327,49158,5,0),
/*DeathandDecay*/
(43265,0,43265,1,0),
(49936,43265,43265,2,0),
(49937,49936,43265,3,0),
(49938,49937,43265,4,0),
/*DeathCoil*/
(47541,0,47541,1,0),
(49892,47541,47541,2,0),
(49893,49892,47541,3,0),
(49894,49893,47541,4,0),
(49895,49894,47541,5,0),
/*DeathStrike*/
(49998,0,49998,1,0),
(49999,49998,49998,2,0),
(45463,49999,49998,3,0),
(49923,45463,49998,4,0),
(49924,49923,49998,5,0),
/*MagicSuppression*/
(49224,0,49224,1,0),
(49610,49224,49224,2,0),
(49611,49610,49224,3,0),
(49612,49611,49224,4,0),
(49614,49612,49224,5,0),
/*Outbreak*/
(49013,0,49013,1,0),
(55236,49013,49013,2,0),
(55237,55236,49013,3,0),
/*PlagueStrike*/
(45462,0,45462,1,0),
(49917,45462,45462,2,0),
(49918,49917,45462,3,0),
(49919,49918,45462,4,0),
(49920,49919,45462,5,0),
(49921,49920,45462,6,0),
/*ScourgeStrike*/
(55090,0,55090,1,0),
(55265,55090,55090,2,0),
(55270,55265,55090,3,0),
(55271,55270,55090,4,0),
/*UnholyBlight*/
(49194,0,49194,1,0),
(51376,49194,49194,2,0),
(51378,51376,49194,3,0),
(51379,51378,49194,4,0),
/*------------------
-- (773) Inscription
------------------*/
/*Inscription*/
(45357,0,45357,1,0),
(45358,45357,45357,2,0),
(45359,45358,45357,3,0),
(45360,45359,45357,4,0),
(45361,45360,45357,5,0),
(45363,45361,45357,6,0),
/*------------------
-- (777) Mounts
------------------*/
(13819,0,13819,1,0),
(23214,13819,13819,2,33391),
(34769,0,34769,1,0),
(34767,34769,34769,2,33391),
/*------------------
--(780)Pet-ExoticChimaera
------------------*/
/*FroststormBreath*/
(54644,0,54644,1,0),
(55488,54644,54644,2,0),
(55489,55488,54644,3,0),
(55490,55489,54644,4,0),
(55491,55490,54644,5,0),
(55492,55491,54644,6,0),
/*------------------
--(781)Pet-ExoticDevlisaur
------------------*/
/*MonstrousBite*/
(54680,0,54680,1,0),
(55495,54680,54680,2,0),
(55496,55495,54680,3,0),
(55497,55496,54680,4,0),
(55498,55497,54680,5,0),
(55499,55498,54680,6,0),
/*------------------
--(784)Pet-ExoticWorm
------------------*/
/*AcidSpit*/
(55749,0,55749,1,0),
(55750,55749,55749,2,0),
(55751,55750,55749,3,0),
(55752,55751,55749,4,0),
(55753,55752,55749,5,0),
(55754,55753,55749,6,0),
/*------------------
--(785)Pet-Wasp
------------------*/
/*Sting*/
(56626,0,56626,1,0),
(56627,56626,56626,2,0),
(56628,56627,56626,3,0),
(56629,56628,56626,4,0),
(56630,56629,56626,5,0),
(56631,56630,56626,6,0),
/*------------------
--(787)Pet-ExoticCoreHound
------------------*/
/*LavaBreath*/
(58604,0,58604,1,0),
(58607,58604,58604,2,0),
(58608,58607,58604,3,0),
(58609,58608,58604,4,0),
(58610,58609,58604,5,0),
(58611,58610,58604,6,0),
/*------------------
--(788)Pet-ExoticSpiritBeast
------------------*/
/*SpiritStrike*/
(61193,0,61193,1,0),
(61194,61193,61193,2,0),
(61195,61194,61193,3,0),
(61196,61195,61193,4,0),
(61197,61196,61193,5,0),
(61198,61197,61193,6,0),

/*Tranquility*/
(44203,    0,44203,1,0),
(44205,44203,44203,2,0),
(44206,44205,44203,3,0),
(44207,44206,44203,4,0),
(44208,44207,44203,5,0),
(48444,44208,44203,6,0),
(48445,48444,44203,7,0),
/*Hurricane*/
(42231,    0,42231,1,0),
(42232,42231,42231,2,0),
(42233,42232,42231,3,0),
(42230,42233,42231,4,0),
(48466,42230,42231,5,0);
/*!40000 ALTER TABLE `spell_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_disabled`
--

DROP TABLE IF EXISTS `spell_disabled`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_disabled` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'spell entry',
  `ischeat_spell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'mark spell as cheat',
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'enable check of this spell',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Dissabled Spell System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_disabled`
--

LOCK TABLES `spell_disabled` WRITE;
/*!40000 ALTER TABLE `spell_disabled` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_disabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_elixir`
--

DROP TABLE IF EXISTS `spell_elixir`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_elixir` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of potion',
  `mask` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_elixir`
--

LOCK TABLES `spell_elixir` WRITE;
/*!40000 ALTER TABLE `spell_elixir` DISABLE KEYS */;
INSERT INTO `spell_elixir` VALUES (673,2),(2367,1),(2374,1),(2378,2),(2380,2),(3160,1),(3164,1),(3166,2),(3219,2),(3220,2),(3222,2),(3223,2),(3593,2),(7844,1),(8212,1),(10667,1),(10668,2),(10669,1),(10692,2),(10693,2),(11319,2),(11328,1),(11334,1),(11348,2),(11349,2),(11364,2),(11371,2),(11390,1),(11396,2),(11405,1),(11406,1),(11474,1),(15231,2),(15233,2),(16321,2),(16322,1),(16323,1),(16325,2),(16326,2),(16327,2),(16329,1),(17038,1),(17535,2),(17537,1),(17538,1),(17539,1),(17624,3),(17626,3),(17627,3),(17629,3),(17628,3),(21920,1),(24361,2),(24363,2),(24382,2),(24383,2),(24417,2),(26276,1),(27652,2),(27653,2),(28486,1),(28488,1),(28490,1),(28491,1),(28493,1),(28497,1),(28501,1),(28502,2),(28503,1),(28509,2),(28514,2),(28518,3),(28519,3),(28520,3),(28521,3),(28540,3),(29348,2),(33720,1),(33721,1),(33726,1),(38954,1),(39625,2),(39626,2),(39627,2),(39628,2),(40567,7),(40568,7),(40572,7),(40573,7),(40575,7),(40576,7),(41608,11),(41609,11),(41610,11),(41611,11),(42735,3),(45373,1),(46837,11),(46839,11);
/*!40000 ALTER TABLE `spell_elixir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_learn_spell`
--

DROP TABLE IF EXISTS `spell_learn_spell`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_learn_spell`
--

LOCK TABLES `spell_learn_spell` WRITE;
/*!40000 ALTER TABLE `spell_learn_spell` DISABLE KEYS */;
INSERT INTO `spell_learn_spell` VALUES (71,7376,0),(768,3025,0),(783,5419,0),(1066,5421,0),(2457,21156,0),(2458,7381,0),(5487,1178,0),(5487,21178,0),(5784,33388,1),(9634,9635,0),(9634,21178,0),(13819,33388,1),(17002,24867,0),(23161,33391,1),(23214,33391,1),(24858,24905,0),(24866,24864,0),(33872,47179,0),(33873,47180,0),(33891,5420,0),(33891,34123,0),(33943,33948,0),(33943,34090,1),(33943,34764,0),(34767,33391,1),(34769,33388,1),(40123,40121,0),(40123,40122,0),(53428,53341,1),(53428,53343,1),(58984,21009,1);
/*!40000 ALTER TABLE `spell_learn_spell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_loot_template`
--

DROP TABLE IF EXISTS `spell_loot_template`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_loot_template`
--

LOCK TABLES `spell_loot_template` WRITE;
/*!40000 ALTER TABLE `spell_loot_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_loot_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_pet_auras`
--

LOCK TABLES `spell_pet_auras` WRITE;
/*!40000 ALTER TABLE `spell_pet_auras` DISABLE KEYS */;
INSERT INTO `spell_pet_auras` VALUES (19028,0,25228),(19578,0,19579),(20895,0,24529),(28757,0,28758),(35029,0,35060),(35030,0,35061),(35691,0,35696),(35692,0,35696),(35693,0,35696),(23785,416,23759),(23822,416,23826),(23823,416,23827),(23824,416,23828),(23825,416,23829),(23785,417,23762),(23822,417,23837),(23823,417,23838),(23824,417,23839),(23825,417,23840),(23785,1860,23760),(23822,1860,23841),(23823,1860,23842),(23824,1860,23843),(23825,1860,23844),(23785,1863,23761),(23822,1863,23833),(23823,1863,23834),(23824,1863,23835),(23825,1863,23836),(23785,17252,35702),(23822,17252,35703),(23823,17252,35704),(23824,17252,35705),(23825,17252,35706);
/*!40000 ALTER TABLE `spell_pet_auras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_proc_event`
--

DROP TABLE IF EXISTS `spell_proc_event`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_proc_event` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `CustomChance` float NOT NULL DEFAULT '0',
  `Cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_proc_event`
--

LOCK TABLES `spell_proc_event` WRITE;
/*!40000 ALTER TABLE `spell_proc_event` DISABLE KEYS */;
INSERT INTO `spell_proc_event` VALUES
(  324, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(  325, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(  905, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(  945, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(  974, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
( 1463, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
( 3232, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
( 5952, 0x00000000,  8, 0x00000001, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
( 6346, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100, 0.000000, 0.000000,  0),
( 7383, 0x00000001,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100, 0.000000, 0.000000,  0),
( 7434, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
( 8134, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
( 8178, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
( 8494, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
( 8495, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
( 9452, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
( 9782, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
( 9784, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
( 9799, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(10191, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(10192, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(10193, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(10431, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(10432, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(11095, 0x00000000,  3, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(11119, 0x00000004,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(11120, 0x00000004,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(11129, 0x00000000,  3, 0x00C00017, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(11180, 0x00000010,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(11185, 0x00000000,  3, 0x00000080, 0x00000000, 0x00000000, 0x00050000, 0x00000000, 0.000000, 0.000000,  0),
(11255, 0x00000000,  3, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12169, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12281, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(12289, 0x00000000,  4, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12298, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12311, 0x00000000,  4, 0x00000800, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12317, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12319, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12322, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(12487, 0x00000000,  3, 0x00000080, 0x00000000, 0x00000000, 0x00050000, 0x00000000, 0.000000, 0.000000,  0),
(12488, 0x00000000,  3, 0x00000080, 0x00000000, 0x00000000, 0x00050000, 0x00000000, 0.000000, 0.000000,  0),
(12598, 0x00000000,  3, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12668, 0x00000000,  4, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12724, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12725, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12726, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12727, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(12797, 0x00000000,  4, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12799, 0x00000000,  4, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12812, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(12813, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(12814, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(12815, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(12834, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12846, 0x00000004,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12847, 0x00000004,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12848, 0x00000004,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12849, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12867, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12872, 0x00000000,  3, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12873, 0x00000000,  3, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12958, 0x00000000,  4, 0x00000800, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(12966, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(12967, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(12968, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(12969, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(12970, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(12971, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12972, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12973, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12974, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(12999, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 4.000000, 0.000000,  0),
(13000, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 6.000000, 0.000000,  0),
(13001, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 8.000000, 0.000000,  0),
(13002, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 10.000000, 0.000000,  0),
(13045, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(13046, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(13047, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(13048, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(13163, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0),
(13165, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(13754, 0x00000000,  8, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(13867, 0x00000000,  8, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(13983, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000018, 0.000000, 0.000000,  0),
(14070, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000018, 0.000000, 0.000000,  0),
(14071, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000018, 0.000000, 0.000000,  0),
(14156, 0x00000000,  8, 0x003E0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14160, 0x00000000,  8, 0x003E0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14161, 0x00000000,  8, 0x003E0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14186, 0x00000000,  8, 0x40800508, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14190, 0x00000000,  8, 0x40800508, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14193, 0x00000000,  8, 0x40800508, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14194, 0x00000000,  8, 0x40800508, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14195, 0x00000000,  8, 0x40800508, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14318, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14319, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14320, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14321, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14322, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(14531, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14774, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(14892, 0x00000000,  6, 0x10001E00, 0x00010004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15088, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15128, 0x00000004,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15268, 0x00000020,  6, 0x06080000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15277, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 6.000000, 0.000000,  0),
(15286, 0x00000020,  6, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15323, 0x00000020,  6, 0x06080000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15324, 0x00000020,  6, 0x06080000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15325, 0x00000020,  6, 0x06080000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15326, 0x00000020,  6, 0x06080000, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(15337, 0x00000000,  6, 0x00002000, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15338, 0x00000000,  6, 0x00002000, 0x00000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15346, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 6.000000, 0.000000,  0),
(15362, 0x00000000,  6, 0x10001E00, 0x00010004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15363, 0x00000000,  6, 0x10001E00, 0x00010004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(15600, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.000000, 0.000000,  0),
(16164, 0x00000000, 11, 0x901000C3, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16176, 0x00000000, 11, 0x000001C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16180, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16196, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16198, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16235, 0x00000000, 11, 0x000001C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16240, 0x00000000, 11, 0x000001C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16256, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16257, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(16277, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(16278, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(16279, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(16280, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(16281, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16282, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16283, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16284, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16487, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16489, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16492, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16550, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16620, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(16624, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(16850, 0x00000000,  7, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(16864, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(16880, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16923, 0x00000000,  7, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(16924, 0x00000000,  7, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(16952, 0x00000000,  7, 0x00039000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16954, 0x00000000,  7, 0x00039000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16958, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(16961, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(17106, 0x00000000,  7, 0x00080000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17107, 0x00000000,  7, 0x00080000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17108, 0x00000000,  7, 0x00080000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17364, 0x00000008,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17495, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(17793, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(17794, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0.000000, 0.000000,  0),
(17796, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(17797, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17798, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17799, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17800, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(17801, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(17802, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(17803, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(18073, 0x00000000,  5, 0x00000060, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18094, 0x00000000,  5, 0x0000000A, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18095, 0x00000000,  5, 0x0000000A, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18096, 0x00000000,  5, 0x00000060, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18119, 0x00000000,  5, 0x000003E5, 0x000010C0, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18120, 0x00000000,  5, 0x000003E5, 0x000010C0, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(18820, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(19184, 0x00000000,  9, 0x00000014, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19228, 0x00000000,  0, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19232, 0x00000000,  9, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19233, 0x00000000,  9, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19387, 0x00000000,  9, 0x00000014, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19388, 0x00000000,  9, 0x00000014, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(19572, 0x00000000,  9, 0x00800000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000,  0),
(19573, 0x00000000,  9, 0x00800000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000,  0),
(20049, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20056, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20057, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20128, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20131, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20132, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20164, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 5.000000, 0.000000,  0),
(20165, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 20.000000, 0.000000,  0),
(20166, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 20.000000, 0.000000,  0),
(20182, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20210, 0x00000000, 10, 0xC0000000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20212, 0x00000000, 10, 0xC0000000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20213, 0x00000000, 10, 0xC0000000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20214, 0x00000000, 10, 0xC0000000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20215, 0x00000000, 10, 0xC0000000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20234, 0x00000000, 10, 0x00008000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(20235, 0x00000000, 10, 0x00008000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(20375, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 7.000000, 0.000000,  0),
(20500, 0x00000000,  4, 0x10000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(20501, 0x00000000,  4, 0x10000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(20705, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(20911, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(20925, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20927, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(20928, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(21185, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(21882, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(21890, 0x00000000,  4, 0x2A764EEF, 0x0000036C, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(22007, 0x00000000,  3, 0x00200021, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(22618, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(22648, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(23547, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(23548, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(23551, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(23552, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(23572, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(23578, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(23581, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(23602, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(23686, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(23688, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(23689, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 4.000000, 0.000000,  0),
(23695, 0x00000000,  4, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(23721, 0x00000000,  9, 0x00000800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(23920, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(24353, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(24389, 0x00000000,  3, 0x00C00017, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(24398, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(24658, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00014110, 0x00000000, 0.000000, 0.000000,  0),
(24905, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 15.000000, 0.000000,  0),
(24932, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  6),
(25050, 0x00000004,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(25296, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(25469, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(25472, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(25669, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.000000, 0.000000,  0),
(25899, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(25988, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(26016, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(26107, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000064, 0.000000, 0.000000,  0),
(26119, 0x00000000, 10, 0x90100003, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(26128, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0.000000, 0.000000,  0),
(26135, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(26480, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(26605, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(27044, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(27131, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(27179, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(27419, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(27498, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(27521, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(27656, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(27774, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(27787, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(27811, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(27815, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(27816, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(28592, 0x00000010,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(28593, 0x00000010,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(28716, 0x00000000,  7, 0x00000010, 0x00000000, 0x00000000, 0x00048000, 0x00000000, 0.000000, 0.000000,  0),
(28719, 0x00000000,  7, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(28744, 0x00000000,  7, 0x00000040, 0x00000000, 0x00000000, 0x00044000, 0x00000000, 0.000000, 0.000000,  0),
(28752, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(28789, 0x00000000, 10, 0xC0000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(28802, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(28809, 0x00000000,  6, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(28812, 0x00000000,  8, 0x02000006, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(28816, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(28823, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(28847, 0x00000000,  7, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(28849, 0x00000000, 11, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(29074, 0x00000014,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29075, 0x00000014,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29076, 0x00000014,  3, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29150, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29179, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29180, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29385, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 7.000000, 0.000000,  0),
(29441, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0.000000, 0.000000,  1),
(29444, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0.000000, 0.000000,  1),
(29455, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(29501, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29593, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(29594, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(29624, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29625, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29626, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29632, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29633, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29634, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29635, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29636, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29637, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(29801, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(29834, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(29838, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(29977, 0x00000000,  3, 0x00C00017, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30003, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(30160, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30293, 0x00000000,  5, 0x00000381, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30295, 0x00000000,  5, 0x00000381, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30296, 0x00000000,  5, 0x00000381, 0x000000C0, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30299, 0x0000007E,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30301, 0x0000007E,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30302, 0x0000007E,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30675, 0x00000000, 11, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30678, 0x00000000, 11, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30679, 0x00000000, 11, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30680, 0x00000000, 11, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30681, 0x00000000, 11, 0x00000003, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30701, 0x0000001C,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30705, 0x0000001C,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(30802, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30803, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30804, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30805, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30806, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30807, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30808, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30809, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30810, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30811, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(30823, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 10.500000, 0.000000,  0),
(30881, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  5),
(30883, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  5),
(30884, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  5),
(30885, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  5),
(30886, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  5),
(30937, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31124, 0x00000000,  8, 0x2000000E, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31126, 0x00000000,  8, 0x2000000E, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31244, 0x00000000,  8, 0x003E0000, 0x00000009, 0x00000000, 0x00000000, 0x00000004, 0.000000, 0.000000,  0),
(31245, 0x00000000,  8, 0x003E0000, 0x00000009, 0x00000000, 0x00000000, 0x00000004, 0.000000, 0.000000,  0),
(31394, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31569, 0x00000000,  3, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31570, 0x00000000,  3, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31785, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00008800, 0x00000000, 0.000000, 0.000000,  0),
(31794, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(31801, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 20.000000, 0.000000,  0),
(31833, 0x00000000, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31835, 0x00000000, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31836, 0x00000000, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31871, 0x00000000, 10, 0x00000010, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000,  0),
(31872, 0x00000000, 10, 0x00000010, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000,  0),
(31876, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31877, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31878, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(31904, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(32385, 0x00000000,  5, 0x00000402, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32387, 0x00000000,  5, 0x00000402, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32392, 0x00000000,  5, 0x00000402, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32393, 0x00000000,  5, 0x00000402, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32394, 0x00000000,  5, 0x00000402, 0x00000011, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32409, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(32587, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(32593, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(32594, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(32642, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(32734, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(32748, 0x00000000,  8, 0x00000000, 0x00000001, 0x00000000, 0x00000140, 0x00000000, 0.000000, 0.000000,  0),
(32776, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(32777, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(32837, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000, 45),
(32844, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000,  0),
(32885, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33076, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(33089, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(33127, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 7.000000, 0.000000,  0),
(33142, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33145, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33146, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33150, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33151, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33154, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33191, 0x00000000,  6, 0x00808000, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(33192, 0x00000000,  6, 0x00808000, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(33193, 0x00000000,  6, 0x00808000, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(33299, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(33510, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 5.000000, 0.000000,  0),
(33648, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33719, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(33736, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(33746, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(33757, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(33759, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(33776, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00008800, 0x00000000, 0.000000, 0.000000,  0),
(33881, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33882, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33883, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(33953, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 45),
(34074, 0x00000000,  9, 0x0007FA43, 0x00881081, 0x00000201, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34080, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0.000000, 0.000000,  0),
(34138, 0x00000000, 11, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34139, 0x00000000, 10, 0x40000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34258, 0x00000000, 10, 0x00000400, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34262, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(34320, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34355, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(34497, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34498, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34499, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34500, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34502, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34503, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34584, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(34586, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.500000, 0.000000,  0),
(34598, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(34749, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0.000000, 0.000000,  0),
(34753, 0x00000000,  6, 0x00001800, 0x00000004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34774, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.500000, 0.000000, 20),
(34783, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(34827, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(34859, 0x00000000,  6, 0x00001800, 0x00000004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34860, 0x00000000,  6, 0x00001800, 0x00000004, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34914, 0x00000000,  6, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34916, 0x00000000,  6, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34917, 0x00000000,  6, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(34935, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  8),
(34938, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  8),
(34939, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  8),
(34950, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(34954, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(35077, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(35080, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.000000, 0.000000, 60),
(35083, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(35086, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(35100, 0x00000000,  9, 0x00003001, 0x00000000, 0x00000000, 0x00010140, 0x00000000, 0.000000, 0.000000,  0),
(35102, 0x00000000,  9, 0x00003001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(35103, 0x00000000,  9, 0x00003001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(35121, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(36096, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(36111, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(36541, 0x00000004,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37165, 0x00000000,  8, 0x00200400, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37168, 0x00000000,  8, 0x003E0000, 0x00000009, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37170, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.000000, 0.000000,  0),
(37173, 0x00000000,  8, 0x2CBC0598, 0x00000106, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(37189, 0x00000000, 10, 0xC0000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 60),
(37193, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(37195, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37197, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000, 45),
(37213, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(37214, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(37227, 0x00000000, 11, 0x000001C0, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 60),
(37237, 0x00000000, 11, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(37247, 0x00000008,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000, 45),
(37377, 0x00000020,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(37379, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37384, 0x00000000,  5, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37443, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(37514, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(37516, 0x00000000,  4, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37519, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000030, 0.000000, 0.000000,  0),
(37523, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(37528, 0x00000000,  4, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37536, 0x00000000,  4, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37568, 0x00000000,  6, 0x00000800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37594, 0x00000000,  6, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37600, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(37601, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(37603, 0x00000000,  6, 0x00008000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(37655, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(37657, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  3),
(38026, 0x00000001,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100, 0.000000, 0.000000,  0),
(38031, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(38290, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 1.600000, 0.000000,  0),
(38326, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(38327, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(38334, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(38347, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(38350, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(38394, 0x00000000,  5, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(38857, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(39027, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(39372, 0x00000030,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(39437, 0x00000004,  5, 0x00001364, 0x000000C0, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(39442, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001, 0.000000, 0.000000,  0),
(39443, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(39530, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(39958, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.700000, 0.000000, 40),
(40407, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 6.000000, 0.000000,  0),
(40438, 0x00000000,  6, 0x00008040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40442, 0x00000000,  7, 0x00000014, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40444, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(40458, 0x00000000,  4, 0x02000000, 0x00000601, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40463, 0x00000000, 11, 0x00000081, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40470, 0x00000000, 10, 0xC0800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40475, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 3.000000, 0.000000,  0),
(40478, 0x00000000,  5, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40482, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(40485, 0x00000000,  9, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(40899, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(41034, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(41260, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(41262, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(41381, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000100, 0.000000, 0.000000,  0),
(41393, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(41434, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 2.000000, 0.000000, 45),
(41469, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 7.000000, 0.000000,  0),
(41635, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(41989, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.500000, 0.000000,  0),
(42083, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 45),
(42135, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 90),
(42136, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 90),
(42368, 0x00000000, 10, 0x40000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(42370, 0x00000000, 11, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(42770, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(43019, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(43020, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(43338, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(43443, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(43726, 0x00000000, 10, 0x40000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43728, 0x00000000, 11, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43737, 0x00000000,  7, 0x00000000, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(43739, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43741, 0x00000000, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43745, 0x00000000, 10, 0x00000000, 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43748, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43750, 0x00000000, 11, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(43819, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(44394, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(44395, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(44396, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000400, 0.000000, 0.000000,  0),
(44401, 0x00000000,  3, 0x00200000, 0x00000000, 0x00000000, 0x00000000, 0x00000FFF, 0.000000, 0.000000,  0),
(44404, 0x00000000,  3, 0x20000021, 0x00009000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44442, 0x00000000,  3, 0x00800000, 0x00000040, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  1),
(44443, 0x00000000,  3, 0x00800000, 0x00000040, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  1),
(44445, 0x00000000,  3, 0x00000013, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44446, 0x00000000,  3, 0x00000013, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44448, 0x00000000,  3, 0x00000013, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44449, 0x00000000,  3, 0x20E21277, 0x00019048, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(44469, 0x00000000,  3, 0x20E21277, 0x00019048, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(44470, 0x00000000,  3, 0x20E21277, 0x00019048, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(44471, 0x00000000,  3, 0x20E21277, 0x00019048, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(44472, 0x00000000,  3, 0x20E21277, 0x00019048, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(44546, 0x00000000,  3, 0x020002A0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44548, 0x00000000,  3, 0x020002A0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44549, 0x00000000,  3, 0x020002A0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(44835, 0x00000000,  7, 0x00000000, 0x00000080, 0x00000000, 0x00000010, 0x00000000, 0.000000, 0.000000,  0),
(45054, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 15),
(45057, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(45234, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(45243, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(45244, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(45354, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(45481, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(45482, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(45483, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(45484, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 45),
(46025, 0x00000020,  6, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(46092, 0x00000000, 10, 0x40000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(46098, 0x00000000, 11, 0x00000080, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(46569, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(46662, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 20),
(46832, 0x00000000,  7, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(46854, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46855, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46867, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46913, 0x00000000,  4, 0x00000000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46914, 0x00000000,  4, 0x00000000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46915, 0x00000000,  4, 0x00000000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46916, 0x00000000,  4, 0x00000000, 0x00000400, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(46951, 0x00000000,  4, 0x00000400, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(46952, 0x00000000,  0, 0x00000400, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(46953, 0x00000000,  0, 0x00000400, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47195, 0x00000000,  5, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(47196, 0x00000000,  5, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(47197, 0x00000000,  5, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(47201, 0x00000000,  5, 0x00000008, 0x00040000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47202, 0x00000000,  5, 0x00000008, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47203, 0x00000000,  5, 0x00000008, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47204, 0x00000000,  5, 0x00000008, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47205, 0x00000000,  5, 0x00000008, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47232, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47234, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47235, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47245, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47246, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47247, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47258, 0x00000000,  5, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47259, 0x00000000,  5, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47260, 0x00000000,  5, 0x00000000, 0x00800000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47263, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 20),
(47264, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 20),
(47265, 0x00000020,  5, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 20),
(47509, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47511, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47515, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(47516, 0x00000000,  6, 0x00001800, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47517, 0x00000000,  6, 0x00001800, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47535, 0x00000000,  6, 0x00001800, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47536, 0x00000000,  6, 0x00001800, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47537, 0x00000000,  6, 0x00001800, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47538, 0x00000000,  6, 0x00001800, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47539, 0x00000000,  6, 0x00001800, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47549, 0x00000000,  6, 0x00000000, 0x00020000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47551, 0x00000000,  6, 0x00000000, 0x00020000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47552, 0x00000000,  6, 0x00000000, 0x00020000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47555, 0x00000000,  6, 0x00001800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47556, 0x00000000,  6, 0x00001800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47557, 0x00000000,  6, 0x00001800, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47572, 0x00000000,  6, 0x00010000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(47580, 0x00000000,  6, 0x00000000, 0x00000000, 0x00000040, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47581, 0x00000000,  6, 0x00000000, 0x00000000, 0x00000040, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(47582, 0x00000000,  6, 0x00000000, 0x00000000, 0x00000040, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(48110, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(48111, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(48112, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(48113, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000A02A8, 0x00000000, 0.000000, 0.000000,  0),
(48159, 0x00000000,  6, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48160, 0x00000000,  6, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48483, 0x00000000,  7, 0x00008800, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48484, 0x00000000,  7, 0x00008800, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48485, 0x00000000,  7, 0x00008800, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48496, 0x00000000,  7, 0x00000060, 0x02000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(48499, 0x00000000,  7, 0x00000060, 0x02000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(48500, 0x00000000,  7, 0x00000060, 0x02000002, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(48506, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48510, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48511, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48516, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 30),
(48521, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 30),
(48525, 0x00000000,  7, 0x00000005, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000, 30),
(48833, 0x00000000,  7, 0x00000000, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48835, 0x00000000, 10, 0x00000000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48837, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(48951, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(48952, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(48988, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(49018, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49137, 0x00000000, 15, 0x00000000, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49188, 0x00000000, 15, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49208, 0x00000000, 15, 0x00440000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49222, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(49280, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(49281, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(49283, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(49284, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(49503, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(49504, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(49529, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49530, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49531, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49532, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(49622, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 60),
(49657, 0x00000000, 15, 0x00000000, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(50781, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51123, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51127, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51128, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51129, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51130, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51346, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(51349, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(51352, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(51359, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 10),
(51466, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51470, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51474, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(51478, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(51479, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(51556, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000010, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51557, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000010, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51558, 0x00000000, 11, 0x000000C0, 0x00000000, 0x00000010, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51562, 0x00000000, 11, 0x00000100, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51563, 0x00000000, 11, 0x00000100, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51564, 0x00000000, 11, 0x00000100, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51565, 0x00000000, 11, 0x00000100, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51566, 0x00000000, 11, 0x00000100, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51625, 0x00000000,  8, 0x1000A000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51626, 0x00000000,  8, 0x1000A000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51627, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(51628, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(51629, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000070, 0.000000, 0.000000,  0),
(51634, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51635, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51636, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51664, 0x00000000,  8, 0x00020000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51665, 0x00000000,  8, 0x00020000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51667, 0x00000000,  8, 0x00020000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51668, 0x00000000,  8, 0x00020000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51669, 0x00000000,  8, 0x00020000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51672, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  1),
(51674, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  1),
(51679, 0x00000000,  8, 0x00000001, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(51692, 0x00000000,  8, 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51696, 0x00000000,  8, 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(51698, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  1),
(51700, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  1),
(51701, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  1),
(51940, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(51989, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(52004, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(52005, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(52007, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(52008, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000,  0),
(52020, 0x00000000,  7, 0x00008000, 0x00100000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52127, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52129, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52131, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52134, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52136, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52138, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(52420, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 30),
(52423, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(52795, 0x00000000,  6, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52797, 0x00000000,  6, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52798, 0x00000000,  6, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52799, 0x00000000,  6, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52800, 0x00000000,  6, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(52898, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53137, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53138, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53215, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53216, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53217, 0x00000000,  9, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53221, 0x00000000,  9, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53222, 0x00000000,  9, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53224, 0x00000000,  9, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53228, 0x00000000,  9, 0x00000020, 0x01000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53232, 0x00000000,  9, 0x00000020, 0x01000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53256, 0x00000000,  9, 0x00000800, 0x00800001, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53259, 0x00000000,  9, 0x00000800, 0x00800001, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53260, 0x00000000,  9, 0x00000800, 0x00800001, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53290, 0x00000000,  9, 0x00000800, 0x7FFFFFFF, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53291, 0x00000000,  9, 0x00000800, 0x7FFFFFFF, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53292, 0x00000000,  9, 0x00000800, 0x7FFFFFFF, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53293, 0x00000000,  9, 0x00000800, 0x7FFFFFFF, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53294, 0x00000000,  9, 0x00000800, 0x7FFFFFFF, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53380, 0x00000000, 10, 0x00800000, 0x00020000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53381, 0x00000000, 10, 0x00800000, 0x00020000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53382, 0x00000000, 10, 0x00800000, 0x00020000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53383, 0x00000000, 10, 0x00800000, 0x00020000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53384, 0x00000000, 10, 0x00800000, 0x00020000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53486, 0x00000000, 10, 0x00800000, 0x00028000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53488, 0x00000000, 10, 0x00800000, 0x00028000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53501, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53502, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53503, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53551, 0x00000000, 10, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53552, 0x00000000, 10, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53553, 0x00000000, 10, 0x00001000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53569, 0x00000000, 10, 0x00200000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53576, 0x00000000, 10, 0x00200000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(53601, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  6),
(53671, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(53673, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54149, 0x00000000, 10, 0x00200000, 0x00010000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(54151, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54154, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54155, 0x00000000, 10, 0x00800000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54278, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(54486, 0x00000000,  0, 0x20000021, 0x00009000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54488, 0x00000000,  0, 0x20000021, 0x00009000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54489, 0x00000000,  0, 0x20000021, 0x00009000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54490, 0x00000000,  0, 0x20000021, 0x00009000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54738, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(54747, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(54749, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(54754, 0x00000000,  7, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54841, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(54936, 0x00000000, 10, 0x40000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54937, 0x00000000, 10, 0x80000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(54939, 0x00000000, 10, 0x00008000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55380, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(55440, 0x00000000, 11, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55620, 0x00000000, 15, 0x00000001, 0x08000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55623, 0x00000000, 15, 0x00000001, 0x08000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55640, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(55666, 0x00000000, 15, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55667, 0x00000000, 15, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55668, 0x00000000, 15, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55669, 0x00000000, 15, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55670, 0x00000000, 15, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55677, 0x00000000,  6, 0x00000000, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55680, 0x00000000,  6, 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(55689, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(55768, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(55776, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(56218, 0x00000000,  5, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56333, 0x00000000,  9, 0x00000004, 0x00000000, 0x00000200, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56336, 0x00000000,  9, 0x00000004, 0x00000000, 0x00000200, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56337, 0x00000000,  9, 0x00000004, 0x00000000, 0x00000200, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56342, 0x00000000,  9, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56343, 0x00000000,  9, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56344, 0x00000000,  9, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56355, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(56364, 0x00000000,  3, 0x00000000, 0x01000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56451, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(56611, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(56612, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(56613, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(56614, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(56636, 0x00000000,  4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56637, 0x00000000,  4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56638, 0x00000000,  4, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56821, 0x00000000,  8, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(56822, 0x00000000, 15, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56834, 0x00000000, 15, 0x00440000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(56835, 0x00000000, 15, 0x00440000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(57878, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0),
(57880, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0),
(57881, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0),
(57960, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  3),
(58357, 0x00000000,  4, 0x00000040, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(58364, 0x00000000,  4, 0x00000400, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58372, 0x00000000,  4, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58386, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(58435, 0x00000000,  5, 0x00000002, 0x00000100, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58436, 0x00000000,  5, 0x00000002, 0x00000100, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58437, 0x00000000,  5, 0x00000002, 0x00000100, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58616, 0x00000000, 15, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58620, 0x00000000, 15, 0x00000000, 0x00004000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58626, 0x00000000, 15, 0x02000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58631, 0x00000000, 15, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58642, 0x00000000, 15, 0x00000000, 0x08000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58644, 0x00000000, 15, 0x00000000, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58647, 0x00000000, 15, 0x00000000, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58676, 0x00000000, 15, 0x00000000, 0x00000008, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58677, 0x00000000, 15, 0x00002000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(58872, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(58874, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000040, 0.000000, 0.000000,  0),
(58901, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(59057, 0x00000000, 15, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(59176, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(59327, 0x00000000, 15, 0x08000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(59725, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000800, 0.000000, 0.000000,  0),
(60132, 0x00000000, 15, 0x00000000, 0x08020000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60170, 0x00000000,  5, 0x00000006, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60172, 0x00000000,  5, 0x00040000, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0.000000, 0.000000,  0),
(60493, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 45),
(60503, 0x00000000,  4, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60537, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(60564, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60571, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60572, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60573, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60574, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60575, 0x00000000, 11, 0x90100000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60617, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000020, 0.000000, 0.000000,  0),
(60710, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60717, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60719, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60722, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60724, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60726, 0x00000000,  7, 0x00000002, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60770, 0x00000000, 11, 0x00000001, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60818, 0x00000000, 10, 0x00000000, 0x00000200, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(60826, 0x00000000, 15, 0x01400000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(61188, 0x00000000,  5, 0x00000004, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(61257, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x000202A8, 0x00010000, 0.000000, 0.000000,  0),
(61324, 0x00000000, 10, 0x00000000, 0x00020000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000,  0),
(61345, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(61346, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(61356, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0.000000, 0.000000,  0),
(61846, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0),
(61847, 0x00000000,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000010, 0.000000, 0.000000,  0);
/*!40000 ALTER TABLE `spell_proc_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_script_target`
--

DROP TABLE IF EXISTS `spell_script_target`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_script_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_script_target`
--

LOCK TABLES `spell_script_target` WRITE;
/*!40000 ALTER TABLE `spell_script_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_script_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_scripts`
--

DROP TABLE IF EXISTS `spell_scripts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_scripts`
--

LOCK TABLES `spell_scripts` WRITE;
/*!40000 ALTER TABLE `spell_scripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_target_position`
--

DROP TABLE IF EXISTS `spell_target_position`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_target_position`
--

LOCK TABLES `spell_target_position` WRITE;
/*!40000 ALTER TABLE `spell_target_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_target_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_threat`
--

DROP TABLE IF EXISTS `spell_threat`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `spell_threat`
--

LOCK TABLES `spell_threat` WRITE;
/*!40000 ALTER TABLE `spell_threat` DISABLE KEYS */;
INSERT INTO `spell_threat` VALUES (78,20),(284,39),(285,59),(770,108),(778,108),(1608,78),(1672,180),(1715,61),(2139,300),(6343,17),(6572,155),(6574,195),(6809,89),(7372,101),(7373,141),(7379,235),(7386,100),(7405,140),(8198,40),(8204,64),(8205,96),(8380,180),(8972,118),(9745,148),(9749,108),(9880,178),(9881,207),(9907,108),(11556,43),(11564,98),(11565,118),(11566,137),(11567,145),(11580,143),(11581,180),(11596,220),(11597,261),(11600,275),(11601,315),(11775,395),(14274,200),(14921,415),(15629,300),(15630,400),(15631,500),(15632,600),(16857,108),(17735,200),(17750,300),(17751,450),(17752,600),(17390,108),(17391,108),(17392,108),(20569,100),(20736,100),(20925,20),(20927,30),(20928,40),(23922,160),(23923,190),(23924,220),(23925,250),(24394,580),(24583,5),(25225,300),(25231,130),(25258,286),(25264,215),(25269,400),(25286,175),(25288,355),(25289,60),(26993,127),(26996,176),(27011,127),(27179,54),(29704,230),(29707,196),(30324,220),(30356,323),(30357,483),(33745,285),(33878,129),(33986,180),(33987,232);
/*!40000 ALTER TABLE `spell_threat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transports` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-05-12 13:53:40
