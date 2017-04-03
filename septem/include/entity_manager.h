#ifndef ENTITY_MANAGER_H_
#define ENTITY_MANAGER_H_
#define SOL_CHECK_ARGUMENTS
#include "scriptable_entities/room.hpp"


//#include "env/base_object.h"
#include <unordered_map>
#include <unordered_set>
#include "scriptable_entities/player_entity.h"
#include "scriptable_entities/command.h"
#include "scriptable_entities/daemonobj.h"
//#include <boost/shared_ptr.hpp>
#include <boost/signals2.hpp>
#include "sol.hpp"
#include <iostream>
#include <memory>
#include "utils/stringutils.hpp"
#include <fstream>
#include <string>
#include <set>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/filesystem/fstream.hpp>
#include "heartbeat_manager.h"
#include <plog/Log.h>
#include <typeinfo>
#include "config.h"

namespace fs = boost::filesystem;

using namespace std;

/*

struct script_entity
{
    shared_ptr<sol::state> owner;
    string object_name;
    sol::object obj; 
    //boost::shared_ptr<base_entity> entity;
};
*/

template <class DstType, class SrcType>
bool IsType(const SrcType* src)
{
  return dynamic_cast<const DstType*>(src) != 0;
}

template <class entType>
sol::optional<entType> GetObj (sol::state& s, std::string& v) {
  sol::optional<entType> ret = s[v];
  return ret;
}

class entity_manager
{
public:
    static entity_manager & Instance()
    {
        // Since it's a static variable, if the class has already been created,
        // It won't be created again.
        // And it **is** thread-safe in C++11.

        static entity_manager myInstance;

        // Return a reference to our instance.
        return myInstance;
    }

    // delete copy and move constructors and assign operators
    entity_manager(entity_manager const&) = delete;             // Copy construct
    entity_manager(entity_manager&&) = delete;                  // Move construct
    entity_manager& operator=(entity_manager const&) = delete;  // Copy assign
    entity_manager& operator=(entity_manager &&) = delete;      // Move assign

    // Any other public methods
    
    
    bool compile_entity(std::string& file_path, std::string& reason);
    
    std::string load_player( shared_ptr<client> c );
    
    
    
    bool load_entities_from_fs( const fs::path & dir_path );
    
    bool load_commands_from_fs( const fs::path & dir_path );
    
    bool load_daemon_from_fs( const fs::path & dir_path, std::string& reason );
    
    std::vector<command*> GetCommands();
    
    void invoke_heartbeat()
    {
        heartbeatManager.do_heartbeats();
        /*
        cout << "heartbeat..";
        for (auto& kv : room_objs) 
        {
            // First, lets call a global heartbeat for the script if it exits..
            cout << "heartbeat.." << endl;
            sol::protected_function tmp_hb = (*kv.second->owner)["heartbeat"];
            auto hb_result = tmp_hb();
            if ( hb_result.valid() ) 
            {
            //    std::cout << "[OK]" << std::endl;
                    // Can work with contents
                   //double numwoof = first_woof;
                   // std::cout << "VALID!" << std::endl;
            }
            else
            {
             //   std::cout << "[No Heartbeat() Interface Found]" << std::endl;
                    // An error has occured
                    //sol::error err = hb_result;
            }

            // Next, for the room object, call its local heartbeat method if it exists
            sol::table self = (*kv.second->owner)[(kv.second->object_name)];
            tmp_hb = self["heartbeat"];//(self);
            hb_result = tmp_hb(self);
            if ( hb_result.valid() ) 
            {
            //    std::cout << "[OK]" << std::endl;
                    // Can work with contents
                   //double numwoof = first_woof;
                   // std::cout << "VALID!" << std::endl;
            }
            else
            {
             //   std::cout << "[No Heartbeat() Interface Found]" << std::endl;
                    // An error has occured
                    //sol::error err = hb_result;
            }
  
            //std::cout << kv.first << " has value " << kv.second << std::endl;
        }
      //  for( room& r )
       * */
    }
    /*
    bool init_player(shared_ptr<player_entity> & player_obj)
    {
        //for( auto& c : player_objs )
        //{
        //    
        //}
        LOG_INFO << "Added client_obj";
        std::string welcome = "Welcome to Septem! <DEBUG>";
        player_obj->send_to_player(welcome);
        
        shared_ptr<entity_wrapper> ew = shared_ptr<entity_wrapper>(new entity_wrapper());
        ew->entity_type = EntityType::PLAYER;
        ew->instance_id = 0;
       // ew->script_obj 
        player_objs.insert( player_obj);// std::move(player_obj) );
        
      //  std::shared_ptr<Base> base (new Derived());
        std::shared_ptr<base_entity> be =
               std::dynamic_pointer_cast<base_entity> (player_obj);
            
        //base_entity bvoid = void_room->script_obj.value();   
       // move_entity(be, *void_room);
        //derived = boost::shared_polymorphic_downcast<Derived>(base); 
         //base_entity& new_d = dynamic_cast<base_entity&>(*player_obj); // downcast
         //base_entity be = void_room->script_obj.value();
        // move_entity(  //new_d, be);
         
        // For now, lets just stick the player into the void room...
       // player_entity p = *player_obj;
       // base_entity be = dynamic_cast<base_entity>(&p);
       // move_entity(be, be);
      //  move_entity( dynamic_cast<base_entity>(*player_obj), NULL );
        return true;
    }
     */
    
