#include "entity_manager.h"
#include <algorithm>
#include <string>
#include <unordered_map>
#include <boost/format.hpp>
//using namespace std;
//using boost::format;
//using boost::io::group;
//hash<string> hasher;

//string s = "heyho";

//size_t hash = hasher(s);

void hash_path(std::string& path)
{
    std::hash<std::string> hash_fn;
 
    size_t hash = hash_fn(path);
    
    std::stringstream ss;
    ss << hash;
    path = ss.str();
 
    //std::cout << hash << '\n';
}
void strip_path(std::string& path)
{
    //path.erase(std::remove_if(path.begin(), path.end(),  std::not1(std::ptr_fun( (int(*)(int))std::isalnum ), path.end());
   
    //path.erase(remove_if(path.begin(), path.end(), [](char c) { return !isalpha(c); } ), path.end());
    std::replace_if(path.begin() , path.end() ,  
            [] (const char& c) { return !isalpha(c); ;},'_');
    //path.erase(std::remove_if(path.begin(), path.end(), my_predicate), path.end());
    cout << "Output String: " << path;    
}

bool entity_manager::lua_safe_script(std::string& script, sol::state& lua)
{
        auto simple_handler = [](lua_State*, sol::protected_function_result result) {
            // You can just pass it through to let the call-site handle it
            return result;
        };
        auto result = lua.script(script, simple_handler);
        if (result.valid()) {
            //std::cout << "the code worked, and a double-hello statement should appear above this one!" << std::endl;
           // int value = result;
           // assert(value == 24);
           return true;
        }
        else {
            sol::error err = result;
            LOG_DEBUG << err.what();
            //std::cout << "error: " << err.what() << std::endl;
        }
        return false;
}

std::string get_env_str( EntityType& etype )
{
    std::string entitys;
    switch(etype) {
    case EntityType::DAEMON: {
        entitys = "_daemon_env";
    }break;
    case EntityType::COMMAND: {
        entitys = "_command_env";
    }break;
    case EntityType::ITEM: {
        entitys = "_item_env";
    }break;
    case EntityType::NPC: {
        entitys = "_npc_env";
    }break;
    case EntityType::PLAYER: {
        entitys = "_player_env";
    }break;
    case EntityType::ROOM: {
        entitys = "_room_env";
    }break;
    default:
    break;
    }
    
    return entitys;
}

bool replace(std::string& str, const std::string& from, const std::string& to) {
    size_t start_pos = str.find(from);
    if(start_pos == std::string::npos)
        return false;
    str.replace(start_pos, from.length(), to);
    return true;
}

bool entity_manager::_init_env_(EntityType& etype, std::string& script_path, sol::state& lua)
{
    
    std::string sid = script_path; 
   // sid = replace(sid, DEFAULT_GAME_DATA_PATH, " ");
    string  st = std::regex_replace(sid, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");
    strip_path(sid);
    std::string entitys = get_env_str(etype);
    
    std::string s = R"(
                _ENV = _G
                _ENV = %1%
                %2% = {_G = _G.base}
                _ENV = %2%
                internal_entity_script_path = '%3%'
                )";
    std::stringstream ss;
    ss << boost::format(s) % entitys % sid % script_path; // 'simple' style.
    std::string sc = ss.str();
    std::cerr << sc << std::endl;
    return lua_safe_script(sc, lua);
}
    

bool entity_manager::_lua_set_env_(EntityType& etype, std::string& script_path, sol::state& lua)
{
    std::string sid = script_path;
    strip_path(sid);
    std::string entitys = get_env_str(etype);
    std::string s = R"(
                _ENV = _G
                _ENV = %1%.%2%
                )";
    std::stringstream ss;
    ss << boost::format(s) % entitys % sid; // 'simple' style.
    std::string sc = ss.str();
    std::cerr << sc << std::endl;
    return lua_safe_script(sc, lua);
}
        
