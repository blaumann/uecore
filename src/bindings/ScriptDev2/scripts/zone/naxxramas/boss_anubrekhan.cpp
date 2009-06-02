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
SDName: Boss_Anubrekhan
SD%Complete: 90
SDComment: timers may be not offi, impale animation
SDCategory: Naxxramas
EndScriptData */

#include "precompiled.h"
#include "def_naxxramas.h"

//Anub'Rekhan speech
enum Speech
{
    SAY_GREET  = -1533000,
    SAY_AGGRO1 = -1533001,
    SAY_AGGRO2 = -1533002,
    SAY_AGGRO3 = -1533003,
    SAY_TAUNT1 = -1533004,
    SAY_TAUNT2 = -1533005,
    SAY_TAUNT3 = -1533006,
    SAY_TAUNT4 = -1533007,
    SAY_SLAY   = -1533008
};

enum
{
//Anub'Rekhan spels
    SPELL_IMPALE       = 28783,                           //May be wrong spell id. Causes more dmg than I expect
    SPELL_LOCUST_SWARM = 28785,                           //This is a self buff that triggers the dmg debuff
    SPELL_BERSERK      = 46587,                           
    SPELL_SELF_SPAWN_5 = 29105,                           //This spawns 5 corpse scarabs ontop of us (most likely the player casts this on death)

// Adds
    NPC_CRYPT_GUARD    = 16573,
    NPC_CORPSE_SCARAB  = 16698,

//Crypt Guard spells
    SPELL_CG_ACID_SPIT  = 28969,
    SPELL_CG_CLEAVE     = 40504,
    SPELL_CG_FRENZY     = 8269,
    SPELL_SELF_SPAWN_10 = 28864                           //This spawns 10 corpse scarabs. This is used by the crypt guards when they die
};

static const uint32 MAX_CRYPT_GUARDS = 8;

//Anub'Rekhan AI
struct MANGOS_DLL_DECL boss_anubrekhanAI : public ScriptedAI
{
    boss_anubrekhanAI(Creature *pCreature) : ScriptedAI(pCreature) 
    {
        m_pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        
        for(int i = 0; i < MAX_CRYPT_GUARDS; i++)
            m_auiCryptGuardGUIDs[i] = 0;
        m_bHasTaunted = false;
        Reset();
    }

    ScriptedInstance *m_pInstance;

    uint32 m_uiImpale_Timer;
    uint32 m_uiLocustSwarmPhase_Timer;
    uint32 m_uiSummonFirst_Timer;
    uint32 m_uiBerserk_Timer;
    uint32 m_uiRiseFromCorpse_Timer;         // Boss calls Corpse Scarabs from dead bodies 

    uint64 m_auiCryptGuardGUIDs[MAX_CRYPT_GUARDS];
    uint32 m_uiCryptGuard_count;

    bool m_bHasTaunted;                //in fact says we entered the room with big beetle
    bool m_bIsSwarmPhase;                        //is active spell LocustbIsSwarmPhase or not, when active he cannot use other spels

    void Reset()
    {
        m_uiImpale_Timer = 15000;                               //15 seconds
        m_uiLocustSwarmPhase_Timer = 80000 + (rand()%40000);         //Random time between 80 seconds and 2 minutes for initial cast
        m_uiSummonFirst_Timer = 20000;                            //45 seconds after initial locust m_bIsSwarmPhase
        m_uiBerserk_Timer = 600000;
        m_uiRiseFromCorpse_Timer = 20000 + (rand()%20000);
        m_bIsSwarmPhase = false;
        m_uiCryptGuard_count = 0;

        // Remove all Crypt Guards
        for(int i = 0; i < MAX_CRYPT_GUARDS; i++)
        {
            //delete creature
            Unit* pUnit = Unit::GetUnit((*m_creature), m_auiCryptGuardGUIDs[i]);
            if (pUnit)
                pUnit->AddObjectToRemoveList();
            m_auiCryptGuardGUIDs[i] = 0;
        }
        //Remove all corpse scarabs

        std::list<Creature*> CorpseScarabs = GetCreaturesByEntry(NPC_CORPSE_SCARAB);
        if (!CorpseScarabs.empty())
            for(std::list<Creature*>::iterator itr = CorpseScarabs.begin(); itr != CorpseScarabs.end(); ++itr)
                (*itr)->AddObjectToRemoveList();

        //if anubrekhan is alive -> this must be first time we entered Archanid Wing -> close all other doors
        if (m_pInstance && m_creature->isAlive())
            m_pInstance->SetData(ENCOUNT_ANUBREKHAN, NOT_STARTED);
    }

    void JustDied(Unit*)
    {
        //Anubrekhan is slayed -> open all doors to Faerlina
        if(m_pInstance)
            m_pInstance->SetData(ENCOUNT_ANUBREKHAN, DONE);
    }

    void KilledUnit(Unit* pVictim)
    {
        DoScriptText(SAY_SLAY, m_creature);
    }

    void EnterCombat(Unit *pEnemy)
    {
        if (!pEnemy)
            return;

        switch(rand()%3)
        {
            case 0: DoScriptText(SAY_AGGRO1, m_creature); break;
            case 1: DoScriptText(SAY_AGGRO2, m_creature); break;
            case 2: DoScriptText(SAY_AGGRO3, m_creature); break;
        }

        Aggro(pEnemy);
    }
    
    bool IsVisible(Unit* who) const
    {
        if (!who)
            return false;
        return m_creature->IsWithinDistInMap(who, 100.0f);
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!m_bHasTaunted)
        {
            DoScriptText(SAY_GREET, m_creature);
            m_bHasTaunted = true;
        }
        
