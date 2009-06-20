/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Opcodes.h"
#include "Log.h"
#include "UpdateMask.h"
#include "World.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Player.h"
#include "Pet.h"
#include "Unit.h"
#include "Spell.h"
#include "DynamicObject.h"
#include "Group.h"
#include "UpdateData.h"
#include "MapManager.h"
#include "ObjectAccessor.h"
#include "CellImpl.h"
#include "Policies/SingletonImp.h"
#include "SharedDefines.h"
#include "LootMgr.h"
#include "VMapFactory.h"
#include "BattleGround.h"
#include "Util.h"

#define SPELL_CHANNEL_UPDATE_INTERVAL (1 * IN_MILISECONDS)

extern pEffect SpellEffects[TOTAL_SPELL_EFFECTS];

class PrioritizeManaUnitWraper
{
    public:
        explicit PrioritizeManaUnitWraper(Unit* unit) : i_unit(unit)
        {
            uint32 maxmana = unit->GetMaxPower(POWER_MANA);
            i_percent = maxmana ? unit->GetPower(POWER_MANA) * 100 / maxmana : 101;
        }
        Unit* getUnit() const { return i_unit; }
        uint32 getPercent() const { return i_percent; }
    private:
        Unit* i_unit;
        uint32 i_percent;
};

struct PrioritizeMana
{
    int operator()( PrioritizeManaUnitWraper const& x, PrioritizeManaUnitWraper const& y ) const
    {
        return x.getPercent() < y.getPercent();
    }
};

typedef std::priority_queue<PrioritizeManaUnitWraper, std::vector<PrioritizeManaUnitWraper>, PrioritizeMana> PrioritizeManaUnitQueue;

class PrioritizeHealthUnitWraper
{
public:
    explicit PrioritizeHealthUnitWraper(Unit* unit) : i_unit(unit)
    {
        i_percent = unit->GetHealth() * 100 / unit->GetMaxHealth();
    }
    Unit* getUnit() const { return i_unit; }
    uint32 getPercent() const { return i_percent; }
private:
    Unit* i_unit;
    uint32 i_percent;
};

struct PrioritizeHealth
{
    int operator()( PrioritizeHealthUnitWraper const& x, PrioritizeHealthUnitWraper const& y ) const
    {
        return x.getPercent() < y.getPercent();
    }
};

typedef std::priority_queue<PrioritizeHealthUnitWraper, std::vector<PrioritizeHealthUnitWraper>, PrioritizeHealth> PrioritizeHealthUnitQueue;

bool IsQuestTameSpell(uint32 spellId)
{
    SpellEntry const *spellproto = sSpellStore.LookupEntry(spellId);
    if (!spellproto) return false;

    return spellproto->Effect[0] == SPELL_EFFECT_THREAT
        && spellproto->Effect[1] == SPELL_EFFECT_APPLY_AURA && spellproto->EffectApplyAuraName[1] == SPELL_AURA_DUMMY;
}

SpellCastTargets::SpellCastTargets()
{
    m_unitTarget = NULL;
    m_itemTarget = NULL;
    m_GOTarget   = NULL;

    m_unitTargetGUID   = 0;
    m_GOTargetGUID     = 0;
    m_CorpseTargetGUID = 0;
    m_itemTargetGUID   = 0;
    m_itemTargetEntry  = 0;

    m_srcX = m_srcY = m_srcZ = m_destX = m_destY = m_destZ = 0;
    m_strTarget = "";
    m_targetMask = 0;
}

SpellCastTargets::~SpellCastTargets()
{
}

void SpellCastTargets::setUnitTarget(Unit *target)
{
    if (!target)
        return;

    m_destX = target->GetPositionX();
    m_destY = target->GetPositionY();
    m_destZ = target->GetPositionZ();
    m_unitTarget = target;
    m_unitTargetGUID = target->GetGUID();
    m_targetMask |= TARGET_FLAG_UNIT;
}

void SpellCastTargets::setDestination(float x, float y, float z)
{
    m_destX = x;
    m_destY = y;
    m_destZ = z;
    m_targetMask |= TARGET_FLAG_DEST_LOCATION;
}

void SpellCastTargets::setSource(float x, float y, float z)
{
    m_srcX = x;
    m_srcY = y;
    m_srcZ = z;
    m_targetMask |= TARGET_FLAG_SOURCE_LOCATION;
}

void SpellCastTargets::setGOTarget(GameObject *target)
{
    m_GOTarget = target;
    m_GOTargetGUID = target->GetGUID();
    //    m_targetMask |= TARGET_FLAG_OBJECT;
}

void SpellCastTargets::setItemTarget(Item* item)
{
    if(!item)
        return;

    m_itemTarget = item;
    m_itemTargetGUID = item->GetGUID();
    m_itemTargetEntry = item->GetEntry();
    m_targetMask |= TARGET_FLAG_ITEM;
}

void SpellCastTargets::setCorpseTarget(Corpse* corpse)
{
    m_CorpseTargetGUID = corpse->GetGUID();
}

void SpellCastTargets::Update(Unit* caster)
{
    m_GOTarget   = m_GOTargetGUID ? caster->GetMap()->GetGameObject(m_GOTargetGUID) : NULL;
    m_unitTarget = m_unitTargetGUID ?
        ( m_unitTargetGUID == caster->GetGUID() ? caster : ObjectAccessor::GetUnit(*caster, m_unitTargetGUID) ) :
    NULL;

    m_itemTarget = NULL;
    if(caster->GetTypeId() == TYPEID_PLAYER)
    {
        if(m_targetMask & TARGET_FLAG_ITEM)
            m_itemTarget = ((Player*)caster)->GetItemByGuid(m_itemTargetGUID);
        else
        {
            Player* pTrader = ((Player*)caster)->GetTrader();
            if(pTrader && m_itemTargetGUID < TRADE_SLOT_COUNT)
                m_itemTarget = pTrader->GetItemByPos(pTrader->GetItemPosByTradeSlot(m_itemTargetGUID));
        }
        if(m_itemTarget)
            m_itemTargetEntry = m_itemTarget->GetEntry();
    }
}

bool SpellCastTargets::read ( WorldPacket * data, Unit *caster, SpellEntry const* spell )
{
    if(data->rpos() + 4 > data->size())
        return false;

    *data >> m_targetMask;

    if(m_targetMask == TARGET_FLAG_SELF)
    {
        m_destX = caster->GetPositionX();
        m_destY = caster->GetPositionY();
        m_destZ = caster->GetPositionZ();
        bool skiptarget = false;
        if(spell)
        {
            for(int j=0;j<3;j++)
            {
                // this is requiered, otherwise it will return SPELL_FAILED_BAD_TARGETS
                skiptarget |= (spell->EffectImplicitTargetA[j] == TARGET_IN_FRONT_OF_CASTER);
            }
        }
        if(!skiptarget)
        {
            m_unitTarget = caster;
            m_unitTargetGUID = caster->GetGUID();
        }
        return true;
    }

    // TARGET_FLAG_UNK2 is used for non-combat pets, maybe other?
    if( m_targetMask & ( TARGET_FLAG_UNIT | TARGET_FLAG_UNK2 ))
        if(!data->readPackGUID(m_unitTargetGUID))
            return false;

    if( m_targetMask & ( TARGET_FLAG_OBJECT ))
        if(!data->readPackGUID(m_GOTargetGUID))
            return false;

    if(( m_targetMask & ( TARGET_FLAG_ITEM | TARGET_FLAG_TRADE_ITEM )) && caster->GetTypeId() == TYPEID_PLAYER)
        if(!data->readPackGUID(m_itemTargetGUID))
            return false;

    if( m_targetMask & (TARGET_FLAG_CORPSE | TARGET_FLAG_PVP_CORPSE ) )
        if(!data->readPackGUID(m_CorpseTargetGUID))
            return false;

    if( m_targetMask & TARGET_FLAG_SOURCE_LOCATION )
    {
        if(data->rpos() + 4 + 4 + 4 > data->size())
            return false;

        *data >> m_srcX >> m_srcY >> m_srcZ;
        if(!MaNGOS::IsValidMapCoord(m_srcX, m_srcY, m_srcZ))
            return false;
    }

    if( m_targetMask & TARGET_FLAG_DEST_LOCATION )
    {
        if(data->rpos() + 1 + 4 + 4 + 4 > data->size())
            return false;

        if(!data->readPackGUID(m_unitTargetGUID))
            return false;

        *data >> m_destX >> m_destY >> m_destZ;
        if(!MaNGOS::IsValidMapCoord(m_destX, m_destY, m_destZ))
            return false;
    }

    if( m_targetMask & TARGET_FLAG_STRING )
    {
        if(data->rpos() + 1 > data->size())
            return false;

        *data >> m_strTarget;
    }

    // find real units/GOs
    Update(caster);
    return true;
}

void SpellCastTargets::write ( WorldPacket * data )
{
    *data << uint32(m_targetMask);

    if( m_targetMask & ( TARGET_FLAG_UNIT | TARGET_FLAG_PVP_CORPSE | TARGET_FLAG_OBJECT | TARGET_FLAG_CORPSE | TARGET_FLAG_UNK2 ) )
    {
        if(m_targetMask & TARGET_FLAG_UNIT)
        {
            if(m_unitTarget)
                data->append(m_unitTarget->GetPackGUID());
            else
                *data << uint8(0);
        }
        else if( m_targetMask & TARGET_FLAG_OBJECT )
        {
            if(m_GOTarget)
                data->append(m_GOTarget->GetPackGUID());
            else
                *data << uint8(0);
        }
        else if( m_targetMask & ( TARGET_FLAG_CORPSE | TARGET_FLAG_PVP_CORPSE ) )
            data->appendPackGUID(m_CorpseTargetGUID);
        else
            *data << uint8(0);
    }

    if( m_targetMask & ( TARGET_FLAG_ITEM | TARGET_FLAG_TRADE_ITEM ) )
    {
        if(m_itemTarget)
            data->append(m_itemTarget->GetPackGUID());
        else
            *data << uint8(0);
    }

    if( m_targetMask & TARGET_FLAG_SOURCE_LOCATION )
        *data << m_srcX << m_srcY << m_srcZ;

    if( m_targetMask & TARGET_FLAG_DEST_LOCATION )
    {
        if(m_unitTarget)
            data->append(m_unitTarget->GetPackGUID());
        else
            *data << uint8(0);

        *data << m_destX << m_destY << m_destZ;
    }

    if( m_targetMask & TARGET_FLAG_STRING )
        *data << m_strTarget;
}

Spell::Spell( Unit* Caster, SpellEntry const *info, bool triggered, uint64 originalCasterGUID, Spell** triggeringContainer )
{
    ASSERT( Caster != NULL && info != NULL );
    ASSERT( info == sSpellStore.LookupEntry( info->Id ) && "`info` must be pointer to sSpellStore element");

    m_spellInfo = info;
    m_caster = Caster;
    m_selfContainer = NULL;
    m_triggeringContainer = triggeringContainer;
    m_referencedFromCurrentSpell = false;
    m_executedCurrently = false;
    m_delayStart = 0;
    m_delayAtDamageCount = 0;

    m_applyMultiplierMask = 0;

    // Get data for type of attack
    switch (m_spellInfo->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:
            if (m_spellInfo->AttributesEx3 & SPELL_ATTR_EX3_REQ_OFFHAND)
                m_attackType = OFF_ATTACK;
            else
                m_attackType = BASE_ATTACK;
            break;
        case SPELL_DAMAGE_CLASS_RANGED:
            m_attackType = RANGED_ATTACK;
            break;
        default:
                                                            // Wands
            if (m_spellInfo->AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG)
                m_attackType = RANGED_ATTACK;
            else
                m_attackType = BASE_ATTACK;
            break;
    }

    m_spellSchoolMask = GetSpellSchoolMask(info);           // Can be override for some spell (wand shoot for example)

    if(m_attackType == RANGED_ATTACK)
    {
        // wand case
        if((m_caster->getClassMask() & CLASSMASK_WAND_USERS) != 0 && m_caster->GetTypeId() == TYPEID_PLAYER)
        {
            if(Item* pItem = ((Player*)m_caster)->GetWeaponForAttack(RANGED_ATTACK))
                m_spellSchoolMask = SpellSchoolMask(1 << pItem->GetProto()->Damage[0].DamageType);
        }
    }
    // Set health leech amount to zero
    m_healthLeech = 0;

    if(originalCasterGUID)
        m_originalCasterGUID = originalCasterGUID;
    else
        m_originalCasterGUID = m_caster->GetGUID();

    if(m_originalCasterGUID == m_caster->GetGUID())
        m_originalCaster = m_caster;
    else
    {
        m_originalCaster = ObjectAccessor::GetUnit(*m_caster, m_originalCasterGUID);
        if(m_originalCaster && !m_originalCaster->IsInWorld()) m_originalCaster = NULL;
    }

    for(int i=0; i <3; ++i)
        m_currentBasePoints[i] = m_spellInfo->EffectBasePoints[i];

    m_spellState = SPELL_STATE_NULL;

    m_castPositionX = m_castPositionY = m_castPositionZ = 0;
    m_TriggerSpells.clear();
    m_IsTriggeredSpell = triggered;
    //m_AreaAura = false;
    m_CastItem = NULL;

    unitTarget = NULL;
    itemTarget = NULL;
    gameObjTarget = NULL;
    focusObject = NULL;
    m_cast_count = 0;
    m_glyphIndex = 0;
    m_preCastSpell = 0;
    m_triggeredByAuraSpell  = NULL;

    //Auto Shot & Shoot (wand)
    m_autoRepeat = IsAutoRepeatRangedSpell(m_spellInfo);

    m_runesState = 0;
    m_powerCost = 0;                                        // setup to correct value in Spell::prepare, don't must be used before.
    m_casttime = 0;                                         // setup to correct value in Spell::prepare, don't must be used before.
    m_timer = 0;                                            // will set to castime in prepare

    m_needAliveTargetMask = 0;

    // determine reflection
    m_canReflect = false;

    if(m_spellInfo->DmgClass == SPELL_DAMAGE_CLASS_MAGIC && !(m_spellInfo->AttributesEx2 & SPELL_ATTR_EX2_CANT_REFLECTED))
    {
        for(int j = 0;j < 3; ++j)
        {
            if (m_spellInfo->Effect[j] == 0)
                continue;

            if(!IsPositiveTarget(m_spellInfo->EffectImplicitTargetA[j], m_spellInfo->EffectImplicitTargetB[j]))
                m_canReflect = true;
            else
                m_canReflect = (m_spellInfo->AttributesEx & SPELL_ATTR_EX_NEGATIVE) ? true : false;

            if(m_canReflect)
                continue;
            else
                break;
        }
    }

    CleanupTargetList();
}

Spell::~Spell()
{
}

template<typename T>
WorldObject* Spell::FindCorpseUsing()
{
    // non-standard target selection
    SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex);
    float max_range = GetSpellMaxRange(srange);

    CellPair p(MaNGOS::ComputeCellPair(m_caster->GetPositionX(), m_caster->GetPositionY()));
    Cell cell(p);
    cell.data.Part.reserved = ALL_DISTRICT;
    cell.SetNoCreate();

    WorldObject* result = NULL;

    T u_check(m_caster, max_range);
    MaNGOS::WorldObjectSearcher<T> searcher(m_caster, result, u_check);

    TypeContainerVisitor<MaNGOS::WorldObjectSearcher<T>, GridTypeMapContainer > grid_searcher(searcher);
    CellLock<GridReadGuard> cell_lock(cell, p);
    cell_lock->Visit(cell_lock, grid_searcher, *m_caster->GetMap());

    if (!result)
    {
        TypeContainerVisitor<MaNGOS::WorldObjectSearcher<T>, WorldTypeMapContainer > world_searcher(searcher);
        cell_lock->Visit(cell_lock, world_searcher, *m_caster->GetMap());
    }

    return result;
}