bool entity_manager::compile_script(std::string& script_path,
                                    unordered_set<shared_ptr<entity_wrapper> >& entities,
                                    std::string& reason)
{
    fs::path p(script_path);
    if(!fs::exists(p)) {
        reason = "Script does not exist.";
        return false;
    }
    std::string script_text;
    EntityType etype;
    string error_str;

    if(!load_script_text(script_path, script_text, etype, error_str)) {
        reason = error_str;
        return false;
    }
    if( !lua_primary )
    {
        lua_primary = shared_ptr<sol::state>(new sol::state);
        _init_sol_(*lua_primary);
    }

    // cout << script_text;

    shared_ptr<sol::state> lua = lua_primary;
    
    //_init_sol_(*lua);

    switch(etype) {
    case EntityType::DAEMON: {
        if (!_init_env_(etype, script_path, *lua))
        {
            LOG_ERROR << "Unable to load daemon: " << script_path;
        }
        else
        {
            LOG_DEBUG << "Loading daemon: " << script_path << "..";
        }
        
       // _init_daemon_type(
            //*lua); // may need to have all commands in the same state to reduce overhead... but that could get messy

        
        std::vector<string> daemon_obj_name;
        if(!load_entities_from_script((*lua), script_text, daemon_obj_name, EntityType::DAEMON, error_str)) {
            reason = error_str;
            return false;
        }
        for(string r_name : daemon_obj_name) {
            shared_ptr<entity_wrapper> new_se(new entity_wrapper());
            sol::optional<base_entity&> so = ((*lua)[r_name]);

            new_se->script_obj = so;
            new_se->script_obj_name = r_name;
            new_se->script_state = lua; // shared_ptr<sol::state>(lua);
            new_se->script_path = script_path;
            new_se->entity_type = EntityType::DAEMON;
            new_se->instance_id = 0; // command_uid_count++;
            entities.insert(new_se);
        }
    } break;
    case EntityType::COMMAND: {

        //_init_command_type(
        //    *lua); // may need to have all commands in the same state to reduce overhead... but that could get messy

        (*lua)["internal_entity_script_path"] = script_path;
        std::vector<string> command_obj_name;
        if(!load_entities_from_script((*lua.get()), script_text, command_obj_name, EntityType::COMMAND, error_str)) {
            reason = error_str;
            return false;
        }
        for(string r_name : command_obj_name) {
            shared_ptr<entity_wrapper> new_se(new entity_wrapper());
            sol::optional<base_entity&> so = ((*lua)[r_name]);

            new_se->script_obj = so;
            new_se->script_obj_name = r_name;
            new_se->script_state = lua; // shared_ptr<sol::state>(lua);
            new_se->script_path = script_path;
            new_se->entity_type = EntityType::COMMAND;
            new_se->instance_id = command_uid_count++;
            entities.insert(new_se);
        }
    } break;
    case EntityType::PLAYER: {
       // _init_player_type(*lua); // load up the functions for this script type

        (*lua)["internal_entity_script_path"] = script_path;
        std::vector<string> player_obj_name;
        if(!load_entities_from_script((*lua.get()), script_text, player_obj_name, EntityType::PLAYER, error_str)) {
            reason = error_str;
            return false;
        }
        if(player_obj_name.size() != 1) {
            reason = "Player object undefined, or more than one object defined (not allowed).";
            return false;
        }
        for(string r_name : player_obj_name) {
            shared_ptr<entity_wrapper> new_se(new entity_wrapper());
            sol::optional<base_entity&> so = ((*lua)[r_name]);

            new_se->script_obj = so;
            new_se->script_obj_name = r_name;
            new_se->script_state = lua; // shared_ptr<sol::state>(lua);
            new_se->script_path = script_path;
            new_se->entity_type = EntityType::PLAYER;
            new_se->instance_id = player_uid_count++;
            entities.insert(new_se);
        }
    } break;
    case EntityType::ROOM: {
        //_init_room_type(*lua);
        /**
         * Elements needed for heartbeat registration
         */
        (*lua).set_function("register_heartbeat", &heartbeat_manager::register_heartbeat_func_on, &heartbeatManager);
        (*lua).set_function("deregister_heartbeat", &heartbeat_manager::deregister_heartbeat_func, &heartbeatManager);
        (*lua).set_function(
            "deregister_all_heartbeat", &heartbeat_manager::deregister_all_heartbeat_funcs, &heartbeatManager);

        (*lua)["internal_entity_script_path"] = script_path;
        std::vector<string> room_obj_names;
        if(!load_entities_from_script((*lua.get()), script_text, room_obj_names, EntityType::ROOM, error_str)) {
            reason = error_str;
            heartbeatManager.clear_heartbeat_funcs(script_path);
            return false;
        }
        // unsigned int instanceid = 0;
        for(string r_name : room_obj_names) {
            // cout << r.description << endl;

            shared_ptr<entity_wrapper> new_se(new entity_wrapper());
            sol::optional<base_entity&> so = (*lua)[r_name];
            new_se->script_obj = so;
            new_se->script_obj_name = r_name;
            new_se->script_state = lua; // shared_ptr<sol::state>(lua);
            new_se->script_path = script_path;
            new_se->entity_type = EntityType::ROOM;
            new_se->instance_id =
                0; // if a script has multiple rooms defined, this allows us to address them individually
            entities.insert(new_se); // std::unique_ptr<entity_wrapper>(std::move(new_se)));
        }

    } break;
    default: {
    }
    }

    // std::string ext = boost::to_lower_copy(p.extension().string());
    // _get_script_object_implementation(script_path);
    return true;
}

