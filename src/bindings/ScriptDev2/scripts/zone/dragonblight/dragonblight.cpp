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
SDName: Dragonblight
SD%Complete: 100
SDComment:
SDCategory: Dragonblight
EndScriptData */

/* ContentData
npc_alexstrasza_wr_gate
frostcav_control
EndContentData */

#include "precompiled.h"

/*######
## Alexstrasza
######*/

enum
{
    QUEST_RETURN_TO_AG_A    = 12499,
    QUEST_RETURN_TO_AG_H    = 12500,
    MOVIE_ID_GATES          = 14
};

#define GOSSIP_ITEM_WHAT_HAPPENED   "Alexstrasza, can you show me what happened here?"

bool GossipHello_npc_alexstrasza_wr_gate(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());

    if (pPlayer->GetQuestRewardStatus(QUEST_RETURN_TO_AG_A) || pPlayer->GetQuestRewardStatus(QUEST_RETURN_TO_AG_H))
        pPlayer->ADD_GOSSIP_ITEM(0, GOSSIP_ITEM_WHAT_HAPPENED, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

    pPlayer->SEND_GOSSIP_MENU(pCreature->GetNpcTextId(), pCreature->GetGUID());
    return true;
}

bool GossipSelect_npc_alexstrasza_wr_gate(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
{
    if (uiAction == GOSSIP_ACTION_INFO_DEF+1)
    {
        pPlayer->CLOSE_GOSSIP_MENU();
        pPlayer->SendMovieStart(MOVIE_ID_GATES);
    }

    return true;
}

/*######
## Frostcav Control
######*/

uint32 frostcav_event = 0;
Unit* playerr;

struct MANGOS_DLL_DECL frostcav_controlAI : public ScriptedAI
{
   frostcav_controlAI(Creature *c) : ScriptedAI(c) {Reset();}

   uint32 phase;
   uint32 phasetim;

   Creature* arthas;
   Creature* muradin;
   Creature* frostmourne;

   void Reset() 
   {
       phase = 1;
	   phasetim = 20000;
   };

   void Aggro(Unit* who) {};

   void UpdateAI(const uint32 diff)
   {
	   if(frostcav_event == 0) return;

	   switch(phase)
	   {
	   case 1:
           arthas = m_creature->SummonCreature(27455,4817.506f,-582.1,163.37f,5.25f,TEMPSUMMON_TIMED_DESPAWN,84000);
		   muradin = m_creature->SummonCreature(27480,4815.1,-589.45f,162.85f,0,TEMPSUMMON_TIMED_DESPAWN,84000);
		   frostmourne = m_creature->SummonCreature(27880,4821.35,-586.58f,163.76f,0,TEMPSUMMON_TIMED_DESPAWN,84000);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 3:
		   arthas->SetOrientation(5.25f);
		   arthas->MonsterSay("Behold, Muradin, our salvation, Frostmourne.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 5:
		   muradin->GetMotionMaster()->MovePoint(0, 4818.86f, -587.33, 163.24f);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 7:
		   muradin->SetStandState(UNIT_STAND_STATE_KNEEL);
		   muradin->MonsterSay("Hold, lad. There\'s an inscription on the dais. It\'s a warning. It says, \"Whomsoever takes up this blade shall wield power eternal. Just as the blade rends flesh, so must power scar the spirit.\" Oh, I should\'ve known. The blade is cursed! Let\'s get the hell out of here!",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 16000;
		   break;
	   case 9:
           muradin->SetStandState(UNIT_STAND_STATE_STAND);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 11:
		   //muradin->GetMotionMaster()->MovePoint(0, 4819.44f, -586.73f, 163.25f);
		   //Muradin's orientation
		   arthas->MonsterSay("I would gladly bear any curse to save my homeland.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 1000;
		   break;
	   case 13:
		   muradin->GetMotionMaster()->MovePoint(0, 4811.28f, -588.28f, 162.099f);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 15:
           //muradin->GetMotionMaster()->MovePoint(0, 4811.84f, -588.229f, 162.24f);
		   //Set right orientation (SetOrientation doesn't work?)
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 17:
		   muradin->MonsterSay("Leave it be, Arthas. Forget this business and lead your men home.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 19:
		   arthas->MonsterSay("Damn the men! Nothing shall prevent me from having my revenge, old friend. Not even you.",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 21:
           arthas->GetMotionMaster()->MovePoint(0, 4819.099f, -584.67f, 163.44f);
		   ++phase;
		   phasetim = 3000;
		   break;
	   case 23:
		   arthas->MonsterSay("Now, I call out to the spirits of this place. I will give anything or pay any price, if only you will help me save my people.",LANG_UNIVERSAL,NULL);
		   arthas->CastSpell(m_creature,49824,false);
		   ++phase;
		   phasetim = 10000;
		   break;
	   case 25:
		   muradin->SetStandState(UNIT_STAND_STATE_DEAD);
		   arthas->LoadEquipment(88001);
		   frostmourne->LoadEquipment(1613);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 27:
		   arthas->SetSpeed(MOVE_RUN,2.0f);
		   arthas->SetSpeed(MOVE_WALK,2.0f);
		   arthas->GetMotionMaster()->MovePoint(0, 4796.64f, -586.94f, 159.55f);
		   ++phase;
		   phasetim = 5000;
		   break;
	   case 29:
           arthas->CastSpell(arthas,53048,false);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 31:
		   arthas->GetMotionMaster()->MovePoint(0, 4729.22f, -560.39f, 165.96f);
		   ++phase;
		   phasetim = 2000;
		   break;
	   case 33:
		   muradin->SetStandState(UNIT_STAND_STATE_STAND);
		   muradin->CastSpell(muradin,43328,false);
		   ++phase;
		   phasetim = 3000;
		   break;
	   case 35:
		   muradin->MonsterSay("O\' my head... Wh... Where am I?",LANG_UNIVERSAL,NULL);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 37:
		   muradin->MonsterSay("Who... Who am I?",0,0);
		   ++phase;
		   phasetim = 4000;
		   break;
	   case 39:
		   muradin->SetSpeed(MOVE_WALK,2.0f);
		   muradin->SetSpeed(MOVE_RUN,2.0f);
		   muradin->GetMotionMaster()->MovePoint(0, 4796.64f, -586.94f, 159.55f);
		   //muradin->GetMotionMaster()->MovePoint(0, 4729.22f, -560.39f, 165.96f);
		   //Get out of the cavern
           ++phase;
		   phasetim = 4000;
		   break;
	   case 41:
		   muradin->SetVisibility(VISIBILITY_OFF);
		   arthas->SetVisibility(VISIBILITY_OFF);
		   frostmourne->SetVisibility(VISIBILITY_OFF);
		   //TODO: Remove muradin, arthas and frostmourne from world
		   frostcav_event = 0;
		   phase = 1;
		   ((Player*)playerr)->GroupEventHappens(12478,m_creature);
		   break;
	   }

	   if (phasetim <= diff)
	   {
		   ++phase;
		   phasetim = 20000000;
	   } phasetim -= diff;
   }
};

CreatureAI* GetAI_frostcav_control(Creature *_Creature)
{
    frostcav_controlAI* frostcavAI = new frostcav_controlAI(_Creature);
    return (CreatureAI*)frostcavAI;
};

bool GossipHello_frostcav_control(Player *player, Creature *_Creature)
{
	if(frostcav_event == 0)
      player->ADD_GOSSIP_ITEM(0, "I\'m ready to see Zelig\'s Vision", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

    player->PlayerTalkClass->SendGossipMenu(907,_Creature->GetGUID());
    return true;
}

bool GossipSelect_frostcav_control(Player *player, Creature *_Creature, uint32 sender, uint32 action )
{
    if(action == GOSSIP_ACTION_INFO_DEF+2)
    {
        frostcav_event = 1;
		playerr = player;
		
        player->CLOSE_GOSSIP_MENU();
    }
    return true;
}

void AddSC_dragonblight()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "frostcav_control";
    newscript->GetAI = &GetAI_frostcav_control;
    newscript->pGossipHello = &GossipHello_frostcav_control;
    newscript->pGossipSelect = &GossipSelect_frostcav_control;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_alexstrasza_wr_gate";
    newscript->pGossipHello = &GossipHello_npc_alexstrasza_wr_gate;
    newscript->pGossipSelect = &GossipSelect_npc_alexstrasza_wr_gate;
    newscript->RegisterSelf();
}
