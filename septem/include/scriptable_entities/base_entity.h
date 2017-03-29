 #ifndef BASE_ENTITY_H
 #define BASE_ENTITY_H
 
 #include <string>
 #include <vector>

 
 using namespace std;
 
 enum class EntityType {UNKNOWN, ROOM, ITEM, NPC, PLAYER, COMMAND}; 

 struct base_entity
 {
     base_entity() = default;
     base_entity(EntityType et) :
        entity_type(et)
     {
         
     }
     
     virtual EntityType& get_type()
     {
         return entity_type;
     }
     
    std::string get_entity_type() {
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
     
public:
protected:
    EntityType entity_type = EntityType::UNKNOWN;

 };
 #endif