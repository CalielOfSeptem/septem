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
     
     
     void send_to_player(std::string& str)
     {
        //if (auto spt = client_ob/j.lock()) { // Has to be copied into a shared_ptr before usage
        if( client_obj )
            (*client_obj).send(str);
        //std::cout << *spt << "\n";
      //  }
      //  else {
           // std::cout << "gw is expired\n";
      //  }
        
     }
     
public:
    shared_ptr< client > client_obj;
    std::string player_name; //for now. TODO: implement full player details and support
    
};
 
#endif