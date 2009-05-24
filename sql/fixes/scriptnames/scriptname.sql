UPDATE `creature_template` SET `ScriptName`='npc_acherus_taxi' WHERE `entry`='28864';
UPDATE `creature_template` SET `ScriptName`='npc_acherus_taxi' WHERE `entry` IN (29488, 29501);
UPDATE `creature_template` SET `ScriptName`='npc_stormwind_harbor_taxi' WHERE `entry`='29154'; 
UPDATE `creature_template` SET `ScriptName`='npc_wyrmresttempelbottom_taxi' WHERE `entry`='26443'; 
UPDATE `creature_template` SET `ScriptName`='npc_wyrmresttempelmiddle_taxi' WHERE `entry`='27575'; 
UPDATE `creature_template` SET `ScriptName`='npc_wyrmresttempeltop_taxi' WHERE `entry`='26949';  
UPDATE `instance_template` SET `script`='instance_uldaman' WHERE `map`=70;

UPDATE `creature_template` SET `ScriptName`='boss_ironaya' WHERE `entry`=7228;

UPDATE `creature_template` SET `ScriptName`='mob_jadespine_basilisk' WHERE `entry`=4863;

UPDATE `creature_template` SET `ScriptName`='npc_lore_keeper_of_norgannon' WHERE `entry`=7172;

UPDATE `creature_template` SET `ScriptName`='boss_archaedas' WHERE `entry`=2748;

UPDATE `creature_template` SET `ScriptName`='mob_archaedas_minions' WHERE `entry` IN (7309, 7077, 7076, 10120);
UPDATE `creature_template` SET `ScriptName`='mob_stonekeepers' WHERE `entry`=4857;

UPDATE `gameobject_template` SET `ScriptName`='go_altar_of_the_keepers' WHERE `entry`=130511;

UPDATE `gameobject_template` SET `ScriptName`='go_altar_of_archaedas' WHERE `entry`=133234;
UPDATE `creature_template` SET `ScriptName`='npc_stormwindharbor_taxi' WHERE `entry`='29154';
UPDATE `creature_template` SET `ScriptName` = 'ancient_of_war' WHERE `entry` = 3469;
UPDATE `creature_template` SET `ScriptName` = 'archbishop_benedictus' WHERE `entry` = 1284;
update `creature_template` set `ScriptName`='boss_alar' where `entry`='19514';
update `creature_template` set `ScriptName`='mob_ember_of_alar' where `entry`='19551';
update `creature_template` set `ScriptName`='mob_flame_patch_alar' where `entry`='20602';
UPDATE `item_template` SET `scriptname` = 'item_jeremiahs_tools' WHERE `entry` = '35943';
UPDATE `item_template` SET `scriptname` = 'item_blood_gem' WHERE `entry` = '36827';
UPDATE `item_template` SET `scriptname` = 'item_frost_gem' WHERE `entry` = '36847';
UPDATE `item_template` SET `scriptname` = 'item_unholy_gem' WHERE `entry` = '36835';
UPDATE `item_template` SET `scriptname` = 'item_scepter_of_domination' WHERE `entry` = '39664';
UPDATE `item_template` SET `scriptname` = 'item_dart_gun' WHERE `entry` = '44222';
UPDATE `item_template` SET `scriptname` = 'item_battered_storm_hammer' WHERE `entry` = '42624';
UPDATE `item_template` SET `scriptname` = 'item_pouch_crushed_bloodspore' WHERE `entry` = '34979';
UPDATE `creature_template` SET `ScriptName` = 'boss_nightbane' WHERE `entry` = 17225;
UPDATE `creature_template` SET `scriptname`='boss_keleseth' WHERE `entry`=23953;

UPDATE `creature_template` SET `scriptname`='mob_frost_tomb' WHERE `entry`=23965;

UPDATE `instance_template` SET `script`='instance_utgarde_keep' WHERE `map`=574;

UPDATE `creature_template` SET `ScriptName`='mob_vrykul_skeleton' WHERE `entry`=23970;

UPDATE `creature_template` SET `ScriptName`='boss_skarvald_the_constructor' WHERE `entry` IN (24200,27390);

UPDATE `creature_template` SET `ScriptName`='boss_dalronn_the_controller' WHERE `entry` IN (24201,27389);

UPDATE `creature_template` SET `ScriptName`='boss_ingvar_the_plunderer' WHERE `entry`=23954;