        ScriptedAI::MoveInLineOfSight(who);
    }
    
    std::list<Creature*> GetCreaturesByEntry(uint32 uiEntry)
    {
        CellPair pair(MaNGOS::ComputeCellPair(m_creature->GetPositionX(), m_creature->GetPositionY()));
        Cell cell(pair);
        cell.data.Part.reserved = ALL_DISTRICT;
        cell.SetNoCreate();

        std::list<Creature*> creatureList;

        AllCreaturesOfEntryInRange check(m_creature, uiEntry, 100);
        MaNGOS::CreatureListSearcher<AllCreaturesOfEntryInRange> searcher(m_creature, creatureList, check);
        TypeContainerVisitor<MaNGOS::CreatureListSearcher<AllCreaturesOfEntryInRange>, GridTypeMapContainer> visitor(searcher);

        CellLock<GridReadGuard> cell_lock(cell, pair);
        cell_lock->Visit(cell_lock, visitor, *(m_creature->GetMap()));

        return creatureList;
    }

    void JustSummoned(Creature* pSummon) 
    {
        if (!pSummon)
            return;

        //Summoned Crypt Guard will pTarget random player
        m_auiCryptGuardGUIDs[m_uiCryptGuard_count++] = pSummon->GetGUID();
        if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
        {
            pSummon->AddThreat(pTarget,0.0f);
            pTarget->SetInCombatWith(pSummon);
        }

        switch (rand()%4)
        {
            case 0: DoScriptText(SAY_TAUNT1, m_creature); break;
            case 1: DoScriptText(SAY_TAUNT2, m_creature); break;
            case 2: DoScriptText(SAY_TAUNT3, m_creature); break;
            case 3: DoScriptText(SAY_TAUNT4, m_creature); break;
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        //m_uiBerserk_Timer
        if (m_uiBerserk_Timer < uiDiff)
        {
            DoCast(m_creature,SPELL_BERSERK);
            m_uiBerserk_Timer = 300000;
        }else m_uiBerserk_Timer -= uiDiff;

        //SumonFirstCryptGuard_Timer
        if (m_uiSummonFirst_Timer < uiDiff)
        {
            if (m_uiCryptGuard_count < MAX_CRYPT_GUARDS)
                DoSpawnCreature(NPC_CRYPT_GUARD,0,0,0,0,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,10000);
            m_uiSummonFirst_Timer = 2000000;
        }else m_uiSummonFirst_Timer -= uiDiff;

        //m_uiRiseFromCorpse_Timer 
        if (m_uiRiseFromCorpse_Timer < uiDiff)
        {
            m_uiRiseFromCorpse_Timer = 60000 + (rand()%10000);
            std::list<Creature*> CryptGuards = GetCreaturesByEntry(NPC_CRYPT_GUARD);
            if (!CryptGuards.empty())
                for(std::list<Creature*>::iterator itr = CryptGuards.begin(); itr != CryptGuards.end(); ++itr)
                    if ((*itr)->isDead())
                    {
                        (*itr)->CastSpell((*itr),SPELL_SELF_SPAWN_10,true);
                        (*itr)->AddObjectToRemoveList();
                    }

            CryptGuards.clear();

            const Map::PlayerList &players = m_creature->GetMap()->GetPlayers();
            if (players.isEmpty())
                return;

            for(Map::PlayerList::const_iterator i = players.begin(); i != players.end(); ++i)
                if (Player* pPlayer = i->getSource())
                {
                    if (pPlayer->isGameMaster())
                        continue;

                    if (pPlayer->isDead())
                        pPlayer->CastSpell(pPlayer,SPELL_SELF_SPAWN_5,true);
                }
        }else m_uiRiseFromCorpse_Timer -= uiDiff;

        if (!m_bIsSwarmPhase)
        {
            //m_uiImpale_Timer
            if (m_uiImpale_Timer < uiDiff)
            {
                //Cast Impale on a random pTarget
                //Do NOT cast it when we are afflicted by locust swarm
                if (!m_creature->HasAura(SPELL_LOCUST_SWARM,1))
                    if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,1))
                        DoCast(pTarget,SPELL_IMPALE);
                m_uiImpale_Timer = 15000;
            }else m_uiImpale_Timer -= uiDiff;

            //m_uiLocustSwarmPhase_Timer
            if (m_uiLocustSwarmPhase_Timer < uiDiff)
            {
                //Cast Locust_Swarm buff on ourselves
                DoCast(m_creature, SPELL_LOCUST_SWARM);
                m_bIsSwarmPhase = true;
                //Summon Crypt Guard immidietly after Locust_Swarm Phase
                if (m_uiCryptGuard_count < MAX_CRYPT_GUARDS)
                    DoSpawnCreature(NPC_CRYPT_GUARD,0,0,0,0,TEMPSUMMON_TIMED_OR_DEAD_DESPAWN,10000);
                m_uiLocustSwarmPhase_Timer = 20000;
            }else m_uiLocustSwarmPhase_Timer -= uiDiff;
        }
        else
        {
            if (m_uiLocustSwarmPhase_Timer < uiDiff)
            {            
                m_bIsSwarmPhase = false;
                m_uiLocustSwarmPhase_Timer = 60000 + rand()%20000;
            }else m_uiLocustSwarmPhase_Timer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_anubrekhan(Creature* pCreature)
{
    return new boss_anubrekhanAI(pCreature);
}

void AddSC_boss_anubrekhan()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_anubrekhan";
    newscript->GetAI = &GetAI_boss_anubrekhan;
    newscript->RegisterSelf();
}
