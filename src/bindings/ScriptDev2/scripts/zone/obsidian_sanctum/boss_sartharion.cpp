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

/* Script Data Start
SDName: Boss Sartharion
SDAuthor: ckegg
SD%Complete: 90%
SDComment: Flame wave need to be implemented
SDCategory: Obsidian Sanctum
Script Data End */

#include "precompiled.h"
#include "def_obsidian_sanctum.h"

//Sartharion Spells
#define SPELL_BERSERK                                 61632 // Increases the caster's attack speed by 150% and all damage it deals by 500% for 5 min.
#define SPELL_CLEAVE                                  56909 // Inflicts 35% weapon damage to an enemy and its nearest allies, affecting up to 10 targets.
#define SPELL_FLAME_BREATH_N                          56908 // Inflicts 8750 to 11250 Fire damage to enemies in a cone in front of the caster.
#define SPELL_FLAME_BREATH_H                          58956 // Inflicts 10938 to 14062 Fire damage to enemies in a cone in front of the caster.
#define SPELL_TAIL_LASH_N                             56910 // A sweeping tail strike hits all enemies behind the caster, inflicting 3063 to 3937 damage and stunning them for 2 sec.
#define SPELL_TAIL_LASH_H                             58957 // A sweeping tail strike hits all enemies behind the caster, inflicting 4375 to 5625 damage and stunning them for 2 sec.
#define SPELL_WILL_OF_SARTHARION                      61254 // Sartharion's presence bolsters the resolve of the Twilight Drakes, increasing their total health by 25%. This effect also increases Sartharion's health by 25%.
#define SPELL_LAVA_STRIKE                             57571
#define SPELL_TWILIGHT_REVENGE                        60639

//Sartharion Yell
#define SAY_SARTHARION_AGGRO                         -1615016
#define SAY_SARTHARION_BERSERK                       -1615017
#define SAY_SARTHARION_BREATH                        -1615018
#define SAY_SARTHARION_CALL_SHADRON                  -1615019
#define SAY_SARTHARION_CALL_TENEBRON                 -1615020
#define SAY_SARTHARION_CALL_VESPERON                 -1615021
#define SAY_SARTHARION_DEATH                         -1615022
#define SAY_SARTHARION_SPECIAL_1                     -1615023
#define SAY_SARTHARION_SPECIAL_2                     -1615024
#define SAY_SARTHARION_SPECIAL_3                     -1615025
#define SAY_SARTHARION_SPECIAL_4                     -1615026
#define SAY_SARTHARION_SLAY_1                        -1615027
#define SAY_SARTHARION_SLAY_2                        -1615028
#define SAY_SARTHARION_SLAY_3                        -1615029

#define POS_SARTHARION_X                              3246.57
#define POS_SARTHARION_Y                              551.263

//Miniboses (Vesperon, Shadron, Tenebron)
#define SPELL_SHADOW_BREATH_H                         59126 //Inflicts 8788 to 10212 Fire damage to enemies in a cone in front of the caster.
#define SPELL_SHADOW_BREATH_N                         57570 //Inflicts 6938 to 8062 Fire damage to enemies in a cone in front of the caster.
//TAIL LASH the same as Sartharion's
#define SPELL_SHADOW_FISSURE_H                        59127 //Deals 9488 to 13512 Shadow damage to any enemy within the Shadow fissure after 5 sec.
#define SPELL_SHADOW_FISSURE_N                        57579 //Deals 6188 to 8812 Shadow damage to any enemy within the Shadow fissure after 5 sec.

//Mini bosses common spells
#define SPELL_TWILIGHT_PHASE                          57620 // enter realm
#define SPELL_TWILIGHT_RESIDUE                        61885 // remove from realm
#define SPELL_TWILIGHT_SHIFT                          57874

//Vesperon
#define MINIBOSS_VESPERON                             30449 //npc 30449  //In portal is a disciple, when disciple killed remove Power_of_vesperon, portal spawns multiple times
#define SPELL_POWER_OF_VESPERON                       61251 //Vesperon's presence decreases the maximum health of all enemies by 25%.
#define SPELL_TWILIGHT_TORMENT_1                      57988
#define ACOLYTE_OF_VESPERON                           31219 //Acolyte of Vesperon
#define SPELL_TWILIGHT_TORMENT_4                      58835

