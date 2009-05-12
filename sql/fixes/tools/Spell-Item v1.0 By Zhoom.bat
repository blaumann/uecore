@echo off
title  Spell-item v1.0 For Mangos - A Funny-Blizz Entertainment Europe Software.
cls
color C1
echo.
echo.
echo    ษอออออออออออออออออออออออออออออป 
echo    บ                             บ
echo    บ                             บ
echo    บ       Spell-item v1.0       บ
echo    บ                             บ
echo    บ                             บ
echo    ศอออออออออออออออออออออออออออออผ
echo.
echo.
rem echo  Le programme va creer des item CONSOMMABLES Attribues d'un Spell
rem echo  ex: Ailes, magiques, repousseur 500 , costume, morph, aura ..etc...
echo  This batch creates consumable items, and associate a speel effect to the created item.
echo.
echo.
rem echo Appuyez sur Entree Pour commencer la creation.
echo Press [enter] to start.

pause>nul
cls 
echo    ษอออออออออออออออออออออออออออออป 
echo    บ                             บ
echo    บ                             บ
echo    บ       Spell-item v1.0       บ
echo    บ          For Mangos         บ
echo    บ                             บ
echo    ศอออออออออออออออออออออออออออออผ
echo.
echo.
rem set/p id=   ID de l'item a creer:  
set/p id=   Item ID:  
rem echo    ITEM %id% enregistre.
echo    ITEM %id%.
echo.
rem set/p name=   Nom de l'item:  
set/p name=   Item name:  
echo.
rem set/p subname=   Commentaire sur l'item:  
set/p subname=   Item comments:  
echo.
echo.
rem set/p displayid=   DisplayID de l'item:  
set/p displayid=   Item DisplayID:  
echo.
rem echo    Qualtite de l'objet: 0=Use, 1=Normal, 2=Inhabituel, 3=Rare, 
echo    Object quality: 0=Use, 1=Normal, 2=Uncommon, 3=Rare, 
echo    -------------------- 4=Epic, 5=Legendary, 6=Artefact
rem set/p qual=                                                Qualite?  
set/p qual=                                                Quality?  
echo.
rem set/p level=   Level Requis pour utiliser l'item "%name%" :  
set/p level=   Required Level to use the item "%name%" :  
echo.
rem set/p spell=   ID du Spell a utiliser:  
set/p spell=   Speel ID to map on the item:  
echo.
rem set/p cool=   Temps du Cooldown pour le spell %spell% pour l'item %id% (en ms):  
set/p cool=   Cooldown time for speel %spell% on item %id% (ms):  
echo.
echo.
rem echo    Appuyez sur entree pour creer le fichier SQL.
echo    Press [enter] to create the SQL file.
echo.
pause>nul
echo INSERT INTO item_template >> item-%id%-patch_mangos309.sql
echo   (entry, class, subclass, unk0, name, displayid, Quality, Flags, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, dmg_min3, dmg_max3, dmg_type3, dmg_min4, dmg_max4, dmg_type4, dmg_min5, dmg_max5, dmg_type5, armor, holy_res, fire_res, nature_res, frost_res, shadow_res, arcane_res, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, ExtendedCost, RequiredArenaRank, RequiredDisenchantSkill, ArmorDamageModifier, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, Duration) >> item-%id%-patch_mangos309.sql
echo VALUES >> item-%id%-patch_mangos309.sql
echo   (%id%, 0, 0, -1, "%name%", %displayid%, %qual%, 0, 0, 5, 1, 0, -1, -1, 255, %level%, 0, 0, 0, 0, 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, %spell%, 0, -1, -1, %cool%, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, "%subname%", 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, "0", 0, 0, 0, 0, 0); >> item-%id%-patch_mangos309.sql
echo INSERT INTO item_template >> item-%id%-patch_mangos31X.sql
echo   (entry, class, subclass, unk0, name, displayid, Quality, Flags, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, armor, holy_res, fire_res, nature_res, frost_res, shadow_res, arcane_res, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, ExtendedCost, RequiredArenaRank, RequiredDisenchantSkill, ArmorDamageModifier, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, Duration) >> item-%id%-patch_mangos31X.sql
echo VALUES >> item-%id%-patch_mangos31X.sql
echo   (%id%, 0, 0, -1, "%name%", %displayid%, %qual%, 0, 0, 5, 1, 0, -1, -1, 255, %level%, 0, 0, 0, 0, 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, %spell%, 0, -1, -1, %cool%, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, "%subname%", 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, "0", 0, 0, 0, 0, 0); >> item-%id%-patch_mangos31X.sql
echo.
echo.
cls
echo    ษอออออออออออออออออออออออออออออป 
echo    บ                             บ
echo    บ                             บ
echo    บ       Spell-item v1.0       บ
echo    บ          For Mangos         บ
echo    บ                             บ
echo    ศอออออออออออออออออออออออออออออผ
echo.
echo.
rem echo   Fichier  patch-%id%-patch.sql Cree avec succes !
echo   File  patch-%id%-patch_mangos309.sql successfully created !
echo   File  patch-%id%-patch_mangos31X.sql successfully created !


pause>nul
cls
echo.
rem echo  Merci d'avoir utilise Spell Item v1.0
echo  Thanks for using Spell Item v1.0
echo.
echo.
rem echo  Programme cree par Zhoom, Staff Funny-Blizz - Redistribution Interdite.
echo  Batch file created by Zhoom, Staff Funny-Blizz - Redistribution Interdite ????.
echo  Translated to english by fuckdb.
echo  Added SQL output for 3.1.X database by fuckdb.
echo.
echo.
echo  Forum http://funny-blizz.xooit.fr
echo.
echo  Site en cours de construction: http://fun.servegame.com/net
echo.
echo.
echo.
echo.
echo.
echo.
echo  Bug Report at funnyblizz@gmail.com
echo.
echo.
echo.               Funny-Blizz Entertainment Europe  -  Toous droits reserves .
pause>nul