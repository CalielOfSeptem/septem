#ifndef HEARTBEAT_MANAGER_H_
#define HEARTBEAT_MANAGER_H_

#include "sol.hpp"

struct heartbeat_manager
{
    heartbeat_manager()
    {
      
    }
    
    struct state_wrapper
    {
        state_wrapper(sol::state_view lua_state, sol::protected_function pf, std::string script_path) :
             lua_state(lua_state), pf(pf), script_path(script_path)
            {
                
            }
        sol::state_view lua_state;
        sol::protected_function pf;
        std::string script_path;
    };
    
    unsigned int register_heartbeat_func(sol::state_view lua_state, sol::protected_function pf)
    {
        std::string script_path = lua_state["internal_entity_script_path"];
        if( script_path.empty() )
            return -1; // yeah.. don't go trying to use an empty value
        bindings.insert( {++bindingId, state_wrapper (lua_state, pf, script_path)});
        return bindingId;
    }
    
    bool deregister_heartbeat_func(int func_id)
    {
        if (bindings.erase(func_id) == 1)
           return true;
        else
            return false;
    }
    
    bool deregister_all_heartbeat_funcs()
    {
        bindings.clear();
        return true;
    }
    
    bool clear_heartbeat_funcs(std::string script_path)
    {
        for(auto it = begin(bindings); it != end(bindings);)
        {
          if (it->second.script_path.compare(script_path) == 0)
          {
            it = bindings.erase(it); // previously this was something like bindings.erase(it++);
          }
          else
            ++it;
        }
        return true;
    }
    
    void do_heartbeats()
    {
        //recreate_crash();
        //crash_it();
        //eturn;
        //cout << "starting..." << endl;
        for (auto& kv : bindings) 
        {
           // 
            auto result = kv.second.pf();
            
            if ( !result.valid() ) {
                sol::error err = result;
                cout << err.what() << endl;
            }
        }
       // cout << "done." << endl;
        
    }
 

    unsigned int register_heartbeat_func_on(sol::this_state ts, sol::object f)
    {
        //return 1;
        sol::type t = f.get_type();
        unsigned int ret = -1;
        switch (t) {
        case sol::type::function:
        {
            ret = register_heartbeat_func(sol::state_view(ts), f);
           
            break;
        }
        case sol::type::string:
        {
            sol::protected_function mp =  sol::state_view(ts)[f.as<std::string>()];
            ret =register_heartbeat_func(sol::state_view(ts), mp);
        }
        break;
        case sol::type::table: {

        }
        break;
        case sol::type::userdata: {

        }
        break;
        default:
           // std::cout << "";
            break;
        }
        return ret;

    }
    
private:
    std::unordered_map< int, state_wrapper > bindings;
    unsigned int bindingId;
};
#endif