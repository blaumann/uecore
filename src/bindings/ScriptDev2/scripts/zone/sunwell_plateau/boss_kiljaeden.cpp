/* ScriptData
SDName: boss_kiljaeden
SDAuthor: ckegg
SD%Complete: 80%
SDComment: Missing ending animation, and Sinister Reflection need to be implemented.
SDCategory: Sunwell_Plateau
EndScriptData */
#include "precompiled.h"
#include "def_sunwell_plateau.h"

/*** Spells used during the encounter ***/
/* Hand of the Deceiver's spells and cosmetics */
#define SPELL_SHADOW_BOLT_VOLLEY               45770 // ~30 yard range Shadow Bolt Volley for ~2k(?) damage
#define SPELL_SHADOW_INFUSION                  45772 // They gain this at 20% - Immunity to Stun/Silence and makes them look angry!
#define SPELL_FELFIRE_PORTAL                   46875 // Creates a portal that spawns Felfire Fiends (LIVE FOR THE SWARM!1 FOR THE OVERMIND!)
#define SPELL_SHADOW_CHANNELING                46757 // Channeling animation out of combat

/* Volatile Felfire Fiend's spells */
#define SPELL_FELFIRE_FISSION                  45779 // Felfire Fiends explode when they die or get close to target.

/* Kil'Jaeden's spells and cosmetics */
#define SPELL_TRANS                            23188 // Surprisingly, this seems to be the right spell.. (Where is it used?)
#define SPELL_REBIRTH                          44200 // Emerge from the Sunwell
#define SPELL_SOUL_FLAY_DAMAGE                 45442 // 9k Shadow damage over 3 seconds. Spammed throughout all the fight.
#define SPELL_SOUL_FLAY_MOVEMENT               47106 // -50% Movement component of the above. Players cast it on selves unless this spell is fixed.
#define SPELL_LEGION_LIGHTNING                 45664 // Chain Lightning, 4 targets, ~3k Shadow damage, 1.5k mana burn
#define SPELL_FIRE_BLOOM                       45641 // Places a debuff on 5 raid members, which causes them to deal 2k Fire damage to nearby allies and selves. MIGHT NOT WORK
#define SPELL_SINISTER_REFLECTION              45785 // Summon shadow copies of 5 raid members that fight against KJ's enemies
#define SPELL_COPY_WEAPON                      41055 // }
#define SPELL_COPY_WEAPON2                     41054 // }
#define SPELL_COPY_OFFHAND                     45206 // }- Spells used in Sinister Reflection creation
#define SPELL_COPY_OFFHAND_WEAPON              45205 // }
#define SPELL_SINISTER_REFLECTION_CLASS        45893
#define SPELL_SINISTER_REFLECTION_CLONE        45785 // Cause the target to become a clone of the caster.
#define SPELL_SINISTER_REFLECTION_SUMMON       45891
#define SPELL_SHADOW_SPIKE                     46680 // Bombard random raid members with Shadow Spikes (Very similar to Void Reaver orbs)
#define SPELL_SHADOW_SPIKE_VISUAL              46589
#define SPELL_SHADOW_SPIKE_EFFECT              45885 // Inflicts 5100 to 6900% Shadow damage to an enemy and leaves it wounded, reducing the effectiveness of any healing by 50% for 10 sec.
#define SPELL_FLAME_DART                       45740 // Bombards the raid with flames every 3(?) seconds
#define SPELL_DARKNESS_OF_A_THOUSAND_SOULS     46605 // Begins a 8-second channeling, after which he will deal 50'000 damage to the raid
#define SPELL_DARKNESS_OF_A_THOUSAND_SOULS_EFFECT 45657 // Deals 47500 to 52500 Shadow damage to all enemies within reach.
#define SPELL_ARMAGEDDON                       45909 // Meteor spell
#define SPELL_ARMAGEDDON_VISUAL                45911 // Does the hellfire visual to indicate where the meteor missle lands
#define SPELL_SACRIFICE_OF_ANVEENA             46474 // Anveena sacrifices herself, causing Kil'jaeden to take 25% increased Holy damage.

/* Anveena's spells and cosmetics (Or, generally, everything that has "Anveena" in name) */
#define SPELL_ANVEENA_PRISON                   46367 // She hovers locked within a bubble
#define SPELL_ANVEENA_ENERGY_DRAIN             46410 // Sunwell energy glow animation (Control mob uses this)

/* Shield Orb spells */
//#define SPELL_SHADOW_BOLT                      45680 // constantly shooting Shadow Bolts at the raid (up to 3 bolts within 1 second)
#define SPELL_SHADOW_BOLT                      30505 // 45680 doesn't work, use 36714(1275~1725) for worksaround, or 30505 (1063~1437)

/* Orb of the Blue Dragonflight */
#define SPELL_BLINK                            45862
#define SPELL_BREATH_REVITALIZE                45860
#define SPELL_BREATH_HASTE                     45856
#define SPELL_SHIELD_OF_THE_BLUE               45848

/*** Other Spells (used by players, etc) ***/
#define SPELL_VENGEANCE_OF_THE_BLUE_FLIGHT     45839 // Possess the blue dragon from the orb to help the raid.
#define SPELL_POWER_OF_THE_BLUE_FLIGHT         45833 // Empowers a humanoid with the essence of the Blue Flight.
#define SPELL_SUMMON_BLUE_DRAKE                45836 // Summon (25653)
#define SPELL_ENTROPIUS_BODY                   46819 // Visual for Entropius at the Epilogue
#define SPELL_RING_OF_BLUE_FLAME               45825 // Blue Flame Ring on actived orb

/*** Creatures used in the encounter ***/
#define CREATURE_ANVEENA                        26046 // Embodiment of the Sunwell
#define CREATURE_KILJAEDEN                      25315 // Give it to 'em KJ!
#define CREATURE_HAND_OF_THE_DECEIVER           25588 // Adds found before KJ emerges
#define CREATURE_FELFIRE_PORTAL                 25603 // Portal spawned be Hand of the Deceivers
#define CREATURE_VOLATILE_FELFIRE_FIEND         25598 // Fiends spawned by the above portal
#define CREATURE_ARMAGEDDON_TARGET              25735 // This mob casts meteor on itself.. I think
#define CREATURE_SHIELD_ORB                     25502 // Shield orbs circle the room raining shadow bolts on raid
#define CREATURE_THE_CORE_OF_ENTROPIUS          26262 // Used in the ending cinematic?
#define CREATURE_POWER_OF_THE_BLUE_DRAGONFLIGHT 25653 // NPC that players possess when using the Orb of the Blue Dragonflight

