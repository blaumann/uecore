/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Instance_Molten_Core
SD%Complete: 80
SDComment: Chest for Majordomo missing
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

#define ENCOUNTERS      9

struct MANGOS_DLL_SPEC instance_molten_core : public ScriptedInstance
{
    instance_molten_core(Map* pMap) : ScriptedInstance(pMap) {Initialize();}

    uint8 SulfuronProgress;
	uint8 GeddonProgress;
	uint8 ShazzrahProgress;
	uint8 GolemaggProgress;
	uint8 GarrProgress;
	uint8 MagmadarProgress;
	uint8 GehennasProgress;
	uint8 LucifronProgress;
	uint8 MajordomoProgress;
	uint8 RagnarosProgress;

	//Creatures
    uint64 Lucifron;
	uint64 Magmadar;
	uint64 Gehennas;
	uint64 Garr;
	uint64 Geddon;
	uint64 Shazzrah;
	uint64 Sulfuron;
	uint64 Golemagg;
	uint64 Domo;
	uint64 Ragnaros;

	//Gameobjects
	GameObject* CacheOfTheFirelord;

	//Misc
	uint8 VarRagnarosIntro;
	uint32 DomoResetCount;
	uint8 DomoPorted;

    void Initialize()
    {
        Lucifron = 0;
        Magmadar = 0;
        Gehennas = 0;
        Garr = 0;
        Geddon = 0;
        Shazzrah = 0;
        Sulfuron = 0;
        Golemagg = 0;
        Domo = 0;
        Ragnaros = 0;

		SulfuronProgress = 0;
		GeddonProgress = 0;
		ShazzrahProgress = 0;
		GolemaggProgress = 0;
		GarrProgress = 0;
		MagmadarProgress = 0;
		GehennasProgress = 0;
		LucifronProgress = 0;
		MajordomoProgress = 0;
		RagnarosProgress = 0;

		CacheOfTheFirelord = NULL;

		VarRagnarosIntro = 0;
		DomoResetCount = 0;
		DomoPorted = 0;
	}

    //Called every map update
    void Update(uint32 diff){}


    //Called when a gameobject is created
    void OnObjectCreate(GameObject *obj) 
    {
		switch(obj->GetEntry())
		{
			case 179703:
				CacheOfTheFirelord = obj;
				break;
		}
    }

    //called on creature creation
    void OnCreatureCreate(Creature* pCreature)
    {
		switch (pCreature->GetEntry())
        {
            case 12118:
                Lucifron = pCreature->GetGUID();
                break;
            case 11982:
                Magmadar = pCreature->GetGUID();
                break;
            case 12259:
                Gehennas = pCreature->GetGUID();
                break;
            case 12057:
                Garr = pCreature->GetGUID();
                break;
            case 12056:
                Geddon = pCreature->GetGUID();
                break;
            case 12264:
                Shazzrah = pCreature->GetGUID();
                break;
            case 12098:
                Sulfuron = pCreature->GetGUID();
                break;
            case 11988:
                Golemagg = pCreature->GetGUID();
                break;
            case 12018:
                Domo = pCreature->GetGUID();
                break;
            case 11502:
                Ragnaros = pCreature->GetGUID();
				pCreature->SetVisibility(VISIBILITY_OFF);
                break;
        }
    }

    uint64 GetData64(uint32 data)
    {
        switch(data)
        {
            case DATA_SULFURON:
                return Sulfuron;
				break;
            case DATA_GOLEMAGG:
                return Golemagg;
				break;
			case DATA_GARR:
				return Garr;
				break;
			case DATA_MAJORDOMO:
				return Domo;
				break;
			case DATA_CACHEOFTHEFIRELORD:
				return CacheOfTheFirelord->GetGUID();
				break;
        }
		return 0;
    }

    uint32 GetData(uint32 type)
    {
        switch(type)
        {
			case DATA_ALL_BOSSES_DEAD:
				if(GeddonProgress == DONE && 
					SulfuronProgress == DONE && 
					ShazzrahProgress == DONE &&
					GolemaggProgress == DONE &&
					GarrProgress == DONE &&
					MagmadarProgress == DONE &&
					GehennasProgress == DONE)
					return 1;
				else return 0;
				break;

			case DATA_MAJORDOMO_PROGRESS:
				return MajordomoProgress;
				break;

			case DATA_DOMO_RESETCOUNT:
				return DomoResetCount;
				break;

			case DATA_DOMO_PORTED:
				return DomoPorted;
				break;

			case DATA_VARRAGNAROSINTRO:
				return VarRagnarosIntro;
				break;
        }
		return 0;
    }


    void SetData(uint32 type, uint32 data)
    {
		switch(type)
		{
		case DATA_SULFURON_PROGRESS:
			SulfuronProgress = data;
			break;

		case DATA_GEDDON_PROGRESS:
			GeddonProgress = data;
			break;

		case DATA_SHAZZRAH_PROGRESS:
			ShazzrahProgress = data;
			break;

		case DATA_GOLEMAGG_PROGRESS:
			GolemaggProgress = data;
			break;

		case DATA_GARR_PROGRESS:
			GarrProgress = data;
			break;

		case DATA_MAGMADAR_PROGRESS:
			MagmadarProgress = data;
			break;

		case DATA_GEHENNAS_PROGRESS:
			GehennasProgress = data;
			break;

		case DATA_LUCIFRON_PROGRESS:
			LucifronProgress = data;
			break;

		case DATA_MAJORDOMO_PROGRESS:
			MajordomoProgress = data;
			if(data == SPECIAL)
			{
				if(CacheOfTheFirelord->isSpawned())
					return;
				else
					CacheOfTheFirelord->SetRespawnTime(3600000);
			}
			break;

		case DATA_DOMO_RESETCOUNT:
			DomoResetCount++;
			break;

		case DATA_DOMO_PORTED:
			DomoPorted = data;
			break;

		case DATA_VARRAGNAROSINTRO:
			VarRagnarosIntro = data;
			break;

		case DATA_RAGNAROS_PROGRESS:
			RagnarosProgress = data;
			break;
		}
    }
};

InstanceData* GetInstance_instance_molten_core(Map *Map)
{
    return new instance_molten_core (Map);
}

void AddSC_instance_molten_core()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_molten_core";
    newscript->GetInstanceData = &GetInstance_instance_molten_core;
    newscript->RegisterSelf();
}