std::string entity_manager::load_player(shared_ptr<client> c)
{
    std::unordered_set<shared_ptr<entity_wrapper> > entities;
    std::string reason;
    std::string fpath = DEFAULT_PLAYER_ENTITY_SCRIPT; // Base script for all players
    std::string ret;
    if(compile_script(fpath, entities, reason)) {

        for(auto ent : entities) {

            switch(ent->entity_type) {
            case EntityType::PLAYER: {
                if(ent->script_obj) {
                    base_entity* be = &ent->script_obj.value();
                    player_entity* pe = dynamic_cast<player_entity*>(be);
                    pe->client_obj = c;
                    pe->player_name = c->get_account()->username;
                    LOG_INFO << "Successfully loaded player: " << pe->player_name;
                } else {
                    LOG_ERROR << "Unable to cast player object into player_entity.";
                }

                player_objs.insert({ ent->get_object_uid(), ent });

                entity_wrapper& ew = *void_room;
                move_entity(ent, ew);
                ret = ent->get_object_uid();
            } break;
            default:
                break;
            }
        }

        
    } else {
        LOG_DEBUG << "Error. Unable to load player: " << reason;
       // return "";
    }
    return ret;
}

bool entity_manager::load_commands_from_fs(const fs::path& dir_path)
{
    if(!fs::exists(dir_path))
        return false;
    fs::directory_iterator end_itr; // default construction yields past-the-end
    for(fs::directory_iterator itr(dir_path); itr != end_itr; ++itr) {
        if(fs::is_directory(itr->status())) {
            if(load_entities_from_fs(itr->path()))
                return true;
        } else {
            std::unordered_set<shared_ptr<entity_wrapper> > entities;
            std::string reason;
            std::string fpath = itr->path().string();
            if(compile_script(fpath, entities, reason)) {

                for(auto ent : entities) {
                    switch(ent->entity_type) {
                    case EntityType::COMMAND: {
                        base_entity* be = &ent->script_obj.value();
                        command* ce = dynamic_cast<command*>(be);
                        command_objs.insert({ boost::to_lower_copy(ce->GetName()), ent });

                        LOG_INFO << "Loaded command: " << fpath;
                    } break;
                    default:
                        LOG_DEBUG << "A non-command entity was detected when loading commands... strange.. " << fpath;
                        break;
                    }
                }
            } else {
                LOG_ERROR << "Unable to load " << fpath << ": " << reason;
            }
        }
    }
    return true;
}

bool entity_manager::load_daemon_from_fs(const fs::path& dir_path)
{
    if(!fs::exists(dir_path))
        return false;
    fs::directory_iterator end_itr; // default construction yields past-the-end
    for(fs::directory_iterator itr(dir_path); itr != end_itr; ++itr) {
        if(fs::is_directory(itr->status())) {
            if(load_daemon_from_fs(itr->path()))
                return true;
        } else {
            std::unordered_set<shared_ptr<entity_wrapper> > entities;
            std::string reason;
            std::string fpath = itr->path().string();
            if(compile_script(fpath, entities, reason)) {

                for(auto ent : entities) {
                    switch(ent->entity_type) {
                    case EntityType::DAEMON: {
                        base_entity* be = &ent->script_obj.value();
                        daemonobj* ce = dynamic_cast<daemonobj*>(be);
                        daemon_objs.insert({ boost::to_lower_copy(ce->GetName()), ent });

                        LOG_INFO << "Loaded daemon: " << fpath;
                    } break;
                    default:
                        LOG_DEBUG << "A non-daemon entity was detected when loading commands... strange.. " << fpath;
                        break;
                    }
                }
            } else {
                LOG_ERROR << "Unable to load " << fpath << ": " << reason;
            }
        }
    }
    return true;
}