//Shadron
#define MINIBOSS_SHADRON                              30451 //npc 30451  //In portal is a disciple, when disciple killed remove Power_of_vesperon, portal spawns multiple times
#define SPELL_POWER_OF_SHADRON                        58105 //Shadron's presence increases Fire damage taken by all enemies by 100%.                     
#define SPELL_TWILIGHT_TORMENT_2                      57835
#define SPELL_TWILIGHT_TORMENT_3                      58766 // on Sartharion
#define ACOLYTE_OF_SHADRON                            31218 //Acolyte of Shadron

//Tenebron
#define MINIBOSS_TENEBRON                             30452 //npc 30452 //in the portal spawns 6 eggs, if not killed in time (approx. 20s)  they will hatch,  whelps can cast 60708
#define SPELL_POWER_OF_TENEBRON                       61248 //Tenebron's presence increases Shadow damage taken by all enemies by 100%.
//Tenebron, dummy spell
#define SPELL_SUMMON_TWILIGHT_WHELP                   58035 // doesn't work, will spawn 30890
#define SPELL_SUMMON_SARTHARION_TWILIGHT_WHELP        58826 // doesn't work, will spawn 31214
#define SPELL_HATCH_EGGS_H                            58542
#define SPELL_HATCH_EGGS_N                            58793

//Whelps
#define TWILIGHT_WHELP                                30890 //mob 30890
#define SHARTHARION_TWILIGHT_WHELP                    31214 //mob 31214
#define SPELL_FADE_ARMOR                              60708 //Reduces the armor of an enemy by 1500 for 15s
#define FLAME_TSUNAMI                                 30616
#define LAVA_BLAZE                                    30643

