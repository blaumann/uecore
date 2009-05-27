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

#include "precompiled.h"

#define GCD_CAST    1

/*######
##Quest 12848
######*/

#define SPELL_CHAIN_ANCHOR              54612
#define SPELL_ICY_TOUCH                 52372
#define SPELL_PLAGUE_STRIKE             52373
#define SPELL_BLOOD_STRIKE              52374
#define SPELL_DEATH_COIL                52375

#define SAY_EVENT_START                 -1000099
#define SAY_EVENT_ATTACK                -1000098
#define SAY_EVENT_START2                 "? ?????? ??????? ? ?????? ??? ????????? ?????!"
#define SAY_EVENT_ATTACK2               "???????????? ????????? – ??????!"
#define SAY_EVENT_START3                 "?? ?????????? ????????, $c."
#define SAY_EVENT_ATTACK3                "??! ?? ?? ??????-?? ??? ???????! ???? ???? ?????? ??????."

const uint32 AnchorId[5] =
{
	29519,
	29520,
	29565,
	29566,
	29567
};

float modelid_dk_armor[20] =
{
    25432, // bloodelf female
    25422, // bloodelf male
    25412, // draenei female
    25420, // draenei male
    25406, // dwarf female
    25414, // dwarf male
    25438, // forsaken female
    25426, // forsaken male
    25408, // gnome female
    25426, // gnome male
    25404, // human female
    25375, // human male
    25410, // nightelf female
    25418, // nightelf male
    25436, // orc female
    25424, // orc male
    25440, // tauren female
    25430, // tauren male
    25434, // troll female
    25428  // troll male
};

float modelid_dk_unworthy[20] =
{
    25369, // bloodelf female
    25373, // bloodelf male
    25363, // draenei female
    25357, // draenei male
    25361, // dwarf female
    25356, // dwarf male
    25372, // forsaken female
    25367, // forsaken male
    25362, // gnome female
    25359, // gnome male
    25355, // human female
    25354, // human male
    25360, // nightelf female
    25358, // nightelf male
    25368, // orc female
    25364, // orc male
    25371, // tauren female
    25366, // tauren male
    25370, // troll female
    25365  // troll male
};

uint32 acherus_soul_prison[12] =
{
    191577,
    191580,
    191581,
    191582,
    191583,
    191584,
    191585,
    191586,
    191587,
    191588,
    191589,
    191590
};

struct MANGOS_DLL_DECL npc_unworthy_initiate_anchorAI : public ScriptedAI
{
    npc_unworthy_initiate_anchorAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

	uint32 CheckTimer;
	bool Channel;
	
    void Reset()
    {
		Channel = false;
		CheckTimer = 2000;
	}
		
	void UpdateAI(const uint32 diff)
    {
		if (Channel)
			return;
		if (CheckTimer < diff)
		{
			SetChannel();
			Channel = true;
			CheckTimer = 2000;

		}else CheckTimer -= diff;
	}

	void SetChannel()
	{
		for (int x = 0; x < 5; x++)
		{ 
			Creature* Initiate = GetClosestCreatureWithEntry(m_creature, AnchorId[x], 7.0f);
			
			if (!Initiate)
				continue;
		
			if (Initiate->isAlive() && m_creature->isAlive() && !Initiate->isInCombat())
			{
				if (!Initiate->HasAura(SPELL_CHAIN_ANCHOR,0))
					DoCast(Initiate,SPELL_CHAIN_ANCHOR);
			break;
			}
		}
	}
};

CreatureAI* GetAI_npc_unworthy_initiate_anchor(Creature* pCreature)
{
    return new npc_unworthy_initiate_anchorAI(pCreature);
}

struct MANGOS_DLL_DECL npc_unworthy_initiateAI : public ScriptedAI
{
    npc_unworthy_initiateAI(Creature* pCreature) : ScriptedAI(pCreature) 
	{
		m_uiNormFaction = pCreature->getFaction();
		m_uiNormModel = pCreature->GetUInt32Value(UNIT_FIELD_DISPLAYID);
		Reset();
	}
	
	uint32 m_uiNormFaction;
	uint32 m_uiNormModel;
	uint64 event_starter;
	uint32 CheckTimer;
    uint32 IcyTouch_Timer;
	uint32 PlagueStrike_Timer;
	uint32 BloodStrike_Timer;
	uint32 DeathCoil_Timer;
	bool EventStart;
	bool Atack;
	