bool entity_manager::load_entities_from_fs(const fs::path& dir_path)
{
    if(!fs::exists(dir_path))
        return false;
    fs::directory_iterator end_itr; // default construction yields past-the-end
    for(fs::directory_iterator itr(dir_path); itr != end_itr; ++itr) {
        if(fs::is_directory(itr->status())) {
            if(load_entities_from_fs(itr->path()))
                return true;
        } else // if ( itr->path().filename() == file_name ) // see below
        {
            for(auto kv : entity_map) {
                if(kv.first == itr->path()) {
                    //  for( unsigned int x = 0; x < 30000; x++ )
                    //   {
                    std::unordered_set<shared_ptr<entity_wrapper> > entities;
                    std::string reason;
                    std::string fpath = kv.first;
                    if(compile_script(fpath, entities, reason)) {

                        for(auto& ent : entities) {

                            switch(ent->entity_type) {
                            case EntityType::ROOM: {
                                //   std::make_shared((*it));
                                // boost::shared_ptr< entity_wrapper> en = ent;
                                room_objs.insert({ ent->get_object_uid(),
                                                   ent }); // path+ std::to_string(x) + ent->script_obj_name, ent });//
                                                           // reference_wrapper<base_entity>(*(*lua)[r_name]) });
                                LOG_INFO << "Loaded room: " << fpath;
                                if(fpath == std::string(DEFAULT_VOID_PATH)) {
                                    void_room = ent;
                                    LOG_INFO << "Void room identified: " << fpath;
                                }
                                // room_objs.insert({ fpath + ent->script_obj_name, ent });
                                // room_objs[fpath]
                            } break;
                            default:
                                LOG_DEBUG << "A non-room entity was detected when loading rooms... strange.. " << fpath;
                                break;
                            }
                        }
                    } else {
                        LOG_ERROR << "Unable to load " << fpath << ": " << reason;
                    }
                    kv.second = true;
                }
            }
        }
    }
    return false;
}

bool entity_manager::get_command(std::string& verb, shared_ptr<entity_wrapper>& cmd)
{
    auto search = command_objs.find(boost::to_lower_copy(verb));
    if(search != command_objs.end()) {
        cmd = search->second;
        return true;
    } else {
        return false;
    }
}

bool entity_manager::get_daemon(std::string& daemon, shared_ptr<entity_wrapper>& cmd)
{
    auto search = daemon_objs.find(boost::to_lower_copy(daemon));
    if(search != daemon_objs.end()) {
        cmd = search->second;
        return true;
    } else {
        return false;
    }
}

bool entity_manager::get_player(const std::string& player_uid, shared_ptr<entity_wrapper>& cmd)
{
    auto search = player_objs.find(player_uid);
    if(search != player_objs.end()) {
        cmd = search->second;
        return true;
    } else {
        return false;
    }
}

bool entity_manager::move_entity(shared_ptr<entity_wrapper>& eorig, entity_wrapper& dest)
{

    // Need some rules such as players can't be put into items, rooms can't be put into players, and so on.
    EntityType eorig_et = eorig->script_obj.value().GetType();
    EntityType dest_et = dest.script_obj.value().GetType();

    switch(dest_et) {
    case EntityType::ROOM: {
        switch(eorig_et) {
        case EntityType::PLAYER: {
            if(dest.script_obj) {
                base_entity* be = &dest.script_obj.value();
                room* re = dynamic_cast<room*>(be);
                re->AddEntityToInventory(eorig);
                // re->inventory.insert(eorig);
                shared_ptr<entity_wrapper> ew;
                std::string l = "look";
                if(get_command(l, ew)) {
                    sol::table self = (*ew->script_state)[ew->script_obj_name];
                    sol::optional<base_entity&> bep = eorig->script_obj;
                    // player_entity * pe = dynamic_cast<player_entity*>(bep);

                    self["ExecuteCommand"](self, bep.value(), "");
                    // lua["print_some_val"]();
                    // ew->script_state[ew->script_obj_name][]
                    // base_entity * bec = &ew->script_obj.value();
                    // command * ce = dynamic_cast<command*>(bec);
                }
                // Now that the player is here, lets 'look' for them..
            }
            break;
        } break;
        default:
            break;
        }

    } break;
    default:
        break;
    }

    // if (dynamic_cast<player_entity*>(&etarget) != NULL)
    //  {
    //       LOG_DEBUG << "Target is of type player_entity";
    //     targ_et =
    //  }
    // std::string s = typeid(etarget).name();

    return true;
}

