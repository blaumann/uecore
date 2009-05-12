@echo off
rem .
rem .   oooooooo8 oooo     oooo ooooooooo  oooooooooo 
rem . o888     88  88   88  88   888    88o 888    888
rem . 888           88 888 88    888    888 888oooo88 
rem . 888o     oo    888 888     888    888 888    888
rem .  888oooo88      8   8     o888ooo88  o888ooo888 
rem .
rem Installer/Updater by: fuckdb 
rem .
rem . TODO:
rem . - add import for instances patches,
rem . - add events patches.
rem .
rem . HELP: 
rem . - Review ALL the variables listed below
rem . - All flags [on/off] , anything != on means off
rem . - dryrun value is used to run the script without executing the SQL files
rem . (it is safe to test the script with dryrun=on)
rem . - If you use quick=on, all the script will run without asking for confirmation
rem . (you have to use with caution this option and do not forget to tune all the flags
rem . to avoid any disaster)
rem .
rem . INFO:
rem . - Applying UDB translations to YTDB/PSDB may generate errors, take care.
rem .

rem -- Change the values below to fit your needs --
rem -- Global variables --
set fixes_path=.
set quick=on
set dryrun=off
set mysql=C:\path\mysql.exe
set udbfr=off
set udbfr_path=C:\path\UnifiedDBFR\udbfr
set gmdb=off
set gmdb_path=C:\path\UDBGerman\trunk\GMDB
set heisei=off
set heisei_sql=C:\path\Heisei Scripts\Heisei Milestone 0.8.5a Expedition to Northrend Chapter II Updated Quests\0.8.5a Full Heisei scripts DB v7809+.sql
set spellfixes=on
set spellfixes_path=%fixes_path%\spell_fixes
set creaturesfixes=on
set creaturesfixes_path=%fixes_path%\creatures_fixes
set announce=on
set announce_sql=%fixes_path%\Announce-System\announce_system.sql
set autoannouncer=on
set autoannouncer_path=%fixes_path%\auto-announcer
set itemfixes=on
set itemfixes_path=%fixes_path%\item_fixes
set outdoorpvp=on
set outdoorpvp_path=%fixes_path%\outdoorpvp_sql
set multilanguards=on
set multilanguards_path=%fixes_path%\multilanguage_guards
set telefraz=off
set telefraz_path=%fixes_path%\telefratz
set av=on
set av_path=%fixes_path%\av
set questsfixes=on
set questsfixes_path=%fixes_path%\quests_fixes
set petfixes=on
set petfixes_path=%fixes_path%\pet_fixes
set commandsfixes=on
set commandsfixes_path=%fixes_path%\commands_fixes
set guildhouses=on
set guildhouses_path=%fixes_path%\guildhouses
set custom_patches=on
set custom_patches_path=%fixes_path%\custom_patches
rem -- First install only values (because existing content will be deleted), set to off if it is an update --
set updateto31=on
set updateto31_path=%fixes_path%\310
set autoannouncer_table=off
set ahbot=off
set ahbot_path=%fixes_path%\ahbot
set anticheat=off
set anticheat_path=%fixes_path%\anticheat
set worldevent=on
set worldevent_path=%fixes_path%\serverwide_event
rem -- Optional variables needed only for quick install --
rem -- Change the values below to match your server --
set svr=localhost
set user=root
set pass=ngdhtfhtdfnhf
set port=3306
set cdb=characters
set rdb=realmd
set wdb=mangos
set sd2db=scriptdev2
rem -- Don't change past this point --

if %quick% == on goto quick
goto standard
:quick
echo (( CWDB Fix Installer ))
set yesno=y
goto install

:standard
pause
rem Standard install section
color 3
echo .
echo   oooooooo8 oooo     oooo ooooooooo  oooooooooo 
echo o888     88  88   88  88   888    88o 888    888
echo 888           88 888 88    888    888 888oooo88 
echo 888o     oo    888 888     888    888 888    888
echo  888oooo88      8   8     o888ooo88  o888ooo888 
echo 
echo.
echo Installer enhanced by: fuckdb
echo.
set /p svr=What is your MySQL host name?           [localhost]   : 
if %svr%. == . set svr=localhost
set /p user=What is your MySQL user name?           [root]        : 
if %user%. == . set user=root
set /p pass=What is your MySQL password?            [ ]           : 
if %pass%. == . set pass=
set /p port=What is your MySQL port?                [3306]        : 
if %port%. == . set port=3306
set /p wdb=What is your World database name?       [mangos]      : 
if %wdb%. == . set wdb=mangos
set /p sd2db=What is your ScriptDev2 database name?  [scriptdev2]  : 
if %sd2db%. == . set sd2db=scriptdev2
set /p cdb=What is your Characters database name?  [characters]  : 
if %cdb%. == . set cdb=characters
set /p rdb=What is your Realmd database name?      [realmd]      : 
if %rdb%. == . set rdb=realmd

