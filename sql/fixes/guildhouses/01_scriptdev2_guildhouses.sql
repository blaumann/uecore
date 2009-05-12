CREATE TABLE IF NOT EXISTS `guildhouses` (
	`id` int(11) NOT NULL auto_increment,
	`x` float NOT NULL default '0',
	`y` float NOT NULL default '0',
	`z` float NOT NULL default '0',
	`map` smallint(5) unsigned NOT NULL default '0',
	`guildid` int(6) unsigned NOT NULL default '0',
	`comment` varchar(255) NOT NULL default '',
	PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Guildhouses System';