UPDATE `creature_template` SET `ScriptName`='mob_annhylde_the_caller' WHERE `entry`=24068;

UPDATE `creature_template` SET `ScriptName`='mob_ingvar_throw_dummy' WHERE `entry`=23997;

UPDATE `creature_template` SET `ScriptName`='npc_dragonflayer_forge_master' WHERE `entry`=24079;
UPDATE `creature_template` SET `ScriptName` = 'g_marcus_jonathan' WHERE `entry` = 466;
UPDATE `creature_template` SET `ScriptName` = 'city_guard' WHERE `entry` = 20674;
UPDATE `creature_template` SET `ScriptName` = 'cathedral_of_light' WHERE `entry` = 6171;

-- Auchenai Crypts
UPDATE `creature_template` set `scriptname` = 'boss_shirrak_the_dead_watcher' where `entry` = '18371';
UPDATE `creature_template` set `scriptname` = 'boss_shirrak_the_dead_watcher' where `entry` = '20318';

UPDATE `instance_template` SET `script`='instance_naxxramas' WHERE `map`=533;
UPDATE `creature_template` SET `ScriptName`='boss_anubrekhan' WHERE `entry`=15956;
UPDATE `creature_template` SET `ScriptName`='boss_faerlina' WHERE `entry`=15953;
UPDATE `creature_template` SET `ScriptName`='boss_maexxna' WHERE `entry`=15952;
UPDATE `creature_template` SET `ScriptName`='boss_noth' WHERE `entry`=15954;
UPDATE `creature_template` SET `ScriptName`='boss_heigan' WHERE `entry`=15936;
UPDATE `creature_template` SET `ScriptName`='boss_loatheb' WHERE `entry`=16011;
UPDATE `creature_template` SET `ScriptName`='boss_razuvious' WHERE `entry`=16061;
UPDATE `creature_template` SET `ScriptName`='boss_gothik' WHERE `entry`=16060;
UPDATE `creature_template` SET `ScriptName`='mob_gothik_minion' where `entry` IN (16124,16125,16126,16127,16148,16149,16150);
UPDATE `creature_template` SET `ScriptName`='boss_thane_korthazz' WHERE `entry`=16064;
UPDATE `creature_template` SET `ScriptName`='boss_sir_zeliek' WHERE `entry`=16063;
UPDATE `creature_template` SET `ScriptName`='boss_lady_blaumeux' WHERE `entry`=16065;
UPDATE `creature_template` SET `ScriptName`='boss_patchwerk' WHERE `entry`=16028;
UPDATE `creature_template` SET `ScriptName`='boss_grobbulus' WHERE `entry`=15931;
UPDATE `creature_template` SET `ScriptName`='boss_gluth' WHERE `entry`=15932;
UPDATE `creature_template` SET `ScriptName`='boss_thaddius' WHERE `entry`=15928;
UPDATE `creature_template` SET `ScriptName`='boss_stalagg' WHERE `entry`=15929;
UPDATE `creature_template` SET `ScriptName`='boss_fugen' WHERE `entry`=15930;
UPDATE `creature_template` SET `ScriptName`='boss_sapphiron' WHERE `entry`=15989;
UPDATE `creature_template` SET `ScriptName`='boss_kelthuzad' WHERE `entry`=15990;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=16062;
UPDATE `creature_template` SET `ScriptName`='boss_rivendare_naxx' WHERE `entry`=30549;
UPDATE `creature_template` SET `ScriptName`='mob_webwrap' WHERE `entry`=16486;

UPDATE `instance_template` SET `script`='instance_serpent_shrine' WHERE `map`=548;
UPDATE `creature_template` SET `ScriptName`='boss_hydross_the_unstable' WHERE `entry`=21216;
UPDATE `gameobject_template` SET `ScriptName` = 'go_bridge_console' WHERE `entry` = 184568;

