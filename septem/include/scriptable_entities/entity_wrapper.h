 #ifndef ENTITY_WRAPPER_H_
 #define ENTITY_WRAPPER_H_
 
 #include <string>
 #include <vector>
 #include <boost/shared_ptr.hpp>
 #include "sol.hpp"
 #include "scriptable_entities/base_entity.h"
 
 //using namespace std;

 struct entity_wrapper
 {
     
    bool operator == (const entity_wrapper& rhs) const{
        return script_path == rhs.script_path && script_obj_name == rhs.script_obj_name && instance_id == rhs.instance_id;
    }

    bool operator != (const entity_wrapper& rhs) const{
        return !(*this == rhs);
    }

     entity_wrapper()
     {
         
     }
     entity_wrapper( std::string& script_path, std::string& script_obj_name, EntityType& entity_type, unsigned int instance_id )
        : script_path(script_path), script_obj_name(script_obj_name), entity_type(entity_type), instance_id(instance_id)
     {
         
     }
     
     std::string get_object_uid()
     {
         // example: /home/ken/git-repos/septem/game_data/realms/void:obj=room1:id=0
         return script_path + ":obj=" + script_obj_name + ":id=" + std::to_string(instance_id);
     }
     
     std::string script_path;
     std::string script_obj_name;
     sol::optional<base_entity&> script_obj;
     sol::optional<sol::environment> env_obj;
     sol::optional<sol::environment> parent_env_obj;
     //std::string env_path;
    // std::vector<std::string> env_path_v;
     shared_ptr<sol::state> script_state;
     EntityType entity_type;
     unsigned int instance_id; // zero based.
 };
namespace std
{
    template <>
    struct hash<entity_wrapper>
    {
        size_t operator()(entity_wrapper const & x) const noexcept
        {
            return hash<string>()(x.script_path) ^ hash<string>()(x.script_obj_name) ^ hash<string>()(std::to_string(x.instance_id));
        }
    };
}
 
 #endif