/*######
## Boss Sartharion
######*/
struct MANGOS_DLL_DECL boss_sartharionAI : public ScriptedAI
{
    boss_sartharionAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Heroic = pCreature->GetMap()->IsHeroic();
        Reset();
    }

    ScriptedInstance *pInstance;
    bool Heroic;

    bool berserk;
    uint32 enrage_timer;
    uint32 tenebron_timer;
    uint32 shadron_timer;
    uint32 vesperon_timer;
    uint32 flame_breath_timer;
    uint32 TailSweepTimer;
    uint32 CleaveTimer;
    uint32 LavaSrike_timer;
    bool called_tenebron;
    bool called_shadron;
    bool called_vesperon;

    void Reset() 
    {
        berserk = false;
        enrage_timer = 900000;
    	tenebron_timer = 32000;
    	shadron_timer = 75000;
    	vesperon_timer = 122000;
    	flame_breath_timer = 30000;
    	TailSweepTimer = 20000;
    	CleaveTimer = 7000;
    	LavaSrike_timer = 5000;
    	called_tenebron = false;
    	called_shadron = false;
    	called_vesperon = false;

		if(pInstance)
        {
        	if(m_creature->isAlive())
        		pInstance->SetData(DATA_SARTHARION, NOT_STARTED);

            Unit* Temp1 =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_TENEBRON));
            if (Temp1)
                if (Temp1->isDead())
                    ((Creature*)Temp1)->Respawn();

            Unit* Temp2 =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SHADRON));
            if (Temp2)
                if (Temp2->isDead())
                    ((Creature*)Temp2)->Respawn();

            Unit* Temp3 =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_VESPERON));
            if (Temp3)
                if (Temp3->isDead())
                    ((Creature*)Temp3)->Respawn();

            if (GameObject* TwilightPortal = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_GO_TWILIGHT_PORTAL)))
                if (TwilightPortal->GetPhaseMask())
                    TwilightPortal->SetPhaseMask(0, true);
        }

        if (m_creature->HasAura(SPELL_TWILIGHT_REVENGE,0))
            m_creature->RemoveAurasDueToSpell(SPELL_TWILIGHT_REVENGE);

        if (m_creature->HasAura(SPELL_TWILIGHT_TORMENT_3,0))
            m_creature->RemoveAurasDueToSpell(SPELL_TWILIGHT_TORMENT_3);
    }

    void Aggro(Unit* who) 
	{
		DoScriptText(SAY_SARTHARION_AGGRO,m_creature);
		DoZoneInCombat();
        if(pInstance)
            pInstance->SetData(DATA_SARTHARION, IN_PROGRESS);
	}

    void AttackStart(Unit* who)
    {
        if (!who)
            return;

        if (who == m_creature || who->GetTypeId() != TYPEID_PLAYER)
            return;

        if (m_creature->Attack(who, true))
        {
            m_creature->AddThreat(who, 0.0f);
            m_creature->SetInCombatWith(who);
            who->SetInCombatWith(m_creature);
            DoStartMovement(who);
        }
    }

    //void MoveInLineOfSight(Unit* who) {}
    void UpdateAI(const uint32 diff) 
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        if ((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) <= 10)
        {
            if(!berserk){
            	DoScriptText(SAY_SARTHARION_BERSERK,m_creature);
                DoCast(m_creature,SPELL_BERSERK);

                berserk = true;
            }
        }

        // enrage
        if (enrage_timer)
            if(enrage_timer < diff)
            {
                DoCast(m_creature,SPELL_WILL_OF_SARTHARION);

                Unit* Temp =  NULL;
                Temp = Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_TENEBRON));
                if (Temp && Temp->isAlive())
                    Temp->CastSpell(Temp,SPELL_WILL_OF_SARTHARION,true);

                Temp = Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SHADRON));
                if (Temp && Temp->isAlive())
                    Temp->CastSpell(Temp,SPELL_WILL_OF_SARTHARION,true);

                Temp = Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_VESPERON));
                if (Temp && Temp->isAlive())
                    Temp->CastSpell(Temp,SPELL_WILL_OF_SARTHARION,true);

                flame_breath_timer = 0;
            }else enrage_timer -=diff;

        // flame breath
        if(flame_breath_timer < diff)
        {
        	DoScriptText(SAY_SARTHARION_BREATH, m_creature);
            DoCast(m_creature->getVictim(), Heroic ? SPELL_FLAME_BREATH_H : SPELL_FLAME_BREATH_N);
            flame_breath_timer = 25000 + rand()%10000;
        }else flame_breath_timer -=diff;

        // Tail Sweep
        if (TailSweepTimer < diff)
        {
            Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0);
            if (target && !m_creature->HasInArc(M_PI, target))
                DoCast(target, SPELL_TAIL_LASH_N);

            TailSweepTimer = 15000 + rand()%5000;
        }else TailSweepTimer -= diff;

        // Cleave
        if (CleaveTimer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_CLEAVE);
            CleaveTimer = 7000 + rand()%3000;
        }else CleaveTimer -= diff;

        // Lavas Srike
        if (LavaSrike_timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_LAVA_STRIKE);
            switch(rand()%15)
            {
                case 0: DoScriptText(SAY_SARTHARION_SPECIAL_1, m_creature);break;
                case 1: DoScriptText(SAY_SARTHARION_SPECIAL_2, m_creature);break;
                case 2: DoScriptText(SAY_SARTHARION_SPECIAL_3, m_creature);break;
            }
            LavaSrike_timer = 5000 + rand()%15000;
        }else LavaSrike_timer -= diff;

        // call tenebron
        if(tenebron_timer < diff)
        {
	        if(pInstance)
	        {
	            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_TENEBRON));
	            if (Temp && Temp->isAlive() && !(Temp->getVictim()))
	            {
	            	if (!called_tenebron) {
						DoScriptText(SAY_SARTHARION_CALL_TENEBRON, m_creature);
						called_tenebron = true;
					}

                    ((Creature*)Temp)->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
				}
	        }
	        tenebron_timer = 1000;
        }else tenebron_timer -=diff;

        // call shadron
        if(shadron_timer < diff)
        {
	        if(pInstance)
	        {
	            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_SHADRON));
	            if (Temp && Temp->isAlive() && !(Temp->getVictim()))
	            {
	            	if (!called_shadron) {
						DoScriptText(SAY_SARTHARION_CALL_SHADRON, m_creature);
						called_shadron = true;
					}

                    ((Creature*)Temp)->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
				}
	        }
	        shadron_timer = 1000;
        }else shadron_timer -=diff;

        // call vesperon
        if(vesperon_timer < diff)
        {
	        if(pInstance)
	        {
	            Unit* Temp =  Unit::GetUnit((*m_creature),pInstance->GetData64(DATA_VESPERON));
	            if (Temp && Temp->isAlive() && !(Temp->getVictim()))
	            {
	            	if (!called_vesperon) {
						DoScriptText(SAY_SARTHARION_CALL_VESPERON, m_creature);
						called_vesperon = true;
					}

                    ((Creature*)Temp)->AI()->AttackStart(SelectUnit(SELECT_TARGET_RANDOM, 0));
				}
	        }
	        vesperon_timer = 1000;
        }else vesperon_timer -=diff;

        // reset if out of his platform
        if (m_creature->GetDistance2d(POS_SARTHARION_X, POS_SARTHARION_Y) > 55)
            EnterEvadeMode();

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)
	{
		DoScriptText(SAY_SARTHARION_DEATH,m_creature);
        if(pInstance)
            pInstance->SetData(DATA_SARTHARION, DONE);
	}

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%3)
        {
            case 0: DoScriptText(SAY_SARTHARION_SLAY_1, m_creature);break;
            case 1: DoScriptText(SAY_SARTHARION_SLAY_2, m_creature);break;
            case 2: DoScriptText(SAY_SARTHARION_SLAY_3, m_creature);break;
        }
    }
};

