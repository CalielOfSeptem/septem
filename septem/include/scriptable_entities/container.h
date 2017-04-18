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
     //container() = default;
     
     virtual void AddEntityToInventory(const shared_ptr< entity_wrapper >& ew)
     {
         //weak_ptr< entity_wrapper> ewp = ew;
         inventory.insert(ew);
     }
     
     virtual bool RemoveEntityFromInventory( const std::string& id  )
     {
         // TODO: implement this and be sure to nuke a removed items environment_ pointer..
         std::set< shared_ptr<entity_wrapper> >::iterator it = this->inventory.begin();
         
          while (it != this->inventory.end()) {
                // Check if key's first character is Fi
                if( (*it)->get_object_uid().compare(id) == 0 ) 
                {
                    it = this->inventory.erase(it);
                    break;
                }
                else
                    it++;
          }
          
         return true;
     }
     
     virtual const  std::set< shared_ptr<entity_wrapper> >& GetInventory()
     {
         return inventory;
     }
     protected:
     std::set< shared_ptr<entity_wrapper> > inventory;
 };
 #endif