#ifndef BOOST_FILESYSTEM_NO_DEPRECATED 
#  define BOOST_FILESYSTEM_NO_DEPRECATED
#endif
#ifndef BOOST_SYSTEM_NO_DEPRECATED 
#  define BOOST_SYSTEM_NO_DEPRECATED
#endif

#include <cryptopp/hex.h>
#include <cryptopp/sha.h>
#include <cryptopp/base64.h>
#include <iostream>
#include <string>
#include <fstream>
#include "account_manager.hpp"
#include "config.h"

#include <plog/Log.h>




account_manager::account_manager()
{
    LOG_VERBOSE << "account_manager intialized";

    /*
    try
    {
        _logger = spdlog::get("account_manager");
    }
    catch (const spdlog::spdlog_ex& ex)
    {
        std::cout << "[account_manager] Log initialization failed: " << ex.what() << std::endl;
    }
    
    //init();
     */
}

bool account_manager::accounts_path_exists()
{
   // auto cwd = fs::current_path();
    std::string accounts_path = DEFAULT_ACCOUNT_PATH;///cwd / DEFAULT_ACCOUNT_PATH;
    
    if (!fs::exists(accounts_path))
    {
        return false;
    }
    return true;
}

bool account_manager::chars_path_exists()
{
   // auto cwd = fs::current_path();
    std::string chars_path = DEFAULT_CHARS_PATH;
    if (!fs::exists(chars_path))
    {
        return false;
    }
    return true;
}

std::string account_manager::get_accounts_path()
{
   // auto cwd = fs::current_path();
    std::string accounts_path = DEFAULT_ACCOUNT_PATH;
    if (!fs::exists(accounts_path))
    {
        fs::create_directory(accounts_path);
    }
    if( accounts_path[accounts_path.size()-1] != '/' )
        accounts_path += '/'; 
    return accounts_path.c_str();
}

std::string account_manager::get_chars_path()
{
    //auto cwd = fs::current_path();
    std::string characters_path = DEFAULT_CHARS_PATH;
    
    if (!fs::exists(characters_path))
    {
        fs::create_directory(characters_path);
    }
    
    if( characters_path[characters_path.size()-1] != '/' )
        characters_path += '/'; 
    return characters_path.c_str();
}

std::string account_manager::get_password_hash(std::string username, std::string password)
{
    CryptoPP::SHA256 hash;
    byte digest[CryptoPP::SHA256::DIGESTSIZE];
    std::string salt, output;
    salt = username + password;

    hash.CalculateDigest(digest,(const byte *)salt.c_str(),salt.size());

    CryptoPP::HexEncoder encoder;
    CryptoPP::StringSink *SS = new CryptoPP::StringSink(output);
    encoder.Attach(SS);
    encoder.Put(digest,sizeof(digest));
    encoder.MessageEnd();
    return output;
}


void account_manager::testcryptopp()
{
    
    CryptoPP::SHA256 hash;
    byte digest[CryptoPP::SHA256::DIGESTSIZE];
    std::string username, password, salt, output;
    std::cout << "Enter username: ";
    std::getline(std::cin,username);
    std::cout << std::endl << "Enter password: ";
    std::getline(std::cin,password);
    salt = username + password;

    hash.CalculateDigest(digest,(const byte *)salt.c_str(),salt.size());

    CryptoPP::HexEncoder encoder;
    CryptoPP::StringSink *SS = new CryptoPP::StringSink(output);
    encoder.Attach(SS);
    encoder.Put(digest,sizeof(digest));
    encoder.MessageEnd();

    std::cout << "The username/password salted hash is => " << output << std::endl;
    

    
    {
        //std::string account_file = get_accounts_path() + //
        std::ofstream os("data.xml");
        //cereal::XMLOutputArchive archive(os);

        account test_account;
        test_account.secure_password = output;
        test_account.username = username;
        
        create_account(test_account);
        bool b = load_account(test_account.username, test_account);
    }
    
    //return 0;
     
}

bool account_manager::account_exists(std::string username)
{
    std::string daccount_path = std::string(get_accounts_path().c_str()) +  username[0] + "/" + username + DEFAULT_ACCOUNT_FILE_EXT;
    fs::path p(daccount_path);
    return fs::exists(p);
}
 
bool account_manager::create_account(account ac)
{
    //_logger->info("Creating an account for username {}..", ac.username);
    LOG_INFO << "Creaitng account for username" << ac.username;
    std::string daccount_path = get_accounts_path() + ac.username[0];
    fs::path p(daccount_path);
    if (!fs::exists(p))
    {
       // _logger->info("Directory does not exist, creating directory {}..", daccount_path);
       LOG_INFO << "Directory does not exist, creating directory: " << daccount_path;
        puts(daccount_path.c_str());
        if (!fs::create_directories(fs::path(daccount_path))) 
        {
            LOG_INFO << "Error creating directory: " << daccount_path;
            //_logger->info("Error creating accounts directory {}", daccount_path);
            return false;
        }
        //return false;
    }
    
    daccount_path = std::string(get_accounts_path().c_str()) + ac.username[0] + "/" + ac.username + DEFAULT_ACCOUNT_FILE_EXT;
    LOG_INFO << "Serializing account file: " << daccount_path;
   // _logger->info("Serializing account file {}..", daccount_path);
   
    try
    {

        std::ofstream os(daccount_path);
        {
            cereal::XMLOutputArchive oarchive(os); // Create an output archive

            //MyData m1, m2, m3;
            oarchive(ac); // Write the data to the archive
            LOG_INFO << "Successfully serialized account file: " << daccount_path;
        } // archive goes out of scope, ensuring all contents are flushed
    }
    catch(std::exception &ex)
    {
        LOG_ERROR << "Account file [" << daccount_path << "] failed to deserialize: " << ex.what();
    }
    
    return true;
     
    
}

bool account_manager::load_account(std::string username, account &ac)
{
    std::string daccount_path = get_accounts_path() + username[0]; // + "/" + ac.username + ".json";
    LOG_INFO << "Trying to load acount from file: " << username;
    fs::path p(daccount_path);
    if (!fs::exists(p))
    {
        LOG_INFO << "Account directory does not exist: " << daccount_path;
        return false;
    }
    daccount_path = get_accounts_path() + username[0] + "/" + username + DEFAULT_ACCOUNT_FILE_EXT;
    fs::path p2(daccount_path);
    if (!fs::exists(p2))
    {
        LOG_INFO << "Account directory does not exist: " << p2.string();
        return false;
    }
    try
    {
        std::ifstream is(daccount_path);
        {
            cereal::XMLInputArchive iarchive(is); // Create an input archive

           // MyData m1, m2, m3;
            account ac_temp;
            iarchive(ac_temp); // Read the data from the archive
            
            ac = ac_temp;
            LOG_INFO << "Account file [" << daccount_path << "] deserialized and loaded successefully.";
        }
    }
    catch(std::exception &ex)
    {
        LOG_ERROR << "Account file [" << daccount_path << "] failed to deserialize: " << ex.what();
      //  std::shared_ptr<yspdlog::logger> _logger;
      //  _logger = spdlog::get("account_manager");
     //   _logger->critical("Unable to read account file {} {}", daccount_path, ex.what());
       // _logger->flush();
    }

    return true;
}