/*######
## Mob Tenebron
######*/

//Yell
#define SAY_TENEBRON_AGGRO                       -1615008
#define SAY_TENEBRON_SLAY_1                      -1615009
#define SAY_TENEBRON_SLAY_2                      -1615010
#define SAY_TENEBRON_DEATH                       -1615011
#define SAY_TENEBRON_BREATH                      -1615012
#define SAY_TENEBRON_RESPOND                     -1615013
#define SAY_TENEBRON_SPECIAL_1                   -1615014
#define SAY_TENEBRON_SPECIAL_2                   -1615015

struct MANGOS_DLL_DECL mob_tenebronAI : public ScriptedAI
{
    mob_tenebronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Heroic = pCreature->GetMap()->IsHeroic();
    	Reset();
    }

    ScriptedInstance *pInstance;
    bool Heroic;

    uint32 shadow_breath_timer;
    uint32 shadow_fissure_timer;
    uint32 powerbuff_timer;
    uint32 hatch_egg_timer;

    void Reset() {
    	shadow_breath_timer = 20000;
    	shadow_fissure_timer = 5000;
    	powerbuff_timer = 10000;
    	hatch_egg_timer = 30000;
    }

    void Aggro(Unit* who) 
	{
		DoScriptText(SAY_TENEBRON_AGGRO,m_creature);
	}

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        // shadow fissure
        if(shadow_fissure_timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), Heroic ? SPELL_SHADOW_FISSURE_H : SPELL_SHADOW_FISSURE_N);
            shadow_fissure_timer = 15000 + rand()%5000;
        }else shadow_fissure_timer -=diff;

        // shadow breath
        if(shadow_breath_timer < diff)
        {
        	DoScriptText(SAY_TENEBRON_BREATH, m_creature);
            DoCast(m_creature->getVictim(), Heroic ? SPELL_SHADOW_BREATH_H : SPELL_SHADOW_BREATH_N);
            shadow_breath_timer = 20000 + rand()%5000;
        }else shadow_breath_timer -=diff;

        // power buff
        if(powerbuff_timer < diff)
        {
        	if (pInstance)
        	{
                Map *map = m_creature->GetMap();
                if (map->IsDungeon())
                {
                    Map::PlayerList const &PlayerList = map->GetPlayers();

                    if (PlayerList.isEmpty())
                        return;

                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    {
                        if (i->getSource()->isAlive() && !i->getSource()->HasAura(SPELL_POWER_OF_TENEBRON,0))
                        	DoCast(i->getSource(), SPELL_POWER_OF_TENEBRON);
                    }
                }
            }
            // check every one second
            powerbuff_timer = 1000;
        }else powerbuff_timer -=diff;

        // hatch egg
        if(hatch_egg_timer < diff)
        {
            // DoCast(m_creature, Heroic ? SPELL_HATCH_EGGS_H : SPELL_HATCH_EGGS_N);

            // spell doesn't work. workaround, spawn eggs instead
            float x, y, z;
            m_creature->GetPosition(x,y,z);

            // 6 eggs. now spawn only 3
            for(uint8 i = 0; i<3; i++)
                m_creature->SummonCreature(30882, x+rand()%10, y+rand()%10, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 25000);

			hatch_egg_timer = 60000 + rand()%10000;
        }else hatch_egg_timer -=diff;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)
	{
		DoScriptText(SAY_TENEBRON_DEATH,m_creature);

        if (pInstance)
        {
            // Twilight Revenge
            if (Creature* pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SARTHARION))))
            	pSartharion->CastSpell(pSartharion,SPELL_TWILIGHT_REVENGE,true);

            // cast Twilight Residue
            Map *map = m_creature->GetMap();
            if (map->IsDungeon())
            {
                Map::PlayerList const &PlayerList = map->GetPlayers();

                if (PlayerList.isEmpty())
                    return;

                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_POWER_OF_TENEBRON,0))
                        i->getSource()->RemoveAurasDueToSpell(SPELL_POWER_OF_TENEBRON);
                }
            }
	    }
	}

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%2)
        {
            case 0: DoScriptText(SAY_TENEBRON_SLAY_1, m_creature);break;
            case 1: DoScriptText(SAY_TENEBRON_SLAY_2, m_creature);break;
        }
    }
};

