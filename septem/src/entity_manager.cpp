#include "entity_manager.h"

bool entity_manager::compile_script(std::string& script_path, unordered_set<shared_ptr<entity_wrapper>>& entities, std::string& reason)
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

    // cout << script_text;

    shared_ptr<sol::state> lua(new sol::state);

    switch(etype) {
        case EntityType::DAEMON: {
        
        _init_daemon_type(*lua); // may need to have all commands in the same state to reduce overhead... but that could get messy

        (*lua)["internal_entity_script_path"] = script_path;
        std::vector<string> daemon_obj_name;
        if(!load_entities_from_script((*lua.get()), script_text, daemon_obj_name, EntityType::DAEMON, error_str)) {
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
            new_se->instance_id = 0;//command_uid_count++;
            entities.insert(new_se);
        }
    } break;
        case EntityType::COMMAND: {
        
        _init_command_type(*lua); // may need to have all commands in the same state to reduce overhead... but that could get messy

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
        _init_player_type(*lua); // load up the functions for this script type

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
        _init_room_type(*lua);
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

bool entity_manager::load_player(shared_ptr<client> c)
{
    std::unordered_set<shared_ptr<entity_wrapper> > entities;
    std::string reason;
    std::string fpath = DEFAULT_PLAYER_ENTITY_SCRIPT; // Base script for all players
    if(compile_script(fpath, entities, reason)) {

        for(auto ent : entities) {

            switch(ent->entity_type) {
            case EntityType::PLAYER: {
                if( ent->script_obj )
                {
                   base_entity * be = &ent->script_obj.value();
                   player_entity * pe = dynamic_cast<player_entity*>(be);
                   pe->client_obj = c;
                   pe->player_name = c->get_account()->username;
                   LOG_INFO << "Successfully loaded player: " << pe->player_name;
                }
                else
                {
                   LOG_ERROR << "Unable to cast player object into player_entity.";
                }
               
                player_objs.insert({ ent->get_object_uid(), ent }); 
                
                entity_wrapper & ew = *void_room;
                move_entity(ent, ew);
            } break;
            default:
                break;
            }
        }

        return true;
    } else {
        LOG_DEBUG << "Error. Unable to load player: " << reason;
        return false;
    }
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
        } 
        else
        {
            std::unordered_set<shared_ptr<entity_wrapper> > entities;
            std::string reason;
            std::string fpath = itr->path().string();
            if(compile_script(fpath, entities, reason)) {

                for(auto ent : entities) {
                    switch(ent->entity_type) {
                    case EntityType::COMMAND: {
                        base_entity * be = &ent->script_obj.value();
                        command * ce = dynamic_cast<command*>(be);
                        command_objs.insert({ boost::to_lower_copy(ce->GetVerb()),
                                           ent });
                        
                        LOG_INFO << "Loaded command: " << fpath;
                    } break;
                    default:
                        LOG_DEBUG << "A non-command entity was detected when loading commands... strange.. " << fpath;
                        break;
                    }
                }
            }
            else{
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
        } 
        else
        {
            std::unordered_set<shared_ptr<entity_wrapper> > entities;
            std::string reason;
            std::string fpath = itr->path().string();
            if(compile_script(fpath, entities, reason)) {

                for(auto ent : entities) {
                    switch(ent->entity_type) {
                    case EntityType::DAEMON: {
                        base_entity * be = &ent->script_obj.value();
                        daemonobj * ce = dynamic_cast<daemonobj*>(be);
                        daemon_objs.insert({ boost::to_lower_copy(ce->GetName()),
                                           ent });
                        
                        LOG_INFO << "Loaded daemon: " << fpath;
                    } break;
                    default:
                        LOG_DEBUG << "A non-daemon entity was detected when loading commands... strange.. " << fpath;
                        break;
                    }
                }
            }
            else{
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
                    }
                    else{
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
    }
    else {
        return false;
    }
}

bool entity_manager::move_entity(shared_ptr<entity_wrapper>& eorig, entity_wrapper& dest)
{

    // Need some rules such as players can't be put into items, rooms can't be put into players, and so on.
    EntityType eorig_et = eorig->script_obj.value().GetType();
    EntityType dest_et = dest.script_obj.value().GetType();

    switch( dest_et )
    {
        case EntityType::ROOM:
        {
            switch( eorig_et )
            {
                case EntityType::PLAYER:
                {
                    if( dest.script_obj )
                    {
                        base_entity * be = &dest.script_obj.value();
                        room * re = dynamic_cast<room*>(be);
                        re->AddEntityToInventory(eorig);
                        //re->inventory.insert(eorig);
                        shared_ptr<entity_wrapper> ew;
                        std::string l = "look";
                        if( get_command(l, ew) )
                        {
                            sol::table self = (*ew->script_state)[ew->script_obj_name];
                            sol::optional<base_entity&> bep = eorig->script_obj;
                            //player_entity * pe = dynamic_cast<player_entity*>(bep);
                        
                            self["execute_command"](self, bep.value(), "");
                           // lua["print_some_val"]();
                           // ew->script_state[ew->script_obj_name][]
                           // base_entity * bec = &ew->script_obj.value();
                           // command * ce = dynamic_cast<command*>(bec);
                            
                        }
                        // Now that the player is here, lets 'look' for them..
                        
                        
                        
                    }
                    break;
                }
                break;
                default:
                break;
            }

        }
        break;
        default:
        break;
    }


   // if (dynamic_cast<player_entity*>(&etarget) != NULL)
  //  {
 //       LOG_DEBUG << "Target is of type player_entity";
   //     targ_et =
  //  }
           //std::string s = typeid(etarget).name();
        
    return true;
     
}

bool entity_manager::get_void_room(shared_ptr<entity_wrapper>& r)
{
    r = void_room;
    return true;
}

template <typename T>
T* downcast ( base_entity* b ) {
     return dynamic_cast<T*>(b);
}

//sol::optional<room&> entity_manager::get_environment(base_entity& r)
//{
    
//}


int test()
{
    struct base {
        int a = 20;
        void Test(int c)
        {
            a + c;
        }
    };
    
    //shared_ptr < fun_times > ft;
    struct base_abstract {
        virtual void foo() = 0;
    };
    struct player : base, base_abstract {
        int b = 40;
        void foo() override
        {
           
        }
    };

    sol::state lua;
    lua.new_usertype<base>("base",
        "a", &base::a
        );

    lua.new_usertype<player>("player",
        "b", &player::b,
        "Test", &player::Test,
        "Foo", &player::foo,
        sol::base_classes, sol::bases<base, base_abstract>()
    );


   sol::load_result lr = lua.load(R"(
    p1 = player.new()
    p1:Foo()
    )");
    

    if (!lr.valid()) {
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
        }
        else
            std::cout << "OK" << std::endl;
    }
    return 0;

}

void entity_manager::_init_room_type(sol::state& lua)
{
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
    //lua.new_usertype<base_entity>("base");
    lua.new_usertype<exitobj>("exitobj", 
            "GetExitPath", &exitobj::GetExitPath,
            "SetExit", &exitobj::SetExit,
            "SetExitDesc", &exitobj::SetExitDesc,
            "SetExitPath", &exitobj::SetExitPath,
            "SetObvious", &exitobj::SetObvious,
            "GetExit", &exitobj::GetExit);
            
    lua.new_usertype<room>("room",
                           "GetTitle", &room::GetTitle, 
                           "SetTitle", &room::SetTitle, 
                           "GetDescription", &room::GetDescription, 
                           "SetDescription", &room::SetDescription, 
                           "GetShortDescription", &room::GetShortDescription, 
                           "SetShortDescription", &room::SetShortDescription, 
                           "GetExits", &room::GetExits,
                            "AddExit", &room::AddExit,
                            "AddExits", &room::AddExits,
                            "GetEnvironment", &room::GetEnvironment,
                            "SetEnvironment", &room::SetEnvironment,
                           sol::base_classes,
                           sol::bases<base_entity, container>());
}



void entity_manager::_init_player_type(sol::state& lua)
{
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
    lua.new_usertype<player_entity>(
        "player", 
        "player_name", &player_entity::player_name, 
        "SendToEntity", &player_entity::SendToEntity, 
        "GetEnvironment", &player_entity::GetEnvironment,
        "SetEnvironment", &player_entity::SetEnvironment,
        "GetRoom", &player_entity::GetRoom, 
        sol::base_classes, sol::bases<living_entity, base_entity>());
}

void entity_manager::_init_command_type(sol::state& lua)
{
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
    lua.new_usertype<command>(
        "command", 
        "GetVerb", &command::GetVerb,
        "SetVerb", &command::SetVerb,
        sol::base_classes, 
        sol::bases<base_entity>());
    lua.set_function( "command_cast", &downcast<command> );
    lua.set_function( "room_cast", &downcast<room> );
    lua.set_function( "player_cast", &downcast<player_entity> );
    //lua.set_function( "exit_obj_cast", &downcast<exit_obj> );
    _init_player_type(lua);
    _init_room_type(lua);
}

void entity_manager::_init_daemon_type(sol::state& lua)
{
    lua.open_libraries(sol::lib::base, sol::lib::string, sol::lib::package, sol::lib::math, sol::lib::table);
    lua.new_usertype<daemonobj>("daemon", 
        sol::constructors<daemonobj(), daemonobj(std::string)>(),
        "GetName", &daemonobj::GetName,
        "SetName", &daemonobj::SetName,
        sol::base_classes, 
        sol::bases<base_entity>());
    lua.set_function( "command_cast", &downcast<command> );
    lua.set_function( "room_cast", &downcast<room> );
    lua.set_function( "player_cast", &downcast<player_entity> );
    //lua.set_function( "exit_obj_cast", &downcast<exit_obj> );
    _init_player_type(lua);
    _init_room_type(lua);
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
        }
        else if(token.compare("inherit room") == 0) {
            if(bFoundType) // bad. only one type per script
            {
                reason = "Multiple inherit directives detected. Only one entity type is allowed per script.";
                return false;
            }
            obj_type = EntityType::ROOM;
            bFoundType = true;
        }
        else if(token.compare("inherit player") == 0) {
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
        }
        else if(token.compare("inherit command") == 0) {
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
                switch(t) {
                case sol::type::function: {
                    // if (key.is<std::string>())
                    //{
                    //   std::cout << "key " << key.as<std::string>() << " is a function -- " << endl;
                    // use this later to find interface functions we need
                    // std::cout << "value " << value.as<std::string>() << " is a sig -- " << std::endl;
                    // sol::optional<room&> maybe_function = value.as<sol::optional<sol::function&>>();
                    // sol::function& v = value;
                    // if (v) {
                    //     cout << "OK";
                    // }
                    //}
                    break;
                }
                case sol::type::table: {
                    sol::optional<std::string> maybe_strkey = key.as<sol::optional<std::string> >();
                    if(maybe_strkey) {
                        std::string& strkey = maybe_strkey.value();
                        // std::cout << "key " << strkey << " is a table...";
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
