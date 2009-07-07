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
SDName: Boss_Golemagg
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

enum
{
	EMOTE_GOLEMAGG_HELP		=	-1409002,

	SPELL_MAGMA_SPLASH_AURA	=	13879,
	SPELL_PYRO_BLAST		=	20228,
	SPELL_EARTH_QUAKE		=	19798,

	//CoreRager Spells
	SPELL_MANGLE			=	19820,
	SPELL_GOLEMAGG_TRUST	=	20553	//if golemagg is in rage 
};

struct MANGOS_DLL_DECL boss_golemaggAI : public ScriptedAI
{
    boss_golemaggAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }
    ScriptedInstance* m_pInstance;

    uint32 Pyroblast_Timer;
    uint32 uiEarthQuake_Timer;

	bool bHasPerformedAggro;
	bool bHasMagmaSplashAura;

    void Reset()
    {
		if(m_pInstance)
		{
			m_pInstance->SetData(DATA_GOLEMAGG_PROGRESS, NOT_STARTED);

			Pyroblast_Timer = 7000;      //These times are probably wrong
			uiEarthQuake_Timer = 3000;

			bHasPerformedAggro = false;
			if(bHasMagmaSplashAura)
				m_creature->RemoveAurasDueToSpell(SPELL_MAGMA_SPLASH_AURA);
				
			bHasMagmaSplashAura = false;
		}
	}

    void Aggro(Unit* pWho)
    {	if(m_pInstance)
			m_pInstance->SetData(DATA_GOLEMAGG_PROGRESS, IN_PROGRESS);
    }

    void JustDied(Unit* pKiller)
    {
		if(m_pInstance)
		{
			m_pInstance->SetData(DATA_GOLEMAGG_PROGRESS, DONE);

			if(m_pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
				m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
		}
	}

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() || !m_pInstance)
            return;

		if(!bHasMagmaSplashAura)
		{
			DoCast(m_creature,SPELL_MAGMA_SPLASH_AURA);
			bHasMagmaSplashAura = true;
		}

        if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 11)
        {
			if(!bHasPerformedAggro)
			{
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 90);
				bHasPerformedAggro = true;
			}

            if (uiEarthQuake_Timer < diff)
            {
                DoCast(m_creature,SPELL_EARTH_QUAKE);

                uiEarthQuake_Timer = 3000;
            }
			else 
				uiEarthQuake_Timer -= diff;
        }

        if (Pyroblast_Timer < diff)
        {
            if (Unit* pTarget = SelectUnit(SELECT_TARGET_RANDOM,0))
                DoCast(pTarget,SPELL_PYRO_BLAST);

            Pyroblast_Timer = 7000;
        }
		else 
			Pyroblast_Timer -= diff;

        DoMeleeAttackIfReady();
    }
}; 

struct MANGOS_DLL_DECL mob_core_ragerAI : public ScriptedAI
{
    mob_core_ragerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
		Reset();
    }

    ScriptedInstance* m_pInstance;

	Unit* pGolemagg;

    uint32 uiMangle_Timer;
    uint32 uiCheck_Timer;

	bool bHasPerformedAggro;

    void Reset()
    {
		if(m_pInstance)
		{
			pGolemagg = Unit::GetUnit((*m_creature), m_pInstance->GetData64(DATA_GOLEMAGG));

			uiMangle_Timer = 7000;      //These times are probably wrong 
			uiCheck_Timer = 1000;

			bHasPerformedAggro = false;
		}
    }


    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim() || !m_pInstance)
            return;

		if(m_creature->IsWithinDistInMap(pGolemagg, 20.0f) && !m_creature->HasAura(SPELL_GOLEMAGG_TRUST))
			DoCast(m_creature, SPELL_GOLEMAGG_TRUST);

        if (uiMangle_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_MANGLE);

            uiMangle_Timer = 10000;
        }
		else 
			uiMangle_Timer -= diff;

        if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 50)
        {
			m_creature->SetHealth(m_creature->GetMaxHealth());
            DoScriptText(EMOTE_GOLEMAGG_HELP, m_creature);
        }

		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() < 11)
        {
			if(!bHasPerformedAggro)
			{
				m_creature->getThreatManager().modifyThreatPercent(m_creature->getVictim(), 90);
				bHasPerformedAggro = true;
			}
		}

        if (uiCheck_Timer < diff)
        {
            if (m_pInstance && (!pGolemagg || !pGolemagg->isAlive()))
				m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, true);

            uiCheck_Timer = 1000;
        }
		else 
			uiCheck_Timer -= diff;

        DoMeleeAttackIfReady();
	}
};

CreatureAI* GetAI_boss_golemagg(Creature* pCreature)
{
    return new boss_golemaggAI(pCreature);
}

CreatureAI* GetAI_mob_core_rager(Creature* pCreature)
{
    return new mob_core_ragerAI(pCreature);
}

void AddSC_boss_golemagg()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "boss_golemagg";
    newscript->GetAI = &GetAI_boss_golemagg;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_core_rager";
    newscript->GetAI = &GetAI_mob_core_rager;
    newscript->RegisterSelf();
}