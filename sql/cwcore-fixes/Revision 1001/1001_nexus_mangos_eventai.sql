UPDATE creature_template set AIName = 'EventAI' where entry in  (26796, 26798, 26929, 26928, 26930);
DELETE FROM `creature_ai_scripts` WHERE `creature_id` in (26796, 26798, 26929, 26928, 26930);
INSERT INTO `creature_ai_scripts` VALUES 
-- Commander Stoutbeard
( 2679600, 26796, 4, 0, 100, 4, 0, 0, 0, 0, 28, 0, 47543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Stoutbeard - crystal prison remove'),
( 2679601, 26796, 4, 0, 100, 4, 0, 0, 0, 0, 11, 31403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Stoutbeard - cast battle shout'),
( 2679602, 26796, 0, 0, 100, 5, 3000, 3000, 11000, 15000, 11, 60067, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Stoutbeard - cast charge'),
( 2679603, 26796, 0, 0, 100, 5, 6000, 8000, 19500, 25000, 11, 38618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Stoutbeard - cast whirlwind'),
( 2679604, 26796, 0, 0, 100, 5, 13000, 13000, 45000, 55000, 11, 19134, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Stoutbeard - cast Frightening Shout'),
-- Commander Kolurg
( 2679800, 26798, 4, 0, 100, 4, 0, 0, 0, 0, 28, 0, 47543, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Kolurg - crystal prison remove'),
( 2679801, 26798, 4, 0, 100, 4, 0, 0, 0, 0, 11, 31403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Kolurg - cast battle shout'),
( 2679802, 26798, 0, 0, 100, 5, 3000, 3000, 11000, 15000, 11, 60067, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Kolurg - cast charge'),
( 2679803, 26798, 0, 0, 100, 5, 6000, 8000, 19500, 25000, 11, 38618, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Kolurg - cast whirlwind'),
( 2679804, 26798, 0, 0, 100, 5, 13000, 13000, 45000, 55000, 11, 19134, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Commander Kolurg - cast Frightening Shout'),
-- Grand Magus Telestra Clone (Arcane)
( 2692901, 26929, 0, 0, 100, 7, 6000, 8000, 10000, 12000, 11, 47731, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra arcane - cast pollymorph critter'),
( 2692902, 26929, 0, 0, 100, 7, 15000, 16000, 15000, 16000, 11, 47736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra arcane - cast time stop'),
-- Grand Magus Telestra Clone (Fire)
( 2692801, 26928, 0, 0, 100, 3, 3000, 3000, 8000, 9000, 11, 47721, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand magus Telestra fire - cast fire blast N'),
( 2692802, 26928, 0, 0, 100, 5, 3000, 3000, 8000, 9000, 11, 56939, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand magus Telestra fire - cast fire blast H'),
( 2692803, 26928, 0, 0, 100, 3, 9000, 9000, 9500, 11500, 11, 47723, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand magus Telestra fire - cast scorge N'),
( 2692804, 26928, 0, 0, 100, 5, 9000, 9000, 9500, 11500, 11, 56938, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand magus Telestra fire - cast scorge H'),
-- Grand Magus Telestra Clone (Frost)
( 2693001, 26930, 0, 0, 100, 3, 3000, 3000, 8000, 9000, 11, 47729, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra frost - cast ice bard N'),
( 2693002, 26930, 0, 0, 100, 5, 3000, 3000, 8000, 9000, 11, 56937, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra frost - cast ice bard H'),
( 2693003, 26930, 0, 0, 100, 3, 9000, 9000, 15000, 16000, 11, 47727, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra frost - cast blizzard N'),
( 2693004, 26930, 0, 0, 100, 5, 9000, 9000, 15000, 16000, 11, 56936, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grand Magus Telestra frost - cast blizzard H');
