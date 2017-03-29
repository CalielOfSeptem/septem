 #ifndef LIVING_ENTITY_H
 #define LIVING_ENTITY_H
 
 #include <string>
 #include <vector>
 #include "scriptable_entities/base_entity.h"
 
 using namespace std;
 

 struct living_entity : base_entity
 {
     living_entity() = default;
     living_entity(EntityType et) :
        base_entity(et)
     {
         
     }
public:

 };
 #endif