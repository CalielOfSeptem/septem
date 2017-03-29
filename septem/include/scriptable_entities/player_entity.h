#ifndef PLAYER_ENTITY_H
#define PLAYER_ENTITY_H
 
#include <string>
#include <vector>
#include "scriptable_entities/living_entity.h"
#include "scriptable_entities/container.h"
#include "server/client.hpp"

 using namespace std;
 
struct player_entity : living_entity, container
{
     player_entity() :
     living_entity(EntityType::PLAYER)
     {
         
     }
     
     void SendToEntity(const std::string& str)
     {
        if( client_obj )
            (*client_obj).send(str);
        living_entity::SendToEntity(str);
     }
     
     void SendToEnvironment(const std::string& str)
     {
         // TODO: implement this
         living_entity::SendToEnvironment(str);
     }
     
public:
    shared_ptr< client > client_obj;
    std::string player_name; //for now. TODO: implement full player details and support
    
    
};
 
#endif