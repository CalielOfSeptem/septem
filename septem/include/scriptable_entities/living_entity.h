#ifndef LIVING_ENTITY_H
#define LIVING_ENTITY_H

#include <string>
#include <vector>
#include "scriptable_entities/base_entity.h"
#include "scriptable_entities/room.hpp"
using namespace std;

struct living_entity : base_entity
{
    living_entity() = default;
    
    living_entity(EntityType et)
        : base_entity(et)
    {
    }

    virtual void SendToEntity(const std::string& entity)
    {
    }

    virtual void SendToEnvironment(const std::string& entity)
    {
    }
    
    room* GetRoom()
    {
        return static_cast<room*>(environment_);
    }

};
#endif