bool entity_manager::get_void_room(shared_ptr<entity_wrapper>& r)
{
    r = void_room;
    return true;
}

template <typename T> T* downcast(base_entity* b)
{
    return dynamic_cast<T*>(b);
}

// sol::optional<room&> entity_manager::get_environment(base_entity& r)
//{

//}

int test()
{
    struct a
    {
        
    };
    struct b
    {
        b()
        {
            m.insert( { "test", shared_ptr<a>(new a()) } );
        }
        //sol::as_table_t<std::vector<a*>> GetCommands()
        std::vector<a*> GetCommands()
        {
                std::vector<a*> ret;
                ret.reserve(m.size());
                for( auto& kvp : this->m )
                {
                    a * be = kvp.second.get();
                    ret.push_back(be);
                }
               // sol::as_table_t<std::vector<a*>>  t = sol::as_table(ret);
                return ret;
        }
        std::map<string, shared_ptr<a>> m;
    };
    b test_obj;
    sol::state lua;
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
    lua.new_usertype<a>("a");
    lua.new_usertype<b>("b",
                        "GetCommands",
                        &b::GetCommands);
                        
        
       // auto result1 = lua.script("/home/ken/git-repos/septem/game_data/test.lua", &sol::default_on_error);
        

        // call lua code, and check to make sure it has loaded and run properly:
       // auto handler = &sol::default_on_error;
       // lua.script_file("/home/ken/git-repos/septem/game_data/test.lua", handler);

        // Use a custom error handler if you need it
        // This gets called when the result is bad
        auto simple_handler = [](lua_State*, sol::protected_function_result result) {
            // You can just pass it through to let the call-site handle it
            return result;
        };
        auto result = lua.script_file("/home/ken/git-repos/septem/game_data/test.lua", simple_handler);
        if (result.valid()) {
            std::cout << "the code worked, and a double-hello statement should appear above this one!" << std::endl;
           // int value = result;
           // assert(value == 24);
        }
        else {
            sol::error err = result;
            std::cout << "error: " << err.what() << std::endl;
        }

        return 0;
   // lua.set_function("GetCommands", &downcast<command>);
       /*                 
    lua.script(R"(
            
            a = 1
            function b:FooExtend ( o )
                print('FooExtend')
            
            end
            
            local newgt = {} -- create new environment
            --setmetatable(newgt, {__index = _G})
            setfenv(1, {_G = _G})
            setfenv(1, newgt) -- set it
            print(a) --> 1
            p1 = b.new () 
            cmds = p1:GetCommands()
            print( #cmds )
            
            local newgt2 = {} -- create new environment
            --setmetatable(newgt2, {__index = _G})
            setfenv(1, {_G = _G})
            setfenv(1, newgt2) -- set it
            print(a) --> 1
            p1 = b.new () 
            p1:FooExtend()
            cmds = p1:GetCommands()
            
            -- Add a new extended method..
            function b:FooExtendEx ( o )
                print('FooExtendEx')
            
            end
            
            print( #cmds )
            
            -- Go back to global
            setfenv( 1, _G )
            newgt2.p1:FooExtend()
            newgt2.p1:FooExtendEx()
            newgt.p1:FooExtend()
        )");
         */
    /*
    if(!lr.valid())
    {
        sol::error err = lr;
        std::string what = err.what();
        std::cout << "call failed, sol::error::what() is " << what << std::endl;
        // return 0;
    }
    else
    {
        sol::protected_function_result result1 = lr(); // lua.do_string("return 24"); // test to make sure it loaded correctly
        if(!result1.valid()) {
            sol::error err = result1;
            std::string what = err.what();
            std::cout << "call failed, sol::error::what() is " << what << std::endl;
        } else
            std::cout << "OK" << std::endl;
    }
  */
    /*
    struct base
    {
        int a = 20;
        void Test(int c)
        {
            a + c;
        }
    };

    // shared_ptr < fun_times > ft;
    struct base_abstract
    {
        virtual void foo() = 0;
    };
    struct player : base, base_abstract
    {
        int b = 40;
        void foo() override
        {
        }
    };

    sol::state lua;
    lua.new_usertype<base>("base", "a", &base::a);

    lua.new_usertype<player>("player",
                             "b",
                             &player::b,
                             "Test",
                             &player::Test,
                             "Foo",
                             &player::foo,
                             sol::base_classes,
                             sol::bases<base, base_abstract>());

    sol::load_result lr = lua.load(R "(
                                   p1 = player.new () p1
                                   : Foo()) ");

    if(!lr.valid())
    {
        sol::error err = lr;
        std::string what = err.what();
        std::cout << "call failed, sol::error::what() is " << what << std::endl;
        // return 0;
    }
    else
    {
        sol::protected_function_result result1 =
            lr(); // lua.do_string("return 24"); // test to make sure it loaded correctly
        if(!result1.valid()) {
            sol::error err = result1;
            std::string what = err.what();
            std::cout << "call failed, sol::error::what() is " << what << std::endl;
        } else
            std::cout << "OK" << std::endl;
    }
    */

}

