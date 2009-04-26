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
SDName: Boss_Mograine_And_Whitemane
SD%Complete: 75
SDComment: Event not implemented
SDCategory: Scarlet Monastery
EndScriptData */

#include "precompiled.h"
#include "def_scarlet_monastery.h"

//Mograine says
#define SAY_MO_AGGRO                -1189005
#define SAY_MO_KILL                 -1189006
#define SAY_MO_RESSURECTED          -1189007

//Whitemane says
#define SAY_WH_INTRO                -1189008
#define SAY_WH_KILL                 -1189009
#define SAY_WH_RESSURECT            -1189010

//Mograine Spells
#define SPELL_CRUSADERSTRIKE        14518
#define SPELL_HAMMEROFJUSTICE       5589
#define SPELL_LAYONHANDS            9257
#define SPELL_RETRIBUTIONAURA       8990

//Whitemanes Spells
#define SPELL_DEEPSLEEP                 9256
#define SPELL_SCARLETRESURRECTION       9232
#define SPELL_DOMINATEMIND              14515
#define SPELL_HOLYSMITE                 9481
#define SPELL_HEAL                      12039
#define SPELL_POWERWORDSHIELD           22187

#define UNIT_FLAG_NON_SELECTABLE    0x02000000

struct MANGOS_DLL_DECL boss_scarlet_commander_mograineAI : public ScriptedAI
{
    boss_scarlet_commander_mograineAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = (ScriptedInstance*)m_creature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;

    uint32 CrusaderStrike_Timer;
    uint32 HammerOfJustice_Timer;
	bool HasDied;
	bool Heal;

    void Reset()
    {
        CrusaderStrike_Timer = 10000;
        HammerOfJustice_Timer = 10000;
		HasDied = false;
		Heal = false;

        //Incase wipe during phase that mograine fake death
		m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
		m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		m_creature->SetStandState(UNIT_STAND_STATE_STAND);
		CloseDoors(true);

		if(pInstance)
			if(m_creature->isAlive())
				pInstance->SetData(TYPE_MOGRAINE_AND_WHITE_EVENT,NOT_STARTED);
    }

    void Aggro(Unit *who)
    {
        DoScriptText(SAY_MO_AGGRO, m_creature);
        DoCast(m_creature,SPELL_RETRIBUTIONAURA);
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_MO_KILL, m_creature);
    }

	void DamageTaken(Unit *done_by, uint32 &damage)
	{
        //On first death, fake death and open door
		if (done_by->GetTypeId() == TYPEID_PLAYER)
			if(damage >= m_creature->GetHealth() && HasDied == false)
			{
				damage = 0;
                m_creature->SetHealth(0);
                m_creature->StopMoving();
                m_creature->InterruptNonMeleeSpells(false);
                m_creature->ClearComboPointHolders();
                m_creature->RemoveAllAurasOnDeath();
                m_creature->ClearAllReactives();
				m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				m_creature->SetStandState(UNIT_STAND_STATE_DEAD);
				m_creature->GetMotionMaster()->Clear();
				m_creature->GetMotionMaster()->MoveIdle();
				HasDied = true;
				CloseDoors(false);

                //Initialize Whitemane to begin walking towards main room
                if (Unit* Whitemane = Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_WHITEMANE)))
                    Whitemane->GetMotionMaster()->MovePoint(1,1163.113370,1398.856812,32.527786);

                pInstance->SetData(TYPE_MOGRAINE_AND_WHITE_EVENT, IN_PROGRESS);
			}				        
	}

    void SpellHit(Unit *who, const SpellEntry *Spell)
    {
        //When hit with ressurection say text
        if (Spell->Id == SPELL_SCARLETRESURRECTION)
        { 
            DoScriptText(SAY_MO_RESSURECTED, m_creature);

            if (pInstance)
                pInstance->SetData(TYPE_MOGRAINE_AND_WHITE_EVENT, SPECIAL);            
        }
    }

    //Function to handle doors
	void CloseDoors(bool close)
	{
		if (GameObject* Doors = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_DOOR_WHITEMANE)))
		{
			if (close) Doors->SetGoState(GO_STATE_ACTIVE);                // Closed
            else       Doors->SetGoState(GO_STATE_ACTIVE);                // Open
		}
	}

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;		

		if(HasDied == true && (pInstance->GetData(TYPE_MOGRAINE_AND_WHITE_EVENT) == SPECIAL) && Heal == false)
		{
            //On ressurection, stop fake death and heal whitemane and resume fight
			Unit* Whitemane = Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_WHITEMANE));
			m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_SELECTABLE);
			m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
			m_creature->SetStandState(UNIT_STAND_STATE_STAND);
			DoCast(Whitemane, SPELL_LAYONHANDS);
            m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim(),0,0);
			CrusaderStrike_Timer = 10000;
			HammerOfJustice_Timer = 10000;
			Heal = true;
		}

        //This if-check to make sure mograine does not attack while fake death
        if (pInstance->GetData(TYPE_MOGRAINE_AND_WHITE_EVENT) != IN_PROGRESS)
        {

            //CrusaderStrike_Timer
            if (CrusaderStrike_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_CRUSADERSTRIKE);
                CrusaderStrike_Timer = 10000;
            }else CrusaderStrike_Timer -= diff;
    
            //HammerOfJustice_Timer
            if (HammerOfJustice_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_HAMMEROFJUSTICE);
                HammerOfJustice_Timer = 60000;
            }else HammerOfJustice_Timer -= diff;
    
            DoMeleeAttackIfReady();
        }
    }
};

