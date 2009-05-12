-- a few variable declarations
SET @PHASE1 = 40;
SET @PHASE1COMPLETE = @PHASE1 + 1;
SET @PHASE2 = @PHASE1 + 2;
SET @PHASE2COMPLETE = @PHASE1 + 3;
SET @PHASE2B = @PHASE1 + 4;
SET @PHASE2BCOMPLETE = @PHASE1 + 5;
SET @PHASE3 = @PHASE1 + 6;
SET @PHASE3COMPLETE = @PHASE1 + 7;
SET @PHASE3B = @PHASE1 + 8;
SET @PHASE3BCOMPLETE = @PHASE1 + 9;
SET @PHASE4A = @PHASE1 + 10;
SET @PHASE4ACOMPLETE = @PHASE1 + 11;
SET @PHASE4B = @PHASE1 + 12;
SET @PHASE4BCOMPLETE = @PHASE1 + 13;
SET @PHASE4COMPLETE = @PHASE1 + 14;

-- PHASES

-- each phase is represented by a separate game event

delete from game_event where entry between @PHASE1 and @PHASE4COMPLETE;
insert into game_event (entry, length, description, world_event) values

-- the phase 1 event will trigger all the other events (if completed)
-- phase 1 will be started manually by gm command or by setting in db

(@PHASE1,0,"Shattered Sun Offensive: Phase 1 - Reclaiming the Sanctum",1),

-- phase 1 complete event
-- it is called when phase 1 is completed, and this one won't expire

(@PHASE1COMPLETE,2592000,"Shattered Sun Offensive: Phase 1 - Reclaiming the Sanctum COMPLETE",1),

-- the completion of phase 1 also triggers phase 2 and phase 2 b...

(@PHASE2,0,"Shattered Sun Offensive: Phase 2 - Sun\'s Reach Armory",1),
(@PHASE2COMPLETE,2592000,"Shattered Sun Offensive: Phase 2 - Sun\'s Reach Armory COMPLETE",1),
(@PHASE2B,0,"Shattered Sun Offensive: Phase 2b - Activating the Sunwell Portal",1),
(@PHASE2BCOMPLETE,2592000,"Shattered Sun Offensive: Phase 2b - Activating the Sunwell Portal COMPLETE",1),

-- phase 2 will start phase 3 and phase 3 b

(@PHASE3,0,"Shattered Sun Offensive: Phase 3 - Sun\'s Reach Harbor",1),
(@PHASE3COMPLETE,2592000,"Shattered Sun Offensive: Phase 3 - Sun\'s Reach Harbor COMPLETE",1),
(@PHASE3B,0,"Shattered Sun Offensive: Phase 3b - Rebuilding the Anvil and Forge",1),
(@PHASE3BCOMPLETE,2592000,"Shattered Sun Offensive: Phase 3b - Rebuilding the Anvil and Forge COMPLETE",1),

-- phase 3 starts phase 4 a and b. To complete phase 4, both of these must be completed

(@PHASE4A,0,"Shattered Sun Offensive: Phase 4A - Creating the Alchemy Lab",1),
(@PHASE4ACOMPLETE,2592000,"Shattered Sun Offensive: Phase 4A - Creating the Alchemy Lab COMPLETE",1),
(@PHASE4B,0,"Shattered Sun Offensive: Phase 4B - Building the Monument to the Fallen",1),
(@PHASE4BCOMPLETE,2592000,"Shattered Sun Offensive: Phase 4B - Building the Monument to the Fallen COMPLETE",1),

-- phase 4 is completed if both 4a and 4b are complete

(@PHASE4COMPLETE,2592000,"Shattered Sun Offensive: Phase 4 - COMPLETE",1);