/*** GameObjects ***/
#define GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT 188415
/* there are several more, probably changes its looking with ring of flame
#define GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT 188114
#define GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT 188115
#define GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT 188116
#define GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT 187869
*/

/*** Speech and sounds***/
// These are used throughout Sunwell and Magisters(?). Players can hear this while running through the instances.
#define SAY_KJ_OFFCOMBAT1                       -2580056
#define SAY_KJ_OFFCOMBAT2                       -2580057
#define SAY_KJ_OFFCOMBAT3                       -2580058
#define SAY_KJ_OFFCOMBAT4                       -2580059
#define SAY_KJ_OFFCOMBAT5                       -2580060

// Encounter speech and sounds
#define SAY_KJ_EMERGE                           -2580061
#define SAY_KJ_SLAY1                            -2580062
#define SAY_KJ_SLAY2                            -2580063
#define SAY_KJ_REFLECTION1                      -2580064
#define SAY_KJ_REFLECTION2                      -2580065
#define SAY_KJ_DARKNESS1                        -2580066
#define SAY_KJ_DARKNESS2                        -2580067
#define SAY_KJ_DARKNESS3                        -2580068
#define SAY_KJ_CANNOT_WIN                       -2580070
#define SAY_KJ_DENINE                           -2580069
#define SAY_KJ_LOST_POWER                       -2580071

/*** Kalecgos - Anveena speech at the beginning of Phase 5; Anveena's sacrifice ***/
#define SAY_KALECGOS_INTRO                      -2580072
#define SAY_KALECGOS_AWAKEN                     -2580073
#define SAY_ANVEENA_IMPRISONED                  -2580074
#define SAY_KALECGOS_LETGO                      -2580075
#define SAY_ANVEENA_LOST                        -2580076
#define SAY_KALECGOS_FOCUS                      -2580077
#define SAY_ANVEENA_KALEC                       -2580078
#define SAY_KALECGOS_FATE                       -2580079
#define SAY_ANVEENA_GOODBYE                     -2580080
#define SAY_KALECGOS_GOODBYE                    -2580081
#define SAY_KALECGOS_ENCOURAGE                  -2580082
#define SAY_KALECGOS_ORB1                       -2580083
#define SAY_KALECGOS_ORB2                       -2580084
#define SAY_KALECGOS_ORB3                       -2580085
#define SAY_KALECGOS_ORB4                       -2580086
// Charming

/*** Error messages ***/
#define ERROR_KJ_NOT_SUMMONED "SD2 ERROR: Unable to summon Kil'Jaeden for some reason"

/*** Others ***/
#define FLOOR_Z        28.050388
#define SHIELD_ORB_Z   39.80 // TODO: Find correct height.

enum Phase
{
    PHASE_NOTSTART   = 0, //
    PHASE_DECEIVERS  = 1, // Fight 3 adds
    PHASE_NORMAL     = 2, // Kil'Jaeden emerges from the sunwell
    PHASE_DARKNESS   = 3, // At 85%, he gains few abilities; Kalecgos joins the fight
    PHASE_ARMAGEDDON = 4, // At 55%, he gains even more abilities
    PHASE_SACRIFICE  = 5, // At 25%, Anveena sacrifices herself into the Sunwell; at this point he becomes enraged and has *significally* shorter cooldowns.
};

/*######
## Boss Kalecgos
######*/
struct MANGOS_DLL_DECL mob_kalecgosAI : public ScriptedAI
{
    mob_kalecgosAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }
    ScriptedInstance* pInstance;

    uint64 Orb[4];
    uint8 OrbsEmpowered;
    uint32 EmpowerTimer;

    void Reset()
    {
        EmpowerTimer = 0;
        OrbsEmpowered = 0;

        for(uint8 i = 0; i < 4; ++i)
            Orb[i] = 0;

        FindOrbs();

        m_creature->SetVisibility(VISIBILITY_OFF);
        m_creature->SetUnitMovementFlags(MOVEMENTFLAG_LEVITATING);
    }

    void UpdateAI(const uint32 diff) {
        // Empower a orb
        if (EmpowerTimer)
            if(EmpowerTimer < diff)
            {
                switch(OrbsEmpowered)
                {
                    case 0: DoScriptText(SAY_KALECGOS_ORB1, m_creature);break;
                    case 1: DoScriptText(SAY_KALECGOS_ORB2, m_creature);break;
                    case 2: DoScriptText(SAY_KALECGOS_ORB3, m_creature);break;
                    case 3: DoScriptText(SAY_KALECGOS_ORB4, m_creature);break;
                }

                EmpowerOrb();

                // In last phase active another orb in short time
                if (EmpowerTimer == 2)
                    EmpowerTimer = 20000;
                else
                    EmpowerTimer = 0;

            }else EmpowerTimer -= diff;
    }

    void FindOrbs()
    {
        CellPair pair(MaNGOS::ComputeCellPair(m_creature->GetPositionX(), m_creature->GetPositionY()));
        Cell cell(pair);
        cell.data.Part.reserved = ALL_DISTRICT;
        cell.SetNoCreate();

        std::list<GameObject*> orbList;
        AllGameObjectsWithEntryInGrid go_check(GAMEOBJECT_ORB_OF_THE_BLUE_DRAGONFLIGHT);
        MaNGOS::GameObjectListSearcher<AllGameObjectsWithEntryInGrid> go_search(m_creature, orbList, go_check);
        TypeContainerVisitor<MaNGOS::GameObjectListSearcher<AllGameObjectsWithEntryInGrid>, GridTypeMapContainer> go_visit(go_search);

        CellLock<GridReadGuard> cell_lock(cell, pair);
        cell_lock->Visit(cell_lock, go_visit, *(m_creature->GetMap()));

        if(orbList.empty())
            return;

        uint8 i = 0;
        for(std::list<GameObject*>::iterator itr = orbList.begin(); itr != orbList.end(); ++itr, ++i)
        {
            Orb[i] = (*itr)->GetGUID();
            (*itr)->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
            (*itr)->Refresh();
        }
    }

    void EmpowerOrb()
    {
        if (OrbsEmpowered < 3)
    	{
            GameObject* orb = pInstance->instance->GetGameObject(Orb[OrbsEmpowered]);
            if(!orb)
                return;

 //<Ntsc> usually if a spell targets a go
 //<Ntsc> it targets it directly using spell targets 

            //m_creature->CastSpell(orb, SPELL_RING_OF_BLUE_FLAME, true);
            orb->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
            orb->Refresh();
            ++OrbsEmpowered;
        }
    }
};


