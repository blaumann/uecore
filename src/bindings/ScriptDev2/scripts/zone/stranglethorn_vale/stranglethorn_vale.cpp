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
SDName: Stranglethorn_Vale
SD%Complete: 100
SDComment: Quest support: 592, 8193
SDCategory: Stranglethorn Vale
EndScriptData */

/* ContentData
mob_yenniku
npc_riggle_bassbait
EndContentData */

#include "precompiled.h"
#include "GameEventMgr.h"

enum
{
    SAY_START               = -1000351,
    SAY_WINNER              = -1000352,
    SAY_END                 = -1000353,

    QUEST_MASTER_ANGLER     = 8193,
    TIME_HOUR_ANNOUNCE      = 14,
    TIME_HOUR_END           = 16
};

/*######
## mob_yenniku
######*/

struct MANGOS_DLL_DECL mob_yennikuAI : public ScriptedAI
{
    mob_yennikuAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        bReset = false;
        Reset();
    }

    uint32 Reset_Timer;
    bool bReset;

    void Reset()
    {
        Reset_Timer = 0;
        m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_NONE);
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (caster->GetTypeId() == TYPEID_PLAYER)
        {
                                                            //Yenniku's Release
            if(!bReset && ((Player*)caster)->GetQuestStatus(592) == QUEST_STATUS_INCOMPLETE && spell->Id == 3607)
            {
                m_creature->SetUInt32Value(UNIT_NPC_EMOTESTATE, EMOTE_STATE_STUN);
                m_creature->CombatStop();                   //stop combat
                m_creature->DeleteThreatList();             //unsure of this
                m_creature->setFaction(83);                 //horde generic

                bReset = true;
                Reset_Timer = 60000;
            }
        }
        return;
    }

    void UpdateAI(const uint32 diff)
    {
        if (bReset)
            if(Reset_Timer < diff)
        {
            EnterEvadeMode();
            bReset = false;
            m_creature->setFaction(28);                     //troll, bloodscalp
        }
        else Reset_Timer -= diff;

        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() )
            return;

        DoMeleeAttackIfReady();
    }
};
CreatureAI* GetAI_mob_yenniku(Creature* pCreature)
{
    return new mob_yennikuAI(pCreature);
}

/*######
##npc_riggle_bassbait
######*/

struct MANGOS_DLL_DECL npc_riggle_bassbaitAI : public ScriptedAI
{
    npc_riggle_bassbaitAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        bIsWinner = false;
        bIsEnded = true;
        SetAnnounceTime();
        bCanAnnounce = true;
        Reset();
    }

    uint32 uiTimeOfAnnounce;
    uint32 uiTimeOfEnd;

    bool bCanAnnounce;
    bool bIsEnded;
    bool bIsWinner;

    void Reset() { }

    void SetAnnounceTime()
    {
        time_t currentTime = time(NULL);
        tm localTime = *localtime(&currentTime);
        localTime.tm_hour   = TIME_HOUR_ANNOUNCE;
        //localTime.tm_min    = 0;

        uiTimeOfAnnounce = mktime(&localTime);
    }

    void SetEndTime()
    {
        time_t currentTime = time(NULL);
        tm localTime = *localtime(&currentTime);
        localTime.tm_hour   = TIME_HOUR_END;
        //localTime.tm_min    = 0;

        uiTimeOfEnd = mktime(&localTime);

        bIsEnded = false;
    }

    void Aggro(Unit *who) {}

    void UpdateAI(const uint32 diff)
    {
        if (bCanAnnounce && time(NULL) >= uiTimeOfAnnounce)
        {
            if (!IsHolidayActive(HOLIDAY_FISHING_EXTRAVAGANZA))
            {
                error_db_log("SD2: npc_riggle_bassbait can announce contest, but HOLIDAY_FISHING_EXTRAVAGANZA is not active.");
                bCanAnnounce = false;
                return;
            }

            debug_log("SD2: npc_riggle_bassbait announce HOLIDAY_FISHING_EXTRAVAGANZA contest");

            DoScriptText(SAY_START, m_creature);
            m_creature->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            bCanAnnounce = false;

            SetEndTime();
        }

        if (!bIsEnded && time(NULL) >= uiTimeOfEnd)
        {
            debug_log("SD2: npc_riggle_bassbait end HOLIDAY_FISHING_EXTRAVAGANZA contest");

            DoScriptText(SAY_END, m_creature);
            m_creature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
            bIsEnded = true;
            bIsWinner = true;
        }

        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

bool GossipHello_npc_riggle_bassbait(Player* pPlayer, Creature* pCreature)
{
    if (pCreature->isQuestGiver())
    {
        pPlayer->PrepareQuestMenu(pCreature->GetGUID());
        pPlayer->SEND_GOSSIP_MENU(7614, pCreature->GetGUID());
        return true;
    }

    pPlayer->SEND_GOSSIP_MENU(7714, pCreature->GetGUID());

    return true;
}

bool ChooseReward_npc_riggle_bassbait(Player* pPlayer, Creature* pCreature, const Quest* pQuest, uint32 uiItem)
{
    if (pQuest->GetQuestId() == QUEST_MASTER_ANGLER)
    {
        DoScriptText(SAY_WINNER, pCreature,pPlayer);
        pCreature->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
        ((npc_riggle_bassbaitAI*)(pCreature->AI()))->bIsWinner = true;
        return true;
    }

    return true;
}

CreatureAI* GetAI_npc_riggle_bassbait(Creature* pCreature)
{
    return new npc_riggle_bassbaitAI(pCreature);
}

void AddSC_stranglethorn_vale()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "mob_yenniku";
    newscript->GetAI = &GetAI_mob_yenniku;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "npc_riggle_bassbait";
    newscript->GetAI = &GetAI_npc_riggle_bassbait;
    newscript->pGossipHello = &GossipHello_npc_riggle_bassbait;
    newscript->pChooseReward = &ChooseReward_npc_riggle_bassbait;
    newscript->RegisterSelf();
}