/*######
## Mob Shadron
######*/

//Shadron Yell
#define SAY_SHADRON_AGGRO                       -1615000
#define SAY_SHADRON_SLAY_1                      -1615001
#define SAY_SHADRON_SLAY_2                      -1615002
#define SAY_SHADRON_DEATH                       -1615003
#define SAY_SHADRON_BREATH                      -1615004
#define SAY_SHADRON_RESPOND                     -1615005
#define SAY_SHADRON_SPECIAL_1                   -1615006
#define SAY_SHADRON_SPECIAL_2                   -1615007

struct MANGOS_DLL_DECL mob_shadronAI : public ScriptedAI
{
    mob_shadronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Heroic = pCreature->GetMap()->IsHeroic();
        Reset();
    }

    ScriptedInstance *pInstance;
    bool Heroic;

    uint32 shadow_breath_timer;
    uint32 shadow_fissure_timer;
    uint32 powerbuff_timer;
    uint32 acolyte_shadron_timer; // should be 30s

    void Reset(){
    	shadow_breath_timer = 20000;
    	shadow_fissure_timer = 5000;
    	powerbuff_timer = 10000;
    	acolyte_shadron_timer = 60000;

        if (m_creature->HasAura(SPELL_TWILIGHT_TORMENT_2,0))
            m_creature->RemoveAurasDueToSpell(SPELL_TWILIGHT_TORMENT_2);
    }

    void Aggro(Unit* who) 
	{
		DoScriptText(SAY_SHADRON_AGGRO,m_creature);
	}

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        // shadow fissure
        if(shadow_fissure_timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), Heroic ? SPELL_SHADOW_FISSURE_H : SPELL_SHADOW_FISSURE_N);
            shadow_fissure_timer = 15000 + rand()%5000;
        }else shadow_fissure_timer -=diff;

        // shadow breath
        if(shadow_breath_timer < diff)
        {
        	DoScriptText(SAY_SHADRON_BREATH, m_creature);
            DoCast(m_creature->getVictim(), Heroic ? SPELL_SHADOW_BREATH_H : SPELL_SHADOW_BREATH_N);
            shadow_breath_timer = 20000 + rand()%5000;
        }else shadow_breath_timer -=diff;

        // power buff
        if(powerbuff_timer < diff)
        {
        	if (pInstance)
        	{
                Map *map = m_creature->GetMap();
                if (map->IsDungeon())
                {
                    Map::PlayerList const &PlayerList = map->GetPlayers();

                    if (PlayerList.isEmpty())
                        return;

                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    {
                        if (i->getSource()->isAlive() && !i->getSource()->HasAura(SPELL_POWER_OF_SHADRON,0))
                        	DoCast(i->getSource(), SPELL_POWER_OF_SHADRON);
                    }
                }
            }
            // check every one second
            powerbuff_timer = 1000;
        }else powerbuff_timer -=diff;

        // Acolyte of Shadron
        if(acolyte_shadron_timer < diff)
        {
            float x, y, z;
            m_creature->GetPosition(x,y,z);
            Creature* pAcolyte = m_creature->SummonCreature(ACOLYTE_OF_SHADRON, x+rand()%10, y+rand()%10, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 360000);

			acolyte_shadron_timer = 60000 + rand()%10000;
        }else acolyte_shadron_timer -=diff;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)  
	{
		DoScriptText(SAY_SHADRON_DEATH,m_creature);

        if (pInstance)
        {
            // Twilight Revenge
            if (Creature* pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SARTHARION))))
            	pSartharion->CastSpell(pSartharion,SPELL_TWILIGHT_REVENGE,true);

            // cast Twilight Residue
            Map *map = m_creature->GetMap();
            if (map->IsDungeon())
            {
                Map::PlayerList const &PlayerList = map->GetPlayers();

                if (PlayerList.isEmpty())
                    return;

                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_POWER_OF_SHADRON,0))
                        i->getSource()->RemoveAurasDueToSpell(SPELL_POWER_OF_SHADRON);
                }
            }
        }
	}

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%2)
        {
            case 0: DoScriptText(SAY_SHADRON_SLAY_1, m_creature);break;
            case 1: DoScriptText(SAY_SHADRON_SLAY_2, m_creature);break;
        }
    }
};