void Spell::FillTargetMap()
{
    // TODO: ADD the correct target FILLS!!!!!!

    for(uint32 i = 0; i < 3; ++i)
    {
        // not call for empty effect.
        // Also some spells use not used effect targets for store targets for dummy effect in triggered spells
        if(m_spellInfo->Effect[i] == 0)
            continue;

        // targets for TARGET_SCRIPT_COORDINATES (A) and TARGET_SCRIPT  filled in Spell::CheckCast call
        if( m_spellInfo->EffectImplicitTargetA[i] == TARGET_SCRIPT_COORDINATES ||
            m_spellInfo->EffectImplicitTargetA[i] == TARGET_SCRIPT ||
            m_spellInfo->EffectImplicitTargetB[i] == TARGET_SCRIPT && m_spellInfo->EffectImplicitTargetA[i] != TARGET_SELF )
            continue;

        // TODO: find a way so this is not needed?
        // for area auras always add caster as target (needed for totems for example)
        if(IsAreaAuraEffect(m_spellInfo->Effect[i]))
            AddUnitTarget(m_caster, i);

        std::list<Unit*> tmpUnitMap;

        // TargetA/TargetB dependent from each other, we not switch to full support this dependences
        // but need it support in some know cases
        switch(m_spellInfo->EffectImplicitTargetA[i])
        {
            case TARGET_SELF:
                switch(m_spellInfo->EffectImplicitTargetB[i])
                {
                    case 0:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        break;
                    case TARGET_AREAEFFECT_INSTANT:         // use B case that not dependent from from A in fact
                        if((m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION) == 0)
                            m_targets.setDestination(m_caster->GetPositionX(), m_caster->GetPositionY(), m_caster->GetPositionZ());
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                        break;
                    case TARGET_BEHIND_VICTIM:              // use B case that not dependent from from A in fact
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                        break;
                    default:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                        break;
                }
                break;
            case TARGET_CASTER_COORDINATES:
                // Note: this hack with search required until GO casting not implemented
                // environment damage spells already have around enemies targeting but this not help in case not existed GO casting support
                // currently each enemy selected explicitly and self cast damage
                if(m_spellInfo->EffectImplicitTargetB[i] == TARGET_ALL_ENEMY_IN_AREA && m_spellInfo->Effect[i] == SPELL_EFFECT_ENVIRONMENTAL_DAMAGE)
                {
                    if(m_targets.getUnitTarget())
                        tmpUnitMap.push_back(m_targets.getUnitTarget());
                }
                else
                {
                    SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                    SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                }
                break;
            case TARGET_TABLE_X_Y_Z_COORDINATES:
                switch(m_spellInfo->EffectImplicitTargetB[i])
                {
                    case 0:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);

                        // need some target for proccesing
                        if(m_targets.getUnitTarget())
                            tmpUnitMap.push_back(m_targets.getUnitTarget());
                        else
                            tmpUnitMap.push_back(m_caster); 
                        break;
                    case TARGET_AREAEFFECT_INSTANT:         // All 17/7 pairs used for dest teleportation, A processed in effect code
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                        break;
                    default:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                    break;
                }
                break;
            case TARGET_EFFECT_SELECT:
                FillCustomTargetMap(i,tmpUnitMap);
                break;
            default:
                switch(m_spellInfo->EffectImplicitTargetB[i])
                {
                    case 0:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        break;
                    case TARGET_SCRIPT_COORDINATES:         // B case filled in CheckCast but we need fill unit list base at A case
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        break;
                    default:
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetA[i], tmpUnitMap);
                        SetTargetMap(i, m_spellInfo->EffectImplicitTargetB[i], tmpUnitMap);
                        break;
                }
                break;
        }

        if( (m_spellInfo->EffectImplicitTargetA[i] == 0 || m_spellInfo->EffectImplicitTargetA[i] == TARGET_EFFECT_SELECT) &&
            (m_spellInfo->EffectImplicitTargetB[i] == 0 || m_spellInfo->EffectImplicitTargetB[i] == TARGET_EFFECT_SELECT) )
        {
            // add here custom effects that need default target.
            // FOR EVERY TARGET TYPE THERE IS A DIFFERENT FILL!!
            switch(m_spellInfo->Effect[i])
            {
                case SPELL_EFFECT_DUMMY:
                {
                    switch(m_spellInfo->Id)
                    {
                        case 20577:                         // Cannibalize
                        {
                            WorldObject* result = FindCorpseUsing<MaNGOS::CannibalizeObjectCheck> ();

                            if(result)
                            {
                                switch(result->GetTypeId())
                                {
                                    case TYPEID_UNIT:
                                    case TYPEID_PLAYER:
                                        tmpUnitMap.push_back((Unit*)result);
                                        break;
                                    case TYPEID_CORPSE:
                                        m_targets.setCorpseTarget((Corpse*)result);
                                        if(Player* owner = ObjectAccessor::FindPlayer(((Corpse*)result)->GetOwnerGUID()))
                                            tmpUnitMap.push_back(owner);
                                        break;
                                }
                            }
                            else
                            {
                                // clear cooldown at fail
                                if(m_caster->GetTypeId() == TYPEID_PLAYER)
                                    ((Player*)m_caster)->RemoveSpellCooldown(m_spellInfo->Id, true);
                                SendCastResult(SPELL_FAILED_NO_EDIBLE_CORPSES);
                                finish(false);
                            }
                            break;
                        }
                        default:
                            if(m_targets.getUnitTarget())
                                tmpUnitMap.push_back(m_targets.getUnitTarget());
                            break;
                    }
                    break;
                }
                case SPELL_EFFECT_RESURRECT:
                case SPELL_EFFECT_PARRY:
                case SPELL_EFFECT_BLOCK:
                case SPELL_EFFECT_CREATE_ITEM:
                case SPELL_EFFECT_TRIGGER_SPELL:
                case SPELL_EFFECT_TRIGGER_MISSILE:
                case SPELL_EFFECT_LEARN_SPELL:
                case SPELL_EFFECT_SKILL_STEP:
                case SPELL_EFFECT_PROFICIENCY:
                case SPELL_EFFECT_SUMMON_OBJECT_WILD:
                case SPELL_EFFECT_SELF_RESURRECT:
                case SPELL_EFFECT_REPUTATION:
                case SPELL_EFFECT_SEND_TAXI:
                    if(m_targets.getUnitTarget())
                        tmpUnitMap.push_back(m_targets.getUnitTarget());
                    // Triggered spells have additional spell targets - cast them even if no explicit unit target is given (required for spell 50516 for example)
                    else if(m_spellInfo->Effect[i] == SPELL_EFFECT_TRIGGER_SPELL)
                        tmpUnitMap.push_back(m_caster);
                    break;
                case SPELL_EFFECT_SUMMON_PLAYER:
                    if(m_caster->GetTypeId()==TYPEID_PLAYER && ((Player*)m_caster)->GetSelection())
                    {
                        Player* target = objmgr.GetPlayer(((Player*)m_caster)->GetSelection());
                        if(target)
                            tmpUnitMap.push_back(target);
                    }
                    break;
                case SPELL_EFFECT_RESURRECT_NEW:
                    if(m_targets.getUnitTarget())
                        tmpUnitMap.push_back(m_targets.getUnitTarget());
                    if(m_targets.getCorpseTargetGUID())
                    {
                        Corpse *corpse = ObjectAccessor::GetCorpse(*m_caster, m_targets.getCorpseTargetGUID());
                        if(corpse)
                        {
                            Player* owner = ObjectAccessor::FindPlayer(corpse->GetOwnerGUID());
                            if(owner)
                                tmpUnitMap.push_back(owner);
                        }
                    }
                    break;
                case SPELL_EFFECT_SUMMON:
                    if(m_spellInfo->EffectMiscValueB[i] == SUMMON_TYPE_POSESSED || m_spellInfo->EffectMiscValueB[i] == SUMMON_TYPE_POSESSED2)
                    {
                        if(m_targets.getUnitTarget())
                            tmpUnitMap.push_back(m_targets.getUnitTarget());
                    }
                    else
                        tmpUnitMap.push_back(m_caster);
                    break;
                case SPELL_EFFECT_SUMMON_CHANGE_ITEM:
                case SPELL_EFFECT_TRANS_DOOR:
                case SPELL_EFFECT_ADD_FARSIGHT:
                case SPELL_EFFECT_APPLY_GLYPH:
                case SPELL_EFFECT_STUCK:
                case SPELL_EFFECT_FEED_PET:
                case SPELL_EFFECT_DESTROY_ALL_TOTEMS:
                case SPELL_EFFECT_SKILL:
                case SPELL_EFFECT_SUMMON_OBJECT_SLOT1:
                    tmpUnitMap.push_back(m_caster);
                    break;
                case SPELL_EFFECT_LEARN_PET_SPELL:
                    if(Pet* pet = m_caster->GetPet())
                        tmpUnitMap.push_back(pet);
                    break;
                case SPELL_EFFECT_ENCHANT_ITEM:
                case SPELL_EFFECT_ENCHANT_ITEM_TEMPORARY:
                case SPELL_EFFECT_ENCHANT_ITEM_PRISMATIC:
                case SPELL_EFFECT_DISENCHANT:
                case SPELL_EFFECT_PROSPECTING:
                case SPELL_EFFECT_MILLING:
                    if(m_targets.getItemTarget())
                        AddItemTarget(m_targets.getItemTarget(), i);
                    break;
                case SPELL_EFFECT_APPLY_AURA:
                    switch(m_spellInfo->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_ADD_FLAT_MODIFIER:  // some spell mods auras have 0 target modes instead expected TARGET_SELF(1) (and present for other ranks for same spell for example)
                        case SPELL_AURA_ADD_PCT_MODIFIER:
                            tmpUnitMap.push_back(m_caster);
                            break;
                        default:                            // apply to target in other case
                            if(m_targets.getUnitTarget())
                                tmpUnitMap.push_back(m_targets.getUnitTarget());
                            break;
                    }
                    break;
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                                                            // AreaAura
                    if(m_spellInfo->Attributes == 0x9050000 || m_spellInfo->Attributes == 0x10000)
                        SetTargetMap(i,TARGET_AREAEFFECT_PARTY, tmpUnitMap);
                    break;
                case SPELL_EFFECT_SKIN_PLAYER_CORPSE:
                    if(m_targets.getUnitTarget())
                    {
                        tmpUnitMap.push_back(m_targets.getUnitTarget());
                    }
                    else if (m_targets.getCorpseTargetGUID())
                    {
                        Corpse *corpse = ObjectAccessor::GetCorpse(*m_caster,m_targets.getCorpseTargetGUID());
                        if(corpse)
                        {
                            Player* owner = ObjectAccessor::FindPlayer(corpse->GetOwnerGUID());
                            if(owner)
                                tmpUnitMap.push_back(owner);
                        }
                    }
                    break;
                default:
                    break;
            }
        }

        if(m_caster->GetTypeId() == TYPEID_PLAYER)
        {
            Player *me = (Player*)m_caster;
            for (std::list<Unit*>::const_iterator itr = tmpUnitMap.begin(); itr != tmpUnitMap.end(); ++itr)
            {
                Unit *owner = (*itr)->GetOwner();
                Unit *u = owner ? owner : (*itr);
                if(u!=m_caster && u->IsPvP() && (!me->duel || me->duel->opponent != u))
                {
                    me->UpdatePvP(true);
                    me->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_ENTER_PVP_COMBAT);
                    break;
                }
            }
        }

        for (std::list<Unit*>::iterator itr = tmpUnitMap.begin(); itr != tmpUnitMap.end();)
        {
            if (!CheckTarget (*itr, i))
            {
                itr = tmpUnitMap.erase(itr);
                continue;
            }
            else
                ++itr;
        }

        for(std::list<Unit*>::const_iterator iunit = tmpUnitMap.begin(); iunit != tmpUnitMap.end(); ++iunit)
            AddUnitTarget((*iunit), i);
    }
}

void Spell::prepareDataForTriggerSystem()
{
    //==========================================================================================
    // Now fill data for trigger system, need know:
    // an spell trigger another or not ( m_canTrigger )
    // Create base triggers flags for Attacker and Victim ( m_procAttacker and  m_procVictim)
    //==========================================================================================
    // Fill flag can spell trigger or not
    // TODO: possible exist spell attribute for this
    m_canTrigger = false;

    if (m_CastItem)
        m_canTrigger = false;         // Do not trigger from item cast spell
    else if (!m_IsTriggeredSpell)
        m_canTrigger = true;          // Normal cast - can trigger
    else if (!m_triggeredByAuraSpell)
        m_canTrigger = true;          // Triggered from SPELL_EFFECT_TRIGGER_SPELL - can trigger

    if (!m_canTrigger)                // Exceptions (some periodic triggers)
    {
        switch (m_spellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_MAGE:
                // Arcane Missles / Blizzard triggers need do it
                if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000000000200080))
                    m_canTrigger = true;
                // Clearcasting trigger need do it
                else if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000000200000000) && m_spellInfo->SpellFamilyFlags2 & 0x8)
                    m_canTrigger = true;
                break;
            case SPELLFAMILY_WARLOCK: // For Hellfire Effect / Rain of Fire / Seed of Corruption triggers need do it
                if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000800000000060))
                    m_canTrigger = true;
                break;
            case SPELLFAMILY_PRIEST:  // For Penance heal/damage triggers need do it
                if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0001800000000000))
                    m_canTrigger = true;
                break;
            case SPELLFAMILY_ROGUE:   // For poisons need do it
                if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x000000101001E000))
                    m_canTrigger = true;
                break;
            case SPELLFAMILY_HUNTER:  // Hunter Rapid Killing/Explosive Trap Effect/Immolation Trap Effect/Frost Trap Aura/Snake Trap Effect/Explosive Shot
                if ((m_spellInfo->SpellFamilyFlags & UI64LIT(0x0100200000000214)) ||
                    m_spellInfo->SpellFamilyFlags2 & 0x200)
                    m_canTrigger = true;
                break;
            case SPELLFAMILY_PALADIN: // For Judgements (all) / Holy Shock triggers need do it
                if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0001000900B80400))
                    m_canTrigger = true;
                break;
            default:
                break;
        }
    }

    // Get data for type of attack and fill base info for trigger
    switch (m_spellInfo->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:
            m_procAttacker = PROC_FLAG_SUCCESSFUL_MELEE_SPELL_HIT;
            m_procVictim   = PROC_FLAG_TAKEN_MELEE_SPELL_HIT;
            break;
        case SPELL_DAMAGE_CLASS_RANGED:
            // Auto attack
            if (m_spellInfo->AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG)
            {
                m_procAttacker = PROC_FLAG_SUCCESSFUL_RANGED_HIT;
                m_procVictim   = PROC_FLAG_TAKEN_RANGED_HIT;
            }
            else // Ranged spell attack
            {
                m_procAttacker = PROC_FLAG_SUCCESSFUL_RANGED_SPELL_HIT;
                m_procVictim   = PROC_FLAG_TAKEN_RANGED_SPELL_HIT;
            }
            break;
        default:
            if (IsPositiveSpell(m_spellInfo->Id))                                 // Check for positive spell
            {
                m_procAttacker = PROC_FLAG_SUCCESSFUL_POSITIVE_SPELL;
                m_procVictim   = PROC_FLAG_TAKEN_POSITIVE_SPELL;
            }
            else if (m_spellInfo->AttributesEx2 & SPELL_ATTR_EX2_AUTOREPEAT_FLAG) // Wands auto attack
            {
                m_procAttacker = PROC_FLAG_SUCCESSFUL_RANGED_HIT;
                m_procVictim   = PROC_FLAG_TAKEN_RANGED_HIT;
            }
            else                                           // Negative spell
            {
                m_procAttacker = PROC_FLAG_SUCCESSFUL_NEGATIVE_SPELL_HIT;
                m_procVictim   = PROC_FLAG_TAKEN_NEGATIVE_SPELL_HIT;
            }
            break;
    }
    // Hunter traps spells (for Entrapment trigger)
    // Gives your Immolation Trap, Frost Trap, Explosive Trap, and Snake Trap ....
    if (m_spellInfo->SpellFamilyName == SPELLFAMILY_HUNTER && (m_spellInfo->SpellFamilyFlags & UI64LIT(0x000020000000001C)))
        m_procAttacker |= PROC_FLAG_ON_TRAP_ACTIVATION;
}

