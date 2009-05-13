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

#include "Database/DatabaseEnv.h"
#include "Policies/SingletonImp.h"
#include "AccountHandler.h"
#include "ProgressBar.h"

extern DatabaseType dbRealmServer;

INSTANTIATE_SINGLETON_1( AcctContainer);

AcctContainer::AcctContainer( ) : m_UpdateInterval(0),
m_NextUpdateTime(time(NULL))
{
}

void AcctContainer::Initialize(uint32 updateInterval)
{
    m_UpdateInterval = updateInterval;
}

void AcctContainer::FillAccount(Account* account,uint32 id, uint8 security, uint8 locale, uint8 expansion, bool banned, uint8 locked, std::string I, std::string lastip)
{
    account->id = id;
    account->security = security;
    account->locale = locale;
    account->expansion = expansion;
    account->banned = banned;
    account->locked = locked;
    account->I = I;
    account->lastip = lastip;
}

void AcctContainer::ReloadEverythingIfNeed()
{
    if(!m_UpdateInterval || m_NextUpdateTime > time(NULL))
        return;

    m_NextUpdateTime = time(NULL) + m_UpdateInterval;

    m_realmcharacters.clear();

    for(AccountList::iterator i = m_accounts.begin(); i != m_accounts.end(); ++i )
    {
        delete i->second;
    }

    m_accounts.clear();

    m_banips.clear();

    LoadAll();
}

void AcctContainer::LoadAll()
{
    // Load accounts
    QueryResult* result = dbRealmServer.PQuery("SELECT id,username,sha_pass_hash,gmlevel,last_ip,locked,expansion,locale FROM account ORDER BY id");
    uint32 count = 0;

    if(!result)
        return;

    //temp set for banned accid to avoid many sql querys
    std::set<uint32> BannedAcc;

    QueryResult* banresult = dbRealmServer.PQuery("SELECT id FROM account_banned WHERE active = 1");
    if(banresult)
    {
        do
        {
            Field *fields = banresult->Fetch();

            //check exist if exist skip;
            if (BannedAcc.find(fields[0].GetUInt32()) != BannedAcc.end())
                continue;
            BannedAcc.insert(fields[0].GetUInt32());

        } while (banresult->NextRow());

        delete banresult;
    }

    sLog.outString("Loading Accounts In Progress...");
    barGoLink bar( result->GetRowCount());

    // Periodic Database Update ...
    dbRealmServer.PExecute("UPDATE account_banned SET active = 0 WHERE unbandate <= UNIX_TIMESTAMP() AND unbandate <> bandate");
    dbRealmServer.PExecute("DELETE FROM ip_banned WHERE unbandate <= UNIX_TIMESTAMP() AND unbandate <> bandate");

    Account *acc;
    do
    {
        Field *fields = result->Fetch();

        bar.step();

        // Create the account by id
        acc = new Account();
        bool banned = false;
        if (BannedAcc.find(fields[0].GetUInt32()) != BannedAcc.end())
            banned = true;

        FillAccount(acc, fields[0].GetUInt32(), fields[3].GetUInt8(), fields[7].GetUInt8(), fields[6].GetUInt8(), banned, fields[5].GetUInt8(), fields[2].GetCppString(), fields[4].GetCppString());
        m_accounts[fields[1].GetCppString()] = acc;
        count++;

    } while (result->NextRow());

    sLog.outString();
    sLog.outString(">> Loaded %u accounts", count);

    //clean up set
    BannedAcc.clear();

    delete result;

    // Now load ip bans

    result = dbRealmServer.PQuery("SELECT ip FROM ip_banned");

    // If there is no ban don't load
    if(result)
    {
        sLog.outString();
        count = 0;

        sLog.outString("Loading Ban Ip In Progress...");

        barGoLink bar( result->GetRowCount());

        do
        {
            Field *fields = result->Fetch();
            bar.step();

            m_banips.insert(fields[0].GetCppString());
            count++;

        }while (result->NextRow());

        delete result;
        sLog.outString();

        sLog.outString(">> Loaded %u ip banned", count);

        count = 0;
    }

    // Now load Realm Characters

    result = dbRealmServer.PQuery("SELECT acctid, realmid, numchars FROM realmcharacters ORDER BY acctid");

    // If there is no ban don't load
    if(result)
    {
        sLog.outString();

        count = 0;

        sLog.outString("Loading Realm Characters In Progress...");

        barGoLink bar( result->GetRowCount());

        do
        {
            Field *fields = result->Fetch();

            bar.step();

            m_realmcharacters[MAKE_PAIR64(fields[0].GetUInt32(),fields[1].GetUInt32())] = fields[2].GetUInt8();
            count++;

        }while (result->NextRow());

        delete result;

        sLog.outString();

        sLog.outString(">> Loaded %u realm characters", count);
    }

}


Account* AcctContainer::FindAccountByName(std::string name)
{
    AccountList::const_iterator itr = m_accounts.find(name);

    if(itr != m_accounts.end())
        return itr->second;

    return NULL;
}

bool AcctContainer::IpBan(std::string ip)
{
    IpBanList::const_iterator itr = m_banips.find(ip);

    if(itr != m_banips.end())
        return true;

    return false;
}

uint8 AcctContainer::GetNumChar(uint32 realmid, uint32 accid)
{
    CharactersList::const_iterator itr = m_realmcharacters.find(MAKE_PAIR64(accid,realmid));
    if(itr != m_realmcharacters.end())
        return itr->second;

    return 0;
}