/*######
## Mob Vesperon
######*/

//Vesperon Yell
#define SAY_VESPERON_AGGRO                       -1615030
#define SAY_VESPERON_SLAY_1                      -1615031
#define SAY_VESPERON_SLAY_2                      -1615032
#define SAY_VESPERON_DEATH                       -1615033
#define SAY_VESPERON_BREATH                      -1615034
#define SAY_VESPERON_RESPOND                     -1615035
#define SAY_VESPERON_SPECIAL_1                   -1615036
#define SAY_VESPERON_SPECIAL_2                   -1615037

struct MANGOS_DLL_DECL mob_vesperonAI : public ScriptedAI
{
    mob_vesperonAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Heroic = pCreature->GetMap()->IsHeroic();
        Reset();
    }

    ScriptedInstance *pInstance;
    bool Heroic;

    uint32 shadow_breath_timer;
    uint32 shadow_fissure_timer;
    uint32 acolyte_vesperon;
    uint32 powerbuff_timer; // should be 30s

    void Reset() {
    	shadow_breath_timer = 20000;
    	shadow_fissure_timer = 5000;
    	powerbuff_timer = 10000;
    	acolyte_vesperon = 60000;
    }

    void Aggro(Unit* who) 
	{
		DoScriptText(SAY_VESPERON_AGGRO,m_creature);
	}

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

        // shadow fissure
        if(shadow_fissure_timer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), Heroic ? SPELL_SHADOW_FISSURE_H : SPELL_SHADOW_FISSURE_N);
            shadow_fissure_timer = 15000 + rand()%5000;
        }else shadow_fissure_timer -=diff;

        // shadow breath
        if(shadow_breath_timer < diff)
        {
        	DoScriptText(SAY_VESPERON_BREATH, m_creature);
            DoCast(m_creature->getVictim(), Heroic ? SPELL_SHADOW_BREATH_H : SPELL_SHADOW_BREATH_N);
            shadow_breath_timer = 20000 + rand()%5000;
        }else shadow_breath_timer -=diff;

        // power buff
        if(powerbuff_timer < diff)
        {
        	if (pInstance)
        	{
                Map *map = m_creature->GetMap();
                if (map->IsDungeon())
                {
                    Map::PlayerList const &PlayerList = map->GetPlayers();

                    if (PlayerList.isEmpty())
                        return;

                    for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                    {
                        if (i->getSource()->isAlive() && !i->getSource()->HasAura(SPELL_POWER_OF_VESPERON,0))
                        	DoCast(i->getSource(), SPELL_POWER_OF_VESPERON);
                    }
                }
            }
            // check every one second
            powerbuff_timer = 1000;
        }else powerbuff_timer -=diff;

        // Acolyte of Vesperon
        if(acolyte_vesperon < diff)
        {
            // doesn't work atm
            //DoCast(m_creature, SPELL_TWILIGHT_TORMENT_1);

            float x, y, z;
            m_creature->GetPosition(x,y,z);
            Creature* pAcolyte = m_creature->SummonCreature(ACOLYTE_OF_VESPERON, x+rand()%10, y+rand()%10, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 360000);

			acolyte_vesperon = 60000 + rand()%10000;
        }else acolyte_vesperon -=diff;

        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)  
	{
		DoScriptText(SAY_VESPERON_DEATH,m_creature);

        if (pInstance)
        {
            // Twilight Revenge
            if (Creature* pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SARTHARION))))
            	pSartharion->CastSpell(pSartharion,SPELL_TWILIGHT_REVENGE,true);

            // cast Twilight Residue
            Map *map = m_creature->GetMap();
            if (map->IsDungeon())
            {
                Map::PlayerList const &PlayerList = map->GetPlayers();

                if (PlayerList.isEmpty())
                    return;

                for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
                {
                    if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_POWER_OF_VESPERON,0))
                        i->getSource()->RemoveAurasDueToSpell(SPELL_POWER_OF_VESPERON);
                }
            }
        }
	}

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%2)
        {
            case 0: DoScriptText(SAY_VESPERON_SLAY_1, m_creature);break;
            case 1: DoScriptText(SAY_VESPERON_SLAY_2, m_creature);break;
        }
    }
};