bool entity_manager::_init_sol_(sol::state& lua)
{
    _init_libs(lua);
    _init_types(lua);
    
    auto simple_handler = [](lua_State*, sol::protected_function_result result) {
        // You can just pass it through to let the call-site handle it
        return result;
    };
    auto result = lua.script_file(DEFAULT_SOL_INIT_PATH, simple_handler);
    if (result.valid()) {
        //std::cout << "the code worked, and a double-hello statement should appear above this one!" << std::endl;
       // int value = result;
       // assert(value == 24);
       return true;
    }
    else {
        sol::error err = result;
        LOG_ERROR << "Error: " << err.what();
        return false;
    }
}
void entity_manager::_init_libs(sol::state& lua)
{
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
}

void entity_manager::_init_types(sol::state& lua)
{
    _init_base_entity_type(lua);
    _init_daemon_type(lua);
    _init_room_type(lua);
    _init_player_type(lua);
}

void entity_manager::_init_base_entity_type(sol::state& lua)
{
       lua.new_usertype<base_entity>("base_entity",
                                    "GetType", &base_entity::GetEntityTypeString
                                    );
}

void entity_manager::_init_room_type(sol::state& lua)
{
    lua.new_usertype<exitobj>("exitobj",
                              "GetExitPath",
                              &exitobj::GetExitPath,
                              "SetExit",
                              &exitobj::SetExit,
                              "SetExitDesc",
                              &exitobj::SetExitDesc,
                              "SetExitPath",
                              &exitobj::SetExitPath,
                              "SetObvious",
                              &exitobj::SetObvious,
                              "GetExit",
                              &exitobj::GetExit);

    lua.new_usertype<room>("room",
                           "GetTitle",
                           &room::GetTitle,
                           "SetTitle",
                           &room::SetTitle,
                           "GetDescription",
                           &room::GetDescription,
                           "SetDescription",
                           &room::SetDescription,
                           "GetShortDescription",
                           &room::GetShortDescription,
                           "SetShortDescription",
                           &room::SetShortDescription,
                           "GetExits",
                           &room::GetExits,
                           "AddExit",
                           &room::AddExit,
                           "AddExits",
                           &room::AddExits,
                           "GetEnvironment",
                           &room::GetEnvironment,
                           "SetEnvironment",
                           &room::SetEnvironment,
                           sol::base_classes,
                           sol::bases<base_entity, container>());
}

void entity_manager::_init_player_type(sol::state& lua)
{

    lua.new_usertype<player_entity>("player",
                                    "player_name",
                                    &player_entity::player_name,
                                    "SendToEntity",
                                    &player_entity::SendToEntity,
                                    "GetEnvironment",
                                    &player_entity::GetEnvironment,
                                    "SetEnvironment",
                                    &player_entity::SetEnvironment,
                                    "GetRoom",
                                    &player_entity::GetRoom,
                                    "GetType", &base_entity::GetEntityTypeString,
                                    sol::base_classes,
                                    sol::bases<living_entity, base_entity>());
}