-- PHASE 1
-- PREREQUISITE
-- the prerequisite event controls what events has to be completed before automatically starting the given event
-- phase 1 will be started manually, so no prereqs are set
delete from game_event_prerequisite where event_id = @PHASE1;
-- PROGRESS ANNOUNCER
-- each phase might have progress announcer npcs, who report the progress of the objectives to the players talking to them
-- this is done through npc gossip texts
-- the gossip text may include some  $(number)w variables, this is a reference for world state fields
delete from game_event_npc_gossip where event_id = @PHASE1;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE1, 12260 from creature where id = 24967;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE1, 12240 from creature where id = 24965;
-- the default gossip is used when the event is inactive
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 24965);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12241 from creature where id = 24965;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 24967);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12259 from creature where id = 24967;
-- for the announcements to work, the announcer npcs must have UNIT_NPC_FLAG_WORLDEVENT set (0x40000000)
update creature_template set npcflag = npcflag | 0x40000000 where entry in (24967, 24965);
-- RESOURCES
-- set what count as objective
-- the condition id is referenced through the game_event_quest_condition, that sets which quest gathers which resource
-- max_world_state_field is the world state field number in the gossip text when announcing the required amount of resources
-- done_world_state_field is the world state field number in the gossip text announcing the already gathered resources
delete from game_event_condition where event_id = @PHASE1;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE1,1,100,0,3244);
-- RESOURCE QUESTS
-- sets which quest gathers which resource by how much
delete from game_event_quest_condition where event_id = @PHASE1;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11524, @PHASE1, 1, 0.1), (11496, @PHASE1,1,0.1);
-- QUESTS
delete from game_event_creature_quest where event = @PHASE1;
insert into game_event_creature_quest(id,quest,event) values (24967,11496,@PHASE1), (24965,11524,@PHASE1);
delete from game_event_gameobject_quest where event = @PHASE1;
-- NPCS
delete from game_event_creature where event = @PHASE1;
insert into game_event_creature(guid, event) select creature.guid, @PHASE1 from creature where id in (24965, 24967);
-- GOS
delete from game_event_gameobject where event = @PHASE1;
-- MODEL EQUIP
delete from game_event_model_equip where event = @PHASE1;
-- NPC FLAG
-- adds this flag to the given npcs during the event
delete from game_event_npcflag where event_id = @PHASE1;

-- PHASE 1 COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE1COMPLETE;
-- prereq event is phase 1, id 40
delete from game_event_prerequisite where event_id = @PHASE1COMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE1COMPLETE,@PHASE1);
-- spawn new creatures
delete from game_event_creature where event = @PHASE1COMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE1COMPLETE from creature where id in (25034, 25061, 25057, 24932, 24965, 24967);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE1COMPLETE;
insert into game_event_creature_quest(id,quest,event) values (24967,11523,@PHASE1COMPLETE), (24965,11525,@PHASE1COMPLETE);
delete from game_event_gameobject_quest where event = @PHASE1COMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE1COMPLETE;
-- model equip
delete from game_event_model_equip where event = @PHASE1COMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE1COMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE1COMPLETE;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE1COMPLETE,1,1,0,0); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE1COMPLETE;

-- PHASE 2
-- prereq
delete from game_event_prerequisite where event_id = @PHASE2;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE2, @PHASE1);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE2;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE2, 12255 from creature where id = 25061;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE2, 12257 from creature where id = 25057;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 25061);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12256 from creature where id = 25061;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 25057);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12258 from creature where id = 25057;
update creature_template set npcflag = npcflag | 0x40000000 where entry in (25057, 25061);
-- resources
delete from game_event_condition where event_id = @PHASE2;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE2,1,100,0,3233);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE2;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11538, @PHASE2, 1, 0.1), (11532, @PHASE2, 1, 0.1);
-- quests
delete from game_event_creature_quest where event = @PHASE2;
insert into game_event_creature_quest(id,quest,event) values (25061,11538,@PHASE2), (25057,11532,@PHASE2);
delete from game_event_gameobject_quest where event = @PHASE2;
-- npcs
delete from game_event_creature where event = @PHASE2;
-- gos
delete from game_event_gameobject where event = @PHASE2;
-- model equip
delete from game_event_model_equip where event = @PHASE2;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE2;

