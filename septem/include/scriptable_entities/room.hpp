 #ifndef ROOM_HPP
 #define ROOM_HPP
 
 #include <string>
 #include <vector>
 #include "scriptable_entities/base_entity.h"
 #include "scriptable_entities/container.h"
//#include <scriptable_entities/script_manager.h>
 
 using namespace std;

 struct exitobj
 {
     exitobj() = default;
     exitobj(const std::string &exit_noun, const std::string &exit_path)
        : exit_noun(exit_noun), exit_path(exit_path)
     {
         
     }
     const std::string& get_exit_noun() { return exit_noun; };
private:
     
     std::string exit_noun;
     std::string exit_path;
 };
 
 struct room : base_entity, container
 {
    room( const room& other ) :
     base_entity(EntityType::ROOM), title(other.title), description(other.description), 
     short_description(other.short_description), bregistered_for_hb(other.bregistered_for_hb)
    {
        for( auto eobj : other.obvious_exits )
        {
            obvious_exits.push_back(eobj);
        }
    }
     room(const string& title, const string& description, const string& short_decscription) :
            base_entity(EntityType::ROOM), title(title), description(description), short_description(short_decscription)
            {
                
            }
             
            
     room() : base_entity(EntityType::ROOM)
     {
         
     }
     
     bool add_exit( const string& exit_noun,  const string& exit_path )
     {
         // TODO: add in validation code
         obvious_exits.push_back(exitobj(exit_noun, exit_path));
         return true;
     }
     
     void registerheartbeat()
     {
        bregistered_for_hb = true;
        // script_manager::Instance().register_for_heartbeats(shared_from_this());
     }
     
     
     
     void deregisterheartbeat()
     {
       //  script_manager::Instance().deregister_for_heartbeats(shared_from_this());
         bregistered_for_hb = false;
     }
     
     vector<exitobj>& get_exits() { return obvious_exits; }
     
     
     
public:
     string title;
     string description;
     string short_description;
     vector< exitobj > obvious_exits;
     string script_path; // t
     string object_id; // this and script_path form a uinque ID tuple
     
     bool bregistered_for_hb;
     
     //std::map<string,string> obvious_exits;
 };
 #endif