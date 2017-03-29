#include "vfs/filesystem_manager.h"
#include <iostream>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/format.hpp>
#include <iomanip>
#include <boost/filesystem.hpp>
#include "utils/stringutils.hpp"

namespace fs = boost::filesystem;
using namespace std;

filesystem_manager::filesystem_manager()
{

}

filesystem_manager::~filesystem_manager()
{
    
}

std::string filesystem_manager::get_vfs_root_path()
{
    //auto cwd = fs::current_path();
    std::string vfs_path = DEFAULT_GAME_DATA_PATH;//cwd / DEFAULT_VFS_ROOT;
    
    if (!fs::exists(vfs_path))
    {
        fs::create_directory(vfs_path);
    }
    if( vfs_path[vfs_path.size()-1] != '/' )
        vfs_path += '/'; // i'm lazy.
    return vfs_path.c_str();
}

std::string filesystem_manager::ls_current_directory()
{
    if( current_directory_.size() == 0 )
    {
       init_vfs();
    }

    stringstream ss;
    stringstream ss_tmp;
    ss_tmp << vector_to_string(current_directory_, '/');
    std::string path = get_vfs_root_path() + ss_tmp.str();
    fs::path p (path);   // p reads clearer than argv[1] in the following code

    try
    {
        if (!fs::exists(p) || !fs::is_directory(p))    // does p actually exist?
        {
            return false;
        }
        else
        {
            ss << "Current Directory: /" << ss_tmp.str() << endl;

            typedef vector<fs::path> vec;             // store paths,
            vec v;                                // so we can sort them later

            copy(fs::directory_iterator(p), fs::directory_iterator(), back_inserter(v));

            sort(v.begin(), v.end());             // sort, since directory iteration
                                                  // is not ordered on some file systems

            for (vec::const_iterator it (v.begin()); it != v.end(); ++it)
            {
                if( fs::is_directory(*it))
                {
                    ss << (*it).stem().string() << "/" << endl;
                }
                
            }
              
            for (vec::const_iterator it (v.begin()); it != v.end(); ++it)
            {
                if( fs::is_regular_file(*it) )
                {
                   ss << (*it).filename().string() << endl;
                }
            }
        }

  }

  catch (std::exception& ex)//const filesystem_error& ex)
  {
    cout << ex.what() << '\n';
  }
  return ss.str();

 // return 0;
}
bool filesystem_manager::command_cd(const std::string& path, std::string &reason)
{
    
    if( current_directory_.size() == 0 )
    {
       init_vfs();
    }
    
    if( path.length() == 0)
    {
        init_vfs();
        return true;
    }
    std::vector<std::string> tokens = split(path, '/');
    
    if( tokens.size() == 1 )
    {
        if(tokens[0].compare("..") == 0)
        {
            if( current_directory_.size() == 0)
            {
                reason = "No such directory exists.";
                return false;// don't allow a change in directory beyond our virtual root
            }
            std::vector<string> tv = current_directory_;
            tv.pop_back();
            std::string tmp_path = vector_to_string(tv, '/');
            set_current_directory(tmp_path);
            return true;
        }
        std::string tmp_path = tokens[0];
        std::string cur_path = vector_to_string(current_directory_, '/');
        fs::path p (get_vfs_root_path() + cur_path + tokens[0]);
        puts(p.c_str());
        if (!fs::exists(p) || !fs::is_directory(p))    // does p actually exist?
        {
            reason = "No such directory.";
            return false;
        }
        else
        {
            set_current_directory(cur_path + tokens[0]);
            return true;
        }
    }
    else
    {
        std::string tmp_path = path;
        std::string cur_path = vector_to_string(current_directory_, '/');
        fs::path p;
        
        if( tmp_path[0] == '/' )
        {
            tmp_path.erase(tmp_path.begin());
            p = fs::path(get_vfs_root_path() + tmp_path);
            cur_path = ""; // this is to make sure our set_current_director reflects the '/', ie the vfs root
        }
        else
            p = fs::path(get_vfs_root_path() + cur_path + tmp_path);
        
        puts(p.c_str());
        
        if (!fs::exists(p) || !fs::is_directory(p))    // does p actually exist?
        {
            reason = "No such directory.";
            return false;
        }
        else
        {
            set_current_directory(cur_path + tmp_path);
            return true;
        }
    }
    reason = "Unknown error.";
    return false; // for now..
   
}
bool filesystem_manager::set_current_directory(const std::string& dir)
{

    fs::path p (get_vfs_root_path() + dir);
    
    if (!fs::exists(p))    // does p actually exist?
    {
        return false;
    }
    current_directory_ = split(dir, '/');
    current_directory_offset = current_directory_.size();
    return true;
}

int filesystem_manager::get_index_of_vfs_directory()
{
    std::string vfs_dir = get_vfs_root_path();
    if( vfs_dir.size() == 0)
    {
        return -1;
    }
    vector<std::string> tokens = split(get_vfs_root_path(), '/');
    return tokens.size()-1; // zero-based
    //current_directory_index 
}

bool filesystem_manager::init_vfs()
{
    std::string vfs_dir = get_vfs_root_path();
    if( vfs_dir.size() == 0)
    {
        return false;
    }
    set_current_directory(""); // set us to the root directory.
}

int filesystem_manager::get_offset_of_current_directory()
{
    return current_directory_offset;
}
