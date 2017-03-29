 #ifndef BASE_ENTITY_H
 #define BASE_ENTITY_H
 
 #include <string>
 #include <vector>
#include <memory>

 using namespace std;
 
 enum class EntityType {UNKNOWN, ROOM, ITEM, NPC, PLAYER, COMMAND}; 

 struct base_entity
 {
     base_entity() = default;
     base_entity(EntityType et) :
        entity_type(et)
     {
         
     }
     
     virtual EntityType& GetType()
     {
         return entity_type;
     }
     
    std::string GetEntityTypeString() {
      switch (entity_type) {
      case EntityType::UNKNOWN: return "unknown";
      case EntityType::ROOM: return "room";
      case EntityType::ITEM: return "item";
      case EntityType::NPC: return "npc";
      case EntityType::PLAYER: return "player";
      default:
      return "unknown";
      break;
      }
    }
    
    base_entity* GetEnvironment()
    {
        return environment_;
    }
    
    void SetEnvironment( base_entity* r )
    {
        environment_ = r;
       // environment_ = r;
    }
    

    
private:
    base_entity* environment_; // the room the entity is in.
    EntityType entity_type = EntityType::UNKNOWN;
   // std::weak_ptr<entity_wrapper> entity_;

 };
 #endif