void entity_manager::_init_command_type(sol::state& lua)
{

    lua.new_usertype<command>("command",
                            sol::constructors<command(), command(std::string), daemonobj(std::string, int)>(),
                              "GetName", &command::GetName,
                              "SetName", &command::SetName,
                              "GetSynonyms", &command::GetSynonyms,
                              "SetSynonyms", &command::SetSynonyms,
                              "SetPriority", &command::SetPriority,
                              "GetPriority", &command::GetPriority,
                              sol::base_classes,
                              sol::bases<base_entity>());
    lua.set_function("command_cast", &downcast<command>);
    lua.set_function("room_cast", &downcast<room>);
    lua.set_function("player_cast", &downcast<player_entity>);
    
}

void entity_manager::_init_daemon_type(sol::state& lua)
{
 
    lua.new_usertype<daemonobj>("daemon",
                                sol::constructors<daemonobj(), daemonobj(std::string)>(),
                                "GetName",
                                &daemonobj::GetName,
                                "SetName",
                                &daemonobj::SetName,
                                sol::base_classes,
                                sol::bases<base_entity>());
    lua.set_function("command_cast", &downcast<command>);
    lua.set_function("room_cast", &downcast<room>);
    lua.set_function("player_cast", &downcast<player_entity>);
    lua.set_function("GetCommands", &entity_manager::GetCommands, this);

}

bool entity_manager::load_script_text(std::string& script_path,
                                      std::string& script_text,
                                      EntityType& obj_type,
                                      string& reason)
{
    std::ifstream in(script_path);
    std::stringstream buffer;
    buffer << in.rdbuf();

    std::string token;
    vector<string> file_tokens;
    bool bFoundType = false;
    while(std::getline(buffer, token, '\n')) {
        trim(token);
        if(token.compare("inherit daemon") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::DAEMON;
            bFoundType = true;
        } else if(token.compare("inherit room") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::ROOM;
            bFoundType = true;
        } else if(token.compare("inherit player") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::PLAYER;
            bFoundType = true;
        } else if(token.compare("inherit object") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::ITEM;
            bFoundType = true;
        } else if(token.compare("inherit npc") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::NPC;
            bFoundType = true;
        } else if(token.compare("inherit command") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::COMMAND;
            bFoundType = true;
        } else {
            file_tokens.push_back(token);
        }
        //  std::cout << token << '\n';
    }
    script_text = vector_to_string(file_tokens, '\n');
    if(bFoundType == false) {
        //  reason = "No inherit directive found in script.";
        //  return false;
    }
    return true;
}