-- PHASE 2 COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE2COMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE2COMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE2COMPLETE,@PHASE2);
-- spawn new creatures
delete from game_event_creature where event = @PHASE2COMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE2COMPLETE from creature where id in (25046, 25035, 25069, 25108, 26090, 26089, 26091, 26092);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE2COMPLETE;
insert into game_event_creature_quest(id,quest,event) values (25057,11533,@PHASE2COMPLETE), (25061,11537,@PHASE2COMPLETE);
delete from game_event_gameobject_quest where event = @PHASE2COMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE2COMPLETE;
-- model equip
delete from game_event_model_equip where event = @PHASE2COMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE2COMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE2COMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE2COMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE2COMPLETE;

-- PHASE 2 B
-- prereq
delete from game_event_prerequisite where event_id = @PHASE2B;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE2B, @PHASE1);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE2B;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE2B, 12226 from creature where id = 24932;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 24932);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12227 from creature where id = 24932;
update creature_template set npcflag = npcflag | 0x40000000 where entry in (24932);
-- resources
delete from game_event_condition where event_id = @PHASE2B;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE2B,1,100,0,0);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE2B;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11513, @PHASE2B, 1, 0.1);
-- quests
delete from game_event_creature_quest where event = @PHASE2B;
insert into game_event_creature_quest(id,quest,event) values (24932,11513,@PHASE2B), (25034,11517,@PHASE2B);
delete from game_event_gameobject_quest where event = @PHASE2B;
-- npcs
delete from game_event_creature where event = @PHASE2B;
-- gos
delete from game_event_gameobject where event = @PHASE2B;
-- model equip
delete from game_event_model_equip where event = @PHASE2B;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE2B;


-- PHASE 2 B COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE2BCOMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE2BCOMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE2BCOMPLETE,@PHASE2B);
-- spawn new creatures
delete from game_event_creature where event = @PHASE2BCOMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE2BCOMPLETE from creature where id in (25133);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE2BCOMPLETE;
insert into game_event_creature_quest(id,quest,event) values (25034,11534,@PHASE2BCOMPLETE), (24932,11514,@PHASE2BCOMPLETE), (25133, 11547, @PHASE2BCOMPLETE);
delete from game_event_gameobject_quest where event = @PHASE2BCOMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE2BCOMPLETE;
insert into game_event_gameobject (guid, event) select gameobject.guid, @PHASE2BCOMPLETE from gameobject where id in (187056, 183318, 187057, 187058);
-- model equip
delete from game_event_model_equip where event = @PHASE2BCOMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE2BCOMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE2BCOMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE2BCOMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE2BCOMPLETE;

-- PHASE 3
-- prereq
delete from game_event_prerequisite where event_id = @PHASE3;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE3, @PHASE2);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE3;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE3, 12319 from creature where id = 25108;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE3, 12339 from creature where id = 25069;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 25108);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12320 from creature where id = 25108;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 25069);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12340 from creature where id = 25069;
update creature_template set npcflag = npcflag | 0x40000000 where entry in (25108, 25069);
-- resources
delete from game_event_condition where event_id = @PHASE3;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE3,1,100,0,0);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE3;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11542, @PHASE3, 1, 0.1), (11539, @PHASE3, 1, 0.1);
-- quests
delete from game_event_creature_quest where event = @PHASE3;
insert into game_event_creature_quest(id,quest,event) values (25108,11542,@PHASE3), (25069,11539,@PHASE3);
delete from game_event_gameobject_quest where event = @PHASE3;
-- npcs
delete from game_event_creature where event = @PHASE3;
-- gos
delete from game_event_gameobject where event = @PHASE3;
-- model equip
delete from game_event_model_equip where event = @PHASE3;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE3;

-- PHASE 3 COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE3COMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE3COMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE3COMPLETE,@PHASE3);
-- spawn new creatures
delete from game_event_creature where event = @PHASE3COMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE3COMPLETE from creature where id in (25036,25112,25163,25088,25950,24975,25037,25045,25043);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE3COMPLETE;
insert into game_event_creature_quest(id,quest,event) values (25108,11543,@PHASE3COMPLETE), (25069,11540,@PHASE3COMPLETE), (25088,11541,@PHASE3COMPLETE);
delete from game_event_gameobject_quest where event = @PHASE3COMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE3COMPLETE;
-- model equip
delete from game_event_model_equip where event = @PHASE3COMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE3COMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE3COMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE3COMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE3COMPLETE;

