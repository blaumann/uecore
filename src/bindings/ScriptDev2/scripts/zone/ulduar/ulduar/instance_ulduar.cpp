/* Script Data Start
SDName: Instance Ulduar
SDAuthor: Thyros
SD%Complete: 0
SDComment: Placeholder
SDCategory: 
Script Data End */

#include "precompiled.h"
#include "def_ulduar.h"

struct MANGOS_DLL_DECL instance_ulduar : public ScriptedInstance
{
    instance_ulduar(Map *Map) : ScriptedInstance(Map) {Initialize();};
};

InstanceData* GetInstanceData_ulduar(Map* map)
{
    return new instance_ulduar(map);
}

void AddSC_instance_ulduar()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "example_instance_ulduar";
    newscript->GetInstanceData = GetInstanceData_ulduar;
    newscript->RegisterSelf();
}
