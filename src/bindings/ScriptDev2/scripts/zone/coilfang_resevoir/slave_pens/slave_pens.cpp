/*
*|||||||||||||||||||||||||
*|| ||
*||* UNDER DEVELOPMENT* ||
*|| ||
*|||||||||||||||||||||||||
*/

#include "precompiled.h"
/*
// Slavehandler spell's
#define SPELL_HAMSTRING 26211
#define SPELL_HEAD_CRACK 35161
#define SPELL_DAZED 13496

struct MANGOS_DLL_DECL npc_slavehandlerAI : public ScriptedAI
{
npc_slavehandlerAI(Creature *c) : ScriptedAI© {EnterEvadeMode();}

Creature *npc_wastewalker_slave;
npc_wastewalker_slave = m_creature->SummonCreature(17963, m_creature->GetPositionX() + 3, m_creature->GetPositionY() + 3, m_creature->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,900000 );

Creature *npc_wastewalker_slave;
npc_wastewalker_slave = m_creature->SummonCreature(17963, m_creature->GetPositionX(), m_creature->GetPositionY() + 3, m_creature->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,900000 );

Creature *npc_wastewalker_slave;
npc_wastewalker_slave = m_creature->SummonCreature(17963, m_creature->GetPositionX() + 3, m_creature->GetPositionY(), m_creature->GetPositionZ(),0,TEMPSUMMON_CORPSE_DESPAWN,900000 );

npc_wastewalker_slave->SetUInt32Value(UNIT_NPC_EMOTESTATE,EMOTE_STATE_WO RK);

// Timers
void EnterEvadeMode()
{
InCombat = false;

m_creature->RemoveAllAuras();
m_creature->DeleteThreatList();
m_creature->CombatStop();
InCombat = false;
DoGoHome();

// Timer = xx

}

void AttackStart(Unit *who)
{
if (!who)
return;

npc_wastewalker_slave->setFaction(168); 

if (who->isTargetableForAttack() && who!= m_creature)
{
DoStartMeleeAttack(who);
InCombat = true;
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

DoStartMeleeAttack(who);
InCombat = true;

}
}
}

void KilledUnit(Unit *player)
{

}

void JustDied(Unit* Killer);
{
if ((npc_wastewalker_slave->GetHealth()*100 / npc_wastewalker_slave->GetMaxHealth()< 100))
{
npc_wastewalker_slave->setFaction(168); 
Unit* target = NULL;
target = SelectUnit(SELECT_TARGET_TOPAGGRO,0);
}
else
{
npc_wastewalker_slave->setFaction(/*neutral);
npc_wastewalker_slave->SetUInt32Value(UNIT_NPC_EMOTESTATE,EMOTE_STATE_KN EEL);
}
}

void UpdateAI(const uint32 diff)
{
if (!m_creature->SelectHostilTarget())
return;

if( m_creature->getVictim() && m_creature->isAlive())
{
//Spells
}
}
};

CreatureAI* GetAI_npc_slavehandler(Creature* pCreature)
{
return new npc_slavehandlerAI(pCreature);
}


void AddSC_npc_slavehandler()
{
Script *newscript;
newscript = new Script;
newscript->Name="npc_slavehandler";
newscript->GetAI = GetAI_Slavehandler;
m_scripts[nrscripts++] = newscript;
}*/