void Spell::CleanupTargetList()
{
    m_UniqueTargetInfo.clear();
    m_UniqueGOTargetInfo.clear();
    m_UniqueItemInfo.clear();
    m_delayMoment = 0;
}

void Spell::AddUnitTarget(Unit* pVictim, uint32 effIndex)
{
    if( m_spellInfo->Effect[effIndex] == 0 )
        return;

    // Check for effect immune skip if immuned
    bool immuned = pVictim->IsImmunedToSpellEffect(m_spellInfo, effIndex);

    uint64 targetGUID = pVictim->GetGUID();

    // Lookup target in already in list
    for(std::list<TargetInfo>::iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
    {
        if (targetGUID == ihit->targetGUID)                 // Found in list
        {
            if (!immuned)
                ihit->effectMask |= 1 << effIndex;          // Add only effect mask if not immuned
            return;
        }
    }

    // This is new target calculate data for him

    // Get spell hit result on target
    TargetInfo target;
    target.targetGUID = targetGUID;                         // Store target GUID
    target.effectMask = immuned ? 0 : 1 << effIndex;        // Store index of effect if not immuned
    target.processed  = false;                              // Effects not apply on target

    // Calculate hit result
    target.missCondition = m_caster->SpellHitResult(pVictim, m_spellInfo, m_canReflect);

    // Spell have speed - need calculate incoming time
    if (m_spellInfo->speed > 0.0f)
    {
        // calculate spell incoming interval
        float dist = m_caster->GetDistance(pVictim->GetPositionX(), pVictim->GetPositionY(), pVictim->GetPositionZ());
        if (dist < 5.0f) dist = 5.0f;
        target.timeDelay = (uint64) floor(dist / m_spellInfo->speed * 1000.0f);

        // Calculate minimum incoming time
        if (m_delayMoment == 0 || m_delayMoment>target.timeDelay)
            m_delayMoment = target.timeDelay;
    }
    else
        target.timeDelay = UI64LIT(0);

    // If target reflect spell back to caster
    if (target.missCondition == SPELL_MISS_REFLECT)
    {
        // Calculate reflected spell result on caster
        target.reflectResult =  m_caster->SpellHitResult(m_caster, m_spellInfo, m_canReflect);

        if (target.reflectResult == SPELL_MISS_REFLECT)     // Impossible reflect again, so simply deflect spell
            target.reflectResult = SPELL_MISS_PARRY;

        // Increase time interval for reflected spells by 1.5
        target.timeDelay += target.timeDelay >> 1;
    }
    else
        target.reflectResult = SPELL_MISS_NONE;

    // Add target to list
    m_UniqueTargetInfo.push_back(target);
}

void Spell::AddUnitTarget(uint64 unitGUID, uint32 effIndex)
{
    Unit* unit = m_caster->GetGUID() == unitGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster, unitGUID);
    if (unit)
        AddUnitTarget(unit, effIndex);
}

void Spell::AddGOTarget(GameObject* pVictim, uint32 effIndex)
{
    if( m_spellInfo->Effect[effIndex] == 0 )
        return;

    uint64 targetGUID = pVictim->GetGUID();

    // Lookup target in already in list
    for(std::list<GOTargetInfo>::iterator ihit = m_UniqueGOTargetInfo.begin(); ihit != m_UniqueGOTargetInfo.end(); ++ihit)
    {
        if (targetGUID == ihit->targetGUID)                 // Found in list
        {
            ihit->effectMask |= 1 << effIndex;              // Add only effect mask
            return;
        }
    }

    // This is new target calculate data for him

    GOTargetInfo target;
    target.targetGUID = targetGUID;
    target.effectMask = 1 << effIndex;
    target.processed  = false;                              // Effects not apply on target

    // Spell have speed - need calculate incoming time
    if (m_spellInfo->speed > 0.0f)
    {
        // calculate spell incoming interval
        float dist = m_caster->GetDistance(pVictim->GetPositionX(), pVictim->GetPositionY(), pVictim->GetPositionZ());
        if (dist < 5.0f) dist = 5.0f;
        target.timeDelay = (uint64) floor(dist / m_spellInfo->speed * 1000.0f);
        if (m_delayMoment==0 || m_delayMoment>target.timeDelay)
            m_delayMoment = target.timeDelay;
    }
    else
        target.timeDelay = UI64LIT(0);

    // Add target to list
    m_UniqueGOTargetInfo.push_back(target);
}

void Spell::AddGOTarget(uint64 goGUID, uint32 effIndex)
{
    GameObject* go = m_caster->GetMap()->GetGameObject(goGUID);
    if (go)
        AddGOTarget(go, effIndex);
}

void Spell::AddItemTarget(Item* pitem, uint32 effIndex)
{
    if( m_spellInfo->Effect[effIndex] == 0 )
        return;

    // Lookup target in already in list
    for(std::list<ItemTargetInfo>::iterator ihit = m_UniqueItemInfo.begin(); ihit != m_UniqueItemInfo.end(); ++ihit)
    {
        if (pitem == ihit->item)                            // Found in list
        {
            ihit->effectMask |= 1<<effIndex;                // Add only effect mask
            return;
        }
    }

    // This is new target add data

    ItemTargetInfo target;
    target.item       = pitem;
    target.effectMask = 1 << effIndex;
    m_UniqueItemInfo.push_back(target);
}

void Spell::DoAllEffectOnTarget(TargetInfo *target)
{
    if (target->processed)                                  // Check target
        return;
    target->processed = true;                               // Target checked in apply effects procedure

    // Get mask of effects for target
    uint32 mask = target->effectMask;

    Unit* unit = m_caster->GetGUID()==target->targetGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster,target->targetGUID);
    if (!unit)
        return;

    // Get original caster (if exist) and calculate damage/healing from him data
    Unit *caster = m_originalCaster ? m_originalCaster : m_caster;

    // Skip if m_originalCaster not available
    if (!caster)
        return;

    SpellMissInfo missInfo = target->missCondition;
    // Need init unitTarget by default unit (can changed in code on reflect)
    // Or on missInfo!=SPELL_MISS_NONE unitTarget undefined (but need in trigger subsystem)
    unitTarget = unit;

    // Reset damage/healing counter
    m_damage = 0;
    m_healing = 0;

    // Fill base trigger info
    uint32 procAttacker = m_procAttacker;
    uint32 procVictim   = m_procVictim;
    uint32 procEx       = PROC_EX_NONE;

    if (missInfo==SPELL_MISS_NONE)                          // In case spell hit target, do all effect on that target
        DoSpellHitOnUnit(unit, mask);
    else if (missInfo == SPELL_MISS_REFLECT)                // In case spell reflect from target, do all effect on caster (if hit)
    {
        if (target->reflectResult == SPELL_MISS_NONE)       // If reflected spell hit caster -> do all effect on him
            DoSpellHitOnUnit(m_caster, mask);
    }

    // All calculated do it!
    // Do healing and triggers
    if (m_healing)
    {
        bool crit = caster->isSpellCrit(NULL, m_spellInfo, m_spellSchoolMask);
        uint32 addhealth = m_healing;
        if (crit)
        {
            procEx |= PROC_EX_CRITICAL_HIT;
            addhealth = caster->SpellCriticalHealingBonus(m_spellInfo, addhealth, NULL);
        }
        else
            procEx |= PROC_EX_NORMAL_HIT;

        // Do triggers for unit (reflect triggers passed on hit phase for correct drop charge)
        if (m_canTrigger && missInfo != SPELL_MISS_REFLECT)
            caster->ProcDamageAndSpell(unitTarget, procAttacker, procVictim, procEx, addhealth, m_attackType, m_spellInfo);

        int32 gain = caster->DealHeal(unitTarget, addhealth, m_spellInfo, crit);
        unitTarget->getHostilRefManager().threatAssist(caster, float(gain) * 0.5f, m_spellInfo);
    }
    // Do damage and triggers
    else if (m_damage)
    {
        // Fill base damage struct (unitTarget - is real spell target)
        SpellNonMeleeDamage damageInfo(caster, unitTarget, m_spellInfo->Id, m_spellSchoolMask);

        // Add bonuses and fill damageInfo struct
        caster->CalculateSpellDamage(&damageInfo, m_damage, m_spellInfo);
        caster->DealDamageMods(damageInfo.target, damageInfo.damage, &damageInfo.absorb);

        // Send log damage message to client
        caster->SendSpellNonMeleeDamageLog(&damageInfo);

        procEx = createProcExtendMask(&damageInfo, missInfo);
        procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;

        // Do triggers for unit (reflect triggers passed on hit phase for correct drop charge)
        if (m_canTrigger && missInfo != SPELL_MISS_REFLECT)
            caster->ProcDamageAndSpell(unitTarget, procAttacker, procVictim, procEx, damageInfo.damage, m_attackType, m_spellInfo);

        caster->DealSpellDamage(&damageInfo, true);

        // Judgement of Blood
        if (m_spellInfo->SpellFamilyName == SPELLFAMILY_PALADIN && (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000000800000000)) && m_spellInfo->SpellIconID==153)
        {
            int32 damagePoint  = damageInfo.damage * 33 / 100;
            m_caster->CastCustomSpell(m_caster, 32220, &damagePoint, NULL, NULL, true);
        }
    }
    // Passive spell hits/misses or active spells only misses (only triggers)
    else
    {
        // Fill base damage struct (unitTarget - is real spell target)
        SpellNonMeleeDamage damageInfo(caster, unitTarget, m_spellInfo->Id, m_spellSchoolMask);
        procEx = createProcExtendMask(&damageInfo, missInfo);
        // Do triggers for unit (reflect triggers passed on hit phase for correct drop charge)
        if (m_canTrigger && missInfo != SPELL_MISS_REFLECT)
            caster->ProcDamageAndSpell(unit, procAttacker, procVictim, procEx, 0, m_attackType, m_spellInfo);
    }

    // Call scripted function for AI if this spell is casted upon a creature
    if(unit->GetTypeId()==TYPEID_UNIT)
    {
        // cast at creature (or GO) quest objectives update at successful cast finished (+channel finished)
        // ignore pets or autorepeat/melee casts for speed (not exist quest for spells (hm... )
        if( !((Creature*)unit)->isPet() && !IsAutoRepeat() && !IsNextMeleeSwingSpell() && !IsChannelActive() )
        {
            if ( Player* p = m_caster->GetCharmerOrOwnerPlayerOrPlayerItself() )
                p->CastedCreatureOrGO(unit->GetEntry(), unit->GetGUID(), m_spellInfo->Id);
        }

        if(((Creature*)unit)->AI())
            ((Creature*)unit)->AI()->SpellHit(m_caster ,m_spellInfo);
    }

    // Call scripted function for AI if this spell is casted by a creature
    if(m_caster->GetTypeId()==TYPEID_UNIT && ((Creature*)m_caster)->AI())
        ((Creature*)m_caster)->AI()->SpellHitTarget(unit, m_spellInfo);
}

void Spell::DoSpellHitOnUnit(Unit *unit, const uint32 effectMask)
{
    if(!unit || !effectMask)
        return;

    // Recheck immune (only for delayed spells)
    if( m_spellInfo->speed && (
        unit->IsImmunedToDamage(GetSpellSchoolMask(m_spellInfo), m_spellInfo) ||
        unit->IsImmunedToSpell(m_spellInfo)))
    {
        m_caster->SendSpellMiss(unit, m_spellInfo->Id, SPELL_MISS_IMMUNE);
        return;
    }

    if (unit->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)unit)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET, m_spellInfo->Id);
        ((Player*)unit)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_BE_SPELL_TARGET2, m_spellInfo->Id);
    }

    if(m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)m_caster)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_CAST_SPELL2, m_spellInfo->Id, 0, unit);
    }

    if( m_caster != unit )
    {
        // Recheck  UNIT_FLAG_NON_ATTACKABLE for delayed spells
        if (m_spellInfo->speed > 0.0f &&
            unit->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE) &&
            unit->GetCharmerOrOwnerGUID() != m_caster->GetGUID())
        {
            m_caster->SendSpellMiss(unit, m_spellInfo->Id, SPELL_MISS_EVADE);
            return;
        }

        if( !m_caster->IsFriendlyTo(unit) )
        {
            // for delayed spells ignore not visible explicit target
            if(m_spellInfo->speed > 0.0f && unit == m_targets.getUnitTarget() && !unit->isVisibleForOrDetect(m_caster,false))
            {
                m_caster->SendSpellMiss(unit, m_spellInfo->Id, SPELL_MISS_EVADE);
                return;
            }

            // Check if spell can break other's stealth
            if (isSpellBreakOthersStealth(m_spellInfo))
                unit->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);

            if( !(m_spellInfo->AttributesEx3 & SPELL_ATTR_EX3_NO_INITIAL_AGGRO) )
            {
                if(!unit->IsStandState() && !unit->hasUnitState(UNIT_STAT_STUNNED))
                    unit->SetStandState(UNIT_STAND_STATE_STAND);

                if(!unit->isInCombat() && unit->GetTypeId() != TYPEID_PLAYER && ((Creature*)unit)->AI())
                    ((Creature*)unit)->AI()->AttackedBy(m_caster);

                unit->AddThreat(m_caster, 0.0f);
                unit->SetInCombatWith(m_caster);
                m_caster->SetInCombatWith(unit);

                if(Player *attackedPlayer = unit->GetCharmerOrOwnerPlayerOrPlayerItself())
                {
                    m_caster->SetContestedPvP(attackedPlayer);
                }
            }
        }
        else
        {
            // for delayed spells ignore negative spells (after duel end) for friendly targets
            if(m_spellInfo->speed > 0.0f && !IsPositiveSpell(m_spellInfo->Id))
            {
                m_caster->SendSpellMiss(unit, m_spellInfo->Id, SPELL_MISS_EVADE);
                return;
            }

            // assisting case, healing and resurrection
            if(unit->hasUnitState(UNIT_STAT_ATTACK_PLAYER))
                m_caster->SetContestedPvP();
            if( unit->isInCombat() && !(m_spellInfo->AttributesEx3 & SPELL_ATTR_EX3_NO_INITIAL_AGGRO) )
            {
                m_caster->SetInCombatState(unit->GetCombatTimer() > 0);
                unit->getHostilRefManager().threatAssist(m_caster, 0.0f);
            }
        }
    }

    // Get Data Needed for Diminishing Returns, some effects may have multiple auras, so this must be done on spell hit, not aura add
    m_diminishGroup = GetDiminishingReturnsGroupForSpell(m_spellInfo,m_triggeredByAuraSpell);
    m_diminishLevel = unit->GetDiminishing(m_diminishGroup);
    // Increase Diminishing on unit, current informations for actually casts will use values above
    if((GetDiminishingReturnsGroupType(m_diminishGroup) == DRTYPE_PLAYER && unit->GetTypeId() == TYPEID_PLAYER) || GetDiminishingReturnsGroupType(m_diminishGroup) == DRTYPE_ALL)
        unit->IncrDiminishing(m_diminishGroup);

    // Apply additional spell effects to target
    if (m_preCastSpell)
        m_caster->CastSpell(unit, m_preCastSpell, true, m_CastItem);

    for(uint32 effectNumber = 0; effectNumber < 3; ++effectNumber)
    {
        if (effectMask & (1 << effectNumber))
        {
            HandleEffects(unit, NULL, NULL, effectNumber, m_damageMultipliers[effectNumber]);
            if ( m_applyMultiplierMask & (1 << effectNumber) )
            {
                // Get multiplier
                float multiplier = m_spellInfo->DmgMultiplier[effectNumber];
                // Apply multiplier mods
                if(Player* modOwner = m_originalCaster->GetSpellModOwner())
                    modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_EFFECT_PAST_FIRST, multiplier, this);
                m_damageMultipliers[effectNumber] *= multiplier;
            }
        }
    }
}