/* Leotheras the Blind event */
UPDATE `creature_template` SET `ScriptName`='boss_leotheras_the_blind' WHERE `entry`=21215;
UPDATE `creature_template` SET `ScriptName`='boss_leotheras_the_blind_demonform' WHERE `entry`=21845;
UPDATE `creature_template` SET `ScriptName`='mob_greyheart_spellbinder' WHERE `entry`=21806;
UPDATE `creature_template` SET `ScriptName`='mob_inner_demon' WHERE `entry`=21857;
/* Fathom-lord Karathress event */
UPDATE `creature_template` SET `ScriptName`='boss_fathomlord_karathress' WHERE `entry`=21214;
UPDATE `creature_template` SET `ScriptName`='boss_fathomguard_sharkkis' WHERE `entry`=21966;
UPDATE `creature_template` SET `ScriptName`='boss_fathomguard_tidalvess' WHERE `entry`=21965;
UPDATE `creature_template` SET `ScriptName`='boss_fathomguard_caribdis' WHERE `entry`=21964;
/* Morogrim Tidewalker event */
UPDATE `creature_template` SET `ScriptName`='boss_morogrim_tidewalker' WHERE `entry`=21213;
UPDATE `creature_template` SET `ScriptName`='mob_water_globule' WHERE `entry`=21913;
/* The Lurker Below */
UPDATE `creature_template` SET `ScriptName`='boss_the_lurker_below' WHERE `entry`=21217;
UPDATE `creature_template` SET `ScriptName`='mob_coilfang_ambusher' WHERE `entry`=21865;
UPDATE `creature_template` SET `ScriptName`='mob_coilfang_guardian' WHERE `entry`=21873;
/* Lady Vashj event */
UPDATE `creature_template` SET `ScriptName`='boss_lady_vashj' WHERE `entry`=21212;
UPDATE `creature_template` SET `ScriptName`='mob_enchanted_elemental' WHERE `entry`=21958;
UPDATE `creature_template` SET `ScriptName`='mob_tainted_elemental' WHERE `entry`=22009;
UPDATE `creature_template` SET `ScriptName`='mob_coilfang_elite' WHERE `entry`=22055;
UPDATE `creature_template` SET `ScriptName`='mob_coilfang_strider' WHERE `entry`=22056;
UPDATE `creature_template` SET `ScriptName`='mob_toxic_sporebat' WHERE `entry`=22140;
UPDATE `creature_template` SET `ScriptName`='mob_shield_generator_channel' WHERE `entry`=19870;

update creature_template set scriptName = "boss_mennu_the_betrayer" where entry in (17941,19893);
update creature_template set scriptName = "boss_quagmirran" where entry in (17942,19894);
update creature_template set scriptName = "boss_rokmar_the_crackler" where entry in (17991,19895);
update creature_template set spell1 = 34978, scriptname = '', heroic_entry = 22322 where entry = 20208;
update creature_template set spell1 = 38799, scriptname = '' where entry = 22322;
update creature_template set spell1 = 31986, scriptname = '' where entry = 18177;
update creature_template set scriptname = 'mob_mennu_nova_totem', type = 11, spell1 = 0  where entry = 18179;
update creature_template set scriptname = 'mob_mennu_earthgrab_totem', type = 11, heroic_entry = 19897, spell1 = 31983 where entry = 18176;
update creature_template set scriptname = 'mob_mennu_earthgrab_totem', type = 11, spell1 = 31983 where entry = 19897;

UPDATE `creature_template` SET `ScriptName`='mob_underbog_mushroom' WHERE `entry`=17990;
UPDATE `creature_template` SET `ScriptName`='boss_hungarfen' WHERE `entry`=17770;
UPDATE `creature_template` SET `ScriptName`='boss_the_black_stalker' WHERE `entry`=17882;

UPDATE `instance_template` SET `script`='instance_steam_vault' WHERE `map`=545;
UPDATE `creature_template` SET `ScriptName`='boss_hydromancer_thespia' WHERE `entry`=17797;
UPDATE `creature_template` SET `ScriptName`='boss_mekgineer_steamrigger' WHERE `entry`=17796;
UPDATE `creature_template` SET `ScriptName`='boss_warlord_kalithresh' WHERE `entry`=17798;
UPDATE `creature_template` SET `ScriptName`='mob_coilfang_waterelemental' WHERE `entry`=17917;
UPDATE `creature_template` SET `ScriptName`='mob_naga_distiller' WHERE `entry`=17954;
UPDATE `creature_template` SET `ScriptName`='mob_steamrigger_mechanic' WHERE `entry`=17951;

