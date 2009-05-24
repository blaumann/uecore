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

#include "Common.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Vehicle.h"
#include "Unit.h"
#include "Util.h"

Vehicle::Vehicle() : Creature(), m_vehicleId(0)
{
    m_isVehicle = true;
    m_updateFlag = (UPDATEFLAG_LIVING | UPDATEFLAG_HAS_POSITION | UPDATEFLAG_VEHICLE);
}

Vehicle::~Vehicle()
{
    if(m_uint32Values)                                      // only for fully created Object
        ObjectAccessor::Instance().RemoveObject(this);
}

void Vehicle::AddToWorld()
{
    ///- Register the vehicle for guid lookup
    if(!IsInWorld()) ObjectAccessor::Instance().AddObject(this);
    Unit::AddToWorld();
}

void Vehicle::RemoveFromWorld()
{
    ///- Remove the vehicle from the accessor
    if(IsInWorld()) ObjectAccessor::Instance().RemoveObject(this);
    ///- Don't call the function for Creature, normal mobs + totems go in a different storage
    Unit::RemoveFromWorld();
}

bool Vehicle::SetVehicleId(uint32 vehicleid)
{
    VehicleEntry const *vehicleInfo = sVehicleStore.LookupEntry(m_vehicleId);
    if(!vehicleInfo)
        return false;

    m_vehicleId = vehicleid;
    m_vehicleInfo = vehicleInfo;

    InitSeats();
    return true;
}

void Vehicle::InitSeats()
{
    m_Seats.clear();

    for(uint32 i = 0; i < MAX_SEAT; ++i)
    {
        uint32 seatId = m_vehicleInfo->m_seatID[i];
        if(seatId)
        {
            if(VehicleSeatEntry const *veSeat = sVehicleSeatStore.LookupEntry(seatId))
            {
                VehicleSeat newseat;
                newseat.passenger = NULL;
                newseat.seatInfo = veSeat;
                newseat.flags = SEAT_FREE;
                m_Seats[i] = newseat;
            }
        }
    }
    // NOTE : there can be vehicles without seats (eg. 180) - probably some TEST vehicles
}

bool Vehicle::FindFreeSeat(int8 *seatid)
{
    SeatMap::const_iterator i_seat = m_Seats.find(*seatid);
    if(i_seat == m_Seats.end()) return GetFirstEmptySeat(seatid);
    if(i_seat->second.flags & (SEAT_FULL | SEAT_VEHICLE_FULL)) return GetNextEmptySeat(seatid, true);

    return true;
}

bool Vehicle::GetFirstEmptySeat(int8 *seatId)
{
    for(SeatMap::iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if(itr->second.flags & (SEAT_FREE | SEAT_VEHICLE_FREE))
        {
            *seatId = itr->first;
            return true;
        }
    }

    return false;
}

int8 Vehicle::GetEmptySeatsCount()
{
    int8 count = 0;
    for(SeatMap::iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if(itr->second.flags & (SEAT_FREE | SEAT_VEHICLE_FREE))

        {
            count++;
        }
    }

    return count;
}

bool Vehicle::GetNextEmptySeat(int8 *seatId, bool next)
{
    SeatMap::const_iterator i_seat = m_Seats.find(*seatId);
    if(i_seat == m_Seats.end()) return GetFirstEmptySeat(seatId);

    while(i_seat->second.flags & (SEAT_FULL | SEAT_VEHICLE_FULL))
    {
        if(next)
        {
            ++i_seat;
            if(i_seat == m_Seats.end())
                i_seat = m_Seats.begin();
        }
        else
        {
            if(i_seat == m_Seats.begin())
                i_seat = m_Seats.end();
            --i_seat;
        }
        if(i_seat->first == *seatId)
            return false;
    }
    *seatId = i_seat->first;
    return true;
}

void Vehicle::setDeathState(DeathState s)                       // overwrite virtual Creature::setDeathState and Unit::setDeathState
{
    Creature::setDeathState(s);
}

void Vehicle::Update(uint32 diff)
{
    Creature::Update(diff);
}

bool Vehicle::Create(uint32 guidlow, Map *map, uint32 Entry, uint32 vehicleId, uint32 team)
{
    SetMapId(map->GetId());
    SetInstanceId(map->GetInstanceId());

    Object::_Create(guidlow, Entry, HIGHGUID_VEHICLE);

    if(!InitEntry(Entry, team))
        return false;

    if(!SetVehicleId(vehicleId))
        return false;

    m_defaultMovementType = IDLE_MOTION_TYPE;

    AIM_Initialize();

    SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
    SetFloatValue(UNIT_FIELD_HOVERHEIGHT, 1.0f);

    CreatureInfo const *ci = GetCreatureInfo();
    setFaction(team == ALLIANCE ? ci->faction_A : ci->faction_H);
    SetMaxHealth(ci->maxhealth);
    SelectLevel(ci);
    SetHealth(GetMaxHealth());

	for( int i = 0; i < 4; ++i )
		this->m_spells[i] = this->GetCreatureInfo()->spells[i]; // So our vehicles can have spells on bar
	GetMotionMaster()->MovePoint(0, GetPositionX(), GetPositionY(), GetPositionZ()+2 ); // So we can fly with Dragon Vehicles

    return true;
}

void Vehicle::Dismiss()
{
    SendObjectDeSpawnAnim(GetGUID());
    CombatStop();
    CleanupsBeforeDelete();
    AddObjectToRemoveList();
}

void Vehicle::EnterVehicle(Vehicle *vehicle, int8 seat_id)
{
    // TODO : implement this
}

void Vehicle::ExitVehicle(Vehicle *vehicle)
{
    // TODO : implement this
}

void Vehicle::RellocatePassengers(Map *map)
{
    for(SeatMap::iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if(itr->second.flags & SEAT_FULL)
        {
            // passenger cant be NULL here
            Unit *passengers = itr->second.passenger;
            assert(passengers);

            float scale = GetFloatValue(OBJECT_FIELD_SCALE_X);
            float xx = GetPositionX() + passengers->m_SeatData.OffsetX * scale;
            float yy = GetPositionY() + passengers->m_SeatData.OffsetY * scale;
            float zz = GetPositionZ() + passengers->m_SeatData.OffsetZ * scale;
            float oo = m_SeatData.Orientation;

            if(passengers->GetTypeId() == TYPEID_PLAYER)
                ((Player*)passengers)->SetPosition(xx, yy, zz, oo);
            else
                map->CreatureRelocation((Creature*)passengers, xx, yy, zz, oo);
        }
        else if(itr->second.flags & (SEAT_VEHICLE_FULL | SEAT_VEHICLE_FREE))
        {
            // passenger cant be NULL here
            Unit *passengers = itr->second.passenger;
            assert(passengers);

            float scale = GetFloatValue(OBJECT_FIELD_SCALE_X);
            float xx = GetPositionX() + passengers->m_SeatData.OffsetX * scale;
            float yy = GetPositionY() + passengers->m_SeatData.OffsetY * scale;
            float zz = GetPositionZ() + passengers->m_SeatData.OffsetZ * scale;
            float oo = m_SeatData.Orientation;

            map->CreatureRelocation((Creature*)passengers, xx, yy, zz, oo);
            ((Vehicle*)passengers)->RellocatePassengers(map);
        }
    }
}