#ifndef ROOM_HPP
#define ROOM_HPP

#include <string>
#include <vector>
#include <map>
#include "scriptable_entities/base_entity.h"
#include "scriptable_entities/container.h"
//#include <scriptable_entities/script_manager.h>

using namespace std;

struct exitobj
{
    exitobj()
    {
        
    }
    exitobj(const std::string& exit, const std::string& exit_path, bool bobvious)
        : exit(exit)
        , exit_path(exit_path)
    {
        this->bobvious = true;
    }
    const std::string& GetExit()
    {
        return exit;
    }
    
    const std::string& GetExitPath()
    {
        return exit_path;
    }

private:
    std::string exit_path; // path the script the exit is linked to
    std::string bobvious; // whether the exit is shown by default
    std::string exit;
};

struct room : base_entity, container
{
    room(const room& other)
        : base_entity(EntityType::ROOM)
        , title(other.title)
        , description(other.description)
        , short_description(other.short_description)
        , bregistered_for_hb(other.bregistered_for_hb)
    {
        for(auto eobj : other.obvious_exits) {
            obvious_exits.push_back(eobj);
        }
    }
    room(const string& title, const string& description, const string& short_decscription)
        : base_entity(EntityType::ROOM)
        , title(title)
        , description(description)
        , short_description(short_decscription)
    {
    }

    room()
        : base_entity(EntityType::ROOM)
    {
    }

    bool AddExit(const std::string& exit, const string& exit_path, bool obvious)
    {
        // TODO: add in validation code
        obvious_exits.push_back(exitobj(exit, exit_path, obvious));
        return true;
    }

    vector<exitobj>& GetExits()
    {
        return obvious_exits;
    }

    void SetTitle(const string& title)
    {
        this->title = title;
    }
    const string& GetTitle()
    {
        return title;
    }

    void SetDescription(const string& description)
    {
        this->description = description;
    }
    const string& GetDescription()
    {
        return description;
    }
    
    void SetShortDescription(const string& short_description)
    {
        this->short_description = short_description;
    }
    const string& GetShortDescription()
    {
        return short_description;
    }
    
    virtual void AddEntityToInventory(const shared_ptr< entity_wrapper >& ew)
    {
        ew->script_obj->SetEnvironment( (base_entity*)this );//ew->script_obj );
        container::AddEntityToInventory(ew);
    }
    
    virtual bool RemoveEntityFromInventory(const std::string& id)
    {
        return container::RemoveEntityFromInventory(id);
    }


protected:
    string title;

    string description;
    string short_description;

    vector<exitobj> obvious_exits;

    bool bregistered_for_hb;

    // std::map<string,string> obvious_exits;
};
#endif