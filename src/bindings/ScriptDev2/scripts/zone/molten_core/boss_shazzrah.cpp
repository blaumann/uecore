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
SDName: Boss_Shazzrah
SD%Complete: 100
SDComment:
SDCategory: Molten Core
EndScriptData */

#include "precompiled.h"
#include "def_molten_core.h"

#define SPELL_ARCANEEXPLOSION           19712
#define SPELL_SHAZZRAHCURSE             19713
#define SPELL_MAGICGROUNDING            19714
#define SPELL_COUNTERSPELL              19715
#define SPELL_GATEOFSHAZZRAH			23138

struct MANGOS_DLL_DECL boss_shazzrahAI : public ScriptedAI
{
    boss_shazzrahAI(Creature *pCreature) : ScriptedAI(pCreature)
	{
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;

    uint32 ArcaneExplosion_Timer;
    uint32 ShazzrahCurse_Timer;
    uint32 MagicGrounding_Timer;
    uint32 Countspell_Timer;
    uint32 GateOfShazzrah_Timer;

    void Reset()
    {
		pInstance->SetData(DATA_SHAZZRAH_PROGRESS, NOT_STARTED);

        ArcaneExplosion_Timer = 6000;      //These times are probably wrong
        ShazzrahCurse_Timer = 10000;
        MagicGrounding_Timer = 24000;
        Countspell_Timer = 15000; 
        GateOfShazzrah_Timer = 45000;
    }

    void Aggro(Unit *who)
    {
		pInstance->SetData(DATA_SHAZZRAH_PROGRESS, IN_PROGRESS);
    }

	void JustDied(Unit* Killer)
    {
		pInstance->SetData(DATA_SHAZZRAH_PROGRESS, DONE);

		if(pInstance->GetData(DATA_ALL_BOSSES_DEAD) == 1)
			m_creature->SummonCreature(12018,758.762,-1166.332,-119.181,3.54182,TEMPSUMMON_TIMED_DESPAWN,3600000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if (ArcaneExplosion_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_ARCANEEXPLOSION);

            ArcaneExplosion_Timer = 5000 + rand()%4000;
        }else ArcaneExplosion_Timer -= diff;

        if (ShazzrahCurse_Timer < diff)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0))
				DoCast(target,SPELL_SHAZZRAHCURSE);

            ShazzrahCurse_Timer = 25000 + rand()%5000;
        }else ShazzrahCurse_Timer -= diff;

        if (MagicGrounding_Timer < diff)
        {
            DoCast(m_creature,SPELL_MAGICGROUNDING);

            MagicGrounding_Timer = 35000;
        }else MagicGrounding_Timer -= diff;

        if (Countspell_Timer < diff)
        {
            DoCast(m_creature->getVictim(),SPELL_COUNTERSPELL);

            Countspell_Timer = 16000 + rand()%4000;
        }else Countspell_Timer -= diff;


        if (GateOfShazzrah_Timer < diff)
        {
			DoCast(m_creature,SPELL_GATEOFSHAZZRAH);
            
			Unit* target = SelectUnit(SELECT_TARGET_RANDOM,0);
            
			m_creature->NearTeleportTo(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), m_creature->GetOrientation());
			DoResetThreat();

            GateOfShazzrah_Timer = 45000;
        }else GateOfShazzrah_Timer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_shazzrah(Creature* pCreature)
{
    return new boss_shazzrahAI(pCreature);
}

void AddSC_boss_shazzrah()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_shazzrah";
    newscript->GetAI = &GetAI_boss_shazzrah;
    newscript->RegisterSelf();
}
