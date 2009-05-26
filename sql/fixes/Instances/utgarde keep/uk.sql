UPDATE `creature_template` SET `scriptname` = 'boss_keleseth' WHERE `entry` = '23953';
UPDATE `creature_template` SET `scriptname` = 'mob_frost_tomb' WHERE `entry` = '23965';
UPDATE `instance_template` SET `script`='instance_utgarde_keep' WHERE `map`= '574';
UPDATE `creature_template` SET `ScriptName`='mob_vrykul_skeleton' WHERE `entry`=23970;
UPDATE `creature_template` SET `ScriptName`= 'boss_skarvald_the_constructor' WHERE `entry` in (24200, 27390);
UPDATE `creature_template` SET `ScriptName`= 'boss_dalronn_the_controller' WHERE `entry` in (24201, 27389);
UPDATE `creature_template` SET `ScriptName`='boss_ingvar_the_plunderer' WHERE `entry`=23954;
UPDATE `creature_template` SET `ScriptName`='mob_annhylde_the_caller' WHERE `entry`=24068;
UPDATE `creature_template` SET `ScriptName`='mob_ingvar_throw_dummy' WHERE `entry`=23997;

INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1574000, 'Your blood is mine!',13221,1,0,'keleseth SAY_AGGRO'),
(-1574001, 'Darkness waits',13223,1,0, 'keleseth SAY_KILL'),
(-1574002, 'I join... the night.',13225,1,0, 'keleseth SAY_DEATH'),
(-1574003, 'Not so fast.',13222,1,0, 'keleseth SAY_FROST_TOMB'),
(-1574004, 'Aranal, lidel! Their fate shall be yours!',13224,1,0, 'keleseth SAY_SKELETONS'); 

INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1999670, 'I\'ll paint my face with your blood!', 13207, 1, 0, 'ingvar SAY_AGGRO_1'),
(-1999663, 'I return! A second chance to carve out your skull!', 13209, 1, 0, 'ingvar SAY_AGGRO_2'),
(-1999668, 'My life for the... death god!', 13213, 1, 0, 'ingvar SAY_DEAD_1'),
(-1999661, 'No! I can do... better! I can...', 1, 0, 13211, 'ingvar SAY_DEAD_2'),
(-1999662, 'Mjul orm agn gjor!', 13212, 1, 0, 'ingvar SAY_KILL_1'),
(-1999669, 'I am a warriorborn!', 13214, 1, 0, 'ingvar SAY_KILL_2');

INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) VALUES
(-1999680, 'Dalronn! See if you can muster the nerve to join my attack!', 13229, 1, 0, 'skarvald SAY_SKARVALD_AGGRO'),
(-1999685, 'By all means, don\'t assess the situation, you halfwit! Just jump into the fray!', 13199, 1, 0, 'dalronn SAY_DALRONN_AGGRO'),
(-1999679, 'Jarggn olkt!', 13232, 1, 0, 'skarvald SAY_SKARVALD_KILL'),
(-1999684, 'You may serve me yet.', 1, 0, 13202, 'dalronn SAY_DALRONN_KILL'),
(-1999683, 'See... you... soon.', 13200, 1, 0, 'dalronn SAY_DALRONN_DAL_DIEDFIRST'),
(-1999676, 'Pagh! What sort of necromancer lets death stop him? I knew you were worthless!', 13233, 1, 0, 'skarvald SAY_SKARVALD_DAL_DIEDFIRST'),
(-1999677, 'A warrior\'s death.', 13231, 1, 0, 'skarvald SAY_SKARVALD_DAL_DIED'),
(-1999678, 'Not... over... yet.', 13230, 1, 0, 'skarvald SAY_SKARVALD_SKA_DIEDFIRST'),
(-1999681, 'Skarvald, you incompetent slug! Return and make yourself useful!', 13203, 1, 0, 'dalronn SAY_DALRONN_SKA_DIEDFIRST'),
(-1999682, 'There\'s no... greater... glory.', 13201, 1, 0, 'dalronn SAY_DALRONN_SKA_DIED');