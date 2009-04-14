/*
 * Copyright (C) 2005-2008 MaNGOS <http://getmangos.com/>
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

#include "Common.h"

struct Account
{
	uint32 id;
    uint8 security;
    uint8 locale;
    uint8 expansion;
    bool banned;
    bool locked;
    std::string I;
    std::string lastip;
};

struct RealmCharacter
{
    uint32 realmid;
    uint8 numchars;
};

class AcctContainer
{
    public:

        AcctContainer();

        bool IpBan(std::string ClientIp);
        void LoadAll();
        void ReloadEverythingIfNeed();
        void Initialize(uint32 updateInterval);

        void FillAccount(Account* account,uint32 id, uint8 security, uint8 locale, uint8 expansion, bool banned, uint8 locked, std::string I, std::string lastip);
		void FillCharacter(RealmCharacter* rch, uint32 realmid, uint8 numchars);

        uint8 GetNumChar(uint32 realmid, uint32 accid);
        Account* FindAccountByName(std::string name);
		Account* FindAccountById(uint32 accid);
    private:
		// key acc name
		typedef UNORDERED_MAP<std::string, Account*> AccountList;
		// key banned ip
		typedef std::set<std::string> IpBanList;
		// key accid
        typedef UNORDERED_MAP<uint32, RealmCharacter*> CharactersList;

		AccountList m_accounts;
        IpBanList m_banips;
        CharactersList m_realmcharacters;

        uint32 m_UpdateInterval;
        time_t m_NextUpdateTime;
};

#define AcctMgr MaNGOS::Singleton<AcctContainer>::Instance()