/*######
## Mob Shield Orb
######*/
struct MANGOS_DLL_DECL mob_shield_orbAI : public ScriptedAI
{
    mob_shield_orbAI(Creature* pCreature) : ScriptedAI(pCreature)
	{
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }
    ScriptedInstance* pInstance;

    uint32 ShadowBoltTimer;
    uint32 MovementTimer;
    uint32 steps;

    void Reset() {
        ShadowBoltTimer = 1000 + rand()%3000;
        MovementTimer = 1000 + rand()%2000;
        steps = 0;

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
                    if (i->getSource()->isAlive())
                        AttackStart(i->getSource());
                }
            }
        }
    }

    void UpdateAI(const uint32 diff) {

        if(ShadowBoltTimer < diff)
        {
        	for(uint8 i = 0; i < rand()%3; ++i)
                DoCast(SelectUnit(SELECT_TARGET_RANDOM,0), SPELL_SHADOW_BOLT);
            ShadowBoltTimer = 1000 + rand()%3000;
        }else ShadowBoltTimer -= diff;

        if(MovementTimer < diff)
        {
            if (pInstance)
            {
                if(Creature* pKiljaeden = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KILJAEDEN))))
                {
                    float angle = (M_PI / 10) * steps;
                    float X = pKiljaeden->GetPositionX() + 22 * cos(angle);
                    float Y = pKiljaeden->GetPositionY() + 22 * sin(angle);

                    m_creature->GetMotionMaster()->MovePoint(0, X, Y, SHIELD_ORB_Z);

                    steps++;
                    if (steps > 19) steps = 0;
                }
            }
            MovementTimer = 1000;
        }else MovementTimer -= diff;
    }
};

/*######
## Boss Kil'jaeden
######*/
struct MANGOS_DLL_DECL boss_kiljaedenAI : public Scripted_NoMovementAI
{
    boss_kiljaedenAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();

