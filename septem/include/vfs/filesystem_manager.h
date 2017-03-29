#ifndef FILESYSTEM_MANAGER_
#define FILESYSTEM_MANAGER_

//#include <ttvfs.h>
#include "config.h"
#include <map>
#include <vector>

// TODO: Implement security scheme.
typedef struct object_permission_
{
    /*
     * The 'owner' map is overkill given there is only one owner.
     * However, this allows the same logic to be used for each of the
     * permission maps to determine read/write/execute access
    */
    std::vector<
        std::map<std::string /*name of the owner*/, 
        std::string /*here is where we store r/w/x*/ >
        > owner;
    std::vector<
        std::map<std::string /*name of the group*/, 
        std::string /*here is where we store r/w/x*/ >
        > groups;
    /*
     * The 'everyone' map is overkill given there is only one everyone.
     * However, this allows the same logic to be used for each of the
     * permission maps to determine read/write/execute access
    */
    std::vector<
        std::map<std::string /*i.e., EVERYONE*/, 
        std::string /*here is where we store r/w/x*/ >
        > everyone;
}object_permission;


/*
 * Each directory needs to have a collection of permissions associated with itself '.'
 * and each of the objects within.  New objects added will inherit permissions from
 * the directory itself, but those permissions can be overriden (if you have the right priv)
 */
typedef struct directory_permissions_
{
    /*
     * First parameter is the direcory/object, second is the map of permissions that correspond to the directory..
     * 
    */
    //std::string directory_path;
    std::map<std::string, object_permission> object_perm;
}directory_permissions;

class filesystem_manager
{
public:
    filesystem_manager();
    ~filesystem_manager();
    
    std::string get_vfs_root_path();
    
    std::string ls_current_directory();
    
    bool command_cd(const std::string& path, std::string &result);

    
private:
    /*
     * Sets the directory relative to the VFS root.  Should protect against
     * attempts to navigate outside of the mud's directories
    */
    bool set_current_directory(const std::string &dir); 
    /* 
     * Not used presently, but leaving it for now.
    */
    int get_index_of_vfs_directory();
    
    int get_offset_of_current_directory();
    
    bool init_vfs();
    
    //ttvfs::Root                         vfs;
    //std::map< std::string, 
     //   directory_permissions>       vfs_directory_map_;
        
    int                                 current_directory_offset; // Offset from the vfs_directory_index
    int                                 vfs_directory_index;
    std::vector <std::string>           current_directory_;
    
};

#endif