    void Reset()
    {
		m_creature->SetUInt32Value(UNIT_FIELD_DISPLAYID, m_uiNormModel);
		m_creature->setFaction(m_uiNormFaction);
		m_creature->SetFlag(UNIT_FIELD_FLAGS, 33024);
		m_creature->SetUInt32Value(UNIT_FIELD_BYTES_1, 8);
        m_creature->SetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID  , 0);
		EventStart = false;
		Atack = false;
		CheckTimer = 6000;
		IcyTouch_Timer = 2000;
		PlagueStrike_Timer = 5000;
		BloodStrike_Timer = 4000;
		DeathCoil_Timer = 6000;		
	}
	void Aggro(Unit *who)
    {
		if (!EventStart)        
            EnterEvadeMode();
	}
		
	void UpdateAI(const uint32 diff)
    {
		if (!m_creature->HasAura(SPELL_CHAIN_ANCHOR,0) && !EventStart)
		{
			Creature* Anchor = GetClosestCreatureWithEntry(m_creature, 29521, 7.0f);
			if (Anchor)
				((npc_unworthy_initiate_anchorAI*)Anchor->AI())->SetChannel();
			ResetGO();
		}

		if (!EventStart)
			return;
		if (CheckTimer < diff && !Atack)
		{
			m_creature->setFaction(14);
			m_creature->RemoveFlag(UNIT_FIELD_FLAGS, 33024);
			if(Unit* target = Unit::GetUnit((*m_creature),event_starter))
			{
			if (target->isAlive())
					m_creature->AI()->AttackStart(target);
			}
			else EnterEvadeMode();
			CheckTimer = 30000;
			Atack = true;
		}else CheckTimer -= diff;

		if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
			return;

		if (Atack)
		{
			if (IcyTouch_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_ICY_TOUCH);
				IcyTouch_Timer = 8000;
			}else IcyTouch_Timer -= diff;

			if (PlagueStrike_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_PLAGUE_STRIKE);
				PlagueStrike_Timer = 8000;
			}else PlagueStrike_Timer -= diff;

			if (BloodStrike_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_BLOOD_STRIKE);
				BloodStrike_Timer = 9000;
			}else BloodStrike_Timer -= diff;

			if (DeathCoil_Timer < diff)
			{
				DoCast(m_creature->getVictim(),SPELL_DEATH_COIL);
				DeathCoil_Timer = 8000;
			}else DeathCoil_Timer -= diff;
			DoMeleeAttackIfReady();
		}
	}
	
	void EventBegin(GameObject* pGo, Player* pPlayer)
	{
		EventStart = true;
		Creature* Anchor = GetClosestCreatureWithEntry(m_creature, 29521, 7.0f);
		if (Anchor)
			Anchor->InterruptNonMeleeSpells(true);
		m_creature->SetStandState(UNIT_STAND_STATE_STAND);
		m_creature->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);
		m_creature->Say(SAY_EVENT_START,LANG_UNIVERSAL,NULL);
		m_creature->GetMotionMaster()->MovePoint(1, pGo->GetPositionX(), pGo->GetPositionY(), m_creature->GetPositionZ());
		event_starter = pPlayer->GetGUID();
	}

	void MovementInform(uint32 type, uint32 id)
    {
        if(type != POINT_MOTION_TYPE)
            return;

        if(id == 1)
        {
            UpdateEquipp();			
			m_creature->Say(SAY_EVENT_ATTACK,LANG_UNIVERSAL,NULL);
            m_creature->HandleEmoteCommand(EMOTE_ONESHOT_TALK);			
        }
    }

	void JustDied(Unit *killer)
    {
        if(m_creature->GetEntry() !=  29519)
            if(killer->GetTypeId() == TYPEID_PLAYER)
                ((Player*)killer)->KilledMonster(29519,m_creature->GetGUID());
    }

	void UpdateEquipp()
    {
        int model_counter = 0;
        for(int i = 0; i< 20; i++)
        {
            if(m_creature->GetDisplayId() == modelid_dk_unworthy[i])
            {
                model_counter = i;
                break;
            }
        }

        m_creature->SetUInt32Value(UNIT_FIELD_DISPLAYID, modelid_dk_armor[model_counter]);
        m_creature->LoadEquipment(m_creature->GetEquipmentId());
    }

	void ResetGO()
	{
		for (int x = 0; x<12; x++)
		{
			GameObject* pGo = GetClosestGameObjectWithEntry(m_creature,acherus_soul_prison[x],7.0f);
				if (!pGo)
					continue;
				pGo->ResetDoorOrButton();
				break;
		}
	}


};

CreatureAI* GetAI_npc_unworthy_initiate(Creature* pCreature)
{
    return new npc_unworthy_initiateAI(pCreature);
}

/*######
## go_acherus_soul_prison
######*/

bool GOHello_go_acherus_soul_prison(Player* pPlayer, GameObject* pGo)
{
	for (int x = 0; x < 5; x++)
	{
		Creature* Initiate = GetClosestCreatureWithEntry(pGo, AnchorId[x], 6.5f);
		
		if (!Initiate)
			continue;
		
		if (Initiate->isAlive() && !Initiate->isInCombat())
		{
			((npc_unworthy_initiateAI*)Initiate->AI())->EventBegin(pGo, pPlayer);
			break;
		}
	}

    return false;
}

void AddSC_the_scarlet_enclave()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_unworthy_initiate_anchor";
    newscript->GetAI = &GetAI_npc_unworthy_initiate_anchor;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_unworthy_initiate";
    newscript->GetAI = &GetAI_npc_unworthy_initiate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_acherus_soul_prison";
    newscript->pGOHello = &GOHello_go_acherus_soul_prison;
    newscript->RegisterSelf();
}