        // hack spell 45885
        SpellEntry *TempSpell = (SpellEntry*)GetSpellStore()->LookupEntry(SPELL_SHADOW_SPIKE_EFFECT);
        if (TempSpell && TempSpell->EffectImplicitTargetB[0] != 16)
        {
               TempSpell->EffectImplicitTargetA[0] = 53;
               TempSpell->EffectImplicitTargetA[1] = 0;
               TempSpell->EffectImplicitTargetB[0] = 16;
               TempSpell->EffectImplicitTargetB[1] = 0;
        }
    }

    /* GUIDs */
    uint64 KalecGUID;

    /* General */
    ScriptedInstance* pInstance;
    uint32 Phase;

    /* Phase 2+ spells */
    uint32 SoulFlayTimer;
    uint32 LegionLightningTimer;
    uint32 FireBloomTimer;
    uint32 SummonShieldOrbTimer;

    /* Phase 3+ spells */
    uint32 FlameDartTimer;
    uint32 DarknessTimer;
    uint32 DarknessBombTimer;
    uint32 ShadowSpikeTimer;
    uint32 ShadowSpikeCount;

    /* Phase 4+ spells */
    uint32 ArmageddonTimer;

    void Reset()
    {
        KalecGUID = 99937;

        // TODO: Fix timers
        SoulFlayTimer = 15000;
        LegionLightningTimer = 30000;
        FireBloomTimer = 30000;
        SummonShieldOrbTimer = 45000;

        FlameDartTimer = 3000;
        DarknessTimer = 60000;
        DarknessBombTimer = 0;
        ShadowSpikeTimer = 5000;
        ShadowSpikeCount = 30000;

        ArmageddonTimer = 10000;

        Phase = PHASE_NOTSTART;
    }

    void EnterEvadeMode()
    {
        Scripted_NoMovementAI::EnterEvadeMode();
        Phase = PHASE_NOTSTART;

        // Reset the controller
        if(pInstance)
        {
            pInstance->SetData(DATA_KILJAEDEN_EVENT, NOT_STARTED);
        }
    }

    void Aggro(Unit* who) { DoZoneInCombat(); }

    void MoveInLineOfSight(Unit* who) {
        if (!m_creature->getVictim() && who->GetTypeId() == TYPEID_PLAYER)
            AttackStart(who);
    }

    void CastSinisterReflection()
    {

//        for (uint8 i = 0; i < 4; ++i) // disadvantage is it may be duplicated target
//            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_SINISTER_REFLECTION);
        // workaround
        for (uint8 i = 0; i < 4; ++i)
        {
            Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0);
            if (target)
            {
                Unit* pSummon = target->SummonCreature(25708, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 45000);
                pSummon->SetDisplayId(target->GetDisplayId());
                pSummon->setFaction(m_creature->getFaction());
                pSummon->SetMaxHealth(target->GetMaxHealth());
                pSummon->SetHealth(target->GetMaxHealth());
                pSummon->CastSpell(target, SPELL_SINISTER_REFLECTION_CLASS, true);
                pSummon->CastSpell(target, SPELL_SINISTER_REFLECTION_CLONE, true);
                pSummon->CastSpell(target, SPELL_COPY_WEAPON, true);
                pSummon->CastSpell(target, SPELL_COPY_WEAPON2, true);
                pSummon->CastSpell(target, SPELL_COPY_OFFHAND, true);
                pSummon->CastSpell(target, SPELL_COPY_OFFHAND_WEAPON, true);
            }
        }

        switch(rand()%2)
        {
            case 0: DoScriptText(SAY_KJ_REFLECTION1, m_creature);break;
            case 1: DoScriptText(SAY_KJ_REFLECTION2, m_creature);break;
        }
    } // TODO: Create copies of 5 random raid members.

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim() || Phase < PHASE_NORMAL)
            return;

        // *****************************************
        // *********** Phase 2 spells **************
        // *****************************************

        // Soul Flay : 9k damage over 3 seconds on highest aggro
        if(SoulFlayTimer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_SOUL_FLAY_DAMAGE);
            m_creature->getVictim()->CastSpell(m_creature->getVictim(), SPELL_SOUL_FLAY_MOVEMENT, true);
            SoulFlayTimer = 3500;
        }else SoulFlayTimer -= diff;

        // Legion Lightning : Lightning on random target, jumps to 3 additional players, burns 1500 mana and deals 3k damage
        if(LegionLightningTimer < diff) 
        {
            m_creature->InterruptNonMeleeSpells(true);
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_LEGION_LIGHTNING);
            LegionLightningTimer = (Phase == PHASE_SACRIFICE) ? 18000 : 30000; // 18 seconds in PHASE_SACRIFICE
        }else LegionLightningTimer -= diff;

        // Fire Bloom : Places a debuff on 5 random targets; targets and all nearby allies suffer ~1.7k fire damage every 2 seconds
        if(FireBloomTimer < diff)
        {
            m_creature->InterruptNonMeleeSpells(true);
            for (uint8 i = 0; i < 5; ++i) // disadvantage is it may be duplicated target
                DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_FIRE_BLOOM);
            FireBloomTimer = (Phase == PHASE_SACRIFICE) ? 25000 : 40000; // 25 seconds in PHASE_SACRIFICE
        }else FireBloomTimer -= diff;

        // Summon Shield Orb : Spawns a Shield Orb add and constantly shooting Shadow Bolts at the raid
        if(SummonShieldOrbTimer < diff)
        {
            // northeast of Kil'jaeden
            for(uint8 i = 1; i < Phase; ++i)
                Creature* SOrb = m_creature->SummonCreature(CREATURE_SHIELD_ORB, 1709.000, 615.000, SHIELD_ORB_Z, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 45000);
            SummonShieldOrbTimer = (Phase == PHASE_SACRIFICE) ? 30000 : 60000; // 30 seconds in PHASE_SACRIFICE
        }else SummonShieldOrbTimer -= diff;

        // *****************************************
        // *********** Phase 3 spells **************
        // *****************************************
        if(Phase == PHASE_NORMAL && ((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 85))
        {
            m_creature->InterruptNonMeleeSpells(true);

            // Sinister Reflection
            CastSinisterReflection();

            // Shadow Spike
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_SHADOW_SPIKE);

            SoulFlayTimer         = 30000; // Don't let other spells
            LegionLightningTimer += 30000; // interrupt Shadow Spikes
            FireBloomTimer       += 30000; 
            SummonShieldOrbTimer += 30000;
            FlameDartTimer       += 30000;
            //DarknessTimer        += 30000;
            ShadowSpikeCount      = 30000; // shadow spike visual timer

            // Active orb after 35 seconds
            if (Creature* pKalecgos = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS))))
            {
                ((mob_kalecgosAI*)pKalecgos->AI())->EmpowerTimer = 35000;
                //((mob_kalecgosAI*)pKalecgos->AI())->FindOrbs();
            }

            Phase = PHASE_DARKNESS;
        }
        else if(Phase <= PHASE_NORMAL) return;

        // Shadow Spike Effect Count
        if (ShadowSpikeCount)
            if(ShadowSpikeTimer < diff)
            {
                // workaround
                Unit* target (SelectUnit(SELECT_TARGET_RANDOM, 0));
                if (target)
                    m_creature->CastSpell(target, SPELL_SHADOW_SPIKE_VISUAL, true);

                ShadowSpikeTimer = 5000;
                ShadowSpikeCount -= ShadowSpikeTimer;
            }else ShadowSpikeTimer -= diff;

        // Flame Dart Explosion
        if(FlameDartTimer < diff)
        {
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_FLAME_DART);
            FlameDartTimer = 3000;
        }else FlameDartTimer -= diff;

        // Darkness of a Thousand Souls : Begins to channel for 8 seconds, then deals 50'000 damage to all raid members.
        if(DarknessTimer < diff)
        {
            m_creature->InterruptNonMeleeSpells(true);
            //DoCast(m_creature, SPELL_DARKNESS_OF_A_THOUSAND_SOULS);
            m_creature->CastSpell(m_creature, SPELL_DARKNESS_OF_A_THOUSAND_SOULS, true);

            SummonShieldOrbTimer += 9000; // Don't let other spells
            FireBloomTimer       += 9000; // interrupt Darkness of a Thousand Souls
            LegionLightningTimer += 9000;
            FlameDartTimer       += 9000;
            if(Phase >= PHASE_ARMAGEDDON)
                ArmageddonTimer  += 9000; // Armageddon on the other hand, can be casted now, if Anveena has already sacrificed
            SoulFlayTimer         = 9000;
            DarknessBombTimer     = 8000; // Darkness of a Thousand Souls effect timer

            switch(rand()%3)
            {
                case 0: DoScriptText(SAY_KJ_DARKNESS1, m_creature);break;
                case 1: DoScriptText(SAY_KJ_DARKNESS2, m_creature);break;
                case 2: DoScriptText(SAY_KJ_DARKNESS3, m_creature);break;
            }

            DarknessTimer = (Phase == PHASE_SACRIFICE) ? 20000 + rand()%15000 : 40000 + rand()%30000;
        }else DarknessTimer -= diff;

        // Darkness of a Thousand Souls Effect
        if (DarknessBombTimer)
            if(DarknessBombTimer < diff)
            {
                DoCast(m_creature, SPELL_DARKNESS_OF_A_THOUSAND_SOULS_EFFECT);
                DarknessBombTimer = 0;
            }else DarknessBombTimer -= diff;

        // *****************************************
        // *********** Phase 4 spells **************
        // *****************************************
        if(Phase == PHASE_DARKNESS && ((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 55))
        {
            m_creature->InterruptNonMeleeSpells(true);

            // Sinister Reflection
            CastSinisterReflection();

            // Shadow Spike
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_SHADOW_SPIKE);

            SoulFlayTimer         = 30000; // Don't let other spells
            LegionLightningTimer += 30000; // interrupt Shadow Spikes
            FireBloomTimer       += 30000; 
            SummonShieldOrbTimer += 30000;
            FlameDartTimer       += 30000;
            DarknessTimer        += 30000;
            ArmageddonTimer      += 30000;
            ShadowSpikeCount      = 30000; // shadow spike visual timer

            // Active orb after 35 seconds
            if (Creature* pKalecgos = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS))))
                ((mob_kalecgosAI*)pKalecgos->AI())->EmpowerTimer = 35000;

            Phase = PHASE_ARMAGEDDON;
        }
        else if(Phase <= PHASE_DARKNESS) return;

        // Armageddon
        if(ArmageddonTimer < diff)
        {
            if(Unit* target = SelectUnit(SELECT_TARGET_RANDOM, 0))
            {
                float x, y, z;
                target->GetPosition(x, y, z);
                if(Creature* Armageddon = m_creature->SummonCreature(CREATURE_ARMAGEDDON_TARGET, x, y, z, 0, TEMPSUMMON_TIMED_DESPAWN, 5000))
                {
                    Armageddon->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    DoCast(Armageddon, SPELL_ARMAGEDDON, true);
                    Armageddon->CastSpell(Armageddon, SPELL_ARMAGEDDON_VISUAL, true);
                }
            }
            ArmageddonTimer = 2000; // No, I'm not kidding
        }else ArmageddonTimer -= diff;


        // *****************************************
        // *********** Phase 5 spells **************
        // *****************************************
        if(Phase == PHASE_ARMAGEDDON && ((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 25))
        {
            m_creature->InterruptNonMeleeSpells(true);

            // Sinister Reflection
            CastSinisterReflection();

            // Shadow Spike
            DoCast(SelectUnit(SELECT_TARGET_RANDOM, 0), SPELL_SHADOW_SPIKE);

            SoulFlayTimer         = 30000; // Don't let other spells
            LegionLightningTimer += 30000; // interrupt Shadow Spikes
            FireBloomTimer       += 30000; 
            SummonShieldOrbTimer += 30000;
            FlameDartTimer       += 30000;
            DarknessTimer        += 30000;
            ArmageddonTimer      += 30000;
            ShadowSpikeCount      = 30000; // shadow spike visual timer

            // Active orb after 35 seconds
            if (Creature* pKalecgos = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS))))
                ((mob_kalecgosAI*)pKalecgos->AI())->EmpowerTimer = 35000;

            Phase = PHASE_SACRIFICE;
        }
        else if(Phase <= PHASE_ARMAGEDDON) return;
    }

    void KilledUnit(Unit *victim)
    {
        if (victim == m_creature)
            return;

        switch(rand()%2)
        {
            case 0: DoScriptText(SAY_KJ_SLAY1, m_creature);break;
            case 1: DoScriptText(SAY_KJ_SLAY2, m_creature);break;
        }
    }

    void JustDied(Unit* killer)  
	{
        if (pInstance)
            pInstance->SetData(DATA_KILJAEDEN_EVENT, DONE);
	}
};

