#ifndef PASSWORD_VALIDATOR_HPP
#define PASSWORD_VALIDATOR_HPP
#include<iostream>
#include<string>
#include "config.h"
#include "stringutils.hpp"

using namespace std;

//function prototypes
static std::string get_pasword_strength_description()
{
    
    return string_format(
    "Password must be between %d and %d characters in length.\r\n \
    Password must contain at least one digit.\r\n \
    Password must contain at least one upper case letter.\r\n \
    Password must containt at least one lower case letter.\r\n \
    Special characters are allowed.\r\n",
    MIN_PASSWORD,
    MAX_PASSWORD); 
}

static bool is_valid_password(string password, string &reason)
{
    bool hasDigit = false;
    bool hasUpper = false;
    bool hasLower = false;
    
    if(password.length()< MIN_PASSWORD)
    {
        char tmp[512];
        memset(tmp, 0, 512);
        sprintf(tmp, "Password must be at least %d characters in length", MIN_PASSWORD); 
        reason = tmp;
        return false;
    }
    if(password.length()> MAX_PASSWORD)
    {
        char tmp[512];
        memset(tmp, 0, 512);
        sprintf(tmp, "Password must be less than %d characters", MAX_PASSWORD); 
        reason = tmp;
        return false;
    }
    for(unsigned int i = 0; i <password.length(); i++)
    {
        if(isdigit(password[i]))
        {//braces separating each if statement.!!!!!!!!!!
        //cout<<" The password contains a digit. "<<endl;
            hasDigit = true;
        }
        if(isupper(password[i]))
        {
        //cout<<" The password contains an uppercase letter. "<<endl;
            hasUpper = true;
        }
        if(islower(password[i]))
        {
        //cout<<" The password contains a lowercase letter. "<<endl;
            hasLower = true;
        }
    }
    if(!hasDigit)
    {
        reason = "Password must contain at least one digit.";
        return false;
    }
    else if(!hasUpper)
    {
        reason = "Password must contain at least one upper case letter.";
        return false;
    }
    else if(!hasLower)
    {
        reason = "Password must contain at least one lower case letter.";
        return false;
    }
    else
    {
        reason = "OK.";
    }
    return true;
}
#endif