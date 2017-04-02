#ifndef DAEMON_H_
#define DAEMON_H_

#include <string>
#include <vector>
#include "scriptable_entities/base_entity.h"

struct daemonobj : base_entity
{
    daemonobj(const std::string& name)
        : base_entity(EntityType::DAEMON)
    {
        this->name = name;
    }
    
    daemonobj()
        : base_entity(EntityType::DAEMON)
    {
        
    }
    
    ~daemonobj()
    {
    }
    
    const std::string& GetName()
    {
        return name;
    }
    
    void SetName(const std::string& name)
    {
        this->name = name;
    }
    
private:
    std::string name;
};

#endif