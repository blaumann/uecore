UPDATE `command` SET `help`='Syntax: .announce $MessageToBroadcast\\r\\n\\r\\nSend a global message to all players online in chat log with colored sender\'s name.\r\n' WHERE (`name`='announce') LIMIT 1

INSERT INTO `command` (`name`,`security`,`help`) VALUES ('sysannounce','2','Syntax: Send a System Message.');

-- mangos_string
INSERT INTO `mangos_string` VALUES
(60,'|c1f40af20 <Mod>|cffff0000[%s]|c1f40af20 announce:|cffffff00 %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(61,'|c1f40af20 <GM>|cffff0000[%s]|c1f40af20 announce:|cffffff00 %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(62,'|c1f40af20 <Admin>|cffff0000[%s]|c1f40af20 announce:|cffffff00 %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO `mangos_string` VALUES (63,'|cffff0000[System]:|cffffff00 %s|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);