/*######
## Mob Acolyte of Shadron
######*/
struct MANGOS_DLL_DECL mob_acolyte_of_shadronAI : public ScriptedAI
{
    mob_acolyte_of_shadronAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance *pInstance;
    uint32 twilight_torment_timer;

    void Reset() {
        DoCast(m_creature, SPELL_TWILIGHT_PHASE);
        twilight_torment_timer = 1000;

        if (pInstance)
        {
            // makes portal visible
            if (GameObject* TwilightPortal = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_GO_TWILIGHT_PORTAL)))
                if (!TwilightPortal->GetPhaseMask())
                    TwilightPortal->SetPhaseMask(1, true);
        }
    }

    void UpdateAI(const uint32 diff)
    {
    	// twilight torment
        if(twilight_torment_timer < diff)
        {
            if (pInstance)
            {
    	        Creature* pSartharion = NULL;
	            // on Sartharion if she is alive, or on Shadron.
                if (pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SARTHARION))))
                	pSartharion->CastSpell(pSartharion,SPELL_TWILIGHT_TORMENT_3,true);
    	        else if (pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SHADRON))))
	            	pSartharion->CastSpell(pSartharion,SPELL_TWILIGHT_TORMENT_2,true);
	        }
			twilight_torment_timer = 1000;
        }else twilight_torment_timer -=diff;

        DoMeleeAttackIfReady();
    }
    void JustDied(Unit* killer)
    {
        if (pInstance)
        {
            Creature* pSartharion = NULL;
            // remove twilight torment on Sartharion
            if (pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SARTHARION))))
            	if (pSartharion && pSartharion->isAlive() && pSartharion->HasAura(SPELL_TWILIGHT_TORMENT_3,0))
                    pSartharion->RemoveAurasDueToSpell(SPELL_TWILIGHT_TORMENT_3);

            // remove twilight torment on Shadron
            if (pSartharion = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_SHADRON))))
            	if (pSartharion && pSartharion->isAlive() && pSartharion->HasAura(SPELL_TWILIGHT_TORMENT_2,0))
                     pSartharion->RemoveAurasDueToSpell(SPELL_TWILIGHT_TORMENT_2);

/* don't close for now
            if (GameObject* TwilightPortal = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_GO_TWILIGHT_PORTAL)))
                if (TwilightPortal->GetPhaseMask())
                    TwilightPortal->SetPhaseMask(0, true);
*/
        }

        // cast Twilight Residue
        Map *map = m_creature->GetMap();
        if (map->IsDungeon())
        {
            Map::PlayerList const &PlayerList = map->GetPlayers();

            if (PlayerList.isEmpty())
                return;

            for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            {
                if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_TWILIGHT_SHIFT,0) && !i->getSource()->getVictim())
                	i->getSource()->CastSpell(i->getSource(),SPELL_TWILIGHT_RESIDUE,true);
            }
        }
    }
};

/*######
## Mob Acolyte of Vesperon
######*/
struct MANGOS_DLL_DECL mob_acolyte_of_vesperonAI : public ScriptedAI
{
    mob_acolyte_of_vesperonAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
    	Reset();
    }

    ScriptedInstance *pInstance;

    void Reset() {
        DoCast(m_creature, SPELL_TWILIGHT_TORMENT_4);
        DoCast(m_creature, SPELL_TWILIGHT_PHASE);

        if (pInstance)
        {
            // makes portal visible
            if (GameObject* TwilightPortal = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_GO_TWILIGHT_PORTAL)))
                if (!TwilightPortal->GetPhaseMask())
                    TwilightPortal->SetPhaseMask(1, true);
        }
    }

    void UpdateAI(const uint32 diff)
    {
        DoMeleeAttackIfReady();
    }

    void JustDied(Unit* killer)
    {
        // remove twilight torment on Vesperon
        if (pInstance)
        {
            Creature* pVesperon = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_VESPERON)));
                if (pVesperon && pVesperon->isAlive() && pVesperon->HasAura(SPELL_TWILIGHT_TORMENT_1,0))
                    pVesperon->RemoveAurasDueToSpell(SPELL_TWILIGHT_TORMENT_1);
