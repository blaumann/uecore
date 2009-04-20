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
SDName: Boss_Morogrim_Tidewalker
SD%Complete: 90
SDComment: Water globules don't explode properly, code cleanup needed
SDCategory: Coilfang Resevoir, Serpent Shrine Cavern
EndScriptData */

#include "precompiled.h"
#include "def_serpent_shrine.h"

enum {
    SAY_AGGRO                    = -1548030,
    SAY_SUMMON1                  = -1548031,
    SAY_SUMMON2                  = -1548032,
    SAY_SUMMON_BUBL1             = -1548033,
    SAY_SUMMON_BUBL2             = -1548034,
    SAY_SLAY1                    = -1548035,
    SAY_SLAY2                    = -1548036,
    SAY_SLAY3                    = -1548037,
    SAY_DEATH                    = -1548038,
    EMOTE_WATERY_GRAVE           = -1548039,
    EMOTE_EARTHQUAKE             = -1548040,
    EMOTE_WATERY_GLOBULES        = -1548041,

    SPELL_TIDAL_WAVE             = 37730,
    SPELL_WATERY_GRAVE           = 38049,
    SPELL_EARTHQUAKE             = 37764,
    SPELL_WATERY_GRAVE_EXPLOSION = 37852,

    WATER_GLOBULE                = 21913,
    TIDEWALKER_LURKER            = 21920
};

const float afWateryGrave[4][3] = {
    {334.64f, -728.89f, -14.42f},
    {365.51f, -737.14f, -14.44f},
    {366.19f, -709.59f, -14.36f},
    {372.93f, -690.96f, -14.44f}
};

//Morogrim Tidewalker AI
struct MANGOS_DLL_DECL boss_morogrim_tidewalkerAI : public ScriptedAI
{
    boss_morogrim_tidewalkerAI(Creature* c) : ScriptedAI(c)
    {
        m_pInstance = ((ScriptedInstance*)c->GetInstanceData());
        Reset();
    }

    ScriptedInstance* m_pInstance; // the instance

    // timers
    uint32 m_uiTidalWave_Timer;
    uint32 m_uiWateryGrave_Timer;
    uint32 m_uiEarthquake_Timer;
    uint32 m_uiWateryGlobules_Timer;

    bool m_bEarthquake;
    bool m_bPhase2;

    void Reset()
    {
        m_uiTidalWave_Timer      = 10000;
        m_uiWateryGrave_Timer    = 30000;
        m_uiEarthquake_Timer     = 40000;
        m_uiWateryGlobules_Timer = 0;

        m_bEarthquake = false;
        m_bPhase2     = false;

        if (m_pInstance)
            m_pInstance->SetData(DATA_MOROGRIMTIDEWALKEREVENT, NOT_STARTED);
    }

