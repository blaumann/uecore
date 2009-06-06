INSERT INTO `mangos`.`spell_bonus_data` (`entry` ,`direct_bonus` ,`dot_bonus` ,`ap_bonus` ,`comments`) VALUES 
('6143', '0.1', '0', '0', 'Mage - Frost Ward'),
('543', '0.1', '0', '0', 'Mage - Fire Ward');

DELETE FROM `spell_bonus_data` WHERE `entry` = '58381';
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES
('58381', '0.257', '0', '0', 'Priest - Mind Flay - Trigger - all ranks');

DELETE FROM `spell_bonus_data` WHERE `entry` IN ('15407','17311','17312','17313','17314','18807','25387','48155','48156');
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES
('15407', '0.257', '0', '0', 'Priest - Mind Flay rank 1'),
('17311', '0.257', '0', '0', 'Priest - Mind Flay rank 2'),
('17312', '0.257', '0', '0', 'Priest - Mind Flay rank 3'),
('17313', '0.257', '0', '0', 'Priest - Mind Flay rank 4'),
('17314', '0.257', '0', '0', 'Priest - Mind Flay rank 5'),
('18807', '0.257', '0', '0', 'Priest - Mind Flay rank 6'),
('25387', '0.257', '0', '0', 'Priest - Mind Flay rank 7'),
('48155', '0.257', '0', '0', 'Priest - Mind Flay rank 8'),
('48156', '0.257', '0', '0', 'Priest - Mind Flay rank 9');