bool entity_manager::load_entities_from_script(sol::state& lua,
                                               const std::string& script_text,
                                               std::vector<string>& obj_names,
                                               EntityType entity_type,
                                               string& reason)
{
    sol::load_result lr = lua.load(script_text);
    if(!lr.valid()) {
        sol::error err = lr;
        reason = err.what();
        return false;
    }
    // lr();
    // execute and return result
    sol::protected_function_result result1 =
        lr(); // lua.do_string("return 24"); // test to make sure it loaded correctly
    if(!result1.valid()) {
        sol::error err = result1;
        reason = err.what();
        // std::cout << "call failed, sol::error::what() is " << what << std::endl;
        return false;
    } else {

        // These are all the table names
        // that can trigger an infinite lookup because
        // it contains references to other entities already being
        // traversed: exclude them from the lookup list
        std::unordered_set<std::string> base_library_names({ "_G", // global table
                                                             "base",
                                                             "io",
                                                             "os",
                                                             "utf8",
                                                             "jit",
                                                             "package",
                                                             "loaded",
                                                             "preload",
                                                             "coroutine",
                                                             "string",
                                                             "math",
                                                             "table",
                                                             "debug",
                                                             "bit32" });
        // Our recursive function
        // We use some lambda techniques and pass the function itself itself so we can recurse,
        // but a regular function would work too!
        bool bFindObject = false;
        auto fx = [&lua, &obj_names, &base_library_names, &bFindObject, &entity_type](auto& f, auto& tbl) -> void {
            // You can iterate through a table: it has
            // begin() and end()
            // like standard containers
            for(auto key_value_pair : tbl) {
                // Note that iterators are extremely frail
                // and should not be used outside of
                // well-constructed for loops
                // that use pre-increment ++,
                // or C++ ranged-for loops
                const sol::object& key = key_value_pair.first;
                const sol::object& value = key_value_pair.second;
                sol::type t = value.get_type();
               // std::cerr << t << std::endl;
                switch(t) {
                case sol::type::function: {
                    if (key.is<std::string>())
                    {
                       std::cout << "key " << key.as<std::string>() << " is a function -- " << endl;
                    // use this later to find interface functions we need
                    // std::cout << "value " << value.as<std::string>() << " is a sig -- " << std::endl;
                    // sol::optional<room&> maybe_function = value.as<sol::optional<sol::function&>>();
                    // sol::function& v = value;
                    // if (v) {
                    //     cout << "OK";
                    // }
                    }
                    break;
                }
                case sol::type::table: {
                    sol::optional<std::string> maybe_strkey = key.as<sol::optional<std::string> >();
                    if(maybe_strkey) {
                        std::string& strkey = maybe_strkey.value();
                        std::cout << "key " << strkey << " is a table...";
                        if(base_library_names.find(strkey) != base_library_names.end()) {
                            //  std::cout << " built-in detected: skipping!" << std::endl;
                            continue;
                        }
                        //   std::cout << std::endl;
                    }
                    sol::table inner = value.as<sol::table>();
                    f(f, inner);
                } break;
                case sol::type::userdata: {
                    // This allows us to check if a userdata is
                    // a specific class type

                    sol::optional<room&> maybe_room = value.as<sol::optional<room&> >();
                    if(maybe_room) {
                        entity_type = EntityType::ROOM;
                        bFindObject = true;
                        obj_names.push_back(key.as<std::string>());
                        break;
                    }
                    sol::optional<command&> maybe_command = value.as<sol::optional<command&> >();
                    if(maybe_command) {
                        entity_type = EntityType::COMMAND;
                        bFindObject = true;
                        obj_names.push_back(key.as<std::string>());
                        break;
                    }
                    sol::optional<player_entity&> maybe_player = value.as<sol::optional<player_entity&> >();
                    if(maybe_player) {
                        entity_type = EntityType::PLAYER;
                        bFindObject = true;
                        obj_names.push_back(key.as<std::string>());
                        break;
                    }
                    sol::optional<daemonobj&> maybe_daemon = value.as<sol::optional<daemonobj&> >();
                    if(maybe_daemon) {
                        entity_type = EntityType::DAEMON;
                        bFindObject = true;
                        obj_names.push_back(key.as<std::string>());
                        break;
                    }

                } break;
                default:
                    if (key.is<std::string>())
                    {
                       std::cout << "key " << key.as<std::string>() << " is a unknown -- " << endl;
                    }
                    // std::cout << "";
                    break;
                }
            }
        };
        sol::table globals = lua.globals();
        fx(fx, globals);
        if(bFindObject == false) {
            reason = "No recognized objects instantiated in script.";
            return false;
        }
        return true;
    }
}

bool entity_manager::process_player_cmd(const std::string& playerid, const std::string& args)
{
    
    shared_ptr<entity_wrapper> ew;
    if( !this->get_player(playerid, ew) )
    {
        LOG_ERROR << "Unable to locate player: " << playerid;
        return false;
    }

    base_entity* be = &ew->script_obj.value();
    
    shared_ptr<entity_wrapper> ew_daemon;
    std::string l = "command_proc";
    if(get_daemon(l, ew_daemon)) {
        sol::table self = (*ew_daemon->script_state)[ew_daemon->script_obj_name];
        sol::optional<base_entity&> bep = ew_daemon->script_obj;

        sol::protected_function exec = self["process_command"];
        auto result = exec(self, be, args);
        if ( !result.valid() ) {
            sol::error err = result;
            LOG_DEBUG << err.what();
        }
    }
    else
    {
        LOG_DEBUG << "Unable to call process_command function in command_proc daemon.";
    }
    return true;
}
std::vector<command*> entity_manager::GetCommands()
{
    std::vector<command*> ret;
    ret.reserve(command_objs.size());
    for( auto& kvp : this->command_objs )
    {
        command * be = static_cast<command*>(&kvp.second->script_obj.value());
        ret.push_back(be);
    }
    return ret;
}
