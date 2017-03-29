#ifndef COMMAND_H_
#define COMMAND_H_
 
#include <string>
#include <vector>
#include "scriptable_entities/base_entity.h"
 
struct command : base_entity
{
     command() : base_entity(EntityType::COMMAND)
     {
         
     }
    std::string verb;
};
 
#endif