void Spell::DoAllEffectOnTarget(GOTargetInfo *target)
{
    if (target->processed)                                  // Check target
        return;
    target->processed = true;                               // Target checked in apply effects procedure

    uint32 effectMask = target->effectMask;
    if(!effectMask)
        return;

    GameObject* go = m_caster->GetMap()->GetGameObject(target->targetGUID);
    if(!go)
        return;

    for(uint32 effectNumber = 0; effectNumber < 3; ++effectNumber)
        if (effectMask & (1 << effectNumber))
            HandleEffects(NULL, NULL, go, effectNumber);

    // cast at creature (or GO) quest objectives update at successful cast finished (+channel finished)
    // ignore autorepeat/melee casts for speed (not exist quest for spells (hm... )
    if( !IsAutoRepeat() && !IsNextMeleeSwingSpell() && !IsChannelActive() )
    {
        if ( Player* p = m_caster->GetCharmerOrOwnerPlayerOrPlayerItself() )
            p->CastedCreatureOrGO(go->GetEntry(), go->GetGUID(), m_spellInfo->Id);
    }
}

void Spell::DoAllEffectOnTarget(ItemTargetInfo *target)
{
    uint32 effectMask = target->effectMask;
    if(!target->item || !effectMask)
        return;

    for(uint32 effectNumber = 0; effectNumber < 3; ++effectNumber)
        if (effectMask & (1 << effectNumber))
            HandleEffects(NULL, target->item, NULL, effectNumber);
}

bool Spell::IsAliveUnitPresentInTargetList()
{
    // Not need check return true
    if (m_needAliveTargetMask == 0)
        return true;

    uint8 needAliveTargetMask = m_needAliveTargetMask;

    for(std::list<TargetInfo>::const_iterator ihit= m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
    {
        if( ihit->missCondition == SPELL_MISS_NONE && (needAliveTargetMask & ihit->effectMask) )
        {
            Unit *unit = m_caster->GetGUID() == ihit->targetGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster, ihit->targetGUID);

            if (unit && unit->isAlive())
                needAliveTargetMask &= ~ihit->effectMask;   // remove from need alive mask effect that have alive target
        }
    }

    // is all effects from m_needAliveTargetMask have alive targets
    return needAliveTargetMask == 0;
}

// Helper for Chain Healing
// Spell target first
// Raidmates then descending by injury suffered (MaxHealth - Health)
// Other players/mobs then descending by injury suffered (MaxHealth - Health)
struct ChainHealingOrder : public std::binary_function<const Unit*, const Unit*, bool>
{
    const Unit* MainTarget;
    ChainHealingOrder(Unit const* Target) : MainTarget(Target) {};
    // functor for operator ">"
    bool operator()(Unit const* _Left, Unit const* _Right) const
    {
        return (ChainHealingHash(_Left) < ChainHealingHash(_Right));
    }
    int32 ChainHealingHash(Unit const* Target) const
    {
        if (Target == MainTarget)
            return 0;
        else if (Target->GetTypeId() == TYPEID_PLAYER && MainTarget->GetTypeId() == TYPEID_PLAYER &&
            ((Player const*)Target)->IsInSameRaidWith((Player const*)MainTarget))
        {
            if (Target->GetHealth() == Target->GetMaxHealth())
                return 40000;
            else
                return 20000 - Target->GetMaxHealth() + Target->GetHealth();
        }
        else
            return 40000 - Target->GetMaxHealth() + Target->GetHealth();
    }
};

class ChainHealingFullHealth: std::unary_function<const Unit*, bool>
{
    public:
        const Unit* MainTarget;
        ChainHealingFullHealth(const Unit* Target) : MainTarget(Target) {};

        bool operator()(const Unit* Target)
        {
            return (Target != MainTarget && Target->GetHealth() == Target->GetMaxHealth());
        }
};

// Helper for targets nearest to the spell target
// The spell target is always first unless there is a target at _completely_ the same position (unbelievable case)
struct TargetDistanceOrder : public std::binary_function<const Unit, const Unit, bool>
{
    const Unit* MainTarget;
    TargetDistanceOrder(const Unit* Target) : MainTarget(Target) {};
    // functor for operator ">"
    bool operator()(const Unit* _Left, const Unit* _Right) const
    {
        return MainTarget->GetDistanceOrder(_Left,_Right);
    }
};