:install
rem misc path

:checkpaths
rem Check path section
if %udbfr% neq on goto nextcheck1
call:fct_checkpath "Checking UDBFR Path" "%udbfr_path%"
:nextcheck1
if %heisei% neq on goto nextcheck2
call:fct_checkpath "Checking Heisei SQL" "%heisei_sql%"
:nextcheck2
if %updateto31% neq on goto nextcheck3
call:fct_checkpath "Checking 31X update path" "%updateto31_path%"
:nextcheck3
if %announce% neq on goto nextcheck4
call:fct_checkpath "Checking Annouce update sql" "%announce_sql%"
:nextcheck4
if %autoannouncer% neq on goto nextcheck5
call:fct_checkpath "Checking Auto-Annoucer sql path" "%autoannouncer_path%"
:nextcheck5
if %itemfixes% neq on goto nextcheck6
call:fct_checkpath "Checking item fixes SQL's" "%itemfixes_path%"
:nextcheck6
if %gmdb% neq on goto nextcheck7
call:fct_checkpath "Checking GMDB path" "%gmdb_path%"
:nextcheck7
if %outdoorpvp% neq on goto nextcheck8
call:fct_checkpath "Checking OutdoorPVP path" "%outdoorpvp_path%"
:nextcheck8
if %multilanguards% neq on goto nextcheck9
call:fct_checkpath "Checking multi-language guards path" "%multilanguards_path%"
:nextcheck9
if %ahbot% neq on goto nextcheck10
call:fct_checkpath "Checking AHBot path" "%ahbot_path%"
:nextcheck10
if %anticheat% neq on goto nextcheck11
call:fct_checkpath "Checking Anticheat path" "%anticheat_path%"
:nextcheck11
if %telefraz% neq on goto nextcheck12
call:fct_checkpath "Checking Telefraz path" "%telefraz_path%"
:nextcheck12
if %worldevent% neq on goto nextcheck13
call:fct_checkpath "Checking Server World Events path" "%worldevent_path%"
:nextcheck13
if %av% neq on goto nextcheck14
call:fct_checkpath "Checking Alterac Valley path" "%av_path%"
:nextcheck14
if %spellfixes% neq on goto nextcheck15
call:fct_checkpath "Checking Spell Fixes path" "%spellfixes_path%"
:nextcheck15
if %creaturesfixes% neq on goto nextcheck16
call:fct_checkpath "Checking Creatures Fixes path" "%creaturesfixes_path%"
:nextcheck16
if %questsfixes% neq on goto nextcheck17
call:fct_checkpath "Checking Quests Fixes path" "%questsfixes_path%"
:nextcheck17
if %petfixes% neq on goto nextcheck18
call:fct_checkpath "Checking Pet Fixes path" "%petfixes_path%"
:nextcheck18
if %commandsfixes% neq on goto nextcheck19
call:fct_checkpath "Checking Commands Fixes path" "%commandsfixes_path%"
:nextcheck19
if %guildhouses% neq on goto nextcheck20
call:fct_checkpath "Checking Guildhouses addon path" "%guildhouses_path%"
:nextcheck20
if %custom_patches% neq on goto nextcheck21
call:fct_checkpath "Checking Custom patches path" "%custom_patches_path%"
:nextcheck21
call:fct_checkpath "Checking MySQL.exe file" "%mysql%"
goto install

:fct_checkpath
echo [-] %~1: %~2
if not exist "%~2" echo [*] %~2 not found && goto patherror
echo [+] OK
goto :eof

:patherror
echo Cannot find required files.
echo Check your config settings and the location of the used path and files.
pause
exit

:install
rem Main install entry point