-- PHASE 3 B
-- prereq
delete from game_event_prerequisite where event_id = @PHASE3B;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE3B, @PHASE2);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE3B;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE3B, 12285 from creature where id = 25046;
delete from npc_gossip where npc_guid in (select creature.guid from creature where id = 25046);
insert into npc_gossip (npc_guid, textid) select creature.guid, 12286 from creature where id = 25046;
update creature_template set npcflag = npcflag | 0x40000000 where entry in (25046);
-- resources
delete from game_event_condition where event_id = @PHASE3B;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE3B,1,100,0,0);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE3B;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11535, @PHASE3B, 1, 0.1);
-- quests
delete from game_event_creature_quest where event = @PHASE3B;
insert into game_event_creature_quest(id,quest,event) values (25046,11535,@PHASE3B);
delete from game_event_gameobject_quest where event = @PHASE3B;
-- npcs
delete from game_event_creature where event = @PHASE3B;
-- gos
delete from game_event_gameobject where event = @PHASE3B;
-- model equip
delete from game_event_model_equip where event = @PHASE3B;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE3B;

-- PHASE 3 B COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE3BCOMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE3BCOMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE3BCOMPLETE,@PHASE3B);
-- spawn new creatures
delete from game_event_creature where event = @PHASE3BCOMPLETE;
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE3BCOMPLETE;
insert into game_event_creature_quest(id,quest,event) values (25046,11544,@PHASE3BCOMPLETE), (25046,11536,@PHASE3BCOMPLETE);
delete from game_event_gameobject_quest where event = @PHASE3BCOMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE3BCOMPLETE;
insert into game_event_gameobject (guid, event) select gameobject.guid, @PHASE3BCOMPLETE from gameobject where id = 187112;
-- model equip
delete from game_event_model_equip where event = @PHASE3BCOMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE3BCOMPLETE;
insert into game_event_npcflag (guid, event_id, npcflag) select creature.guid, @PHASE3BCOMPLETE, 0x00001080 from creature where id = 25046;
-- resources
delete from game_event_condition where event_id = @PHASE3BCOMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE3BCOMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE3BCOMPLETE;


-- PHASE 4A
-- prereq
delete from game_event_prerequisite where event_id = @PHASE4A;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE4A, @PHASE3);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE4A;
-- todo: insert new values and update creatures' npcflag
-- resources
delete from game_event_condition where event_id = @PHASE4A;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE4A,1,100,0,0);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE4A;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11520, @PHASE4A, 1, 0.1);
-- quests
delete from game_event_creature_quest where event = @PHASE4A;
insert into game_event_creature_quest(id,quest,event) values (24975,11520,@PHASE4A);
delete from game_event_gameobject_quest where event = @PHASE4A;
-- npcs
delete from game_event_creature where event = @PHASE4A;
-- gos
delete from game_event_gameobject where event = @PHASE4A;
-- model equip
delete from game_event_model_equip where event = @PHASE4A;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE4A;

-- PHASE 4A COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE4ACOMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE4ACOMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE4ACOMPLETE,@PHASE4A);
-- spawn new creatures
delete from game_event_creature where event = @PHASE4ACOMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE4ACOMPLETE from creature where id in (25039);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE4ACOMPLETE;
insert into game_event_creature_quest(id,quest,event) values (24975,11521,@PHASE4ACOMPLETE), (24975,11546,@PHASE4ACOMPLETE);
delete from game_event_gameobject_quest where event = @PHASE4ACOMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE4ACOMPLETE;
insert into game_event_gameobject (guid, event) select gameobject.guid, @PHASE4ACOMPLETE from gameobject where id = 187114;
-- model equip
delete from game_event_model_equip where event = @PHASE4ACOMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE4ACOMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE4ACOMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE4ACOMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE4ACOMPLETE;


