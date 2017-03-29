 #ifndef BASE_ITEM_HPP
 #define BASE_ITEM_HPP
 
 #include <string>
 #include <vector>
 #include "scriptable_entities/base_entity.h"
 

 struct item : base_entity
 {
             
            
     item() :
     entity_type(EntityType::ITEM)
     {
         
     }
     


 };
 #endif