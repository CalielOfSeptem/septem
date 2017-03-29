 #ifndef CONTAINER_H_
 #define CONTAINER_H_
 
 #include <string>
 #include <vector>
 #include <set>
 #include "scriptable_entities/base_entity.h"
 #include "scriptable_entities/entity_wrapper.h"
 
 using namespace std;

 struct container
 {
     container() = default;
     
     virtual void AddEntityToInventory( const shared_ptr< entity_wrapper > & ew)=0;

     
     std::set< shared_ptr<entity_wrapper> > inventory;
 };
 #endif