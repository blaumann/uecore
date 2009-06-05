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

/* ScriptData
SDName: The-Scarlet-Enclave
SD%Complete: 100
SDComment: Quest support: 12848, 28406, 12680, 12687.
SDCategory: Eastern Plaguelands: The Scarlet Enclave
EndScriptData */

//IDs of the different initiate entrys
uint32 unworthyInitiates[] = {
	29519, 29520, 29565, 29566, 29567
};

uint32 spellList[] = { 52374, 52372, 52373, 52375 };

//old modelids to know which new model has to be chosen
uint32 oldModels[] = {
    25370,  25359,  25368,  25354,
    25356,  25365,  25367,  25366,
    25369,  25362,  25363,  25360,
    25355,  25372,  25371,  25361,
    25373,  25358,  25357,  25364
};

uint32 newModelSpells[] = {
	51545,	51539,	51544,	51520,
	51538,	51546,	51549,	51547,
	51552,	51540,	51542,	51536,
	51534,	51549,	51548,	51537,
	51551,	51535,	51541,	51543
};

int Textids[]= {
	-1999926, -1999927,
	-1999928, -1999929,
	-1999930, -1999931
};
enum
{
	QUEST_THE_ENDLESS_HUNGER = 12848,
	SPELL_CHAINED_TO_TRIGGER = 54612,
	SPELL_INITIATE_VISUAL    = 51519,
};

struct MANGOS_DLL_DECL npc_unworthy_initiateAI : public ScriptedAI
{	
	npc_unworthy_initiateAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
		Reset();
	}

	uint32 changeTimer;
	uint32 castSpellTimer;
	uint32 phase;
	int resetTimer;
	int Textid;

	void Reset()
	{
		changeTimer    = 10000;
		castSpellTimer = 5000;
		phase          = 0;
		Textid         = rand()%3 *2;

		for(int i=0; i < 20; i++)
			m_creature->RemoveAurasDueToSpell(newModelSpells[i]);
		
		//kneel
		m_creature->SetUInt32Value(UNIT_FIELD_BYTES_1, 8);
		m_creature->setFaction(7);
		m_creature->SetUInt32Value(UNIT_FIELD_FLAGS, 33024);

	}

	void JustDied(Unit* killer)
	{
		//Complete the quest even if an Initiate has not the right entry
		if(killer->hasQuest(QUEST_THE_ENDLESS_HUNGER))
			((Player*)killer)->CompleteQuest(QUEST_THE_ENDLESS_HUNGER);
	}

	void UpdateAI(const uint32 diff)
	{
		//if we are still chained, do nothing
		if(m_creature->HasAura(SPELL_CHAINED_TO_TRIGGER))
			return;

		if(phase == 0)
		{
			//timer until the initiate dresses up
			if(changeTimer < diff)
			{
				int modelId = -1;
				int i = 0;
				while(modelId == -1){//24507 
					if((m_creature->GetDisplayId() == oldModels[i])||(m_creature->GetDisplayId()==25407))
						modelId = i;
					i++;
				}

				//stand up
				m_creature->SetUInt32Value(UNIT_FIELD_BYTES_1, 0);
				//change model
				DoCast(m_creature, newModelSpells[modelId]);
				//become hostile
				m_creature->setFaction(14);
				//remove possible unattackable flags
				m_creature->SetUInt32Value(UNIT_FIELD_FLAGS, 0);
				//cast the wierd visual spell
				DoCast(m_creature, SPELL_INITIATE_VISUAL);
				DoScriptText(Textids[Textid], m_creature);

				changeTimer = 3000;
				phase++;
			} else changeTimer -= diff;
		} else if(phase == 1){
			//no need to use a different timer now
			if(changeTimer < diff)
			{
				DoScriptText(Textids[Textid + 1], m_creature);
				changeTimer = 10000;
				phase++;
			} else changeTimer -= diff;
		} else {
			if(castSpellTimer < diff)
			{
				m_creature->SelectHostilTarget();
				int chosenSpell = rand()%4;
				DoCast(m_creature->getVictim(),spellList[chosenSpell]);
				castSpellTimer = 10000 + rand()%4000;
			} else castSpellTimer -= diff;

			DoMeleeAttackIfReady();
		}
	}
};

