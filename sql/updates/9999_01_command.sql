DELETE FROM `command` WHERE (`name`='bg end');
DELETE FROM `command` WHERE (`name`='bg update');
DELETE FROM `command` WHERE (`name`='bg list');
INSERT INTO `command` (`name`,`security`,`help`) VALUES ('bg update','3','Syntax: .bg update $seconds [$shift-\r\r\nbglink]\\\\r\\\\nif $shift-bglink isn\\\\\\\'t used it takes the bg of the \\r\\r\\ntargeted player or bg from current player\r\r\n\\\\r\\\\nthen bg gets an \\\"BattleGround::Update\\\"-call with $seconds as diff \\\\r\\r\\r\\n\\\\nso a .bg update 120 at the \r\r\nbeginning, will let your bg instantly start.');

INSERT INTO `command` (`name`,`security`,`help`) VALUES ('bg end','3','Syntax: .bg end $winner [$shift-bglink]\\r\\nif $shift-bglink isn\\\'t used it takes the bg of the targeted \r\n\r\nplayer or current player\\r\\nthen bg gets ended with a $winner as winner\\r\\nWinnner=0->Horde,Winner=1->Alliance, \r\n\r\nelse ->Draw');

INSERT INTO `command` (`name`,`security`,`help`) VALUES ('bg list','3','Syntax: .bg list [bg-shiftlink]\\r\\nLists all current open Battlegrounds and arenas - with some \r\n\r\ninformation about them\\r\\nif the optional shiftlink-parameter is given, it just shows bgs/arenas of the same type\r\n\r\n\\r\\nfor arenas it means, shows only 2v2,3v3,5v5 and for bgs it shows av,ab,ey,wsg');

DELETE FROM `command` WHERE (`name`='debug bg');
UPDATE `command` SET `help`='Syntax: .bg debug\r\nSyntax: .bg debug\\r\\nToggle debug mode for battlegrounds. In debug mode GM can start battleground with single player.' WHERE (`name`='bg debug');