UPDATE `creature_template` SET `ScriptName`='npc_archmage_malin' WHERE `entry`=2708;
UPDATE `creature_template` SET `ScriptName`='npc_bartleby' WHERE `entry`=6090;
UPDATE `creature_template` SET `ScriptName`='npc_dashel_stonefist' WHERE `entry`=4961;
UPDATE `creature_template` SET `ScriptName`='npc_general_marcus_jonathan' WHERE `entry`=466;
UPDATE `creature_template` SET `ScriptName`='npc_lady_katrana_prestor' WHERE `entry`=1749;
UPDATE `creature_template` SET `ScriptName`='npc_stormwind_harbor_taxi' WHERE `entry`=29154;
UPDATE `creature_template` SET `ScriptName` = 'boss_leviathan' WHERE `entry` = 22884;
UPDATE `creature_template` SET `ScriptName` = 'commander_kolurg' WHERE `entry` = 26798;
UPDATE `creature_template` SET `ScriptName` = 'commander_kolurg' WHERE `entry` = 30397;
UPDATE `creature_template` SET `ScriptName` = 'commander_stoutbeard' WHERE `entry` = 26796;
UPDATE `creature_template` SET `ScriptName` = 'commander_stoutbeard' WHERE `entry` = 30398;
UPDATE `creature_template` SET `ScriptName` = 'npc_willix' WHERE `entry` = 4508;
UPDATE `creature_template` SET `ScriptName` = 'boss_ayamiss' WHERE `entry` = 15369;
UPDATE `creature_template` SET `ScriptName` = 'mob_nestlewood_owlkin' WHERE `entry` = 16518;
UPDATE `creature_template` SET `ScriptName` = 'boss_kurinnaxx' WHERE `entry` = 15348;
UPDATE `creature_template` SET `ScriptName` = 'boss_moam' WHERE `entry` = 15340;
UPDATE `instance_template` SET `script`='instance_zulaman' WHERE `map`=568;
UPDATE `creature_template` SET `ScriptName`='boss_janalai' WHERE `entry`=23578;
UPDATE `creature_template` SET `ScriptName`='boss_nalorakk' WHERE `entry`=23576;
UPDATE `creature_template` SET `ScriptName`='mob_janalai_firebomb' WHERE `entry`=23920;
UPDATE `creature_template` SET `ScriptName`='mob_janalai_hatcher' WHERE `entry`=23818;
UPDATE `creature_template` SET `ScriptName`='mob_janalai_hatchling' WHERE `entry`=23598;
UPDATE `creature_template` SET `ScriptName`='mob_janalai_egg' WHERE `entry`=23817;
UPDATE `creature_template` SET `ScriptName`='npc_forest_frog' WHERE `entry`=24396;
UPDATE `creature_template` SET `ScriptName`='boss_akilzon' WHERE `entry`=23574;
UPDATE `creature_template` SET `ScriptName`='mob_akilzon_eagle' WHERE `entry`=24858;
UPDATE `creature_template` SET `ScriptName`='boss_halazzi' WHERE `entry`=23577;
UPDATE `creature_template` SET `ScriptName`='mob_halazzi_lynx' WHERE `entry`=24143;
UPDATE `creature_template` SET `ScriptName`='boss_hexlord_malacrass' WHERE `entry` =24239;
UPDATE `creature_template` SET `ScriptName`='boss_alyson_antille' WHERE `entry` =24240;
UPDATE `creature_template` SET `ScriptName`='boss_thurg' WHERE `entry` =24241;
UPDATE `creature_template` SET `ScriptName`='boss_slither' WHERE `entry` =24242;
UPDATE `creature_template` SET `ScriptName`='boss_lord_raadan' WHERE `entry` =24243;
UPDATE `creature_template` SET `ScriptName`='boss_gazakroth' WHERE `entry` =24244;
UPDATE `creature_template` SET `ScriptName`='boss_fenstalker' WHERE `entry` =24245;
UPDATE `creature_template` SET `ScriptName`='boss_darkheart' WHERE `entry` =24246;
UPDATE `creature_template` SET `ScriptName`='boss_koragg' WHERE `entry` =24247;
UPDATE `creature_template` SET `ScriptName`='boss_zuljin' WHERE `entry` =23863;
UPDATE `creature_template` SET `ScriptName`='do_nothing' WHERE `entry`=24187;
UPDATE `creature_template` SET `ScriptName`='mob_zuljin_vortex' WHERE `entry`=24136;
UPDATE `creature_template` SET `ScriptName`='npc_zulaman_hostage' WHERE `entry` IN (23790, 23999, 24024, 24001);
UPDATE `creature_template` SET `ScriptName`='mob_hatchling' WHERE `entry`=23598;
UPDATE `creature_template` SET `ScriptName`='mob_jandalai_firebomb' WHERE `entry`=23920;
UPDATE `creature_template` SET `ScriptName` = 'npc_nestlewood_owlkin' WHERE `entry` = 16518;
UPDATE `creature_template` SET `ScriptName` = 'mob_parasitic_shadowfiend' WHERE `entry` = 23498;
UPDATE `creature_template` SET `ScriptName` = 'mob_shadowy_construct' WHERE `entry` = 29231;
UPDATE `creature_template` SET `ScriptName` = 'npc_broodling' WHERE `entry` = 7047;
UPDATE `creature_template` SET `ScriptName` = 'npc_broodling' WHERE `entry` = 7048;
UPDATE `creature_template` SET `ScriptName` = 'npc_broodling' WHERE `entry` = 7049;
UPDATE `creature_template` SET `ScriptName` = 'boss_malganis' WHERE `entry` = 929;
UPDATE `creature_template` SET `ScriptName` = 'boss_salramm' WHERE `entry` = 31212;
UPDATE `creature_template` SET `ScriptName` = 'boss_salramm' WHERE `entry` = 26530;
UPDATE `creature_template` SET `ScriptName` = 'spark_of_ionar' WHERE `entry` = 28926;
UPDATE `creature_template` SET `ScriptName` = 'spark_of_ionar' WHERE `entry` = 31867;
UPDATE `creature_template` SET `ScriptName` = 'npc_kyle_frenzied' WHERE `entry` = 23616;
UPDATE `creature_template` SET `ScriptName` = 'npc_swiftmountain' WHERE `entry` = 10427;
UPDATE `instance_template` SET `script`='instance_sunwell_plateau' WHERE `map`=580;
UPDATE `creature_template` SET `ScriptName`='boss_brutallus' WHERE `entry`=24882;
UPDATE `creature_template` SET `ScriptName`='boss_felmyst' WHERE `entry`=25038;
UPDATE `creature_template` SET `ScriptName`='mob_felmyst_vapor' WHERE `entry`=25265;
UPDATE `creature_template` SET `ScriptName`='mob_felmyst_trail' WHERE `entry`=25267;
UPDATE `creature_template` SET `ScriptName`='boss_sacrolash' WHERE `entry`=25165;
UPDATE `creature_template` SET `ScriptName`='boss_alythess' WHERE `entry`=25166;
UPDATE `creature_template` SET `ScriptName`='mob_shadow_image' WHERE `entry`=25214;
UPDATE `creature_template` SET `ScriptName`='boss_kiljaeden' WHERE `entry`=25315;
UPDATE `creature_template` SET `ScriptName`='mob_kalecgos' WHERE `entry`=25319;
UPDATE `creature_template` SET `ScriptName`='mob_kiljaeden_controller' WHERE `entry`=25608;
UPDATE `creature_template` SET `ScriptName`='mob_hand_of_the_deceiver' WHERE `entry`=25588;
UPDATE `creature_template` SET `ScriptName`='mob_felfire_portal' WHERE `entry`=25603;
UPDATE `creature_template` SET `ScriptName`='mob_volatile_felfire_fiend' WHERE `entry`=25598;
UPDATE `creature_template` SET `ScriptName`='mob_armageddon' WHERE `entry`=25735;
UPDATE `creature_template` SET `ScriptName`='mob_shield_orb' WHERE `entry`=25502;
UPDATE `creature_template` SET `ScriptName`='mob_sinster_reflection' WHERE `entry`=25708;
UPDATE `creature_template` SET `ScriptName`='npc_void_sentinel' WHERE `entry`=25772;
UPDATE `creature_template` SET `ScriptName`='dark_fiend' WHERE `entry`=25744;
UPDATE `creature_template` SET `ScriptName`='boss_muru' WHERE `entry`=25741;
UPDATE `creature_template` SET `ScriptName`='boss_entropius' WHERE `entry`=25840;
UPDATE `creature_template` SET `ScriptName`='npc_muru_portal' WHERE `entry`=25770;
UPDATE `creature_template` SET `ScriptName`='boss_kalecgos' WHERE `entry`=24850;
UPDATE `creature_template` SET `ScriptName`='boss_sathrovarr' WHERE `entry`=24892;
UPDATE `creature_template` SET `ScriptName`='boss_kalec' WHERE `entry`=24891;
UPDATE `creature_template` SET `ScriptName`='npc_blackhole' WHERE `entry`=25855;