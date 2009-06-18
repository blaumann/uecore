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

/** \file
    \ingroup realmd
*/

#include "Common.h"
#include "RealmList.h"
#include "Policies/SingletonImp.h"
#include "Database/DatabaseEnv.h"
#include <ace/Singleton.h>
#include <ace/OS_NS_dirent.h>
#include <ace/OS_NS_errno.h>

INSTANTIATE_SINGLETON_1( RealmList );

extern DatabaseType dbRealmServer;

RealmList::RealmList( ) : m_UpdateInterval(0), m_NextUpdateTime(time(NULL))
{
}

/// Load the realm list from the database
void RealmList::Initialize(uint32 updateInterval)
{
    m_UpdateInterval = updateInterval;

    ///- Get the content of the realmlist table in the database
    UpdateRealms(true);
}

void RealmList::UpdateRealm( uint32 ID, const std::string& name, const std::string& address, uint32 port, uint8 icon, uint8 color, uint8 timezone, AccountTypes allowedSecurityLevel, float popu)
{
    ///- Create new if not exist or update existed
    Realm& realm = m_realms[name];

    realm.m_ID      = ID;
    realm.icon      = icon;
    realm.color     = color;
    realm.timezone  = timezone;
    realm.allowedSecurityLevel = allowedSecurityLevel;
    realm.populationLevel        = popu;

    ///- Append port to IP address.
    std::ostringstream ss;
    ss << address << ":" << port;
    realm.address   = ss.str();
}

void RealmList::UpdateIfNeed()
{
    // maybe disabled or updated recently
    if(!m_UpdateInterval || m_NextUpdateTime > time(NULL))
        return;

    m_NextUpdateTime = time(NULL) + m_UpdateInterval;

    // Clears Realm list
    m_realms.clear();

    // Get the content of the realmlist table in the database
    UpdateRealms(false);
}

void RealmList::UpdateRealms(bool init)
{
    sLog.outDetail("Updating Realm List...");

    QueryResult *result = dbRealmServer.Query( "SELECT id, name, address, port, icon, color, timezone, allowedSecurityLevel, population FROM realmlist WHERE color <> 3 ORDER BY name" );

    ///- Circle through results and add them to the realm map
    if(result)
    {
        do
        {
            Field *fields = result->Fetch();

            uint8 allowedSecurityLevel = fields[7].GetUInt8();

            UpdateRealm(fields[0].GetUInt32(), fields[1].GetCppString(),fields[2].GetCppString(),fields[3].GetUInt32(),fields[4].GetUInt8(), fields[5].GetUInt8(), fields[6].GetUInt8(), (allowedSecurityLevel <= SEC_ADMINISTRATOR ? AccountTypes(allowedSecurityLevel) : SEC_ADMINISTRATOR), fields[8].GetFloat() );
            if(init)
                sLog.outString("Added realm \"%s\".", fields[1].GetString());
        } while( result->NextRow() );
        delete result;
    }
}

PatchCache::~PatchCache ()
{
  for (Patches::iterator i = _patches.begin (); i != _patches.end (); i++)
    delete i->second;
}

PatchCache::PatchCache ()
{
  LoadPatchesInfo ();
}

PatchCache*
PatchCache::instance ()
{
  return ACE_Singleton<PatchCache, ACE_Thread_Mutex>::instance ();
}

void
PatchCache::LoadPatchMD5 (const char* szFileName)
{
  // Try to open the patch file
  std::string path = "./patches/";
  path += szFileName;
  FILE * pPatch = fopen (path.c_str (), "rb");
  DEBUG_LOG ("PatchCache::LoadPatchMD5 Loading patch info from %s", path.c_str ());
  if (!pPatch)
    {
      sLog.outError ("PatchCache::LoadPatchMD5 Error loading patch %s", path.c_str ());
      return;
    }

  // Calculate the MD5 hash
  MD5_CTX ctx;
  MD5_Init (&ctx);

  const size_t check_chunk_size = 4*1024;

  uint8 buf[check_chunk_size];

  while (!feof (pPatch))
    {
      size_t read = fread (buf, 1, check_chunk_size, pPatch);
      MD5_Update (&ctx, buf, read);
    }

  fclose (pPatch);

  // Store the result in the internal patch hash map
  _patches[path] = new PATCH_INFO;
  MD5_Final ((uint8 *) & _patches[path]->md5, &ctx);
}

bool
PatchCache::GetHash (const char * pat, uint8 mymd5[MD5_DIGEST_LENGTH])
{
  for (Patches::iterator i = _patches.begin (); i != _patches.end (); i++)
    if (!stricmp (pat, i->first.c_str ()))
      {
        memcpy (mymd5, i->second->md5, MD5_DIGEST_LENGTH);
        return true;
      }

  return false;
}

void
PatchCache::LoadPatchesInfo ()
{
  ACE_DIR* dirp = ACE_OS::opendir (ACE_TEXT("./patches/"));

  if (!dirp)
    return;

  ACE_DIRENT* dp;

  while ((dp = ACE_OS::readdir (dirp)) != NULL)
    {
      int l = strlen (dp->d_name);
      if (l < 8) continue;

      if (!memcmp (&dp->d_name[l - 4], ".mpq", 4))
        LoadPatchMD5 (dp->d_name);
    }

  ACE_OS::closedir (dirp);
}
