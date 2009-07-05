/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/// \addtogroup realmd Realm Daemon
/// @{
/// \file 

#include "Common.h"

#include <ace/Signal.h>
#include <ace/Proactor.h>
#include "AccountHandler.h"
#if defined (ACE_WIN32)

#  include <ace/WIN32_Proactor.h>

#elif defined (ACE_HAS_AIO_CALLS)

#  include <ace/POSIX_Proactor.h>
#  include <ace/POSIX_CB_Proactor.h>
#  include <ace/SUN_Proactor.h>

#endif /* ACE_WIN32 */

#include "Database/DatabaseEnv.h"
#include "RealmList.h"

#include "Config/ConfigEnv.h"
#include "Log.h"
#include "AuthSocket.h"
#include "SystemConfig.h"
#include "revision.h"
#include "revision_nr.h"
#include "Util.h"
#include <openssl/opensslv.h>
#include <openssl/crypto.h>

#ifdef WIN32
#include "ServiceWin32.h"
char serviceName[] = "realmd";
char serviceLongName[] = "MaNGOS realmd service";
char serviceDescription[] = "Massive Network Game Object Server";
/*
 * -1 - not in service mode
 *  0 - stopped
 *  1 - running
 *  2 - paused
 */
int m_ServiceStatus = -1;
#endif

bool StartDB(std::string &dbstring);
void UnhookSignals();
void HookSignals();

/// Holds the list of realms for this server
RealmList m_realmList;                                     

/// Accessor to the realm server database
DatabaseType dbRealmServer;                                 

/// Print out the usage string for this program on the console.
void usage(const char *prog)
{
    sLog.outString("Usage: \n %s [<options>]\n"
        "    --version                print version and exist\n\r"
        "    -c config_file           use config_file as configuration file\n\r"
        #ifdef WIN32
        "    Running as service functions:\n\r"
        "    --service                run as service\n\r"
        "    -s install               install service\n\r"
        "    -s uninstall             uninstall service\n\r"
        #endif
        ,prog);
}

