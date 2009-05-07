update `gameobject_template` set `flags`=5 where `entry` in (181212, 181233,181235,181197,181209);
update `gameobject_template` set `flags`=2 where `entry` in (181126,181195,181167);
-- notice for UDB users: need delete duplicate doors, 'cause instance will become unreacheble. Go to correct door, look it's guid and delete all other doors except this one!
delete from `gameobject` where `guid` in (26367,26369,26370) and `id` = 181167;