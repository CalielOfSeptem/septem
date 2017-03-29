#define SOL_CHECK_ARGUMENTS
#include <boost/shared_ptr.hpp>
#include "sol.hpp"
#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <unordered_set>
#include "scriptable_entities/room.hpp"
//#include "lua.h"
/*
 * How to handle smart pointers..
 * 
 */
/*
namespace sol {
        template <typename T>
        struct unique_usertype_traits<boost::shared_ptr<T>> {
                typedef T type;
                typedef boost::shared_ptr<T> actual_type;
                static const bool value = true;

                static bool is_null(const actual_type& value) {
                        return value == nullptr;
                }

                static type* get (const actual_type& p) {
                        return p.get();
                }
        }
}
*/

bool init_room_utype(sol::state& lua)
{
   // 
    
   // lua.open_libraries(sol::lib::base);
   // lua.new_usertype<room>("room", sol::base_classes, sol::bases<room>());
   
    lua.open_libraries(sol::lib::base);//, sol::lib::package, sol::lib::math, sol::lib::table);
    lua.new_usertype<exitobj>("exitobj", "get_exit_noun", &exitobj::get_exit_noun);
    lua.new_usertype<room>("room", "title", &room::title, "description", 
    &room::description, "short_decscription", &room::short_description,
    "get_exits", &room::get_exits, "add_exit", &room::add_exit);
    //"get_exits", &room::get_exits, "add_exit", &room::add_exit,);
    
    
    
    
    return true;
       
}

int test2()
{

int main(int argc, char** argv) {


    return 0;
}

	return 0;

}
bool load_room(sol::state& lua, const std::string& path_to_room, room& r)
{
        
    sol::protected_function_result result1 = lua.do_file(path_to_room);

    if (!result1.valid()) {
        sol::error err = result1;
        std::string what = err.what();
        std::cout << "call failed, sol::error::what() is " << what << std::endl;
        return false;
    }
    else
    {
        std::vector<std::reference_wrapper<room>> rooms;
        
        // These are all the table names
        // that can trigger an infinite lookup because
        // it contains references to other entities already being
        // traversed: exclude them from the lookup list
        std::unordered_set<std::string> base_library_names({
            "_G", // global table
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
            "bit32"
        });
        // Our recursive function
        // We use some lambda techniques and pass the function itself itself so we can recurse,
        // but a regular function would work too!
        auto fx = [&lua, &rooms, &base_library_names](auto& f, auto& tbl) -> void {
            // You can iterate through a table: it has 
            // begin() and end()
            // like standard containers
            for (auto key_value_pair : tbl) {
                // Note that iterators are extremely frail
                // and should not be used outside of
                // well-constructed for loops
                // that use pre-increment ++,
                // or C++ ranged-for loops
                const sol::object& key = key_value_pair.first;
                const sol::object& value = key_value_pair.second;
                sol::type t = value.get_type();
                switch (t) {
                case sol::type::function:
                {
                        //if (key.is<std::string>()) 
                        //{
                         //   std::cout << "key " << key.as<std::string>() << " is a function -- " << endl;
                            // use this later to find interface functions we need
                            //std::cout << "value " << value.as<std::string>() << " is a sig -- " << std::endl;
                            //sol::optional<room&> maybe_function = value.as<sol::optional<sol::function&>>();
                           // sol::function& v = value;
                           // if (v) {
                           //     cout << "OK";
                           // }
                        //}
                    break;
                }
                case sol::type::table: {
                    sol::optional<std::string> maybe_strkey = key.as<sol::optional<std::string>>();
                    if (maybe_strkey) {
                        std::string& strkey = maybe_strkey.value();
                        std::cout << "key " << strkey << " is a table...";
                        if (base_library_names.find(strkey) != base_library_names.end()) {
                            std::cout << " built-in detected: skipping!" << std::endl;
                            continue;
                        }
                        std::cout << std::endl;
                    }
                    sol::table inner = value.as<sol::table>();
                    f(f, inner);
                }
                break;
                case sol::type::userdata: {
                    // This allows us to check if a userdata is 
                    // a specific class type
                    
                    sol::optional<room&> maybe_room = value.as<sol::optional<room&>>();
                    if (maybe_room) {
                        room& the_room = maybe_room.value();
                        if (key.is<std::string>()) {
                            std::cout << "key " << key.as<std::string>() << " is a room -- ";
                        }
                        else if (key.is<int>()) {
                            std::cout << "key " << key.as<int>() << " is a room -- ";
                        }
                        std::cout << "room.description == " << the_room.description << std::endl;
                        rooms.push_back(the_room);
                    }
                     
                }
                break;
                default:
                    //std::cout << "";
                    break;
                }
            }
        };
        sol::table globals = lua.globals();
        fx(fx, globals);

        return true;
    }
    /*
    if( lua["p1"] != sol::nil )
    {
        r = lua["p1"];
        return true;
    }
    else
    {
        return false;
    }*/
}




void test_lua()
{
    //test2();
    std::vector<boost::shared_ptr<sol::state>> v;
  //  v.reserve(10000);

    for( unsigned int x = 0; x < 1; x++ )
    {
        boost::shared_ptr<sol::state> lua(new sol::state());
        init_room_utype((*lua));
        
        room r1;// = room();
        if( load_room(*lua, "/home/ken/git-repos/septem/game_data/realms/void", r1 ))
        {
            
        }

    }

}