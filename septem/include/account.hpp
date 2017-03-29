#ifndef ACCOUNT_HPP
#define ACCOUNT_HPP
#include <cereal/archives/xml.hpp>
#include <cereal/types/string.hpp>
#include <string.h>
#include <cereal/types/vector.hpp>
class account
{
public:
    account();
    
    account( const account& other ) :
     username(other.username), email(other.email), secure_password(other.secure_password)
    {
        for( auto eobj : other.char_names )
        {
            char_names.push_back(eobj);
        }
    }
    
    ~account();
    
    std::string username;
    std::string email;
    std::string secure_password;
    std::vector<std::string> char_names;
    
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( cereal::make_nvp("UserName", username), cereal::make_nvp("Email", email),  
        cereal::make_nvp("SecurePassword", secure_password), cereal::make_nvp("CharNames", char_names)); // serialize things by passing them to the archive
    }
};

#endif // ACCOUNT_HPP