/*######
## Mob Kil'jaeden Controller , controls most of the event
######*/
struct MANGOS_DLL_DECL mob_kiljaeden_controllerAI : public Scripted_NoMovementAI
{
    mob_kiljaeden_controllerAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance* pInstance;
    std::list<uint64> HandDeceivers;

    uint32 Phase;
    uint32 event_timer;
    uint32 AnveenaSpeech_timer;
    uint32 AnveenaSpeechCounter;
    bool DevicerChanneling;
    bool AnveenaSpellCheck;
    bool KalecgosResetCheck;

    void Reset()
    {
        Phase = PHASE_NOTSTART;
        event_timer = 1000;
        DevicerChanneling = false;
        AnveenaSpellCheck = false;
        KalecgosResetCheck = false;
        AnveenaSpeech_timer = 0;
        AnveenaSpeechCounter = 0;

    	m_creature->SetVisibility(VISIBILITY_ON);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

        if (pInstance)
        {
            pInstance->SetData(DATA_KILJAEDEN_EVENT, NOT_STARTED);

            if (Creature* pKalecgosAnveena = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS))))
                pKalecgosAnveena->SetVisibility(VISIBILITY_OFF);

            if (Creature* pKalecgos = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS))))
                ((mob_kalecgosAI*)pKalecgos->AI())->Reset();
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if(event_timer < diff)
        {
            if (Phase == PHASE_NOTSTART)
            {
                Creature* DeciverGUID[2];
                Unit* target = NULL;
                uint32 DeciverCount = 0;

                for(uint8 i = 0; i < 3; ++i)
                    DeciverGUID[i] = NULL;

            	FindHandDeceivers();
                for(std::list<uint64>::iterator itr = HandDeceivers.begin(); itr != HandDeceivers.end(); ++itr)
                {
                    if (Creature* pCreature = ((Creature*)Unit::GetUnit(*m_creature, *itr)))
                    {
                        // alive & no target
                        if (pCreature->isAlive() && !pCreature->getVictim())
                        {
                            if (DeciverCount < 3)
                                DeciverGUID[DeciverCount] = pCreature;
                            DeciverCount++;
                        }
                        // alive & has target
                        else if (pCreature->isAlive() && pCreature->getVictim())
                            target = pCreature->getVictim();
                        // dead, respawn
                        else if (pCreature->isDead())
                        {
                            pCreature->RemoveCorpse();
                            pCreature->Respawn();
                            if (DeciverCount < 3)
                                DeciverGUID[DeciverCount] = pCreature;
                            DeciverCount++;
                        }
                    }
                }

                // aggro, link to others
                if (target)
                {
                    for(uint8 i = 0; i < 2; ++i)
                    if (DeciverGUID[i])
                    {
                        //((Creature*)DeciverGUID[i])->AddThreat(target, 0.0f);
                        ((Creature*)DeciverGUID[i])->AI()->AttackStart(target);
                    }
                    if (pInstance)
                        if (Creature* pAnveena = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_ANVEENA))))
                            pAnveena->Relocate(1698.45, 628.03, 88.1989);
                            //pAnveena->GetMotionMaster()->MovePoint(0, 1698.45, 628.03, 88.1989);

                    DoZoneInCombat();
                    Phase = PHASE_DECEIVERS;
                }
                // no aggro, do channeling
                else if (!target && !DevicerChanneling)
                {
                    for(uint8 i = 0; i < 3; ++i)
                        if (DeciverGUID[i])
                            DeciverGUID[i]->CastSpell(DeciverGUID[i], SPELL_SHADOW_CHANNELING, false);
                    DevicerChanneling = true;
                }
            }

            if (Phase == PHASE_DECEIVERS)
            {
                bool DeciverDead;
                bool DecivernoVictim;
                FindHandDeceivers();
                DeciverDead = false;
                for(std::list<uint64>::iterator itr = HandDeceivers.begin(); itr != HandDeceivers.end(); ++itr)
                {
                    if (Creature* pCreature = ((Creature*)Unit::GetUnit(*m_creature, *itr)))
                    {
                        // if any is alive
                        if (pCreature->isAlive())
                        {
                        	DeciverDead = true;

                        	// no target
                            if (!pCreature->getVictim())
                            {
                                Phase = PHASE_NOTSTART;
                                Reset();
                                return;
                            }
                        }
                    }
                }

                // if all dead, KILJAEDEN
                if (!DeciverDead)
                {
                    m_creature->RemoveAurasDueToSpell(SPELL_ANVEENA_ENERGY_DRAIN);
                    Phase = PHASE_NORMAL;
                    AnveenaSpeech_timer = 25000; // first speech after 25 secs

                    if(Creature* KJ = DoSpawnCreature(CREATURE_KILJAEDEN, 0, 0,0, 0, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 45000))
                    {
                        KJ->CastSpell(KJ, SPELL_REBIRTH, false);
                        //KJ->AddThreat(m_creature->getVictim(), 1.0f);
                        //((boss_kiljaedenAI*)KJ->AI())->AttackStart(m_creature->getVictim());
                        DoScriptText(SAY_KJ_EMERGE, KJ);
                        ((boss_kiljaedenAI*)KJ->AI())->Phase = PHASE_NORMAL;
                        if (pInstance)
                            pInstance->SetData(DATA_KILJAEDEN_EVENT, IN_PROGRESS);
                    }
                }
            }

            if (Phase >= PHASE_NORMAL)
            {
                if(Creature* pKiljaeden = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KILJAEDEN))))
                {
                    if (pKiljaeden->isAlive())
                    	if (pInstance && pInstance->GetData(DATA_KILJAEDEN_EVENT) == NOT_STARTED)
                    	{
                            Phase = PHASE_NOTSTART;
                            Reset();
                            return;
                        }
                }
            }

            // Anveena and Kil'jaeden spawn check
            if (pInstance)
            {
                Creature* pKiljaeden = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KILJAEDEN)));
                Creature* pAnveena = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_ANVEENA)));
                Creature* KalecgosAnveena = ((Creature*)Unit::GetUnit((*m_creature), pInstance->GetData64(DATA_KALECGOS)));

                if (pKiljaeden && pKiljaeden->isAlive()
                    	&& pInstance && pInstance->GetData(DATA_KILJAEDEN_EVENT) == NOT_STARTED)
                {
                    pKiljaeden->setDeathState(JUST_DIED);
                    pKiljaeden->RemoveCorpse();
                    KalecgosAnveena->SetVisibility(VISIBILITY_OFF);
                }
                if (pKiljaeden && pKiljaeden->isAlive()
                    	&& pInstance && pInstance->GetData(DATA_KILJAEDEN_EVENT) == IN_PROGRESS)
                {
                    if((pKiljaeden->GetHealth()*100 / pKiljaeden->GetMaxHealth()) < 24 && Phase < PHASE_SACRIFICE)
                    {
                        Phase = PHASE_SACRIFICE;
                        AnveenaSpeechCounter = 0;
                        AnveenaSpeech_timer = 1000;
                    }
                    else if((pKiljaeden->GetHealth()*100 / pKiljaeden->GetMaxHealth()) < 54 && Phase < PHASE_ARMAGEDDON)
                    {
                        Phase = PHASE_ARMAGEDDON;
                        AnveenaSpeechCounter = 0;
                        AnveenaSpeech_timer = 1000;
                    }
                    else if((pKiljaeden->GetHealth()*100 / pKiljaeden->GetMaxHealth()) < 84 && Phase < PHASE_DARKNESS)
                    {
                        Phase = PHASE_DARKNESS;
                        AnveenaSpeechCounter = 0;
                        AnveenaSpeech_timer = 1000;
                    }
                }

                // Phase 2 speech
                if (Phase == PHASE_NORMAL && AnveenaSpeech_timer)
                {
                    if(AnveenaSpeech_timer < diff)
                    {
                        if (KalecgosAnveena && KalecgosAnveena->isAlive())
                        {
                            KalecgosAnveena->SetVisibility(VISIBILITY_ON);
                            KalecgosAnveena->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            KalecgosAnveena->GetMotionMaster()->MovePoint(0, 1705.87, 653.42, 120.20);
                            DoScriptText(SAY_KALECGOS_INTRO, KalecgosAnveena);
                        }

                        AnveenaSpeech_timer = 0;
                    }else AnveenaSpeech_timer -= diff;
                }
                // Phase 3 speech
                else if (Phase == PHASE_DARKNESS && AnveenaSpeech_timer)
                {
                    if(AnveenaSpeech_timer < diff)
                    {
                        switch(AnveenaSpeechCounter)
                        {
                            case 0:
                                    if (KalecgosAnveena)
                                        DoScriptText(SAY_KALECGOS_AWAKEN, KalecgosAnveena);
                                        AnveenaSpeech_timer = 5000;
                                    break;
                            case 1:
                                    if (pAnveena)
                                        DoScriptText(SAY_ANVEENA_IMPRISONED, pAnveena);
                                        AnveenaSpeech_timer = 5000;
                                    break;
                            case 2:
                                    if (pKiljaeden)
                                        DoScriptText(SAY_KJ_DENINE, pKiljaeden);
                                        AnveenaSpeech_timer = 0;
                                    break;
                        }
                        AnveenaSpeechCounter++;
                    }else AnveenaSpeech_timer -= diff;
                }
                // Phase 4 speech
                else if (Phase == PHASE_ARMAGEDDON && AnveenaSpeech_timer)
                {
                    if(AnveenaSpeech_timer < diff)
                    {
                        switch(AnveenaSpeechCounter)
                        {
                            case 0:
                                    if (KalecgosAnveena)
                                        DoScriptText(SAY_KALECGOS_LETGO, KalecgosAnveena);
                                        AnveenaSpeech_timer = 7000;
                                    break;
                            case 1:
                                    if (pAnveena)
                                        DoScriptText(SAY_ANVEENA_LOST, pAnveena);
                                        AnveenaSpeech_timer = 5000;
                                    break;
                            case 2:
                                    if (pKiljaeden)
                                        DoScriptText(SAY_KJ_CANNOT_WIN, pKiljaeden);
                                        AnveenaSpeech_timer = 0;
                                    break;
                        }
                        AnveenaSpeechCounter++;
                    }else AnveenaSpeech_timer -= diff;
                }
                // Phase 5 speech
                else if (Phase == PHASE_SACRIFICE && AnveenaSpeech_timer)
                {
                    if(AnveenaSpeech_timer < diff)
                    {
                        switch(AnveenaSpeechCounter)
                        {
                            case 0:
                                if (KalecgosAnveena)
                                    DoScriptText(SAY_KALECGOS_FOCUS, KalecgosAnveena);
                                AnveenaSpeech_timer = 10000;
                                break;
                            case 1:
                                if (pAnveena)
                                    DoScriptText(SAY_ANVEENA_KALEC, pAnveena);
                                AnveenaSpeech_timer = 3000;
                                break;
                            case 2:
                                if (KalecgosAnveena)
                                    DoScriptText(SAY_KALECGOS_FATE, KalecgosAnveena);
                                AnveenaSpeech_timer = 7000;
                                break;
                            case 3:
                                if (pAnveena)
                                    DoScriptText(SAY_ANVEENA_GOODBYE, pAnveena);
                                AnveenaSpeech_timer = 6000;
                                break;
                            case 4:
                                if (pKiljaeden && pKiljaeden->isAlive() && pAnveena && pAnveena->isAlive())
                                {
                                    pAnveena->CastSpell(pKiljaeden, SPELL_SACRIFICE_OF_ANVEENA, true);
                                    pAnveena->setDeathState(JUST_DIED);
                                    pAnveena->RemoveCorpse();
                                    DoScriptText(SAY_KJ_LOST_POWER, pKiljaeden);
                                }
                                AnveenaSpeech_timer = 13000;
                                break;
                            case 5:
                                if (KalecgosAnveena)
                                    DoScriptText(SAY_KALECGOS_GOODBYE, KalecgosAnveena);
                                AnveenaSpeech_timer = 14000;
                                break;
                            case 6:
                                if (KalecgosAnveena)
                                    DoScriptText(SAY_KALECGOS_ENCOURAGE, KalecgosAnveena);
                                AnveenaSpeech_timer = 0;
                                break;
                        }
                        AnveenaSpeechCounter++;
                    }else AnveenaSpeech_timer -= diff;
                }

                // respawn check
                if (Phase != PHASE_SACRIFICE)
                {
                    if (pAnveena && !pAnveena->isAlive())
                        pAnveena->Respawn();

                    if (pAnveena && pAnveena->isAlive() && AnveenaSpellCheck == false)
                    {
                        DoCast(m_creature, SPELL_ANVEENA_ENERGY_DRAIN);
                        pAnveena->SetVisibility(VISIBILITY_ON);
                        pAnveena->SetUnitMovementFlags(MOVEMENTFLAG_LEVITATING);
                        pAnveena->CastSpell(pAnveena, SPELL_ANVEENA_PRISON, true);
                        //pAnveena->GetMotionMaster()->MovePoint(0, 1698.45, 628.03, 88.1989);
                        pAnveena->Relocate(1698.45, 628.03, 88.1989);
                        AnveenaSpellCheck = true;
                    }
                }
                // reset Kalecgo
                if (Phase == PHASE_NOTSTART)
                {
                	if (KalecgosAnveena && KalecgosAnveena->isAlive() && !KalecgosResetCheck)
                    {
                	    ((mob_kalecgosAI*)KalecgosAnveena->AI())->Reset();
                        KalecgosResetCheck = true;
                    }
                }
            }
        }else event_timer -=diff;
    }

    void FindHandDeceivers()
    {
        CellPair pair(MaNGOS::ComputeCellPair(m_creature->GetPositionX(), m_creature->GetPositionY()));
        Cell cell(pair);
        cell.data.Part.reserved = ALL_DISTRICT;
        cell.SetNoCreate();

        std::list<Creature*> DeceiverList;

        AllCreaturesOfEntryInRange check(m_creature, CREATURE_HAND_OF_THE_DECEIVER, 50);
        MaNGOS::CreatureListSearcher<AllCreaturesOfEntryInRange> searcher(m_creature, DeceiverList, check);
        TypeContainerVisitor<MaNGOS::CreatureListSearcher<AllCreaturesOfEntryInRange>, GridTypeMapContainer> visitor(searcher);

        CellLock<GridReadGuard> cell_lock(cell, pair);
        cell_lock->Visit(cell_lock, visitor, *(m_creature->GetMap()));

        if (!DeceiverList.empty())
        {
            HandDeceivers.clear();
            for(std::list<Creature*>::iterator itr = DeceiverList.begin(); itr != DeceiverList.end(); ++itr)
                HandDeceivers.push_back((*itr)->GetGUID());
        }
    }
};

