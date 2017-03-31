#ifndef COMMAND_H_
#define COMMAND_H_

#include <string>
#include <vector>
#include "scriptable_entities/base_entity.h"
#include "sol.hpp"

struct command : base_entity
{
    command()
        : base_entity(EntityType::COMMAND)
    {
    }
    command(const std::string& name)
        : base_entity(EntityType::COMMAND)
    {
        this->cmd_name = name;
    }
    void SetName(const std::string& name)
    {
        this->cmd_name = name;
    }
    const std::string& GetName()
    {
        return cmd_name;
    }
    void SetSynonyms(const sol::as_table_t<std::vector<std::string>>& cmd_syn)
    {
        //this->cmd_syn = cmd_syn;
        const auto& vex = cmd_syn.source;
        for( auto& s : vex )
        {
            this->cmd_syn.push_back(s);
        }
    }
    const std::vector<std::string>& GetSynonyms()
    {
        return cmd_syn;
    }

private:
    std::string cmd_name;
    std::vector<std::string> cmd_syn;

};

#endif