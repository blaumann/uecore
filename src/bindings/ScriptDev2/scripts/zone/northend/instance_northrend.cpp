#include "precompiled.h"
#include "def_northrend.h"

struct MANGOS_DLL_DECL instance_northrend : public ScriptedInstance
{
    instance_northrend(Map *Map) : ScriptedInstance(Map) {Initialize();};
};

InstanceData* GetInstanceData_instance_northrend(Map* map)
{
    return new instance_northrend(map);
}

void AddSC_instance_northrend()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "instance_northrend";
    newscript->GetInstanceData = &GetInstanceData_instance_northrend;
    newscript->RegisterSelf();
}