/*######
## Mob Hand of the Deceiver
######*/
struct MANGOS_DLL_DECL mob_hand_of_the_deceiverAI : public ScriptedAI
{
    mob_hand_of_the_deceiverAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        pInstance = ((ScriptedInstance*)pCreature->GetInstanceData());
        Reset();
    }

    ScriptedInstance* pInstance;

    uint32 ShadowBoltVolleyTimer;
    uint32 FelfirePortalTimer;

    void Reset()
    {
        // TODO: Timers!
        ShadowBoltVolleyTimer = 8000 + rand()%6000; // So they don't all cast it in the same moment.
        FelfirePortalTimer = 20000;

        m_creature->CastSpell(m_creature, SPELL_SHADOW_CHANNELING, false);
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
            m_creature->InterruptNonMeleeSpells(true);
            DoStartMovement(who);
        }
    }

    void JustDied(Unit* killer) { }

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->getVictim() || !m_creature->SelectHostilTarget())
            return;

        // Gain Shadow Infusion at 20% health
        if(((m_creature->GetHealth()*100 / m_creature->GetMaxHealth()) < 20) && !m_creature->HasAura(SPELL_SHADOW_INFUSION, 0))
            DoCast(m_creature, SPELL_SHADOW_INFUSION, true);

        // Shadow Bolt Volley - Shoots Shadow Bolts at all enemies within 30 yards, for ~2k Shadow damage.
        if(ShadowBoltVolleyTimer < diff)
        {
            DoCast(m_creature->getVictim(), SPELL_SHADOW_BOLT_VOLLEY);
            ShadowBoltVolleyTimer = 12000;
        }else ShadowBoltVolleyTimer -= diff;

        // Felfire Portal - Creatres a portal, that spawns Volatile Felfire Fiends, which do suicide bombing.
        if(FelfirePortalTimer < diff)
        {
            if(Creature* Portal = DoSpawnCreature(CREATURE_FELFIRE_PORTAL, 0, 0,0, 0, TEMPSUMMON_TIMED_DESPAWN, 20000))
            {
                // why don't use m_creature->getVictim() ???
                std::list<HostilReference*>::iterator itr;
                for(itr = m_creature->getThreatManager().getThreatList().begin(); itr != m_creature->getThreatManager().getThreatList().end(); ++itr)
                {
                    Unit* pUnit = Unit::GetUnit(*m_creature, (*itr)->getUnitGuid());
                    if(pUnit)
                        Portal->AddThreat(pUnit, 1.0f);
                }
            }
            FelfirePortalTimer = 20000;
        }else FelfirePortalTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