/* don't close for now
            if (GameObject* TwilightPortal = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_GO_TWILIGHT_PORTAL)))
                if (TwilightPortal->GetPhaseMask())
                    TwilightPortal->SetPhaseMask(0, true);
*/
        }

        // cast Twilight Residue
        Map *map = m_creature->GetMap();
        if (map->IsDungeon())
        {
            Map::PlayerList const &PlayerList = map->GetPlayers();

            if (PlayerList.isEmpty())
                return;

            for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            {
                if (i->getSource()->isAlive() && i->getSource()->HasAura(SPELL_TWILIGHT_SHIFT,0) && !i->getSource()->getVictim())
                	i->getSource()->CastSpell(i->getSource(),SPELL_TWILIGHT_RESIDUE,true);
            }
        }
    }
};

/*######
## Mob Twilight Eggs
######*/
struct MANGOS_DLL_DECL mob_twilight_eggsAI : public Scripted_NoMovementAI
{
    mob_twilight_eggsAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature) {Reset();}

    uint32 hatch_Timer;

    void Reset() {
    	hatch_Timer = 20000;
    	//DoCast(m_creature, SPELL_TWILIGHT_PHASE);
    }
    void AttackStart(Unit* who) { }
    void MoveInLineOfSight(Unit* who) { }
    void UpdateAI(const uint32 diff)
    {
        if (hatch_Timer)
            if(hatch_Timer < diff)
            {
                float x, y, z;
                m_creature->GetPosition(x,y,z);
                Creature* pWhelp = m_creature->SummonCreature(TWILIGHT_WHELP, x, y, z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 360000);
                Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0);
                if (target && pWhelp) {
                    pWhelp->AddThreat(target, 0.0f);
                    pWhelp->AI()->AttackStart(target);
                }

                m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);

                hatch_Timer = 0;
            }else hatch_Timer -=diff;
    }
    void JustDied(Unit* killer)  {}
};

/*######
## Mob Twilight Whelps
######*/
struct MANGOS_DLL_DECL mob_twilight_whelpAI : public ScriptedAI
{
    mob_twilight_whelpAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 fade_armor_timer;

    void Reset() {
        fade_armor_timer = 1000;
        //DoCast(m_creature, SPELL_TWILIGHT_RESIDUE);
    }

    void UpdateAI(const uint32 diff)
    {
        //Return since we have no target
        if (!m_creature->SelectHostilTarget() || !m_creature->getVictim())
            return;

    	// twilight torment
        if(fade_armor_timer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_FADE_ARMOR);
            fade_armor_timer = 5000 + rand()%5000;
        }else fade_armor_timer -=diff;

        DoMeleeAttackIfReady();
    }
    void JustDied(Unit* killer)  {}
};

CreatureAI* GetAI_mob_tenebron(Creature* pCreature)
{
    return new mob_tenebronAI(pCreature);
}

CreatureAI* GetAI_mob_shadron(Creature* pCreature)
{
    return new mob_shadronAI(pCreature);
}

CreatureAI* GetAI_mob_vesperon(Creature* pCreature)
{
    return new mob_vesperonAI(pCreature);
}

CreatureAI* GetAI_boss_sartharion(Creature* pCreature)
{
    return new boss_sartharionAI(pCreature);
}

CreatureAI* GetAI_mob_acolyte_of_shadron(Creature* pCreature)
{
    return new mob_acolyte_of_shadronAI(pCreature);
}

CreatureAI* GetAI_mob_acolyte_of_vesperon(Creature* pCreature)
{
    return new mob_acolyte_of_vesperonAI(pCreature);
}

CreatureAI* GetAI_mob_twilight_eggs(Creature* pCreature)
{
    return new mob_twilight_eggsAI(pCreature);
}

CreatureAI* GetAI_mob_twilight_whelp(Creature* pCreature)
{
    return new mob_twilight_whelpAI(pCreature);
}

void AddSC_boss_sartharion()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="boss_sartharion";
    newscript->GetAI = &GetAI_boss_sartharion;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name="mob_vesperon";
    newscript->GetAI = &GetAI_mob_vesperon;
    newscript->RegisterSelf();
    
    newscript = new Script;
    newscript->Name="mob_shadron";
    newscript->GetAI = &GetAI_mob_shadron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_tenebron";
    newscript->GetAI = &GetAI_mob_tenebron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_acolyte_of_shadron";
    newscript->GetAI = &GetAI_mob_acolyte_of_shadron;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_acolyte_of_vesperon";
    newscript->GetAI = &GetAI_mob_acolyte_of_vesperon;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_twilight_eggs";
    newscript->GetAI = &GetAI_mob_twilight_eggs;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="mob_twilight_whelp";
    newscript->GetAI = &GetAI_mob_twilight_whelp;
    newscript->RegisterSelf();
}