CreatureAI* GetAI_npc_unworthy_initiate(Creature* pCreature)
{
    return new npc_unworthy_initiateAI(pCreature);
}

struct MANGOS_DLL_DECL npc_unworthy_initiate_triggerAI : public ScriptedAI
{	
	npc_unworthy_initiate_triggerAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

	uint32 chainTimer;
	Creature* chainedTo;

	void Reset()
	{
		//always check for a new target after death
		chainedTo = NULL;
		chainTimer = 2000;
	}

	void UpdateAI(const uint32 diff)
	{
		if(chainTimer < diff && !chainedTo)
		{
			int i = 0;
			while(!chainedTo && i < 5){
				chainedTo = GetClosestCreatureWithEntry(m_creature, unworthyInitiates[i], 5);
				i++;
			}

			//only apply spell in case Unworthy Initiate is not yet hostile and exists
			if(chainedTo && chainedTo->getFaction() != 14 )
				m_creature->CastSpell(chainedTo ,SPELL_CHAINED_TO_TRIGGER , false);
			else
				chainTimer = 2000;
		}else chainTimer -= diff;

	}

};

CreatureAI* GetAI_npc_unworthy_initiate_trigger(Creature* pCreature)
{
    return new npc_unworthy_initiate_triggerAI(pCreature);
}

/*######
## npc_death_knight_initiate
######*/

#define GOSSIP_DKI      "Duel with me!"

#define SAY_DKI_DUEL1   "Remember this day, $N, for it is the day that you will be thoroughly owned."
#define SAY_DKI_DUEL2   "I'm going to tear your heart out, cupcake!"
#define SAY_DKI_DUEL3   "You have challenged death itself!"
#define SAY_DKI_DUEL4   "Don't make me laugh."
#define SAY_DKI_DUEL5   "Here come the tears..."
#define SAY_DKI_DUEL6   "No potions!"

struct MANGOS_DLL_DECL npc_death_knight_initiateAI : public ScriptedAI
{
    npc_death_knight_initiateAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    void Reset()
    {
        m_creature->setFaction(2084);
    }

    void EnterCombat(Unit *who) {
        if(who->GetTypeId() == TYPEID_PLAYER) {
            switch(rand()%6)
            {
                case 0: DoSay(SAY_DKI_DUEL1, LANG_UNIVERSAL, who); break;
                case 1: DoSay(SAY_DKI_DUEL2, LANG_UNIVERSAL, who); break;
                case 2: DoSay(SAY_DKI_DUEL3, LANG_UNIVERSAL, who); break;
                case 3: DoSay(SAY_DKI_DUEL4, LANG_UNIVERSAL, who); break;
                case 4: DoSay(SAY_DKI_DUEL5, LANG_UNIVERSAL, who); break;
                case 5: DoSay(SAY_DKI_DUEL6, LANG_UNIVERSAL, who); break;
            }
        }
    }

    void JustDied(Unit *killer) { }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() )
            return;

        Unit *victim = m_creature->getVictim();

        if(victim->GetTypeId() == TYPEID_PLAYER) {
            if ( (victim->GetHealth()*100)/victim->GetMaxHealth() <= 10 ) {
                m_creature->setFaction(2084);
                victim->AttackStop();
                m_creature->CombatStop();
                m_creature->RemoveAllAuras();
                EnterEvadeMode();
            }
        }

        DoMeleeAttackIfReady();
    }

    void DamageTaken(Unit *done_by, uint32 & damage)
    {
        if(done_by->GetTypeId() == TYPEID_PLAYER && damage > m_creature->GetHealth())
        {
            //Take 0 damage
            damage = 0;
            ((Player*)done_by)->AttackStop();
            ((Player*)done_by)->KilledMonster(29025,m_creature->GetGUID());
            m_creature->setFaction(2084);
            m_creature->RemoveAllAuras();
            m_creature->CombatStop();
            EnterEvadeMode();
        }
    }
};