void Spell::SetTargetMap(uint32 i,uint32 cur,UnitList& TagUnitMap)
{
    float radius;
    if (m_spellInfo->EffectRadiusIndex[i])
        radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[i]));
    else
        radius = GetSpellMaxRange(sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex));

    if(m_originalCaster)
        if(Player* modOwner = m_originalCaster->GetSpellModOwner())
            modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_RADIUS, radius, this);

    uint32 EffectChainTarget = m_spellInfo->EffectChainTarget[i];
    if(m_originalCaster)
        if(Player* modOwner = m_originalCaster->GetSpellModOwner())
            modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_JUMP_TARGETS, EffectChainTarget, this);

    // Get spell max affected targets
    uint32 unMaxTargets = m_spellInfo->MaxAffectedTargets;

    // custom target amount cases
    switch(m_spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_DRUID:
            // Starfall
            if (m_spellInfo->SpellFamilyFlags2 & UI64LIT(0x00000100))
                unMaxTargets = 2;
            break;
        default:
            break;
    }

    Unit::AuraList const& mod = m_caster->GetAurasByType(SPELL_AURA_MOD_MAX_AFFECTED_TARGETS);
    for(Unit::AuraList::const_iterator m = mod.begin(); m != mod.end(); ++m)
    {
        if (!(*m)->isAffectedOnSpell(m_spellInfo))
            continue;
        unMaxTargets+=(*m)->GetModifier()->m_amount;
    }

    switch(cur)
    {
        case TARGET_TOTEM_EARTH:
        case TARGET_TOTEM_WATER:
        case TARGET_TOTEM_AIR:
        case TARGET_TOTEM_FIRE:
        case TARGET_SELF:
        case TARGET_SELF2:
        case TARGET_DYNAMIC_OBJECT:
        case TARGET_AREAEFFECT_CUSTOM:
        case TARGET_SUMMON:
        {
            TagUnitMap.push_back(m_caster);
            break;
        }
        case TARGET_AREAEFFECT_CUSTOM_2:
        {
            // used for targeting gameobjects
            TagUnitMap.push_back(m_caster);
            break;
        }
        case TARGET_RANDOM_ENEMY_CHAIN_IN_AREA:
        {
            m_targets.m_targetMask = 0;
            unMaxTargets = EffectChainTarget;
            float max_range = radius + unMaxTargets * CHAIN_SPELL_JUMP_RADIUS;

            CellPair p(MaNGOS::ComputeCellPair(m_caster->GetPositionX(), m_caster->GetPositionY()));
            Cell cell(p);
            cell.data.Part.reserved = ALL_DISTRICT;
            cell.SetNoCreate();

            std::list<Unit *> tempUnitMap;

            {
                MaNGOS::AnyAoETargetUnitInObjectRangeCheck u_check(m_caster, m_caster, max_range);
                MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck> searcher(m_caster, tempUnitMap, u_check);

                TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
                TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

                CellLock<GridReadGuard> cell_lock(cell, p);
                cell_lock->Visit(cell_lock, world_unit_searcher, *m_caster->GetMap());
                cell_lock->Visit(cell_lock, grid_unit_searcher, *m_caster->GetMap());
            }

            if(tempUnitMap.empty())
                break;

            tempUnitMap.sort(TargetDistanceOrder(m_caster));

            //Now to get us a random target that's in the initial range of the spell
            uint32 t = 0;
            std::list<Unit *>::iterator itr = tempUnitMap.begin();
            while(itr!= tempUnitMap.end() && (*itr)->IsWithinDist(m_caster,radius))
                ++t, ++itr;

            if(!t)
                break;

            itr = tempUnitMap.begin();
            std::advance(itr, rand()%t);
            Unit *pUnitTarget = *itr;
            TagUnitMap.push_back(pUnitTarget);

            tempUnitMap.erase(itr);

            tempUnitMap.sort(TargetDistanceOrder(pUnitTarget));

            t = unMaxTargets - 1;
            Unit *prev = pUnitTarget;
            std::list<Unit*>::iterator next = tempUnitMap.begin();

            while(t && next != tempUnitMap.end() )
            {
                if(!prev->IsWithinDist(*next,CHAIN_SPELL_JUMP_RADIUS))
                    break;

                if(!prev->IsWithinLOSInMap(*next))
                {
                    ++next;
                    continue;
                }

                prev = *next;
                TagUnitMap.push_back(prev);
                tempUnitMap.erase(next);
                tempUnitMap.sort(TargetDistanceOrder(prev));
                next = tempUnitMap.begin();

                --t;
            }
        }break;
        case TARGET_RANDOM_FRIEND_CHAIN_IN_AREA:
        {
            m_targets.m_targetMask = 0;
            unMaxTargets = EffectChainTarget;
            float max_range = radius + unMaxTargets * CHAIN_SPELL_JUMP_RADIUS;
            CellPair p(MaNGOS::ComputeCellPair(m_caster->GetPositionX(), m_caster->GetPositionY()));
            Cell cell(p);
            cell.data.Part.reserved = ALL_DISTRICT;
            cell.SetNoCreate();
            std::list<Unit *> tempUnitMap;
            {
                MaNGOS::AnyFriendlyUnitInObjectRangeCheck u_check(m_caster, m_caster, max_range);
                MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck> searcher(m_caster, tempUnitMap, u_check);

                TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck>, WorldTypeMapContainer > world_unit_searcher(searcher);
                TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck>, GridTypeMapContainer >  grid_unit_searcher(searcher);

                CellLock<GridReadGuard> cell_lock(cell, p);
                cell_lock->Visit(cell_lock, world_unit_searcher, *m_caster->GetMap());
                cell_lock->Visit(cell_lock, grid_unit_searcher, *m_caster->GetMap());
            }

            if(tempUnitMap.empty())
                break;

            tempUnitMap.sort(TargetDistanceOrder(m_caster));

            //Now to get us a random target that's in the initial range of the spell
            uint32 t = 0;
            std::list<Unit *>::iterator itr = tempUnitMap.begin();
            while(itr!= tempUnitMap.end() && (*itr)->IsWithinDist(m_caster,radius))
                ++t, ++itr;

            if(!t)
                break;

            itr = tempUnitMap.begin();
            std::advance(itr, rand()%t);
            Unit *pUnitTarget = *itr;
            TagUnitMap.push_back(pUnitTarget);

            tempUnitMap.erase(itr);

            tempUnitMap.sort(TargetDistanceOrder(pUnitTarget));

            t = unMaxTargets - 1;
            Unit *prev = pUnitTarget;
            std::list<Unit*>::iterator next = tempUnitMap.begin();

            while(t && next != tempUnitMap.end() )
            {
                if(!prev->IsWithinDist(*next,CHAIN_SPELL_JUMP_RADIUS))
                    break;

                if(!prev->IsWithinLOSInMap(*next))
                {
                    ++next;
                    continue;
                }
                prev = *next;
                TagUnitMap.push_back(prev);
                tempUnitMap.erase(next);
                tempUnitMap.sort(TargetDistanceOrder(prev));
                next = tempUnitMap.begin();
                --t;
            }
        }break;
        case TARGET_PET:
        {
            Pet* tmpUnit = m_caster->GetPet();
            if (!tmpUnit) break;
            TagUnitMap.push_back(tmpUnit);
            break;
        }
        case TARGET_CHAIN_DAMAGE:
        {
            if (EffectChainTarget <= 1)
            {
                if(Unit* pUnitTarget = m_caster->SelectMagnetTarget(m_targets.getUnitTarget(), m_spellInfo))
                {
                    m_targets.setUnitTarget(pUnitTarget);
                    TagUnitMap.push_back(pUnitTarget);
                }
            }
            else
            {
                Unit* pUnitTarget = m_targets.getUnitTarget();
                Unit* originalCaster = GetOriginalCaster();
                if(!pUnitTarget || !originalCaster)
                    break;

                unMaxTargets = EffectChainTarget;

                float max_range;
                if(m_spellInfo->DmgClass==SPELL_DAMAGE_CLASS_MELEE)
                    max_range = radius;                     //
                else
                    //FIXME: This very like horrible hack and wrong for most spells
                    max_range = radius + unMaxTargets * CHAIN_SPELL_JUMP_RADIUS;

                CellPair p(MaNGOS::ComputeCellPair(m_caster->GetPositionX(), m_caster->GetPositionY()));
                Cell cell(p);
                cell.data.Part.reserved = ALL_DISTRICT;
                cell.SetNoCreate();

                std::list<Unit *> tempUnitMap;
                {
                    MaNGOS::AnyAoETargetUnitInObjectRangeCheck u_check(pUnitTarget, originalCaster, max_range, false);
                    MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck> searcher(m_caster, tempUnitMap, u_check);
                    TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck>, WorldTypeMapContainer> world_unit_searcher(searcher);
                    TypeContainerVisitor<MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck>, GridTypeMapContainer>  grid_unit_searcher(searcher);
                    CellLock<GridReadGuard> cell_lock(cell, p);

                    cell_lock->Visit(cell_lock, world_unit_searcher, *m_caster->GetMap());
                    cell_lock->Visit(cell_lock, grid_unit_searcher, *m_caster->GetMap());
                }
                if (tempUnitMap.empty())
                    break;

                tempUnitMap.sort(TargetDistanceOrder(pUnitTarget));

                if (*tempUnitMap.begin() == pUnitTarget)
                    tempUnitMap.erase (tempUnitMap.begin());

                TagUnitMap.push_back(pUnitTarget);
                uint32 t = unMaxTargets - 1;
                Unit *prev = pUnitTarget;
                std::list<Unit*>::iterator next = tempUnitMap.begin();

                while (t && next != tempUnitMap.end())
                {
                    if (!prev->IsWithinDist (*next,CHAIN_SPELL_JUMP_RADIUS))
                        break;
                    if (!prev->IsWithinLOSInMap (*next))
                    {
                        ++next;
                        continue;
                    }
                    prev = *next;
                    TagUnitMap.push_back(prev);
                    tempUnitMap.erase(next);
                    tempUnitMap.sort (TargetDistanceOrder(prev));
                    next = tempUnitMap.begin();
                    --t;
                }
            }
        }break;
        case TARGET_ALL_ENEMY_IN_AREA:
        {
            FillAreaTargets(TagUnitMap,m_targets.m_destX, m_targets.m_destY,radius,PUSH_DEST_CENTER,SPELL_TARGETS_AOE_DAMAGE);
            break;
        }
        case TARGET_AREAEFFECT_INSTANT:
        {
            SpellTargets targetB = SPELL_TARGETS_AOE_DAMAGE;
            // Select friendly targets for positive effect
            if (IsPositiveEffect(m_spellInfo->Id, i))
                targetB = SPELL_TARGETS_FRIENDLY;

            FillAreaTargets(TagUnitMap,m_caster->GetPositionX(), m_caster->GetPositionY(),radius, PUSH_DEST_CENTER, targetB);

            // exclude caster
            TagUnitMap.remove(m_caster);
        }
        case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
        {
            // targets the ground, not the units in the area
            if (m_spellInfo->Effect[i]!=SPELL_EFFECT_PERSISTENT_AREA_AURA)
            {
                FillAreaTargets(TagUnitMap,m_targets.m_destX, m_targets.m_destY,radius,PUSH_DEST_CENTER,SPELL_TARGETS_AOE_DAMAGE);

                // exclude caster (this can be important if this not original caster)
                TagUnitMap.remove(m_caster);
            }
        }break;
        case TARGET_DUELVSPLAYER_COORDINATES:
        {
            if(Unit* currentTarget = m_targets.getUnitTarget())
            {
                m_targets.setDestination(currentTarget->GetPositionX(), currentTarget->GetPositionY(), currentTarget->GetPositionZ());
                TagUnitMap.push_back(currentTarget);
            }
        }break;
        case TARGET_ALL_PARTY_AROUND_CASTER:
        case TARGET_ALL_PARTY_AROUND_CASTER_2:
        case TARGET_ALL_PARTY:
            FillRaidOrPartyTargets(TagUnitMap,m_caster,radius,false,true,true);
            break;
        case TARGET_ALL_RAID_AROUND_CASTER:
        {
            if(m_spellInfo->Id == 57669)                    // Replenishment (special target selection)
                FillRaidOrPartyManaPriorityTargets(TagUnitMap, m_caster, radius, 10, true, false, false);
            else if (m_spellInfo->Id==52759)                //Ancestral Awakening (special target selection)
                FillRaidOrPartyHealthPriorityTargets(TagUnitMap, m_caster, radius, 1, true, false, false);
            else
                FillRaidOrPartyTargets(TagUnitMap, m_caster, radius, true, true, true);
            break;
        }
        case TARGET_SINGLE_FRIEND:
        case TARGET_SINGLE_FRIEND_2:
        {
            if(m_targets.getUnitTarget())
                TagUnitMap.push_back(m_targets.getUnitTarget());
        }break;
        case TARGET_NONCOMBAT_PET:
        {
            if(Unit* target = m_targets.getUnitTarget())
                if( target->GetTypeId() == TYPEID_UNIT && ((Creature*)target)->isPet() && ((Pet*)target)->getPetType() == MINI_PET)
                    TagUnitMap.push_back(target);
        }break;
        case TARGET_CASTER_COORDINATES:
        {
            // Check original caster is GO - set its coordinates as dst cast
            WorldObject *caster = NULL;
            if (IS_GAMEOBJECT_GUID(m_originalCasterGUID))
                caster = m_caster->GetMap()->GetGameObject(m_originalCasterGUID);
            if (!caster)
                caster = m_caster;
            // Set dest for targets
            m_targets.setDestination(caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());
        }break;
        case TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER:
            // special target order
            if (m_spellInfo->Id==64904)                     // Hymn of Hope
                // target amount stored in parent spell dummy effect but hard for access
                FillRaidOrPartyManaPriorityTargets(TagUnitMap, m_caster, radius, 3, true, false, false);
            else
                FillAreaTargets(TagUnitMap, m_targets.m_destX, m_targets.m_destY, radius, PUSH_SELF_CENTER, SPELL_TARGETS_FRIENDLY);
            break;
        case TARGET_ALL_FRIENDLY_UNITS_IN_AREA:
            FillAreaTargets(TagUnitMap, m_targets.m_destX, m_targets.m_destY, radius, PUSH_DEST_CENTER, SPELL_TARGETS_FRIENDLY);
            break;
        // TARGET_SINGLE_PARTY means that the spells can only be casted on a party member and not on the caster (some seals, fire shield from imp, etc..)
        case TARGET_SINGLE_PARTY:
        {
            Unit *target = m_targets.getUnitTarget();
            // Thoses spells apparently can't be casted on the caster.
            if( target && target != m_caster)
            {
                // Can only be casted on group's members or its pets
                Group  *pGroup = NULL;

                Unit* owner = m_caster->GetCharmerOrOwner();
                Unit *targetOwner = target->GetCharmerOrOwner();
                if(owner)
                {
                    if(owner->GetTypeId() == TYPEID_PLAYER)
                    {
                        if( target == owner )
                        {
                            TagUnitMap.push_back(target);
                            break;
                        }
                        pGroup = ((Player*)owner)->GetGroup();
                    }
                }
                else if (m_caster->GetTypeId() == TYPEID_PLAYER)
                {
                    if( targetOwner == m_caster && target->GetTypeId() == TYPEID_UNIT && ((Creature*)target)->isPet())
                    {
                        TagUnitMap.push_back(target);
                        break;
                    }
                    pGroup = ((Player*)m_caster)->GetGroup();
                }

                if(pGroup)
                {
                    // Our target can also be a player's pet who's grouped with us or our pet. But can't be controlled player
                    if(targetOwner)
                    {
                        if( targetOwner->GetTypeId() == TYPEID_PLAYER &&
                            target->GetTypeId() == TYPEID_UNIT && (((Creature*)target)->isPet()) &&
                            target->GetOwnerGUID() == targetOwner->GetGUID() &&
                            pGroup->IsMember(((Player*)targetOwner)->GetGUID()))
                        {
                            TagUnitMap.push_back(target);
                        }
                    }
                    // 1Our target can be a player who is on our group
                    else if (target->GetTypeId() == TYPEID_PLAYER && pGroup->IsMember(((Player*)target)->GetGUID()))
                    {
                        TagUnitMap.push_back(target);
                    }
                }
            }
        }break;
        case TARGET_GAMEOBJECT:
        {
            if(m_targets.getGOTarget())
                AddGOTarget(m_targets.getGOTarget(), i);
        }break;
        case TARGET_IN_FRONT_OF_CASTER:
        {
            bool inFront = m_spellInfo->SpellVisual[0] != 3879;
            FillAreaTargets(TagUnitMap,m_caster->GetPositionX(), m_caster->GetPositionY(),radius,inFront ? PUSH_IN_FRONT : PUSH_IN_BACK,SPELL_TARGETS_AOE_DAMAGE);
            break;
        }
        case TARGET_DUELVSPLAYER:
        {
            Unit *target = m_targets.getUnitTarget();
            if(target)
            {
                if(m_caster->IsFriendlyTo(target))
                {
                    TagUnitMap.push_back(target);
                }
                else
                {
                    if(Unit* pUnitTarget = m_caster->SelectMagnetTarget(m_targets.getUnitTarget(), m_spellInfo))
                    {
                        m_targets.setUnitTarget(pUnitTarget);
                        TagUnitMap.push_back(pUnitTarget);
                    }
                }
            }
        }break;
        case TARGET_GAMEOBJECT_ITEM:
        {
            if(m_targets.getGOTargetGUID())
                AddGOTarget(m_targets.getGOTarget(), i);
            else if(m_targets.getItemTarget())
                AddItemTarget(m_targets.getItemTarget(), i);
            break;
        }
        case TARGET_MASTER:
        {
            if(Unit* owner = m_caster->GetCharmerOrOwner())
                TagUnitMap.push_back(owner);
            break;
        }
        case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
        {
            // targets the ground, not the units in the area
            if (m_spellInfo->Effect[i]!=SPELL_EFFECT_PERSISTENT_AREA_AURA)
                FillAreaTargets(TagUnitMap, m_targets.m_destX, m_targets.m_destY, radius, PUSH_DEST_CENTER, SPELL_TARGETS_AOE_DAMAGE);
            break;
        }
        case TARGET_MINION:
        {
            if(m_spellInfo->Effect[i] != SPELL_EFFECT_DUEL)
                TagUnitMap.push_back(m_caster);
        }break;
        case TARGET_SINGLE_ENEMY:
        {
            if(Unit* pUnitTarget = m_caster->SelectMagnetTarget(m_targets.getUnitTarget(), m_spellInfo))
            {
                m_targets.setUnitTarget(pUnitTarget);
                TagUnitMap.push_back(pUnitTarget);
            }
        }break;
        case TARGET_AREAEFFECT_PARTY:
        {
            Unit* owner = m_caster->GetCharmerOrOwner();
            Player *pTarget = NULL;

            if(owner)
            {
                TagUnitMap.push_back(m_caster);
                if(owner->GetTypeId() == TYPEID_PLAYER)
                    pTarget = (Player*)owner;
            }
            else if (m_caster->GetTypeId() == TYPEID_PLAYER)
            {
                if(Unit* target = m_targets.getUnitTarget())
                {
                    if( target->GetTypeId() != TYPEID_PLAYER)
                    {
                        if(((Creature*)target)->isPet())
                        {
                            Unit *targetOwner = target->GetOwner();
                            if(targetOwner->GetTypeId() == TYPEID_PLAYER)
                                pTarget = (Player*)targetOwner;
                        }
                    }
                    else
                        pTarget = (Player*)target;
                }
            }

            Group* pGroup = pTarget ? pTarget->GetGroup() : NULL;

            if(pGroup)
            {
                uint8 subgroup = pTarget->GetSubGroup();

                for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    Player* Target = itr->getSource();

                    // IsHostileTo check duel and controlled by enemy
                    if(Target && Target->GetSubGroup()==subgroup && !m_caster->IsHostileTo(Target))
                    {
                        if( pTarget->IsWithinDistInMap(Target, radius) )
                            TagUnitMap.push_back(Target);

                        if(Pet* pet = Target->GetPet())
                            if( pTarget->IsWithinDistInMap(pet, radius) )
                                TagUnitMap.push_back(pet);
                    }
                }
            }
            else if (owner)
            {
                if(m_caster->IsWithinDistInMap(owner, radius))
                    TagUnitMap.push_back(owner);
            }
            else if(pTarget)
            {
                TagUnitMap.push_back(pTarget);

                if(Pet* pet = pTarget->GetPet())
                    if( m_caster->IsWithinDistInMap(pet, radius) )
                        TagUnitMap.push_back(pet);
            }

        }break;
        case TARGET_SCRIPT:
        {
            if(m_targets.getUnitTarget())
                TagUnitMap.push_back(m_targets.getUnitTarget());
            if(m_targets.getItemTarget())
                AddItemTarget(m_targets.getItemTarget(), i);
        }break;
        case TARGET_SELF_FISHING:
        {
            TagUnitMap.push_back(m_caster);
        }break;
        case TARGET_CHAIN_HEAL:
        {
            Unit* pUnitTarget = m_targets.getUnitTarget();
            if(!pUnitTarget)
                break;

            if (EffectChainTarget <= 1)
                TagUnitMap.push_back(pUnitTarget);
            else
            {
                unMaxTargets = EffectChainTarget;
                float max_range = radius + unMaxTargets * CHAIN_SPELL_JUMP_RADIUS;

                UnitList tempUnitMap;

                FillAreaTargets(tempUnitMap, m_caster->GetPositionX(), m_caster->GetPositionY(), max_range, PUSH_SELF_CENTER, SPELL_TARGETS_FRIENDLY);

                if(m_caster != pUnitTarget && std::find(tempUnitMap.begin(),tempUnitMap.end(), m_caster) == tempUnitMap.end() )
                    tempUnitMap.push_front(m_caster);

                tempUnitMap.sort(TargetDistanceOrder(pUnitTarget));

                if(tempUnitMap.empty())
                    break;

                if(*tempUnitMap.begin() == pUnitTarget)
                    tempUnitMap.erase(tempUnitMap.begin());

                TagUnitMap.push_back(pUnitTarget);
                uint32 t = unMaxTargets - 1;
                Unit *prev = pUnitTarget;
                std::list<Unit*>::iterator next = tempUnitMap.begin();

                while(t && next != tempUnitMap.end() )
                {
                    if(!prev->IsWithinDist(*next, CHAIN_SPELL_JUMP_RADIUS))
                        break;

                    if(!prev->IsWithinLOSInMap(*next))
                    {
                        ++next;
                        continue;
                    }

                    if((*next)->GetHealth() == (*next)->GetMaxHealth())
                    {
                        next = tempUnitMap.erase(next);
                        continue;
                    }

                    prev = *next;
                    TagUnitMap.push_back(prev);
                    tempUnitMap.erase(next);
                    tempUnitMap.sort(TargetDistanceOrder(prev));
                    next = tempUnitMap.begin();

                    --t;
                }
            }
        }break;
        case TARGET_CURRENT_ENEMY_COORDINATES:
        {
            Unit* currentTarget = m_targets.getUnitTarget();
            if(currentTarget)
            {
                TagUnitMap.push_back(currentTarget);
                m_targets.setDestination(currentTarget->GetPositionX(), currentTarget->GetPositionY(), currentTarget->GetPositionZ());
                if(m_spellInfo->EffectImplicitTargetB[i]==TARGET_ALL_ENEMY_IN_AREA_INSTANT)
                    FillAreaTargets(TagUnitMap, currentTarget->GetPositionX(), currentTarget->GetPositionY(), radius, PUSH_TARGET_CENTER, SPELL_TARGETS_AOE_DAMAGE);
            }
            break;
        }
        case TARGET_AREAEFFECT_PARTY_AND_CLASS:
        {
            Player* targetPlayer = m_targets.getUnitTarget() && m_targets.getUnitTarget()->GetTypeId() == TYPEID_PLAYER
                ? (Player*)m_targets.getUnitTarget() : NULL;

            Group* pGroup = targetPlayer ? targetPlayer->GetGroup() : NULL;
            if(pGroup)
            {
                for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    Player* Target = itr->getSource();

                    // IsHostileTo check duel and controlled by enemy
                    if( Target && targetPlayer->IsWithinDistInMap(Target, radius) &&
                        targetPlayer->getClass() == Target->getClass() &&
                        !m_caster->IsHostileTo(Target) )
                    {
                        TagUnitMap.push_back(Target);
                    }
                }
            }
            else if(m_targets.getUnitTarget())
                TagUnitMap.push_back(m_targets.getUnitTarget());
            break;
        }
        case TARGET_TABLE_X_Y_Z_COORDINATES:
        {
            SpellTargetPosition const* st = spellmgr.GetSpellTargetPosition(m_spellInfo->Id);
            if(st)
            {
                if (st->target_mapId == m_caster->GetMapId())
                    m_targets.setDestination(st->target_X, st->target_Y, st->target_Z);
                else
                    sLog.outError( "SPELL: wrong map (%u instead %u) target coordinates for spell ID %u", st->target_mapId, m_caster->GetMapId(), m_spellInfo->Id );
            }
            else
                sLog.outError( "SPELL: unknown target coordinates for spell ID %u", m_spellInfo->Id );
        }break;
        case TARGET_BEHIND_VICTIM:
        {
            Unit *pTarget = NULL;

            // explicit cast data from client or server-side cast
            // some spell at client send caster
            if(m_targets.getUnitTarget() && m_targets.getUnitTarget()!=m_caster)
                pTarget = m_targets.getUnitTarget();
            else if(m_caster->getVictim())
                pTarget = m_caster->getVictim();
            else if(m_caster->GetTypeId() == TYPEID_PLAYER)
                pTarget = ObjectAccessor::GetUnit(*m_caster, ((Player*)m_caster)->GetSelection());

            if(pTarget)
            {
                float _target_x, _target_y, _target_z;
                pTarget->GetClosePoint(_target_x, _target_y, _target_z, m_caster->GetObjectSize(), CONTACT_DISTANCE, M_PI);
                if(pTarget->IsWithinLOS(_target_x, _target_y, _target_z))
                {
                    TagUnitMap.push_back(m_caster);
                    m_targets.setDestination(_target_x, _target_y, _target_z);
                }
            }
            break;
        }
        case TARGET_DYNAMIC_OBJECT_COORDINATES:
        {
            // if parent spell create dynamic object extract area from it
            if(DynamicObject* dynObj = m_caster->GetDynObject(m_triggeredByAuraSpell ? m_triggeredByAuraSpell->Id : m_spellInfo->Id))
                m_targets.setDestination(dynObj->GetPositionX(), dynObj->GetPositionY(), dynObj->GetPositionZ());
            break;
        }
        case TARGET_DIRECTLY_FORWARD:
        {
            if (!(m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION))
            {
                SpellRangeEntry const* rEntry = sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex);
                float minRange = GetSpellMinRange(rEntry);
                float maxRange = GetSpellMaxRange(rEntry);
                float dist = minRange+ rand_norm()*(maxRange-minRange);

                float _target_x, _target_y, _target_z;
                m_caster->GetClosePoint(_target_x, _target_y, _target_z, m_caster->GetObjectSize(), dist);
                m_targets.setDestination(_target_x, _target_y, _target_z);
            }

            TagUnitMap.push_back(m_caster);
            break;
        }
        default:
            break;
    }

    if (unMaxTargets && TagUnitMap.size() > unMaxTargets)
    {
        // make sure one unit is always removed per iteration
        uint32 removed_utarget = 0;
        for (UnitList::iterator itr = TagUnitMap.begin(), next; itr != TagUnitMap.end(); itr = next)
        {
            next = itr;
            ++next;
            if (!*itr) continue;
            if ((*itr) == m_targets.getUnitTarget())
            {
                TagUnitMap.erase(itr);
                removed_utarget = 1;
                //        break;
            }
        }
        // remove random units from the map
        while (TagUnitMap.size() > unMaxTargets - removed_utarget)
        {
            uint32 poz = urand(0, TagUnitMap.size()-1);
            for (UnitList::iterator itr = TagUnitMap.begin(); itr != TagUnitMap.end(); ++itr, --poz)
            {
                if (!*itr) continue;

                if (!poz)
                {
                    TagUnitMap.erase(itr);
                    break;
                }
            }
        }
        // the player's target will always be added to the map
        if (removed_utarget && m_targets.getUnitTarget())
            TagUnitMap.push_back(m_targets.getUnitTarget());
    }
}

