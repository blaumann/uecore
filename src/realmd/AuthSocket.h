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

/// \addtogroup realmd
/// @{
/// \file

#ifndef _AUTHSOCKET_H
#define _AUTHSOCKET_H

#include <string>

#include <ace/Asynch_IO.h>
#include <ace/Message_Block.h>
#include <ace/Asynch_Acceptor.h>

#include "Common.h"
#include "Auth/BigNumber.h"

struct sAuthReconChallengeC;
struct sAuthLogonChallengeC;

class AuthSocket : public ACE_Service_Handler
{
public:
  const static int s_BYTE_SIZE = 32;
  const static size_t s_INPUT_BUFFER = 1024;
  const static size_t s_OUTPUT_BUFFER = 16 * 1096;

  AuthSocket ();
  virtual ~AuthSocket ();

  /// Called by ACE_Asynch_Acceptor.
  virtual void open (ACE_HANDLE new_handle,
                     ACE_Message_Block&);

  /// Called by ACE_Asynch_Acceptor to pass the addresses.
  virtual void addresses (const ACE_INET_Addr &remote_address,
                          const ACE_INET_Addr &local_address);

private:
  /// Called when async read/write completes.
  virtual void handle_read_stream (const ACE_Asynch_Read_Stream::Result &result);
  virtual void handle_write_stream (const ACE_Asynch_Write_Stream::Result &result);

  /// Start async read.
  int initiate_read (size_t size = 1, bool reset = true);

  /// Put data on the output buffer.
  int send_data (const char* data, size_t size);

  /// Flush the output buffer if it has data on it.
  int flush_data ();

  /// Async streams.
  ACE_Asynch_Read_Stream rs_;
  ACE_Asynch_Write_Stream ws_;

  ACE_HANDLE handle_;
  ACE_HANDLE patch_;
  ACE_INET_Addr remote_address_;

  /// Note that these will get NULL when we have initiated IO.
  ACE_Message_Block* incoming_mb_;
  ACE_Message_Block* outgoing_mb_;

  /// Various handling functions.
  ssize_t handle_realmlist ();
  ssize_t handle_logon_proof ();
  ssize_t handle_wrong_password ();
  ssize_t handle_logon_challenge ();
  ssize_t handle_logon_challenge (sAuthLogonChallengeC& cs);
  ssize_t handle_clent_old_version (sAuthLogonChallengeC& cs);
  ssize_t handle_reconnect_challenge ();
  ssize_t handle_reconnect_challenge (sAuthReconChallengeC& cs);
  ssize_t handle_reconnect_proof ();
  ssize_t handle_transfer_resume ();
  ssize_t handle_transfer_accept ();

  std::string login_;
  std::string safelogin_;

  /// This is set to true when player have authed.
  bool authed_;

  /// When this is true, the connection
  /// will be closed after next write or read completes.
  bool closing_;

  uint8 locale_;

  AccountTypes accountSecurityLevel;

  /// For SRP6.
  BigNumber N, s, g, v;
  BigNumber b, B;
  BigNumber K;

  /// For reconnect challenge.
  BigNumber rB;

  // set v and s fields in database.
  void SetVSFields (const std::string& rI);

  const char*
  GetRemoteAddress ()
  {
    return remote_address_.get_host_addr ();
  }
};

// Acceptor
typedef ACE_Asynch_Acceptor<AuthSocket> AuthSocketAcceptor;

#endif
/// @}