    void StartEvent()
    {
        DoScriptText(SAY_AGGRO, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(DATA_MOROGRIMTIDEWALKEREVENT, IN_PROGRESS);
    }

    void KilledUnit(Unit* pVictim)
    {
        switch(rand()%3)
        {
            case 0: DoScriptText(SAY_SLAY1, m_creature); break;
            case 1: DoScriptText(SAY_SLAY2, m_creature); break;
            case 2: DoScriptText(SAY_SLAY3, m_creature); break;
        }
    }

    void JustDied(Unit* pVictim)
    {
        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(DATA_MOROGRIMTIDEWALKEREVENT, NOT_STARTED);
    }

    void Aggro(Unit* pWho)
    {
        StartEvent();
    }

    void ApplyWateryGrave(Unit* pPlayer, uint8 uiPos)
    {
        float afPos[3];

        memcpy(&afPos, &afWateryGrave[uiPos], sizeof(afWateryGrave[uiPos]));

        DoTeleportPlayer(pPlayer, afPos[0], afPos[1], afPos[2]+1, pPlayer->GetOrientation());
        DoCast(pPlayer, SPELL_WATERY_GRAVE);
    }

    void SummonMurloc(float fX, float fY, float fZ)
    {
        
        if (Creature *pSummoned = m_creature->SummonCreature(TIDEWALKER_LURKER, fX, fY, fZ, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 5000))
        {
            if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                pSummoned->AI()->AttackStart(pTarget);
        }
    }

    void SummonWaterGlobule(float fX, float fY, float fZ)
    {
        if (Creature *pGlobule = m_creature->SummonCreature(WATER_GLOBULE, fX, fY, fZ, 0, TEMPSUMMON_TIMED_DESPAWN, 30000))
        {
            if (Unit *pTarget = SelectUnit(SELECT_TARGET_RANDOM, 0))
                pGlobule->AI()->AttackStart(pTarget);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() )
            return;

        //m_uiEarthquake_Timer
        if (m_uiEarthquake_Timer < uiDiff)
        {
            if (!m_bEarthquake)
            {
                DoCast(m_creature->getVictim(), SPELL_EARTHQUAKE);
                m_bEarthquake = true;
                m_uiEarthquake_Timer = 10000;
            }
            else
            {
                DoScriptText(urand(0,1) ? SAY_SUMMON1 : SAY_SUMMON2, m_creature);

                //north
                SummonMurloc(486.10f, -723.64f, -7.14f);
                SummonMurloc(482.58f, -723.78f, -7.14f);
                SummonMurloc(479.38f, -723.91f, -7.14f);
                SummonMurloc(476.03f, -723.86f, -7.14f);
                SummonMurloc(472.69f, -723.69f, -7.14f);
                SummonMurloc(469.04f, -723.63f, -7.14f);

                //south
                SummonMurloc(311.63f, -725.04f, -13.15f);
                SummonMurloc(307.81f, -725.34f, -13.15f);
                SummonMurloc(303.91f, -725.64f, -13.06f);
                SummonMurloc(300.23f, -726.0f , -11.89f);
                SummonMurloc(296.82f, -726.33f, -10.82f);
                SummonMurloc(293.64f, -726.64f, -9.81f );

                DoScriptText(EMOTE_EARTHQUAKE, m_creature);

                m_bEarthquake = false;
                m_uiEarthquake_Timer = 40000+rand()%5000;
            }
        }else m_uiEarthquake_Timer -= uiDiff;

        //m_uiTidalWave_Timer
        if (m_uiTidalWave_Timer < uiDiff)
        {
            DoCast(m_creature->getVictim(), SPELL_TIDAL_WAVE);
            m_uiTidalWave_Timer = 20000;
        }else m_uiTidalWave_Timer -= uiDiff;

        if (!m_bPhase2)
        {
            //m_uiWateryGrave_Timer
            if (m_uiWateryGrave_Timer < uiDiff)
            {
                //Teleport 4 players under the waterfalls
                for(uint8 i = 0; i < 4; i++)
                {
                    Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM, 1);
                    if (pTarget && (pTarget->GetTypeId() == TYPEID_PLAYER) && !pTarget->HasAura(SPELL_WATERY_GRAVE, 0) && pTarget->IsWithinDistInMap(m_creature, 50))
                        ApplyWateryGrave(pTarget, i);
                }

                DoScriptText(urand(0,1) ? SAY_SUMMON_BUBL1 : SAY_SUMMON_BUBL2, m_creature);

                DoScriptText(EMOTE_WATERY_GRAVE, m_creature);
                m_uiWateryGrave_Timer = 30000;
            }else m_uiWateryGrave_Timer -= uiDiff;

            //Start Phase2
            if ((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 25)
                m_bPhase2 = true;
        }
        else
        {
            //m_uiWateryGlobules_Timer
            if (m_uiWateryGlobules_Timer < uiDiff)
            {
                SummonWaterGlobule(afWateryGrave[0][0], afWateryGrave[0][1], afWateryGrave[0][2]);
                SummonWaterGlobule(afWateryGrave[1][0], afWateryGrave[1][1], afWateryGrave[1][2]);
                SummonWaterGlobule(afWateryGrave[2][0], afWateryGrave[2][1], afWateryGrave[2][2]);
                SummonWaterGlobule(afWateryGrave[3][0], afWateryGrave[3][1], afWateryGrave[3][2]);

                DoScriptText(EMOTE_WATERY_GLOBULES, m_creature);

                m_uiWateryGlobules_Timer = 25000;
            }else m_uiWateryGlobules_Timer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

//Water Globule AI
struct MANGOS_DLL_DECL mob_water_globuleAI : public ScriptedAI
{
    mob_water_globuleAI(Creature* c) : ScriptedAI(c) { Reset(); }

    // timers
    uint32 m_uiCheck_Timer;

    void Reset()
    {
        m_uiCheck_Timer = 1000;

        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->setFaction(14);
    }

    void Aggro(Unit* pWho) {}

    void MoveInLineOfSight(Unit* pWho)
    {
        if (!pWho || m_creature->getVictim())
            return;

        if (pWho->isTargetableForAttack() && pWho->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(pWho))
        {
            //no attack radius check - it attacks the first target that moves in his los
            pWho->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
            AttackStart(pWho);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() )
            return;

        if (m_uiCheck_Timer < uiDiff)
        {
            if (m_creature->IsWithinDistInMap(m_creature->getVictim(), 5))
            {
                m_creature->DealDamage(m_creature->getVictim(), 4000+rand()%2000, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_FROST, NULL, false);

                //despawn
                m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
            }
            m_uiCheck_Timer = 500;
        }else m_uiCheck_Timer -= uiDiff;

        //do NOT deal any melee damage to the target.
    }
};

CreatureAI* GetAI_boss_morogrim_tidewalker(Creature* pCreature)
{
    return new boss_morogrim_tidewalkerAI (pCreature);
}
CreatureAI* GetAI_mob_water_globule(Creature* pCreature)
{
    return new mob_water_globuleAI (pCreature);
}

void AddSC_boss_morogrim_tidewalker()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_morogrim_tidewalker";
    newscript->GetAI = &GetAI_boss_morogrim_tidewalker;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_water_globule";
    newscript->GetAI = &GetAI_mob_water_globule;
    newscript->RegisterSelf();
}