/*######
## Mob Felfire Portal
######*/
struct MANGOS_DLL_DECL mob_felfire_portalAI : public Scripted_NoMovementAI
{
    mob_felfire_portalAI(Creature* pCreature) : Scripted_NoMovementAI(pCreature)
    {
        Reset();
    }

    uint32 SpawnFiendTimer;

    void Reset() {
        SpawnFiendTimer = 5000;
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim()) return;

        if(SpawnFiendTimer < diff)
        {
            Creature* Fiend = DoSpawnCreature(CREATURE_VOLATILE_FELFIRE_FIEND, 0, 0, 0, 0, TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN, 20000);
            if(Fiend)
                Fiend->AddThreat(SelectUnit(SELECT_TARGET_RANDOM,0), 100000.0f);
            SpawnFiendTimer = 4000 + rand()%4000;
        }else SpawnFiendTimer -= diff;
    }
};

/*######
## Mob Volatile Felfire Fiend
######*/
struct MANGOS_DLL_DECL mob_volatile_felfire_fiendAI : public ScriptedAI
{
    mob_volatile_felfire_fiendAI(Creature* pCreature) : ScriptedAI(pCreature) { Reset(); }

    uint32 ExplodeTimer;
    bool LockedTarget;

    void Reset()
    {
        ExplodeTimer = 2000;
    }

