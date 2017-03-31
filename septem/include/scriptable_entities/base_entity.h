#ifndef BASE_ENTITY_H
#define BASE_ENTITY_H

#include <string>
#include <vector>
#include <memory>
#include "sol.hpp"

using namespace std;

enum class EntityType { UNKNOWN, ROOM, ITEM, NPC, PLAYER, COMMAND, DAEMON };

struct base_entity
{
    base_entity() = default;
    base_entity(EntityType et)
        : entity_type(et)
    {
        environment_ = NULL;
    }

    virtual EntityType& GetType()
    {
        return entity_type;
    }

    std::string GetEntityTypeString()
    {
        switch(entity_type) {
        case EntityType::UNKNOWN:
            return "unknown";
        case EntityType::ROOM:
            return "room";
        case EntityType::ITEM:
            return "item";
        case EntityType::NPC:
            return "npc";
        case EntityType::PLAYER:
            return "player";
        default:
            return "unknown";
            break;
        }
    }

    base_entity* GetEnvironment()
    {
        return environment_; //.value();
    }

    void SetEnvironment(base_entity* be)
    {
        environment_ = be;
    }
    
protected:
    base_entity* environment_; // the object the entity is in (e.g., a room, a backpack, etc).
    EntityType entity_type = EntityType::UNKNOWN;
};
#endif