CreatureAI* GetAI_npc_death_knight_initiate(Creature* pCreature)
{
    return new npc_death_knight_initiateAI(pCreature);
}

bool GossipHello_npc_death_knight_initiate(Player *player, Creature *_Creature)
{
    if( player->GetQuestStatus(12733) == QUEST_STATUS_INCOMPLETE )
        player->ADD_GOSSIP_ITEM(0, GOSSIP_DKI, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

    player->SEND_GOSSIP_MENU(_Creature->GetNpcTextId(),_Creature->GetGUID());
    return true;
}

bool GossipSelect_npc_death_knight_initiate(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if( action == GOSSIP_ACTION_INFO_DEF )
    {
        player->CastSpell(player, 52991, true);
        _Creature->setFaction(14);
        ((npc_death_knight_initiateAI*)_Creature->AI())->AttackStart(player);
    }
    return true;
}

/*######
## npc_salanar_the_horseman
######*/

struct MANGOS_DLL_DECL npc_salanar_the_horsemanAI : public ScriptedAI
{
    npc_salanar_the_horsemanAI(Creature* pCreature) : ScriptedAI(pCreature) {Reset();}

    void Reset() { }

    void MoveInLineOfSight(Unit *who)
    {
        if( (who->GetTypeId() == TYPEID_UNIT) && ((Creature*)who)->isVehicle() && m_creature->IsWithinDistInMap(who, 25.0f) )
        {
            if( Unit *charmer = who->GetCharmer() )
            {
                if( charmer->GetTypeId() == TYPEID_PLAYER && ((Player*)charmer)->GetQuestStatus(12680) == QUEST_STATUS_INCOMPLETE )
                {
                    ((Player*)charmer)->KilledMonster(28767,m_creature->GetGUID());
                    ((Player*)charmer)->ExitVehicle();
                    // TODO: dismiss Vehicle; Now we cant do it from script.
                }
            }
        }
    }
};

CreatureAI* GetAI_npc_salanar_the_horseman(Creature* pCreature)
{
    return new npc_salanar_the_horsemanAI(pCreature);
}

/*######
## npc_ros_dark_rider
######*/

struct MANGOS_DLL_DECL npc_ros_dark_riderAI : public ScriptedAI
{
    npc_ros_dark_riderAI(Creature *c) : ScriptedAI(c) {}

    void Reset()
    {
        Creature* deathcharger = m_creature->FindNearestCreature(28782, 30);
        if(!deathcharger) return;
        //deathcharger->SetFaction(0);
        deathcharger->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
        deathcharger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }

    void JustDied(Unit *killer)
    {
        Creature* deathcharger = m_creature->FindNearestCreature(28782, 30);
        if(!deathcharger) return;
        if( killer->GetTypeId() == TYPEID_PLAYER && deathcharger->GetTypeId() == TYPEID_UNIT && deathcharger->isVehicle() )
        {
            deathcharger->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
            deathcharger->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            deathcharger->RemoveUnitMovementFlag(MOVEMENTFLAG_WALK_MODE);
            deathcharger->setFaction(2096);
        }
    }
};

CreatureAI* GetAI_npc_ros_dark_rider(Creature *_Creature)
{
    return new npc_ros_dark_riderAI(_Creature);
}

void AddSC_the_scarlet_enclave()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "npc_unworthy_initiate";
    newscript->GetAI = &GetAI_npc_unworthy_initiate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_unworthy_initiate_trigger";
    newscript->GetAI = &GetAI_npc_unworthy_initiate_trigger;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_death_knight_initiate";
    newscript->pGossipHello = &GossipHello_npc_death_knight_initiate;
    newscript->pGossipSelect = &GossipSelect_npc_death_knight_initiate;
    newscript->GetAI = &GetAI_npc_death_knight_initiate;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_salanar_the_horseman";
    newscript->GetAI = &GetAI_npc_salanar_the_horseman;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_ros_dark_rider";
    newscript->GetAI = &GetAI_npc_ros_dark_rider;
    newscript->RegisterSelf();
}