struct MANGOS_DLL_DECL boss_high_inquisitor_whitemaneAI : public ScriptedAI
{
    boss_high_inquisitor_whitemaneAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = (ScriptedInstance*)m_creature->GetInstanceData();
        Reset();
    }

    ScriptedInstance* pInstance;

    uint32 Heal_Timer;
    uint32 PowerWordShield_Timer;
    uint32 HolySmite_Timer;
	uint32 Wait_Timer;
	bool HasRezzed;
	bool HasRezzedTrigger;

    void Reset()
    {
		Wait_Timer = 7000;
        Heal_Timer = 10000;
        PowerWordShield_Timer = 15000;
        HolySmite_Timer = 6000;
		HasRezzed = false;
		HasRezzedTrigger = false;

        if(pInstance)
			if(m_creature->isAlive())
				pInstance->SetData(TYPE_MOGRAINE_AND_WHITE_EVENT,NOT_STARTED);
    }

    void Aggro(Unit *who)
    {
        DoScriptText(SAY_WH_INTRO, m_creature);
    }

    void KilledUnit(Unit *victim)
    {
        DoScriptText(SAY_WH_KILL, m_creature);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;		

		if(HasRezzedTrigger == true)
		{
            //When casting resuruction make sure to delay so on rez when reinstate battle deepsleep runs out
			if (Wait_Timer < diff && !m_creature->IsNonMeleeSpellCasted(false))
			{
                Unit* Mograine = Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_MOGRAINE));
				DoCast(Mograine, SPELL_SCARLETRESURRECTION);
				DoScriptText(SAY_WH_RESSURECT, m_creature); 
				HasRezzedTrigger = false;

			}else Wait_Timer -= diff;
		}

        //Cast Deep sleep when health is less than 50%
		if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <=50 && HasRezzed == false && !m_creature->IsNonMeleeSpellCasted(false))
		{
            m_creature->InterruptNonMeleeSpells(false);
			DoCast(m_creature->getVictim(), SPELL_DEEPSLEEP, true);
			HasRezzed = true;
			HasRezzedTrigger = true;
		}

        //Do not cast spells our attack when party is in deep sleep
		if(HasRezzedTrigger == false)
		{

            //If we are <75% hp cast healing spells at self and Mograine
            if (m_creature->GetHealth()*100 / m_creature->GetMaxHealth() <= 75)
            {
                if (Heal_Timer < diff)
                {
                    DoCast(m_creature,SPELL_HEAL);
                    Heal_Timer = 13000;
                }else Heal_Timer -= diff;
            }
    
            //PowerWordShield_Timer
            if (PowerWordShield_Timer < diff)
            {
                DoCast(m_creature,SPELL_POWERWORDSHIELD);
                PowerWordShield_Timer = 15000;
            }else PowerWordShield_Timer -= diff;
    
            //HolySmite_Timer
            if (HolySmite_Timer < diff)
            {
                DoCast(m_creature->getVictim(),SPELL_HOLYSMITE);
                HolySmite_Timer = 6000;
            }else HolySmite_Timer -= diff;
    
            DoMeleeAttackIfReady();
        }
    }
};

CreatureAI* GetAI_boss_scarlet_commander_mograine(Creature *_Creature)
{
    return new boss_scarlet_commander_mograineAI (_Creature);
}

CreatureAI* GetAI_boss_high_inquisitor_whitemane(Creature *_Creature)
{
    return new boss_high_inquisitor_whitemaneAI (_Creature);
}

void AddSC_boss_mograine_and_whitemane()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_scarlet_commander_mograine";
    newscript->GetAI = &GetAI_boss_scarlet_commander_mograine;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "boss_high_inquisitor_whitemane";
    newscript->GetAI = &GetAI_boss_high_inquisitor_whitemane;
    newscript->RegisterSelf();
}