void Spell::FillCustomTargetMap(uint32 i, UnitList& TagUnitMap)
{
     float radius;
     if (m_spellInfo->EffectRadiusIndex[i])
         radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(m_spellInfo->EffectRadiusIndex[i]));
     else
         radius = GetSpellMaxRange(sSpellRangeStore.LookupEntry(m_spellInfo->rangeIndex));
     // Resulting effect depends on spell that we want to cast
     switch (m_spellInfo->Id)
     {
                case 50524:
                {
                    if(unitTarget && unitTarget->isAlive())
                    {
                        int32 cost = 8;
                        m_caster->ModifyPower(POWER_RUNIC_POWER, -cost);
                        if (m_caster->GetPower(POWER_RUNIC_POWER) > 0)
                            ((Pet*)unitTarget)->SetDuration(1400);  //if all ok - "feed"
                        else
                            m_caster->CastSpell(unitTarget,50515,true);  // dismiss
                    }
                    else
                        m_caster->RemoveAurasDueToSpell(50514);
                    return;
                }
        case 50515:
        {
            if (m_caster->GetTypeId() != TYPEID_PLAYER)
                break;

            if (Pet* guard = ((Player*)m_caster)->GetGuardian(27829))
                TagUnitMap.push_back(guard);

            break;
        }
         default:
         {
             switch(m_spellInfo->EffectImplicitTargetB[i])
             {
                  case 0:
                      SetTargetMap(i,m_spellInfo->EffectImplicitTargetA[i],TagUnitMap);
                      break;
                  case TARGET_SCRIPT_COORDINATES:         // B case filled in CheckCast but we need fill unit list base at A case
                      SetTargetMap(i,m_spellInfo->EffectImplicitTargetA[i],TagUnitMap);
                      break;
                  default:
                      SetTargetMap(i,m_spellInfo->EffectImplicitTargetA[i],TagUnitMap);
                      SetTargetMap(i,m_spellInfo->EffectImplicitTargetB[i],TagUnitMap);
                      break;
             }
             break;
         }
     }
}


void Spell::prepare(SpellCastTargets const* targets, Aura* triggeredByAura)
{
    m_targets = *targets;

    m_spellState = SPELL_STATE_PREPARING;

    m_castPositionX = m_caster->GetPositionX();
    m_castPositionY = m_caster->GetPositionY();
    m_castPositionZ = m_caster->GetPositionZ();
    m_castOrientation = m_caster->GetOrientation();

    if(triggeredByAura)
        m_triggeredByAuraSpell  = triggeredByAura->GetSpellProto();

    // create and add update event for this spell
    SpellEvent* Event = new SpellEvent(this);
    m_caster->m_Events.AddEvent(Event, m_caster->m_Events.CalculateTime(1));

    //Prevent casting at cast another spell (ServerSide check)
    if(m_caster->IsNonMeleeSpellCasted(false, true, true) && m_cast_count)
    {
        SendCastResult(SPELL_FAILED_SPELL_IN_PROGRESS);
        finish(false);
        return;
    }

    // Fill cost data
    m_powerCost = CalculatePowerCost();

    SpellCastResult result = CheckCast(true);
    if(result != SPELL_CAST_OK && !IsAutoRepeat())          //always cast autorepeat dummy for triggering
    {
        if(triggeredByAura)
        {
            SendChannelUpdate(0);
            triggeredByAura->SetAuraDuration(0);
        }
        SendCastResult(result);
        finish(false);
        return;
    }

    // Prepare data for triggers
    prepareDataForTriggerSystem();

    // calculate cast time (calculated after first CheckCast check to prevent charge counting for first CheckCast fail)
    m_casttime = GetSpellCastTime(m_spellInfo, this);

    // set timer base at cast time
    ReSetTimer();

    // stealth must be removed at cast starting (at show channel bar)
    // skip triggered spell (item equip spell casting and other not explicit character casts/item uses)
    if ( !m_IsTriggeredSpell && isSpellBreakStealth(m_spellInfo) )
    {
        m_caster->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
        m_caster->RemoveSpellsCausingAura(SPELL_AURA_FEIGN_DEATH);
    }

    if(m_IsTriggeredSpell)
        cast(true);
    else
    {
        m_caster->SetCurrentCastedSpell( this );
        m_selfContainer = &(m_caster->m_currentSpells[GetCurrentContainer()]);
        SendSpellStart();
    }
}

void Spell::cancel()
{
    if(m_spellState == SPELL_STATE_FINISHED)
        return;

    m_autoRepeat = false;
    switch (m_spellState)
    {
        case SPELL_STATE_PREPARING:
        case SPELL_STATE_DELAYED:
        {
            SendInterrupted(0);
            SendCastResult(SPELL_FAILED_INTERRUPTED);
        } break;

        case SPELL_STATE_CASTING:
        {
            for(std::list<TargetInfo>::const_iterator ihit= m_UniqueTargetInfo.begin();ihit != m_UniqueTargetInfo.end();++ihit)
            {
                if( ihit->missCondition == SPELL_MISS_NONE )
                {
                    Unit* unit = m_caster->GetGUID()==(*ihit).targetGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster, ihit->targetGUID);
                    if( unit && unit->isAlive() )
                        unit->RemoveAurasDueToSpell(m_spellInfo->Id);
                }
            }

            m_caster->RemoveAurasDueToSpell(m_spellInfo->Id);
            SendChannelUpdate(0);
            SendInterrupted(0);
            SendCastResult(SPELL_FAILED_INTERRUPTED);
        } break;

        default:
        {
        } break;
    }

    finish(false);
    m_caster->RemoveDynObject(m_spellInfo->Id);
    m_caster->RemoveGameObject(m_spellInfo->Id,true);
}

void Spell::cast(bool skipCheck)
{
    SetExecutedCurrently(true);

    // update pointers base at GUIDs to prevent access to non-existed already object
    UpdatePointers();

    // cancel at lost main target unit
    if(!m_targets.getUnitTarget() && m_targets.getUnitTargetGUID() && m_targets.getUnitTargetGUID() != m_caster->GetGUID())
    {
        cancel();
        SetExecutedCurrently(false);
        return;
    }

    if(m_caster->GetTypeId() != TYPEID_PLAYER && m_targets.getUnitTarget() && m_targets.getUnitTarget() != m_caster)
        m_caster->SetInFront(m_targets.getUnitTarget());

    SpellCastResult castResult = CheckPower();
    if(castResult != SPELL_CAST_OK)
    {
        SendCastResult(castResult);
        finish(false);
        SetExecutedCurrently(false);
        return;
    }

    // triggered cast called from Spell::prepare where it was already checked
    if(!skipCheck)
    {
        castResult = CheckCast(false);
        if(castResult != SPELL_CAST_OK)
        {
            SendCastResult(castResult);
            finish(false);
            SetExecutedCurrently(false);
            return;
        }
    }

    switch(m_spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            if (m_spellInfo->Mechanic == MECHANIC_BANDAGE)             // Bandages
                m_preCastSpell = 11196;                                // Recently Bandaged
            else if(m_spellInfo->SpellIconID == 1662 && m_spellInfo->AttributesEx & 0x20) // Blood Fury (Racial)
                m_preCastSpell = 23230;                                // Blood Fury - Healing Reduction
            else if(m_spellInfo->Id == 20594)                          // Stoneform
                m_preCastSpell = 65116;                                // Stoneform (Armor increased)
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // Ice Block
            if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000008000000000))
                m_preCastSpell = 41425;                                // Hypothermia
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            if (m_spellInfo->Mechanic == MECHANIC_SHIELD &&
                m_spellInfo->SpellIconID == 566)                       // Power Word: Shield
                m_preCastSpell = 6788;                                 // Weakened Soul
            if (m_spellInfo->Id == 47585)                              // Dispersion (transform)
                m_preCastSpell = 60069;                                // Dispersion (mana regen)
            if (m_spellInfo->Id == 33206)                              // Pain Suppression (Damage modifier)
                m_preCastSpell = 44416;                                // Pain Suppression (Threat modifier)
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Divine Shield, Divine Protection or Hand of Protection
            if (m_spellInfo->SpellFamilyFlags & UI64LIT(0x0000000000400080))
                m_preCastSpell = 25771;                                // Forbearance
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            if (m_spellInfo->Id == 2825)                               // Bloodlust
                m_preCastSpell = 57724;                                // Sated
            else if (m_spellInfo->Id == 32182)                         // Heroism
                m_preCastSpell = 57723;                                // Exhaustion
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            if (m_spellInfo->Id == 47897)                              // Shadowflame DD (Rank 1)
                m_preCastSpell = 47960;                                // Shadowflame DOT
            else if(m_spellInfo->Id == 61290)                          // Shadowflame DD (Rank 2)
                m_preCastSpell = 61291;                                // Shadowflame DOT
            break;
        }
        default:
            break;
    }

    // Conflagrate - consumes immolate
    if ((m_spellInfo->TargetAuraState == AURA_STATE_IMMOLATE) && m_targets.getUnitTarget() && !m_caster->HasAura(56235))
    {
        // for caster applied auras only
        Unit::AuraList const &mPeriodic = m_targets.getUnitTarget()->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
        for(Unit::AuraList::const_iterator i = mPeriodic.begin(); i != mPeriodic.end(); ++i)
        {
            if( (*i)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_WARLOCK && ((*i)->GetSpellProto()->SpellFamilyFlags & 4) &&
                (*i)->GetCasterGUID()==m_caster->GetGUID() )
            {
                m_targets.getUnitTarget()->RemoveAura((*i)->GetId(), (*i)->GetEffIndex());
                break;
            }
        }
    }

    // traded items have trade slot instead of guid in m_itemTargetGUID
    // set to real guid to be sent later to the client
    m_targets.updateTradeSlotItem();

    if (m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        if (!m_IsTriggeredSpell && m_CastItem)
            ((Player*)m_caster)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_USE_ITEM, m_CastItem->GetEntry());

        ((Player*)m_caster)->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_CAST_SPELL, m_spellInfo->Id);
    }

    FillTargetMap();

    if(m_spellState == SPELL_STATE_FINISHED)                // stop cast if spell marked as finish somewhere in FillTargetMap
    {
        SetExecutedCurrently(false);
        return;
    }

    // CAST SPELL
    SendSpellCooldown();

    TakePower();
    TakeReagents();                                         // we must remove reagents before HandleEffects to allow place crafted item in same slot

    SendCastResult(castResult);
    SendSpellGo();                                          // we must send smsg_spell_go packet before m_castItem delete in TakeCastItem()...

    // Okay, everything is prepared. Now we need to distinguish between immediate and evented delayed spells
    if (m_spellInfo->speed > 0.0f)
    {

        // Remove used for cast item if need (it can be already NULL after TakeReagents call
        // in case delayed spell remove item at cast delay start
        TakeCastItem();

        // Okay, maps created, now prepare flags
        m_immediateHandled = false;
        m_spellState = SPELL_STATE_DELAYED;
        SetDelayStart(0);
    }
    else
    {
        // Immediate spell, no big deal
        handle_immediate();
    }

    SetExecutedCurrently(false);
}

void Spell::handle_immediate()
{
    // start channeling if applicable
    if(IsChanneledSpell(m_spellInfo))
    {
        int32 duration = GetSpellDuration(m_spellInfo);
        if (duration)
        {
            // Apply duration mod
            if(Player* modOwner = m_caster->GetSpellModOwner())
                modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_DURATION, duration);
            m_spellState = SPELL_STATE_CASTING;
            SendChannelStart(duration);
        }
    }

    // process immediate effects (items, ground, etc.) also initialize some variables
    _handle_immediate_phase();

    for(std::list<TargetInfo>::iterator ihit= m_UniqueTargetInfo.begin();ihit != m_UniqueTargetInfo.end();++ihit)
        DoAllEffectOnTarget(&(*ihit));

    for(std::list<GOTargetInfo>::iterator ihit= m_UniqueGOTargetInfo.begin();ihit != m_UniqueGOTargetInfo.end();++ihit)
        DoAllEffectOnTarget(&(*ihit));

    // spell is finished, perform some last features of the spell here
    _handle_finish_phase();

    // Remove used for cast item if need (it can be already NULL after TakeReagents call
    TakeCastItem();

    if(m_spellState != SPELL_STATE_CASTING)
        finish(true);                                       // successfully finish spell cast (not last in case autorepeat or channel spell)
}

uint64 Spell::handle_delayed(uint64 t_offset)
{
    uint64 next_time = 0;

    if (!m_immediateHandled)
    {
        _handle_immediate_phase();
        m_immediateHandled = true;
    }

    // now recheck units targeting correctness (need before any effects apply to prevent adding immunity at first effect not allow apply second spell effect and similar cases)
    for(std::list<TargetInfo>::iterator ihit= m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end();++ihit)
    {
        if (ihit->processed == false)
        {
            if ( ihit->timeDelay <= t_offset )
                DoAllEffectOnTarget(&(*ihit));
            else if( next_time == 0 || ihit->timeDelay < next_time )
                next_time = ihit->timeDelay;
        }
    }

    // now recheck gameobject targeting correctness
    for(std::list<GOTargetInfo>::iterator ighit= m_UniqueGOTargetInfo.begin(); ighit != m_UniqueGOTargetInfo.end();++ighit)
    {
        if (ighit->processed == false)
        {
            if ( ighit->timeDelay <= t_offset )
                DoAllEffectOnTarget(&(*ighit));
            else if( next_time == 0 || ighit->timeDelay < next_time )
                next_time = ighit->timeDelay;
        }
    }
    // All targets passed - need finish phase
    if (next_time == 0)
    {
        // spell is finished, perform some last features of the spell here
        _handle_finish_phase();

        finish(true);                                       // successfully finish spell cast

        // return zero, spell is finished now
        return 0;
    }
    else
    {
        // spell is unfinished, return next execution time
        return next_time;
    }
}