    bool move_entity(shared_ptr<entity_wrapper>& eorig, entity_wrapper& dest);
    
    bool get_void_room(shared_ptr<entity_wrapper>& r);
    
    bool process_player_cmd(const std::string& playerid, const std::string& args);
    

protected:
    entity_manager()
    {
      
         // Constructor code goes here.
    }

    ~entity_manager()
    {
         // Destructor code goes here.
    }

 // And any other protected methods.
    
private:

    bool compile_script(std::string& script_path, unordered_set<shared_ptr<entity_wrapper>>& entities, std::string& reason);

    std::unordered_map< string, shared_ptr<entity_wrapper>> room_objs;
    
    shared_ptr< entity_wrapper > void_room; // default void room
    
    //shared_ptr< entity_wrapper> commands_;
    
    std::unordered_map< string, shared_ptr<entity_wrapper>> player_objs;
    
    std::unordered_map< string, shared_ptr<entity_wrapper>> command_objs;
    
    std::unordered_map< string, shared_ptr<entity_wrapper>> daemon_objs;
    
    heartbeat_manager heartbeatManager;
    
    unsigned int player_uid_count = 0; // hack to make sure we give each player an instance ID that is non-conflicting
    unsigned int command_uid_count = 0; // hack to make sure we give each command an instance ID that is non-conflicting
    
    
    bool _init_sol_(sol::state& lua);
    
    void _init_libs(sol::state& lua);
    
    void _init_types(sol::state& lua);

    void _init_base_entity_type(sol::state& lua);

    void _init_room_type(sol::state& lua);
    
    void _init_player_type(sol::state& lua);
    
    void _init_command_type(sol::state& lua);
    
    void _init_daemon_type(sol::state& lua);
  //  std::vector< boost::shared_ptr<script_entity> > objs; /// test
    
    bool load_script_text(std::string& script_path, std::string& script_text, EntityType& obj_type, string& reason);
    
    bool load_entities_from_script(sol::state& lua, const std::string& script_text, const sol::environment& env,
        std::vector<string>& obj_names, EntityType entity_type, string& reason);
        
    bool get_command(std::string& verb, shared_ptr<entity_wrapper>& cmd);
    
    bool get_daemon(std::string& verb, shared_ptr<entity_wrapper>& cmd);
    
    bool get_player(const std::string& player_uid, shared_ptr<entity_wrapper>& cmd);

    shared_ptr<sol::state> lua_primary;
    
    std::map < std::string, bool > entity_map = { 
        {"/home/ken/git-repos/septem/game_data/realms/void", false}
        }; 
    std::map < std::string, bool > daemon_map = { 
        {"/home/ken/git-repos/septem/game_data/daemon/command_proc", false}
        }; 

     bool lua_safe_script(std::string& script, sol::state& lua);
     
     bool _init_env_(EntityType& etype, std::string& script_path, sol::state& lua, std::vector<std::string>& env_path);
     
     bool _lua_set_env_(EntityType& etype, std::string& env_path, sol::state& lua);
     
     void get_change_env_script( std::string& script_path, EntityType& etype, std::string& env_script);
     
     bool compile_daemon_entity(std::string& file_path, std::string& reason);
};


#endif