    void Aggro(Unit* who) {
        m_creature->AddThreat(who, 10000000.0f);
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if(damage > m_creature->GetHealth())
            DoCast(m_creature, SPELL_FELFIRE_FISSION, true);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!m_creature->SelectHostilTarget() || !m_creature->getVictim()) return;

        if(ExplodeTimer) // Just so it doesn't explode as soon as it spawn
        {
            if(ExplodeTimer < diff) ExplodeTimer = 0;
            else ExplodeTimer -= diff;
        }
        else if(m_creature->IsWithinDistInMap(m_creature->getVictim(), 3)) // Explode if it's close enough to it's target
        {
            DoCast(m_creature->getVictim(), SPELL_FELFIRE_FISSION);
            m_creature->DealDamage(m_creature, m_creature->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
        }
    }
};

CreatureAI* GetAI_boss_kiljaeden(Creature* pCreature)
{
    return new boss_kiljaedenAI(pCreature);
}

CreatureAI* GetAI_mob_kiljaeden_controller(Creature* pCreature)
{
    return new mob_kiljaeden_controllerAI(pCreature);
}

CreatureAI* GetAI_mob_hand_of_the_deceiver(Creature* pCreature)
{
    return new mob_hand_of_the_deceiverAI(pCreature);
}

CreatureAI* GetAI_mob_felfire_portal(Creature* pCreature)
{
    return new mob_felfire_portalAI(pCreature);
}

CreatureAI* GetAI_mob_volatile_felfire_fiend(Creature* pCreature)
{
    return new mob_volatile_felfire_fiendAI(pCreature);
}

CreatureAI* GetAI_mob_shield_orb(Creature* pCreature)
{
    return new mob_shield_orbAI(pCreature);
}

CreatureAI* GetAI_mob_kalecgos(Creature* pCreature)
{
    return new mob_kalecgosAI(pCreature);
}

bool GOHello_orb_of_the_blue_flight(Player* pPlayer, GameObject* go)
{
    ScriptedInstance *pInstance = (pPlayer->GetInstanceData()) ? ((ScriptedInstance*)pPlayer->GetInstanceData()) : NULL;

    if (pInstance && pInstance->GetData(DATA_KILJAEDEN_EVENT) == IN_PROGRESS && !go->HasFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE))
    {
        pPlayer->CastSpell(pPlayer, SPELL_SUMMON_BLUE_DRAKE, true);
        pPlayer->CastSpell(pPlayer, SPELL_VENGEANCE_OF_THE_BLUE_FLIGHT, true);
    }

    return false;
}

void AddSC_boss_Kiljaeden()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "boss_kiljaeden";
    newscript->GetAI = &GetAI_boss_kiljaeden;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_kiljaeden_controller";
    newscript->GetAI = &GetAI_mob_kiljaeden_controller;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_kalecgos";
    newscript->GetAI = &GetAI_mob_kalecgos;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_hand_of_the_deceiver";
    newscript->GetAI = &GetAI_mob_hand_of_the_deceiver;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_felfire_portal";
    newscript->GetAI = &GetAI_mob_felfire_portal;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_volatile_felfire_fiend";
    newscript->GetAI = &GetAI_mob_volatile_felfire_fiend;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shield_orb";
    newscript->GetAI = &GetAI_mob_shield_orb;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "go_orb_of_the_blue_flight";
    newscript->pGOHello = &GOHello_orb_of_the_blue_flight;
    newscript->RegisterSelf();
}