DELETE FROM gameobject WHERE id = 164869;
INSERT INTO gameobject (id, map, spawnmask, phasemask, position_x, position_y, position_z, orientation,
rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) 
VALUES (164869, 230, 1, 1, 1224.69, -243.124, -85.50, 0.920305, 0, 0, 1, 0, -1, 100, 1);

UPDATE gameobject_template SET data5 = 1 WHERE entry = 164869;
