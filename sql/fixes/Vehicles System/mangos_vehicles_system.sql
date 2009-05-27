/*
MySQL Data Transfer
Source Host: localhost
Source Database: mangos
Target Host: localhost
Target Database: mangos
Date: 27.05.2009 23:25:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for vehicle_data
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_data`;
CREATE TABLE `vehicle_data` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `vehicle_id` mediumint(5) unsigned NOT NULL,
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell_flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell8` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell9` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell10` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_aura` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Vehicle System';

-- ----------------------------
-- Table structure for vehicle_seat_data
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_seat_data`;
CREATE TABLE `vehicle_seat_data` (
  `seat` mediumint(5) unsigned NOT NULL,
  `flags` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`seat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Vehicle Seat System';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `vehicle_data` VALUES ('1234', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28312', '117', '4', '0', '50652', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('32627', '117', '4', '0', '50652', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28319', '116', '13', '0', '51362', '51421', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('32629', '116', '13', '0', '51362', '51421', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28094', '106', '4', '0', '50896', '0', '50652', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28670', '156', '18', '899103', '53114', '0', '53110', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28605', '200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28606', '200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_data` VALUES ('28607', '200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `vehicle_seat_data` VALUES ('1643', '3');
INSERT INTO `vehicle_seat_data` VALUES ('1648', '3');
INSERT INTO `vehicle_seat_data` VALUES ('1649', '2');
INSERT INTO `vehicle_seat_data` VALUES ('1650', '2');
INSERT INTO `vehicle_seat_data` VALUES ('1652', '4');
INSERT INTO `vehicle_seat_data` VALUES ('1986', '3');
INSERT INTO `vehicle_seat_data` VALUES ('1987', '10');
INSERT INTO `vehicle_seat_data` VALUES ('1554', '3');
INSERT INTO `vehicle_seat_data` VALUES ('1556', '2');
INSERT INTO `vehicle_seat_data` VALUES ('1557', '2');