void Spell::_handle_immediate_phase()
{
    // handle some immediate features of the spell here
    HandleThreatSpells(m_spellInfo->Id);

    m_needSpellLog = IsNeedSendToClient();
    for(uint32 j = 0; j < 3; ++j)
    {
        if(m_spellInfo->Effect[j] == 0)
            continue;

        // apply Send Event effect to ground in case empty target lists
        if( m_spellInfo->Effect[j] == SPELL_EFFECT_SEND_EVENT && !HaveTargetsForEffect(j) )
        {
            HandleEffects(NULL, NULL, NULL, j);
            continue;
        }

        // Don't do spell log, if is school damage spell
        if(m_spellInfo->Effect[j] == SPELL_EFFECT_SCHOOL_DAMAGE || m_spellInfo->Effect[j] == 0)
            m_needSpellLog = false;

        uint32 EffectChainTarget = m_spellInfo->EffectChainTarget[j];
        if(m_originalCaster)
            if(Player* modOwner = m_originalCaster->GetSpellModOwner())
                modOwner->ApplySpellMod(m_spellInfo->Id, SPELLMOD_JUMP_TARGETS, EffectChainTarget, this);

        // initialize multipliers
        m_damageMultipliers[j] = 1.0f;
        if( (m_spellInfo->EffectImplicitTargetA[j] == TARGET_CHAIN_DAMAGE || m_spellInfo->EffectImplicitTargetA[j] == TARGET_CHAIN_HEAL) &&
            (EffectChainTarget > 1) )
            m_applyMultiplierMask |= 1 << j;
    }

    // initialize Diminishing Returns Data
    m_diminishLevel = DIMINISHING_LEVEL_1;
    m_diminishGroup = DIMINISHING_NONE;

    // process items
    for(std::list<ItemTargetInfo>::iterator ihit= m_UniqueItemInfo.begin();ihit != m_UniqueItemInfo.end();++ihit)
        DoAllEffectOnTarget(&(*ihit));

    // process ground
    for(uint32 j = 0; j < 3; ++j)
    {
        // persistent area auras target only the ground
        if(m_spellInfo->Effect[j] == SPELL_EFFECT_PERSISTENT_AREA_AURA)
            HandleEffects(NULL, NULL, NULL, j);
    }
}

void Spell::_handle_finish_phase()
{
    // spell log
    if(m_needSpellLog)
        SendLogExecute();
}