/// Launch the realm server
extern int main(int argc, char **argv)
{
    ///- Command line parsing to get the configuration file name
    char const* cfg_file = _REALMD_CONFIG;
    int c=1;
    while( c < argc )
    {
        if( strcmp(argv[c],"-c") == 0)
        {
            if( ++c >= argc )
            {
                sLog.outError("Runtime-Error: -c option requires an input argument");
                usage(argv[0]);
                return 1;
            }
            else
                cfg_file = argv[c];
        }

        if( strcmp(argv[c],"--version") == 0)
        {
            printf("%s\n", _FULLVERSION(REVISION_DATE,REVISION_TIME,REVISION_NR,REVISION_ID));
            return 0;
        }

        #ifdef WIN32
        ////////////
        //Services//
        ////////////
        if( strcmp(argv[c],"-s") == 0)
        {
            if( ++c >= argc )
            {
                sLog.outError("Runtime-Error: -s option requires an input argument");
                usage(argv[0]);
                return 1;
            }
            if( strcmp(argv[c],"install") == 0)
            {
                if (WinServiceInstall())
                    sLog.outString("Installing service");
                return 1;
            }
            else if( strcmp(argv[c],"uninstall") == 0)
            {
                if(WinServiceUninstall())
                    sLog.outString("Uninstalling service");
                return 1;
            }
            else
            {
                sLog.outError("Runtime-Error: unsupported option %s",argv[c]);
                usage(argv[0]);
                return 1;
            }
        }
        if( strcmp(argv[c],"--service") == 0)
        {
            WinServiceRun();
        }
        ////
        #endif
        ++c;
    }

    if (!sConfig.SetSource(cfg_file))
    {
        sLog.outError("Could not find configuration file %s.", cfg_file);
        return 1;
    }

    sLog.outString( "%s [realm-daemon]", _FULLVERSION(REVISION_DATE, REVISION_TIME, REVISION_NR,REVISION_ID) );
    sLog.outString( "[UECore-Revision]: 141\n\n");

    sLog.outString("Using configuration file %s.", cfg_file);

    ///- Check the version of the configuration file
    uint32 confVersion = sConfig.GetIntDefault("ConfVersion", 0);
    if (confVersion < _REALMDCONFVERSION)
    {
        sLog.outError("*****************************************************************************");
        sLog.outError(" WARNING: Your realmd.conf version indicates your conf file is out of date!");
        sLog.outError("          Please check for updates, as your current default values may cause");
        sLog.outError("          strange behavior.");
        sLog.outError("*****************************************************************************");
        clock_t pause = 3000 + clock();

        while (pause > clock()) {}
    }

    sLog.outDetail("%s (Library: %s)", OPENSSL_VERSION_TEXT, SSLeay_version(SSLEAY_VERSION));
    if (SSLeay() < 0x009080bfL )
    {
        sLog.outDetail("WARNING: Outdated version of OpenSSL lib. Logins to server impossible!");
        sLog.outDetail("WARNING: Minimal required version [OpenSSL 0.9.8k]");
    }

    /// realmd PID file creation
    std::string pidfile = sConfig.GetStringDefault("PidFile", "");
    if(!pidfile.empty())
    {
        uint32 pid = CreatePIDFile(pidfile);
        if( !pid )
        {
            sLog.outError( "Cannot create PID file %s.\n", pidfile.c_str() );
            return 1;
        }

        sLog.outString( "Daemon PID: %u\n", pid );
    }

    ///- Initialize the database connection
    std::string dbstring;
    if(!StartDB(dbstring))
        return 1;

    ///- Get the list of realms for the server
    m_realmList.Initialize(sConfig.GetIntDefault("RealmsStateUpdateDelay", 20));
    if (m_realmList.size() == 0)
    {
        sLog.outError("No valid realms specified.");
        return 1;
    }
    // Activate or not account caching system, precache them before launching connection port
    if(sConfig.GetIntDefault("AccountCaching", 0) == 1)
    {
        AcctMgr.Initialize(sConfig.GetIntDefault("AccountReloadingDelay", 300));
        AcctMgr.ReloadEverythingIfNeed();
        sLog.outString();
        sLog.outString("Accounts will be reloaded in %u seconds", sConfig.GetIntDefault("AccountReloadingDelay", 300));
    }
    
    ///- Catch termination signals
    HookSignals();

    // Setup apropriate proactor, if needed.
    ACE_Proactor_Impl* proactor_impl = 0;
    ACE_Proactor* proactor = 0;

#ifdef __FreeBSD__

    ACE_NEW_RETURN(proactor_impl, ACE_POSIX_AIOCB_Proactor(), -1);
    ACE_NEW_RETURN(proactor, ACE_Proactor (proactor_impl, 1 ), -1);

#warning "Please ensure aio module is loaded into kernel when starting this program"
#endif // __FreeBSD__

    if(proactor)
        ACE_Proactor::instance (proactor, 1);

    ///- Launch the listening network socket
    u_short rmport = sConfig.GetIntDefault( "RealmServerPort", DEFAULT_REALMSERVER_PORT );
    std::string bind_ip = sConfig.GetStringDefault("BindIP", "0.0.0.0");
    
    ACE_INET_Addr listen_addr (rmport, bind_ip.c_str ());
    AuthSocketAcceptor acc;
    
    PatchCache::instance ();

    if (acc.open (listen_addr, 0, 1, 64, 1) == -1)
      return 1;

    ///- Handle affinity for multiple processors and process priority on Windows
    #ifdef WIN32
    {
        HANDLE hProcess = GetCurrentProcess();

        uint32 Aff = sConfig.GetIntDefault("UseProcessors", 0);
        if(Aff > 0)
        {
            ULONG_PTR appAff;
            ULONG_PTR sysAff;

            if(GetProcessAffinityMask(hProcess,&appAff,&sysAff))
            {
                ULONG_PTR curAff = Aff & appAff;            // remove non accessible processors

                if(!curAff )
                {
                    sLog.outError("Processors marked in UseProcessors bitmask (hex) %x not accessible for realmd. Accessible processors bitmask (hex): %x",Aff,appAff);
                }
                else
                {
                    if(SetProcessAffinityMask(hProcess,curAff))
                        sLog.outString("Using processors (bitmask, hex): %x", curAff);
                    else
                        sLog.outError("Can't set used processors (hex): %x", curAff);
                }
            }
            sLog.outString();
        }

        bool Prio = sConfig.GetBoolDefault("ProcessPriority", false);

        if(Prio)
        {
            if(SetPriorityClass(hProcess,HIGH_PRIORITY_CLASS))
                sLog.outString("realmd process priority class set to HIGH");
            else
                sLog.outError("ERROR: Can't set realmd process priority class.");
            sLog.outString();
        }
    }
    #endif
    sLog.outBasic ("Server is running.");

    // TODO Database PING
    ACE_Proactor::instance ()->run_event_loop ();

    ///- Wait for the delay thread to exit
    dbRealmServer.HaltDelayThread();

    ///- Remove signal handling before leaving
    UnhookSignals();

    ACE_Proactor::close_singleton();

    sLog.outString( "Halting process..." );
    return 0;
}

/// Handle termination signals
void OnSignal(int s)
{
    switch (s)
    {
        case SIGINT:
        case SIGTERM:
        #ifdef _WIN32
        case SIGBREAK:
        #endif
        {
          ACE_Proactor::instance ()->end_event_loop ();
        }
        break;
    }

    signal(s, OnSignal);
}

/// Initialize connection to the database
bool StartDB(std::string &dbstring)
{
    if(!sConfig.GetString("LoginDatabaseInfo", &dbstring))
    {
        sLog.outError("Database not specified");
        return false;
    }

    sLog.outString("Database: %s", dbstring.c_str() );
    if(!dbRealmServer.Initialize(dbstring.c_str()))
    {
        sLog.outError("Cannot connect to database");
        return false;
    }

    return true;
}

/// Define hook 'OnSignal' for all termination signals
void HookSignals()
{
    signal(SIGINT, OnSignal);
    signal(SIGTERM, OnSignal);
    #ifdef _WIN32
    signal(SIGBREAK, OnSignal);
    #endif
}

/// Unhook the signals before leaving
void UnhookSignals()
{
    signal(SIGINT, 0);
    signal(SIGTERM, 0);
    #ifdef _WIN32
    signal(SIGBREAK, 0);
    #endif
}

/// @}
