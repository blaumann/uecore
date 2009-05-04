[code=cpp]/* Copyright © 2006,2007 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.* See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA* 02111-1307* USA
*/

/* ScriptData
SDName: Boss Mennu the Betrayer
SD%Complete: 80
SDComment: Need's Test
Author: Klappstuhl, Thyros
SDCategory: Coilfang Resevoir, Slave Pens
EndScriptData */

#include "precompiled.h"
#include "sc_creature.h"

enum Spells
{
	//Spells
    SPELL_POISON_BOLT_VOLLEY           = 38655,
    SPELL_UPPERCUT                     = 39069,
    SPELL_ACID_GEYSER                  = 38739,
    SPELL_CLEAVE                       = 40505
};

struct MANGOS_DLL_DECL boss_quagmirranAI : public ScriptedAI
{
    boss_quagmirranAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        Reset();
	}

    uint32 m_uiPoisonBoltVolley_Timer;
    uint32 m_uiUppercut_Timer;
    uint32 m_uiAcidGeyser_Timer;
    uint32 m_uiCleave_Timer;

    bool m_bInCombat;

    void Reset()
    {
        m_creature->RemoveAllAuras();
        m_creature->DeleteThreatList();
        m_creature->CombatStop();
        m_bInCombat = false;

        m_uiPoisonBoltVolley_Timer = 20000;
        m_uiUppercut_Timer = 20000;
        m_uiAcidGeyser_Timer = 25000;
        m_uiCleave_Timer = 10000;
    }

    void AttackStart(Unit *who)
    {
        if (!who)
            return;

        if (who->isTargetableForAttack() && who!= m_creature)
        {
        AttackStart(who);
        }
    }

    void MoveInLineOfSight(Unit *who)
    {
        if (!who || m_creature->getVictim())
            return;

        if (who->isTargetableForAttack() && who->isInAccessablePlaceFor(m_creature) && m_creature->IsHostileTo(who))
        {
            float attackRadius = m_creature->GetAttackDistance(who);
            if (m_creature->IsWithinDistInMap(who, attackRadius) && m_creature->GetDistanceZ(who) <= CREATURE_Z_ATTACK_RANGE && m_creature->IsWithinLOSInMap(who))
            {
                if(who->HasStealthAura())
                    who->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH) ;

        if (!m_creature->IsWithinDistInMap(who, ATTACK_DISTANCE))
                AttackStart(who);
            }
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget())
            return;
		
        if( m_creature->getVictim() && m_creature->isAlive())
        {
            if (m_uiPoisonBoltVolley_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_POISON_BOLT_VOLLEY);
                m_uiPoisonBoltVolley_Timer = 30000;
            }
            else m_uiPoisonBoltVolley_Timer -= diff;
			
            if (m_uiUppercut_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_UPPERCUT);
                m_uiUppercut_Timer = 25000;
            }
            else m_uiUppercut_Timer -= diff;
			
            if (m_uiCleave_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_CLEAVE);
                m_uiCleave_Timer = 10000;
            }
            else m_uiCleave_Timer -= diff;
			
            if (m_uiAcidGeyser_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_ACID_GEYSER);
                m_uiAcidGeyser_Timer = 50000;
            }
            else m_uiUppercut_Timer -= diff;
			
            DoMeleeAttackIfReady();
		}
	}
};

CreatureAI* GetAI_boss_quagmirran(Creature* pCreature)
{
    return new boss_quagmirranAI(pCreature);
}

void AddSC_boss_quagmirran()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_quagmirran";
    newscript->GetAI = &GetAI_boss_quagmirran;
    newscript->RegisterSelf();
}
/*
SQL (Script added, meele dps increased)
REPLACE INTO `creature_template` (`entry`, `modelid_m`, `modelid_f`, `name`, `subname`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction`, `npcflag`, `speed`, `rank`, `mindmg`, `maxdmg`, `attackpower`, `baseattacktime`, `rangeattacktime`, `flags`, `dynamicflags`, `size`, `family`, `bounding_radius`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `combat_reach`, `type`, `civilian`, `flag1`, `equipmodel1`, `equipmodel2`, `equipmodel3`, `equipinfo1`, `equipinfo2`, `equipinfo3`, `equipslot1`, `equipslot2`, `equipslot3`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `ScriptName`) VALUES (17942, 18224, 0, 'Quagmirran', '', 64, 64, 100000, 100000, 0, 0, 0, 168, 0, '1.48', 1, 700, 1220, 1679, 1347, 1584, 1, 0, 1, 0, 2, 0, 0, 0, 0, 1200, 1600, 100, 3, 5, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17942, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 3, 0, 'boss_quagmirran');
*/