void Spell::SendSpellCooldown()
{
    if(m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* _player = (Player*)m_caster;

    // mana/health/etc potions, disabled by client (until combat out as declarate)
    if (m_CastItem && m_CastItem->IsPotion())
    {
        // need in some way provided data for Spell::finish SendCooldownEvent
        _player->SetLastPotionId(m_CastItem->GetEntry());
        return;
    }

    // have infinity cooldown but set at aura apply
    if(m_spellInfo->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
        return;

    _player->AddSpellAndCategoryCooldowns(m_spellInfo,m_CastItem ? m_CastItem->GetEntry() : 0, this);
}

void Spell::update(uint32 difftime)
{
    // update pointers based at it's GUIDs
    UpdatePointers();

    if(m_targets.getUnitTargetGUID() && !m_targets.getUnitTarget())
    {
        cancel();
        return;
    }

    // check if the player caster has moved before the spell finished
    if ((m_caster->GetTypeId() == TYPEID_PLAYER && m_timer != 0) &&
        (m_castPositionX != m_caster->GetPositionX() || m_castPositionY != m_caster->GetPositionY() || m_castPositionZ != m_caster->GetPositionZ()) &&
        (m_spellInfo->Effect[0] != SPELL_EFFECT_STUCK || !m_caster->HasUnitMovementFlag(MOVEMENTFLAG_FALLING)))
    {
        // always cancel for channeled spells
        if( m_spellState == SPELL_STATE_CASTING )
            cancel();
        // don't cancel for melee, autorepeat, triggered and instant spells
        else if(!IsNextMeleeSwingSpell() && !IsAutoRepeat() && !m_IsTriggeredSpell && (m_spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_MOVEMENT))
            cancel();
    }

    switch(m_spellState)
    {
        case SPELL_STATE_PREPARING:
        {
            if(m_timer)
            {
                if(difftime >= m_timer)
                    m_timer = 0;
                else
                    m_timer -= difftime;
            }

            if(m_timer == 0 && !IsNextMeleeSwingSpell() && !IsAutoRepeat())
                cast();
        } break;
        case SPELL_STATE_CASTING:
        {
            if(m_timer > 0)
            {
                if( m_caster->GetTypeId() == TYPEID_PLAYER )
                {
                    // check if player has jumped before the channeling finished
                    if(m_caster->HasUnitMovementFlag(MOVEMENTFLAG_JUMPING))
                        cancel();

                    // check for incapacitating player states
                    if( m_caster->hasUnitState(UNIT_STAT_STUNNED | UNIT_STAT_CONFUSED))
                        cancel();

                    // check if player has turned if flag is set
                    if( m_spellInfo->ChannelInterruptFlags & CHANNEL_FLAG_TURNING && m_castOrientation != m_caster->GetOrientation() )
                        cancel();
                }

                // check if there are alive targets left
                if (!IsAliveUnitPresentInTargetList())
                {
                    SendChannelUpdate(0);
                    finish();
                }

                if(difftime >= m_timer)
                    m_timer = 0;
                else
                    m_timer -= difftime;
            }

            if(m_timer == 0)
            {
                SendChannelUpdate(0);

                // channeled spell processed independently for quest targeting
                // cast at creature (or GO) quest objectives update at successful cast channel finished
                // ignore autorepeat/melee casts for speed (not exist quest for spells (hm... )
                if( !IsAutoRepeat() && !IsNextMeleeSwingSpell() )
                {
                    if ( Player* p = m_caster->GetCharmerOrOwnerPlayerOrPlayerItself() )
                    {
                        for(std::list<TargetInfo>::iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
                        {
                            TargetInfo* target = &*ihit;
                            if(!IS_CREATURE_GUID(target->targetGUID))
                                continue;

                            Unit* unit = m_caster->GetGUID() == target->targetGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster, target->targetGUID);
                            if (unit == NULL)
                                continue;

                            p->CastedCreatureOrGO(unit->GetEntry(), unit->GetGUID(), m_spellInfo->Id);
                        }

                        for(std::list<GOTargetInfo>::iterator ihit = m_UniqueGOTargetInfo.begin(); ihit != m_UniqueGOTargetInfo.end(); ++ihit)
                        {
                            GOTargetInfo* target = &*ihit;

                            GameObject* go = m_caster->GetMap()->GetGameObject(target->targetGUID);
                            if(!go)
                                continue;

                            p->CastedCreatureOrGO(go->GetEntry(), go->GetGUID(), m_spellInfo->Id);
                        }
                    }
                }

                finish();
            }
        } break;
        default:
        {
        }break;
    }
}

void Spell::finish(bool ok)
{
    if(!m_caster)
        return;

    if(m_spellState == SPELL_STATE_FINISHED)
        return;

    m_spellState = SPELL_STATE_FINISHED;

    // other code related only to successfully finished spells
    if(!ok)
        return;

    //remove spell mods
    if (m_caster->GetTypeId() == TYPEID_PLAYER)
        ((Player*)m_caster)->RemoveSpellMods(this);

    // handle SPELL_AURA_ADD_TARGET_TRIGGER auras
    Unit::AuraList const& targetTriggers = m_caster->GetAurasByType(SPELL_AURA_ADD_TARGET_TRIGGER);
    for(Unit::AuraList::const_iterator i = targetTriggers.begin(); i != targetTriggers.end(); ++i)
    {
        if (!(*i)->isAffectedOnSpell(m_spellInfo))
            continue;
        for(std::list<TargetInfo>::const_iterator ihit= m_UniqueTargetInfo.begin();ihit != m_UniqueTargetInfo.end();++ihit)
            if( ihit->missCondition == SPELL_MISS_NONE )
            {
                // check m_caster->GetGUID() let load auras at login and speedup most often case
                Unit *unit = m_caster->GetGUID()== ihit->targetGUID ? m_caster : ObjectAccessor::GetUnit(*m_caster, ihit->targetGUID);
                if (unit && unit->isAlive())
                {
                    SpellEntry const *auraSpellInfo = (*i)->GetSpellProto();
                    uint32 auraSpellIdx = (*i)->GetEffIndex();
                    // Calculate chance at that moment (can be depend for example from combo points)
                    int32 chance = m_caster->CalculateSpellDamage(auraSpellInfo, auraSpellIdx, (*i)->GetBasePoints(),unit);
                    if(roll_chance_i(chance))
                        m_caster->CastSpell(unit, auraSpellInfo->EffectTriggerSpell[auraSpellIdx], true, NULL, (*i));
                }
            }
    }

    // Heal caster for all health leech from all targets
    if (m_healthLeech)
        m_caster->DealHeal(m_caster, uint32(m_healthLeech), m_spellInfo);

    if (IsMeleeAttackResetSpell())
    {
        m_caster->resetAttackTimer(BASE_ATTACK);
        if(m_caster->haveOffhandWeapon())
            m_caster->resetAttackTimer(OFF_ATTACK);
    }

    /*if (IsRangedAttackResetSpell())
        m_caster->resetAttackTimer(RANGED_ATTACK);*/

    // Clear combo at finish state
    if(m_caster->GetTypeId() == TYPEID_PLAYER && NeedsComboPoints(m_spellInfo))
    {
        // Not drop combopoints if negative spell and if any miss on enemy exist
        bool needDrop = true;
        if (!IsPositiveSpell(m_spellInfo->Id))
        for(std::list<TargetInfo>::const_iterator ihit= m_UniqueTargetInfo.begin();ihit != m_UniqueTargetInfo.end();++ihit)
            if (ihit->missCondition != SPELL_MISS_NONE && ihit->targetGUID!=m_caster->GetGUID())
            {
                needDrop = false;
                break;
            }
        if (needDrop)
            ((Player*)m_caster)->ClearComboPoints();
    }

    // potions disabled by client, send event "not in combat" if need
    if (m_caster->GetTypeId() == TYPEID_PLAYER)
        ((Player*)m_caster)->UpdatePotionCooldown(this);

    // call triggered spell only at successful cast (after clear combo points -> for add some if need)
    if(!m_TriggerSpells.empty())
        TriggerSpell();

    // Stop Attack for some spells
    if( m_spellInfo->Attributes & SPELL_ATTR_STOP_ATTACK_TARGET )
        m_caster->AttackStop();
}

void Spell::SendCastResult(SpellCastResult result)
{
    if(result == SPELL_CAST_OK)
        return;

    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    if(((Player*)m_caster)->GetSession()->PlayerLoading())  // don't send cast results at loading time
        return;

    SendCastResult((Player*)m_caster,m_spellInfo,m_cast_count,result);
}

void Spell::SendCastResult(Player* caster, SpellEntry const* spellInfo, uint8 cast_count, SpellCastResult result)
{
    if(result == SPELL_CAST_OK)
        return;

    WorldPacket data(SMSG_CAST_FAILED, (4+1+1));
    data << uint8(cast_count);                              // single cast or multi 2.3 (0/1)
    data << uint32(spellInfo->Id);
    data << uint8(result);                                  // problem
    switch (result)
    {
        case SPELL_FAILED_REQUIRES_SPELL_FOCUS:
            data << uint32(spellInfo->RequiresSpellFocus);
            break;
        case SPELL_FAILED_REQUIRES_AREA:
            // hardcode areas limitation case
            switch(spellInfo->Id)
            {
                case 41617:                                 // Cenarion Mana Salve
                case 41619:                                 // Cenarion Healing Salve
                    data << uint32(3905);
                    break;
                case 41618:                                 // Bottled Nethergon Energy
                case 41620:                                 // Bottled Nethergon Vapor
                    data << uint32(3842);
                    break;
                case 45373:                                 // Bloodberry Elixir
                    data << uint32(4075);
                    break;
                default:                                    // default case (don't must be)
                    data << uint32(0);
                    break;
            }
            break;
        case SPELL_FAILED_TOTEMS:
            if(spellInfo->Totem[0])
                data << uint32(spellInfo->Totem[0]);
            if(spellInfo->Totem[1])
                data << uint32(spellInfo->Totem[1]);
            break;
        case SPELL_FAILED_TOTEM_CATEGORY:
            if(spellInfo->TotemCategory[0])
                data << uint32(spellInfo->TotemCategory[0]);
            if(spellInfo->TotemCategory[1])
                data << uint32(spellInfo->TotemCategory[1]);
            break;
        case SPELL_FAILED_EQUIPPED_ITEM_CLASS:
            data << uint32(spellInfo->EquippedItemClass);
            data << uint32(spellInfo->EquippedItemSubClassMask);
            //data << uint32(spellInfo->EquippedItemInventoryTypeMask);
            break;
        default:
            break;
    }
    caster->GetSession()->SendPacket(&data);
}

void Spell::SendSpellStart()
{
    if(!IsNeedSendToClient())
        return;

    sLog.outDebug("Sending SMSG_SPELL_START id=%u", m_spellInfo->Id);

    uint32 castFlags = CAST_FLAG_UNKNOWN1;
    if(IsRangedSpell())
        castFlags |= CAST_FLAG_AMMO;

    if(m_spellInfo->runeCostID)
        castFlags |= CAST_FLAG_UNKNOWN10;

    WorldPacket data(SMSG_SPELL_START, (8+8+4+4+2));
    if(m_CastItem)
        data.append(m_CastItem->GetPackGUID());
    else
        data.append(m_caster->GetPackGUID());

    data.append(m_caster->GetPackGUID());
    data << uint8(m_cast_count);                            // pending spell cast?
    data << uint32(m_spellInfo->Id);                        // spellId
    data << uint32(castFlags);                              // cast flags
    data << uint32(m_timer);                                // delay?

    m_targets.write(&data);

    if ( castFlags & CAST_FLAG_UNKNOWN6 )                   // predicted power?
        data << uint32(0);

    if ( castFlags & CAST_FLAG_UNKNOWN7 )                   // rune cooldowns list
    {
        uint8 v1 = 0;//m_runesState;
        uint8 v2 = 0;//((Player*)m_caster)->GetRunesState();
        data << uint8(v1);                                  // runes state before
        data << uint8(v2);                                  // runes state after
        for(uint8 i = 0; i < MAX_RUNES; ++i)
        {
            uint8 m = (1 << i);
            if(m & v1)                                      // usable before...
                if(!(m & v2))                               // ...but on cooldown now...
                    data << uint8(0);                       // some unknown byte (time?)
        }
    }

    if ( castFlags & CAST_FLAG_AMMO )
        WriteAmmoToPacket(&data);

    m_caster->SendMessageToSet(&data, true);
}

void Spell::SendSpellGo()
{
    // not send invisible spell casting
    if(!IsNeedSendToClient())
        return;

    sLog.outDebug("Sending SMSG_SPELL_GO id=%u", m_spellInfo->Id);

    uint32 castFlags = CAST_FLAG_UNKNOWN3;
    if(IsRangedSpell())
        castFlags |= CAST_FLAG_AMMO;                        // arrows/bullets visual

    if((m_caster->GetTypeId() == TYPEID_PLAYER) && (m_caster->getClass() == CLASS_DEATH_KNIGHT) && m_spellInfo->runeCostID)
    {
        castFlags |= CAST_FLAG_UNKNOWN10;                   // same as in SMSG_SPELL_START
        castFlags |= CAST_FLAG_UNKNOWN6;                    // makes cooldowns visible
        castFlags |= CAST_FLAG_UNKNOWN7;                    // rune cooldowns list
    }

    WorldPacket data(SMSG_SPELL_GO, 50);                    // guess size

    if(m_CastItem)
        data.append(m_CastItem->GetPackGUID());
    else
        data.append(m_caster->GetPackGUID());

    data.append(m_caster->GetPackGUID());
    data << uint8(m_cast_count);                            // pending spell cast?
    data << uint32(m_spellInfo->Id);                        // spellId
    data << uint32(castFlags);                              // cast flags
    data << uint32(getMSTime());                            // timestamp

    WriteSpellGoTargets(&data);

    m_targets.write(&data);

    if ( castFlags & CAST_FLAG_UNKNOWN6 )                   // unknown wotlk, predicted power?
        data << uint32(0);

    if ( castFlags & CAST_FLAG_UNKNOWN7 )                   // rune cooldowns list
    {
        uint8 v1 = m_runesState;
        uint8 v2 = ((Player*)m_caster)->GetRunesState();
        data << uint8(v1);                                  // runes state before
        data << uint8(v2);                                  // runes state after
        for(uint8 i = 0; i < MAX_RUNES; ++i)
        {
            uint8 m = (1 << i);
            if(m & v1)                                      // usable before...
                if(!(m & v2))                               // ...but on cooldown now...
                    data << uint8(0);                       // some unknown byte (time?)
        }
    }

    if ( castFlags & CAST_FLAG_UNKNOWN4 )                   // unknown wotlk
    {
        data << float(0);
        data << uint32(0);
    }

    if ( castFlags & CAST_FLAG_AMMO )
        WriteAmmoToPacket(&data);

    if ( castFlags & CAST_FLAG_UNKNOWN5 )                   // unknown wotlk
    {
        data << uint32(0);
        data << uint32(0);
    }

    if ( m_targets.m_targetMask & TARGET_FLAG_DEST_LOCATION )
    {
        data << uint8(0);
    }

    m_caster->SendMessageToSet(&data, true);
}

void Spell::WriteAmmoToPacket( WorldPacket * data )
{
    uint32 ammoInventoryType = 0;
    uint32 ammoDisplayID = 0;

    if (m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        Item *pItem = ((Player*)m_caster)->GetWeaponForAttack( RANGED_ATTACK );
        if(pItem)
        {
            ammoInventoryType = pItem->GetProto()->InventoryType;
            if( ammoInventoryType == INVTYPE_THROWN )
                ammoDisplayID = pItem->GetProto()->DisplayInfoID;
            else
            {
                uint32 ammoID = ((Player*)m_caster)->GetUInt32Value(PLAYER_AMMO_ID);
                if(ammoID)
                {
                    ItemPrototype const *pProto = objmgr.GetItemPrototype( ammoID );
                    if(pProto)
                    {
                        ammoDisplayID = pProto->DisplayInfoID;
                        ammoInventoryType = pProto->InventoryType;
                    }
                }
                else if(m_caster->GetDummyAura(46699))      // Requires No Ammo
                {
                    ammoDisplayID = 5996;                   // normal arrow
                    ammoInventoryType = INVTYPE_AMMO;
                }
            }
        }
    }
    else
    {
        for (uint8 i = 0; i < 3; ++i)
        {
            if(uint32 item_id = m_caster->GetUInt32Value(UNIT_VIRTUAL_ITEM_SLOT_ID + i))
            {
                if(ItemEntry const * itemEntry = sItemStore.LookupEntry(item_id))
                {
                    if(itemEntry->Class==ITEM_CLASS_WEAPON)
                    {
                        switch(itemEntry->SubClass)
                        {
                            case ITEM_SUBCLASS_WEAPON_THROWN:
                                ammoDisplayID = itemEntry->DisplayId;
                                ammoInventoryType = itemEntry->InventoryType;
                                break;
                            case ITEM_SUBCLASS_WEAPON_BOW:
                            case ITEM_SUBCLASS_WEAPON_CROSSBOW:
                                ammoDisplayID = 5996;       // is this need fixing?
                                ammoInventoryType = INVTYPE_AMMO;
                                break;
                            case ITEM_SUBCLASS_WEAPON_GUN:
                                ammoDisplayID = 5998;       // is this need fixing?
                                ammoInventoryType = INVTYPE_AMMO;
                                break;
                        }

                        if(ammoDisplayID)
                            break;
                    }
                }
            }
        }
    }

    *data << uint32(ammoDisplayID);
    *data << uint32(ammoInventoryType);
}

void Spell::WriteSpellGoTargets( WorldPacket * data )
{
    // This function also fill data for channeled spells:
    // m_needAliveTargetMask req for stop channelig if one target die
    uint32 hit  = m_UniqueGOTargetInfo.size(); // Always hits on GO
    uint32 miss = 0;
    for(std::list<TargetInfo>::iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
    {
        if ((*ihit).effectMask == 0)                  // No effect apply - all immuned add state
        {
            // possibly SPELL_MISS_IMMUNE2 for this??
            ihit->missCondition = SPELL_MISS_IMMUNE2;
            ++miss;
        }
        else if ((*ihit).missCondition == SPELL_MISS_NONE)
            ++hit;
        else
            ++miss;
    }

    *data << (uint8)hit;
    for(std::list<TargetInfo>::const_iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
    {
        if ((*ihit).missCondition == SPELL_MISS_NONE)       // Add only hits
        {
            *data << uint64(ihit->targetGUID);
            m_needAliveTargetMask |=ihit->effectMask;
        }
    }

    for(std::list<GOTargetInfo>::const_iterator ighit = m_UniqueGOTargetInfo.begin(); ighit != m_UniqueGOTargetInfo.end(); ++ighit)
        *data << uint64(ighit->targetGUID);                 // Always hits

    *data << (uint8)miss;
    for(std::list<TargetInfo>::const_iterator ihit = m_UniqueTargetInfo.begin(); ihit != m_UniqueTargetInfo.end(); ++ihit)
    {
        if( ihit->missCondition != SPELL_MISS_NONE )        // Add only miss
        {
            *data << uint64(ihit->targetGUID);
            *data << uint8(ihit->missCondition);
            if( ihit->missCondition == SPELL_MISS_REFLECT )
                *data << uint8(ihit->reflectResult);
        }
    }
    // Reset m_needAliveTargetMask for non channeled spell
    if(!IsChanneledSpell(m_spellInfo))
        m_needAliveTargetMask = 0;
}

void Spell::SendLogExecute()
{
    Unit *target = m_targets.getUnitTarget() ? m_targets.getUnitTarget() : m_caster;

    WorldPacket data(SMSG_SPELLLOGEXECUTE, (8+4+4+4+4+8));

    if(m_caster->GetTypeId() == TYPEID_PLAYER)
        data.append(m_caster->GetPackGUID());
    else
        data.append(target->GetPackGUID());

    data << uint32(m_spellInfo->Id);
    uint32 count1 = 1;
    data << uint32(count1);                                 // count1 (effect count?)
    for(uint32 i = 0; i < count1; ++i)
    {
        data << uint32(m_spellInfo->Effect[0]);             // spell effect
        uint32 count2 = 1;
        data << uint32(count2);                             // count2 (target count?)
        for(uint32 j = 0; j < count2; ++j)
        {
            switch(m_spellInfo->Effect[0])
            {
                case SPELL_EFFECT_POWER_DRAIN:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    data << uint32(0);
                    data << uint32(0);
                    data << float(0);
                    break;
                case SPELL_EFFECT_ADD_EXTRA_ATTACKS:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    data << uint32(0);                      // count?
                    break;
                case SPELL_EFFECT_INTERRUPT_CAST:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    data << uint32(0);                      // spellid
                    break;
                case SPELL_EFFECT_DURABILITY_DAMAGE:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    data << uint32(0);
                    data << uint32(0);
                    break;
                case SPELL_EFFECT_OPEN_LOCK:
                    if(Item *item = m_targets.getItemTarget())
                        data.append(item->GetPackGUID());
                    else
                        data << uint8(0);
                    break;
                case SPELL_EFFECT_CREATE_ITEM:
                case SPELL_EFFECT_CREATE_ITEM_2:
                    data << uint32(m_spellInfo->EffectItemType[0]);
                    break;
                case SPELL_EFFECT_SUMMON:
                case SPELL_EFFECT_TRANS_DOOR:
                case SPELL_EFFECT_SUMMON_PET:
                case SPELL_EFFECT_SUMMON_OBJECT_WILD:
                case SPELL_EFFECT_CREATE_HOUSE:
                case SPELL_EFFECT_DUEL:
                case SPELL_EFFECT_SUMMON_OBJECT_SLOT1:
                case SPELL_EFFECT_SUMMON_OBJECT_SLOT2:
                case SPELL_EFFECT_SUMMON_OBJECT_SLOT3:
                case SPELL_EFFECT_SUMMON_OBJECT_SLOT4:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else if(m_targets.getItemTargetGUID())
                        data.appendPackGUID(m_targets.getItemTargetGUID());
                    else if(GameObject *go = m_targets.getGOTarget())
                        data.append(go->GetPackGUID());
                    else
                        data << uint8(0);                   // guid
                    break;
                case SPELL_EFFECT_FEED_PET:
                    data << uint32(m_targets.getItemTargetEntry());
                    break;
                case SPELL_EFFECT_DISMISS_PET:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    break;
                case SPELL_EFFECT_RESURRECT:
                case SPELL_EFFECT_RESURRECT_NEW:
                    if(Unit *unit = m_targets.getUnitTarget())
                        data.append(unit->GetPackGUID());
                    else
                        data << uint8(0);
                    break;
                default:
                    return;
            }
        }
    }

    m_caster->SendMessageToSet(&data, true);
}

void Spell::SendInterrupted(uint8 result)
{
    WorldPacket data(SMSG_SPELL_FAILURE, (8+4+1));
    data.append(m_caster->GetPackGUID());
    data << uint8(m_cast_count);
    data << uint32(m_spellInfo->Id);
    data << uint8(result);
    m_caster->SendMessageToSet(&data, true);

    data.Initialize(SMSG_SPELL_FAILED_OTHER, (8+4));
    data.append(m_caster->GetPackGUID());
    data << uint8(m_cast_count);
    data << uint32(m_spellInfo->Id);
    data << uint8(result);
    m_caster->SendMessageToSet(&data, true);
}

void Spell::SendChannelUpdate(uint32 time)
{
    if(time == 0)
    {
        m_caster->SetUInt64Value(UNIT_FIELD_CHANNEL_OBJECT, 0);
        m_caster->SetUInt32Value(UNIT_CHANNEL_SPELL, 0);
    }

    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    WorldPacket data( MSG_CHANNEL_UPDATE, 8+4 );
    data.append(m_caster->GetPackGUID());
    data << uint32(time);

    ((Player*)m_caster)->GetSession()->SendPacket( &data );
}

void Spell::SendChannelStart(uint32 duration)
{
    WorldObject* target = NULL;

    // select first not resisted target from target list for _0_ effect
    if(!m_UniqueTargetInfo.empty())
    {
        for(std::list<TargetInfo>::const_iterator itr = m_UniqueTargetInfo.begin(); itr != m_UniqueTargetInfo.end(); ++itr)
        {
            if( (itr->effectMask & (1 << 0)) && itr->reflectResult == SPELL_MISS_NONE && itr->targetGUID != m_caster->GetGUID())
            {
                target = ObjectAccessor::GetUnit(*m_caster, itr->targetGUID);
                break;
            }
        }
    }
    else if(!m_UniqueGOTargetInfo.empty())
    {
        for(std::list<GOTargetInfo>::const_iterator itr = m_UniqueGOTargetInfo.begin(); itr != m_UniqueGOTargetInfo.end(); ++itr)
        {
            if(itr->effectMask & (1 << 0) )
            {
                target = m_caster->GetMap()->GetGameObject(itr->targetGUID);
                break;
            }
        }
    }

    if (m_caster->GetTypeId() == TYPEID_PLAYER)
    {
        WorldPacket data( MSG_CHANNEL_START, (8+4+4) );
        data.append(m_caster->GetPackGUID());
        data << uint32(m_spellInfo->Id);
        data << uint32(duration);

        ((Player*)m_caster)->GetSession()->SendPacket( &data );
    }

    m_timer = duration;
    if(target)
        m_caster->SetUInt64Value(UNIT_FIELD_CHANNEL_OBJECT, target->GetGUID());
    m_caster->SetUInt32Value(UNIT_CHANNEL_SPELL, m_spellInfo->Id);
}

void Spell::SendResurrectRequest(Player* target)
{
    // Both players and NPCs can resurrect using spells - have a look at creature 28487 for example
    // However, the packet structure differs slightly

    const char* sentName = m_caster->GetTypeId() == TYPEID_PLAYER ? "" : m_caster->GetNameForLocaleIdx(target->GetSession()->GetSessionDbLocaleIndex());

    WorldPacket data(SMSG_RESURRECT_REQUEST, (8+4+strlen(sentName)+1+1+1));
    data << uint64(m_caster->GetGUID());
    data << uint32(strlen(sentName) + 1);

    data << sentName;
    data << uint8(0);

    data << uint8(m_caster->GetTypeId() == TYPEID_PLAYER ? 0 : 1);
    target->GetSession()->SendPacket(&data);
}

void Spell::SendPlaySpellVisual(uint32 SpellID)
{
    if (m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    /* FIXMEPLZ - THIS IS AN HACK */
    if(SpellID == 1725 && m_caster->GetTypeId() == TYPEID_PLAYER)
        return;

    WorldPacket data(SMSG_PLAY_SPELL_VISUAL, 8 + 4);
    data << uint64(m_caster->GetGUID());
    data << uint32(SpellID);                                // spell visual id?
    ((Player*)m_caster)->GetSession()->SendPacket(&data);
}

void Spell::TakeCastItem()
{
    if(!m_CastItem || m_caster->GetTypeId() != TYPEID_PLAYER)
        return;

    // not remove cast item at triggered spell (equipping, weapon damage, etc)
    if(m_IsTriggeredSpell)
        return;

    ItemPrototype const *proto = m_CastItem->GetProto();

    if(!proto)
    {
        // This code is to avoid a crash
        // I'm not sure, if this is really an error, but I guess every item needs a prototype
        sLog.outError("Cast item has no item prototype highId=%d, lowId=%d",m_CastItem->GetGUIDHigh(), m_CastItem->GetGUIDLow());
        return;
    }

    bool expendable = false;
    bool withoutCharges = false;

    for (int i = 0; i < MAX_ITEM_PROTO_SPELLS; ++i)
    {
        if (proto->Spells[i].SpellId)
        {
            // item has limited charges
            if (proto->Spells[i].SpellCharges)
            {
                if (proto->Spells[i].SpellCharges < 0)
                    expendable = true;

                int32 charges = m_CastItem->GetSpellCharges(i);

                // item has charges left
                if (charges)
                {
                    (charges > 0) ? --charges : ++charges;  // abs(charges) less at 1 after use
                    if (proto->Stackable == 1)
                        m_CastItem->SetSpellCharges(i, charges);
                    m_CastItem->SetState(ITEM_CHANGED, (Player*)m_caster);
                }

                // all charges used
                withoutCharges = (c