:precustom_patches
rem Custom Patch
if %custom_patches% == on goto custom_patches
goto preguildhouses
:custom_patches
if %quick% == off echo.
if %quick% == off echo [?] This will add/update/replace your Custom patches.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preguildhouses
echo.
echo [-] Importing Custom SQL's patches in ScriptDev2 DB
for %%i in ("%custom_patches_path%\*scriptdev*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%%i"
echo [-] Importing Custom SQL's patches in World DB
for %%i in ("%custom_patches_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing Custom SQL's patches in Characters DB
for %%i in ("%custom_patches_path%\*character*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preguildhouses
rem Guildhouses addon Patch
if %guildhouses% == on goto guildhouses
goto precommandsfixes
:guildhouses
if %quick% == off echo.
if %quick% == off echo [?] This will add/update the Guildhouses patch addon.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto precommandsfixes
echo.
echo [-] Importing Guildhouses SQL's in ScriptDev2 DB
for %%i in ("%guildhouses_path%\*scriptdev*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%%i"

:precommandsfixes
rem Commands Fixes Patch
if %commandsfixes% == on goto commandsfixes
goto prepetfixes
:commandsfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Commands Fixes patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto prepetfixes
echo.
echo [-] Importing Commands Fixes SQL's in World DB
for %%i in ("%commandsfixes_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:prepetfixes
rem Pet Fixes Patch
if %petfixes% == on goto petfixes
goto prequestsfixes
:petfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Pet Fixes patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto prequestsfixes
echo.
echo [-] Importing Pet Fixes SQL's in World DB
for %%i in ("%petfixes_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:prequestsfixes
rem Quests Fixes Patch
if %questsfixes% == on goto questsfixes
goto precreaturesfixes
:questsfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Quests Fixes patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto precreaturesfixes
echo.
echo [-] Importing Quests Fixes SQL's in World DB
for %%i in ("%questsfixes_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing Quests Fixes SQL's in ScriptDev2 DB
for %%i in ("%questsfixes_path%\*scriptdev*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%%i"

:precreaturesfixes
rem Creatures Fixes Patch
if %creaturesfixes% == on goto creaturesfixes
goto prespellfixes
:creaturesfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Creatures Fixes patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto prespellfixes
echo.
echo [-] Importing Creatures Fixes SQL's in World DB
for %%i in ("%creaturesfixes_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:prespellfixes
rem Spell Fixes Patch
if %spellfixes% == on goto spellfixes
goto preav
:spellfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Spell Fixes patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preav
echo.
echo [-] Importing Spell Fixes SQL's in World DB
for %%i in ("%spellfixes_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preav
rem Alterac Valley Patch
if %av% == on goto av
goto preworldevent
:av
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Alterac Valley patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preworldevent
echo.
echo [-] Importing Alterac Valley SQL's in World DB
for %%i in ("%av_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing Alterac Valley EventAI SQL's in World DB
for %%i in ("%av_path%\*eventai*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preworldevent
rem Server World Events Patch
if %worldevent% == on goto worldevent
goto pretelefraz
:worldevent
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Server World Events tables.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto pretelefraz
echo.
echo [-] Importing Server World Events SQL's in World DB
for %%i in ("%worldevent_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing Server World Events SQL's in Characters DB
for %%i in ("%worldevent_path%\*char*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < "%%i"

:pretelefraz
rem Telefraz Patch
if %telefraz% == on goto telefraz
goto preanticheat
:telefraz
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the telefraz creature template.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preanticheat
echo.
echo [-] Importing Telefraz SQL's in World DB
for %%i in ("%telefraz_path%\mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preanticheat
rem Anticheat Patch
if %anticheat% == on goto anticheat
goto preahbot
:anticheat
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the Anticheat tables.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preahbot
echo.
echo [-] Importing Anticheat SQL's in Characters DB
for %%i in ("%anticheat_path%\characters*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < "%%i"

:preahbot
rem AHBot Patch
if %ahbot% == on goto ahbot
goto premultilanguards
:ahbot
if %quick% == off echo.
if %quick% == off echo [?] This will add/REPLACE the AHBot tables.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto premultilanguards
echo.
echo [-] Importing AHBot SQL's in Characters DB
for %%i in ("%ahbot_path%\*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < "%%i"

:premultilanguards
rem Multilanguage guards Patch
if %multilanguards% == on goto multilanguards
goto preoutdoorpvp
:multilanguards
if %quick% == off echo.
if %quick% == off echo [?] This will add/replace/update some guards translations.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preoutdoorpvp
echo.
echo [-] Importing Multilanguage guards SQL's in World DB
for %%i in ("%multilanguards_path%\mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing Multilanguage guards SQL's in ScriptDev2 DB
for %%i in ("%multilanguards_path%\scriptdev2*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%%i"

:preoutdoorpvp
rem OutdoorPVP Patch
if %outdoorpvp% == on goto outdoorpvp
goto preitemfixes
:outdoorpvp
if %quick% == off echo.
if %quick% == off echo [?] This will add/replace/update all entries in World DB related to OutdoorPVP patch.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preitemfixes
echo.
echo [-] Importing OutdoorPVP SQL's in World DB
for %%i in ("%outdoorpvp_path%\*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
for %%i in ("%outdoorpvp_path%\eventai_sql\*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preitemfixes
rem Item fixes Patch
if %itemfixes% == on goto itemfixes
goto preautoannouncer
:itemfixes
if %quick% == off echo.
if %quick% == off echo [?] This will add/replace/update some items in the Mangos World DB.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preautoannouncer
echo.
echo [-] Importing item fixes SQL's in World DB
for %%i in ("%itemfixes_path%\*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"

:preautoannouncer
rem Auto-Announce Patch
if %autoannouncer% == on goto autoannouncer
goto preannounce
:autoannouncer
if %quick% == off echo.
if %quick% == off echo [?] This will add the Mangos text template for the auto-announcer system (and also install the needed table in Realm DB if flagged).
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preannounce
echo.
echo [-] Importing Auto-Announcer SQL's in World DB
for %%i in ("%autoannouncer_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
if %autoannouncer_table% neq on goto preannounce
if %quick% == off echo.
if %quick% == off echo [?] This will wipe and then create the table needed by the auto-announcer system.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preannounce
echo [-] Importing Auto-Announcer SQL's in Realm DB
for %%i in ("%autoannouncer_path%\*realm*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %rdb% < "%%i"

:preannounce
rem Announce Patch
if %announce% == on goto announce
goto pre31X
:announce
if %quick% == off echo.
if %quick% == off echo [?] This will add the Mangos command for the colored announce system.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto pre31X
echo.
echo [-] Importing Announce patch to World DB
echo [+] %announce_sql%
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%announce_sql%"

:pre31X
rem 31X Patches
if %updateto31% == on goto 31X
goto preheisei
:31X
if %quick% == off echo.
if %quick% == off echo [?] This will convert your Characters and World database for 31X.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preheisei
echo.
echo [-] Importing 31X patches to World DB
for %%i in ("%updateto31_path%\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing 31X patches to Characters DB
for %%i in ("%updateto31_path%\*characters*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %cdb% < "%%i"

:preheisei
rem Heisei EventAI scripts
if %heisei% == on goto heisei
goto pregmdb
:heisei
if %quick% == off echo.
if %quick% == off echo [?] This will wipe out ALL EventAI scripts with Heisei EventAI scripts.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto pregmdb
echo.
echo [-] Importing Heisei EventAI scripts
echo [+] %heisei_sql%
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%heisei_sql%"

:pregmdb
rem German translation for UDB (may break PSDB/YTDB)
if %gmdb% == on goto gmdb
goto preudbfr
:gmdb
if %quick% == off echo.
if %quick% == off echo [?] This will add German translations from GMDB and also wipe out few of the basic english translation.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto preudbfr
echo.
echo [-] UDB World DB init
echo [+] %fixes_path%\translations\Prepare_locales_tables.sql
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%fixes_path%\translations\Prepare_locales_tables.sql"
echo [-] Importing GMDB translations into World DB
for %%i in ("%gmdb_path%\*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing GMDB translations into ScriptDev2 DB
echo [+] %gmdb_path%\ScriptDev2\script_texts.sql 
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%gmdb_path%\ScriptDev2\script_texts.sql "

:preudbfr
rem Translation from UDB French team (may break PSDB/YTDB)
if %udbfr% == on goto udbfr
goto done
:udbfr
if %quick% == off echo.
if %quick% == off echo [?] This will add French translations from UDBFR and also wipe out few of the basic english translation.
if %quick% == off set /p yesno=Do you wish to continue? (y/n) 
if %quick% == off if %yesno% neq y if %yesno% neq Y goto done
echo.
echo [-] UDBFR World DB init
echo [+] %udbfr_path%\Prepare_locales_tables.sql
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%udbfr_path%\Prepare_locales_tables.sql"
echo [-] Importing French translations from UDBFR to World DB
for %%i in ("%udbfr_path%\Annexe\*.sql") do if %%i neq %udbfr_path%\Annexe\script_texts.sql echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing French translations from UDBFR to ScriptDev2 DB
echo [+] %udbfr_path%\Annexe\script_texts.sql 
if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%udbfr_path%\Annexe\script_texts.sql"
echo [-] Importing UDBFR updates to World DB
for %%i in ("%udbfr_path%\Updates\*mangos*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %wdb% < "%%i"
echo [-] Importing UDBFR updates to ScriptDev2 DB
for %%i in ("%udbfr_path%\Updates\*scriptdev*.sql") do echo [+] %%i & if %dryrun% neq on %mysql% -q -s -h %svr% --user=%user% --password=%pass% --port=%port% %sd2db% < "%%i"

:done
echo.
echo Done :)
echo.
pause