-- PHASE 4B
-- prereq
delete from game_event_prerequisite where event_id = @PHASE4B;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE4B, @PHASE3);
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE4B;
insert into game_event_npc_gossip (guid, event_id, textid) select creature.guid, @PHASE4B, 12322 from creature where id in (25112, 25163);
delete from npc_gossip where npc_guid in (select creature.guid from creature where id in (25112, 25163));
insert into npc_gossip (npc_guid, textid) select creature.guid, 12323 from creature where id in (25112, 25163);
update creature_template set npcflag = npcflag | 0x40000000 where entry in (25112, 25163);
-- resources
delete from game_event_condition where event_id = @PHASE4B;
insert into game_event_condition (event_id, condition_id, req_num, max_world_state_field, done_world_state_field) values (@PHASE4B,1,1000000,0,0);
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE4B;
insert into game_event_quest_condition (quest, event_id, condition_id, num) values (11545, @PHASE4B, 1, 10), (11549, @PHASE4B, 1, 1000);
-- quests
delete from game_event_creature_quest where event = @PHASE4B;
insert into game_event_creature_quest(id,quest,event) values (25112,11545,@PHASE4B),(25163,11549,@PHASE4B);
delete from game_event_gameobject_quest where event = @PHASE4B;
-- npcs
delete from game_event_creature where event = @PHASE4B;
-- gos
delete from game_event_gameobject where event = @PHASE4B;
-- model equip
delete from game_event_model_equip where event = @PHASE4B;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE4B;

-- PHASE 4B COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE4BCOMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE4BCOMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE4BCOMPLETE,@PHASE4B);
-- spawn new creatures
delete from game_event_creature where event = @PHASE4BCOMPLETE;
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE4BCOMPLETE;
insert into game_event_creature_quest(id,quest,event) values (25112,11548,@PHASE4BCOMPLETE), (25163,11549,@PHASE4BCOMPLETE);
delete from game_event_gameobject_quest where event = @PHASE4BCOMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE4BCOMPLETE;
insert into game_event_gameobject (guid, event) select gameobject.guid, @PHASE4BCOMPLETE from gameobject where id = 187116;
-- model equip
delete from game_event_model_equip where event = @PHASE4BCOMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE4BCOMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE4BCOMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE4BCOMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE4BCOMPLETE;

-- PHASE 4 COMPLETE
-- progress announcer
delete from game_event_npc_gossip where event_id = @PHASE4COMPLETE;
-- prereq event
delete from game_event_prerequisite where event_id = @PHASE4COMPLETE;
insert into game_event_prerequisite (event_id, prerequisite_event) values (@PHASE4COMPLETE,@PHASE4A),(@PHASE4COMPLETE,@PHASE4B);
-- spawn new creatures
delete from game_event_creature where event = @PHASE4COMPLETE;
insert into game_event_creature(guid, event) select creature.guid, @PHASE4COMPLETE from creature where id in (25174);
-- add new daily quests
delete from game_event_creature_quest where event = @PHASE4COMPLETE;
delete from game_event_gameobject_quest where event = @PHASE4COMPLETE;
-- gos
delete from game_event_gameobject where event = @PHASE4COMPLETE;
-- model equip
delete from game_event_model_equip where event = @PHASE4COMPLETE;
-- npc flag
delete from game_event_npcflag where event_id = @PHASE4COMPLETE;
-- resources
delete from game_event_condition where event_id = @PHASE4COMPLETE;
insert into game_event_condition (event_id, condition_id, req_num) values (@PHASE4COMPLETE,1,1); -- add to prevent deactivating this event
-- resource quests
delete from game_event_quest_condition where event_id = @PHASE4COMPLETE;


-- starting npcflag for smith hauthaa
update creature_template set npcflag = 0x40000002 where entry = 25046;

-- cleanup at end (remove the new unnecessary quest startings, it will be handled from game events now)
delete from creature_questrelation where quest in (select game_event_creature_quest.quest from game_event_creature_quest);