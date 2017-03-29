#include "server/client.hpp"
#include "server/connection.hpp"
#include "server/context_impl.hpp"
#include "utils/password_validator.hpp"
#include <telnetpp/telnetpp.hpp>
#include "terminalpp/encoder.hpp"
#include <boost/asio/strand.hpp>
#include <boost/format.hpp>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/algorithm/string.hpp>
#include "utils/password_validator.hpp"
#include <algorithm>
#include <cstdio>
#include <deque>
#include <mutex>
#include <string>
#include <vector>
#include <sstream>
#include <fstream>
#include <boost/tokenizer.hpp>
#include "welcome_screen.hpp"
#include "account_manager.hpp"
#include "utils/stringutils.hpp"
#include <iomanip>
#include "server/connectionsm.hpp"
#include "entity_manager.h"
#include "scriptable_entities/player_entity.h"

#include "vfs/filesystem_manager.h"
//#include "scriptable_entities/player_entity.h"

namespace fs = boost::filesystem;

using namespace boost::algorithm;

enum state { ST_ACCOUNT_LOGIN, ST_ACCOUNT_PASSWORD_VERIFY, ST_NEW_ACCOUNT, ST_NEW_ACCOUNT_CONFIRM,
                ST_NEW_ACCOUNT_EMAIL, ST_NEW_ACCOUNT_EMAIL_USE_ACCOUNT_NAME, ST_NEW_ACCOUNT_EMAIL_CONFIRM, 
                ST_NEW_ACCOUNT_PASSWORD, ST_NEW_ACCOUNT_PASSWORD_VERIFY, ST_ACCOUNT_VERIFIED, 
                ST_CHAR_SELECTION, ST_NEW_CHAR, ST_CHAR_SELECTED, ST_CONNECT_DONE
                };



// ==========================================================================
// CLIENT IMPLEMENTATION STRUCTURE
// ==========================================================================
class client::impl : public std::enable_shared_from_this<client::impl>
{
    public :
    // ======================================================================
    // CONSTRUCTOR
    // ======================================================================
    impl(
        client                  &self,
        boost::asio::io_service &io_service,
        std::shared_ptr<world_context> ctx)
      : self_(self),
        strand_(io_service),
        context_(ctx)
    {
      current_state = ST_ACCOUNT_LOGIN;
      password_try_count = 0;
    }
    
    // ======================================================================
    // SET_CONNECTION
    // ======================================================================
    void set_connection(std::shared_ptr<connection> cnx)
    {
        
        connection_ = cnx;
                // CONNECTION CALLBACKS
        
        display_welcome();
        connection_->on_data_read(
            [this](std::string const &data)
            {
                std::unique_lock<std::mutex> lock(dispatch_queue_mutex_);
                dispatch_queue_.push_back(bind(&impl::on_data, this, data));
                strand_.post(bind(&impl::dispatch_queue, shared_from_this()));
            });
        //send("What is your name?\r\n");
    }
    // TODO:  Add reasonable limit to the size of a command being received to avoid overrun attack
    void on_data(std::string const &data)
    {
       // printf("on data");
       //puts(data.c_str());
        if( current_state == ST_NEW_ACCOUNT_PASSWORD || 
        current_state == ST_NEW_ACCOUNT_PASSWORD ||
        current_state == ST_ACCOUNT_PASSWORD_VERIFY ||
        current_state == ST_NEW_ACCOUNT_PASSWORD_VERIFY)
        {
            std::string password_string = data; 
            sanitizepassword(password_string);
            send(password_string);
        }
        else
        {
            string::size_type pos = 0; // Must initialize
            std::string str = data;
            while ( ( pos = str.find ("\n",pos) ) != string::npos )
            {
                str.erase ( pos, 1 );
            }
                        //data.erase(std::remove(data.begin(), data.end(), '\n'), data.end());
            send(str);
        }
        for( unsigned int x = 0; x < data.length(); x++ )
        {
            char c = data[x];
            //printf("[%d]", c);

            if( c ==  NEW_LINE_CHAR )
            {
                //cout << "Command Received! : " << input_buffer.c_str() << endl;
                on_input_entered(input_buffer);
                
                prompt();
                input_buffer = "";
                
            }
            else if( c >= 32 && c <= 126 )
            {
                input_buffer += data[x];
                
            }
            else if( c == 127 )
            {
                if( input_buffer.length() > 0 )
                {
                    input_buffer = input_buffer.substr(0, input_buffer.size()-1);
                }
            }
            //printf("[%d]", c);
        }

    }
    
    void prompt()
    {
        send("\r\n> ");
    }
    
    // ======================================================================
    // SET_ACCOUNT
    // ======================================================================
    void set_account(std::shared_ptr<account> acc)
    {
        account_ = acc;
    }

    // ======================================================================
    // GET_ACCOUNT
    // ======================================================================
    std::shared_ptr<account> get_account()
    {
        return account_;
    }

    // ======================================================================
    // SET_CHARACTER
    // ======================================================================
    void set_character(std::shared_ptr<character> ch)
    {
        character_ = ch;
    }

    // ======================================================================
    // GET_CHARACTER
    // ======================================================================
    std::shared_ptr<character> get_character()
    {
        return character_;
    }
    
     // ======================================================================
    // DISCONNECT
    // ======================================================================
    void disconnect()
    {
        connection_->disconnect();
    }

    // ======================================================================
    // ON_CONNECTION_DEATH
    // ======================================================================
    void on_connection_death(std::function<void ()> const &callback)
    {
        connection_->on_socket_death(callback);
    }
    
    void send(std::string const& data)
    {
        connection_->write(data);
    }
    

    
    std::string input_buffer;
    
    void display_welcome()
    {
        //puts(logo_data);
       // std::string text = logo_data;
       // boost::char_separator<char> sep("\n");
       // boost::tokenizer<char_separator<char>> tokens(text, sep);
      //  for (const auto& t : tokens) {
      //      cout << t << "." << endl;
      //      //send(t + "\r\n");
      //  }
        send(logo_data);
        send("\r\nWelcome, please enter your account username or \"new\" to register an account:");
        prompt();
  
    }
    

private :
    
        // ======================================================================
    // REMOVE_DUPLICATE_ACCOUNTS
    // ======================================================================
    void remove_duplicate_accounts(std::shared_ptr<account> acc)
    {
        /*
        std::vector<std::shared_ptr<client>> clients_to_remove;
        auto clients = context_->get_clients();

        for (auto current_client : clients)
        {
            auto current_account = current_client->get_account();

            if (current_account != NULL && current_account != acc)
            {
                if (current_account->get_name() == acc->get_name())
                {
                    clients_to_remove.push_back(current_client);
                }
            }
        }

        for (auto current_client : clients_to_remove)
        {
            current_client->disconnect();
            context_->remove_client(current_client);
        }
        */
    }
    
    
        // ======================================================================
    // UPDATE_CHARACTER_NAMES
    // ======================================================================
    void update_character_names()
    {
    }
    
        // ======================================================================
    // ON_LOGIN
    // ======================================================================
    void on_login(
        std::string const &username,
        std::string const &password)
    {
    
    }
    
    // ======================================================================
    // ON_NEW_ACCOUNT
    // ======================================================================
    void on_new_account()
    {
    }
        // ======================================================================
    // ON_ACCOUNT_CREATED
    // ======================================================================
    void on_account_created(
        std::string        account_name,
        std::string const &password,
        std::string const &password_verify)
    {
    }
    
        // ======================================================================
    // ON_ACCOUNT_CREATION_CANCELLED
    // ======================================================================
    void on_account_creation_cancelled()
    {
    }
    
        // ======================================================================
    // ON_NEW_CHARACTER
    // ======================================================================
    void on_new_character()
    {

    }
    
    // ======================================================================
    // ON_CHARACTER_SELECTED
    // ======================================================================
    void on_character_selected(std::string const &character_name)
    {
    }
    
        // ======================================================================
    // ON_CHARACTER_CREATED
    // ======================================================================
    void on_character_created(std::string character_name, bool is_gm)
    {
    }
    
    // ======================================================================
    // ON_CHARACTER_CREATION_CANCELLED
    // ======================================================================
    void on_character_creation_cancelled()
    {
    }
    
        // ======================================================================
    // ON_PASSWORD_CHANGED
    // ======================================================================
    void on_password_changed(
        std::string const &old_password,
        std::string const &new_password,
        std::string const &new_password_verify)
    {
    }
    
        // ======================================================================
    // ON_PASSWORD_CHANGE_CANCELLED
    // ======================================================================
    void on_password_change_cancelled()
    {
    }
    
        // ======================================================================
    // ON_INPUT_ENTERED
    // ======================================================================
    void on_input_entered(std::string const &input)
    {
       // puts(input.c_str());
        switch(current_state)
        {
            case ST_ACCOUNT_LOGIN:
            {
                password_try_count = 0;
                string account_name = to_lower_copy(input);
                if( input.length() == 0 )
                {
                    
                }
                else if( account_name.compare("new") == 0)
                {
                    current_state = ST_NEW_ACCOUNT;
                    send("\r\nPlease enter the account name you wish to register:");
                    //on_input_entered(input);
                    //return;
                }
                else if( !account_manager::account_exists(account_name) )
                {
                    send( string_format(
                    "\r\nNo account is registered with that name, please try another or type \"new\" to register a new account:\r\n",
                    account_name.c_str()) );
                  // prompt();
                }
                else
                {
                    current_state = ST_ACCOUNT_PASSWORD_VERIFY;
                    temp_account_name = account_name;
                    send( string_format(
                    "\r\nPlease enter the password for account [%s]:\r\n",
                    account_name.c_str()) );
                }
                break;
            }
            case ST_ACCOUNT_PASSWORD_VERIFY:
            {
                    std::string tmp_password = account_manager::get_password_hash(temp_account_name, input);
                   // puts(tmp_password.c_str());
                    
                    //shared_ptr<account> ac_tmp = shared_ptr<account>(new account());
                    account ac_tmp;
                    account_manager::load_account(temp_account_name, ac_tmp);
                    
                    if( ac_tmp.secure_password.compare(tmp_password) == 0 )
                    {
                        send( "\r\nLogon successful..\r\n" );
                        shared_ptr<account> a = shared_ptr<account>(new account(ac_tmp));
                        set_account(a);
                        on_auth();
                        current_state = ST_ACCOUNT_VERIFIED;
                        
                    }
                    else
                    {
                       send( string_format("\r\nInvalid password. {%d} attempts retries remaining:\r\n", 
                       (MAX_PASSWORD_RETRY)-password_try_count));
                       if( password_try_count++ == (MAX_PASSWORD_RETRY) )
                       {
                           disconnect();
                           //context_->remove_client(connection_);
                           password_try_count = 0;
                       }
                    }
                break;
            }
            case ST_NEW_ACCOUNT:
            {
                string account_name = to_lower_copy(input);
                temp_account_name = account_name;
                if( account_manager::account_exists(account_name) )
                {
                    send( string_format(
                    "\r\nAccount name [%s] already in use, please try another:\r\n",
                    account_name.c_str()) );
                }
                else if(account_name.length() < 5)
                {
                    send("\r\nAccount name must be at least 5 characters, please try again:\r\n");
                }
                else
                {
                    send(string_format("\r\n Please confirm you wish to register account [%s] (y/n):\r\n", account_name.c_str()));
                    
                    current_state = ST_NEW_ACCOUNT_CONFIRM;

                     
                    /*
                    send( string_format(
                    "\nPlease enter a password to use for new account [%s]:\n",
                    account_name.c_str()) );
                    send(get_pasword_strength_description());
                    send("\n");
                    temp_account_name = account_name;
                    current_state = ST_NEW_ACCOUNT_PASSWORD;
                    */
                }
                break;
            }
            case ST_NEW_ACCOUNT_CONFIRM:
            {
                
                string selection = to_lower_copy(input);
                if( selection.length() == 0 )
                {
                }
                else if(selection[0] == 'y')
                {
                    if( is_email_valid(temp_account_name) )
                    {
                        send( string_format(
                        "\r\n Your account name also appears to be a valid email address, would you like to use [%s] as your registered email address (y/n)?\r\n Note, the registered email address is primarily used for password recovery and occasional emails from Septem.\r\n",
                        temp_account_name.c_str()) );
                        current_state = ST_NEW_ACCOUNT_EMAIL_USE_ACCOUNT_NAME;
                    }
                    else
                    {
                        send( "\r\n Please provide an email address for your account:\r\n Note, the registered email address is primarily used for password recovery and occasional emails from Septem.\r\n");
                        current_state = ST_NEW_ACCOUNT_EMAIL;
                    }
                }
                else if(selection[0] == 'n')
                {
                    current_state = ST_NEW_ACCOUNT;
                    temp_account_name = "";
                    send("\r\nPlease enter the account name you wish to register:");
                }
                 

                break;
            }
            case ST_NEW_ACCOUNT_EMAIL_USE_ACCOUNT_NAME:
            {
                string selection = to_lower_copy(input);
                if( selection.length() == 0 )
                {
                
                }
                else if(selection[0] == 'y')
                {
                    temp_new_account_email = temp_account_name;
                    send( string_format(
                    "\r\nPlease enter a password to use for new account [%s]:\r\n",
                    temp_account_name.c_str()) );
                    send(get_pasword_strength_description());
                    send("\n");
                   // temp_account_name = account_name;
                    current_state = ST_NEW_ACCOUNT_PASSWORD;
                }
                else if(selection[0] == 'n')
                {
                    send( "\r\nPlease provide an email address for your account.\r\n");
                        current_state = ST_NEW_ACCOUNT_EMAIL;
                }
                break;
            }
            case ST_NEW_ACCOUNT_EMAIL:
            {
                string email = to_lower_copy(input);
                if( !is_email_valid(email) )
                {
                    send("\r\nPlease enter a valid email address:\r\n");
                    
                }
                else
                {
                    temp_new_account_email = email;
                    send(string_format("\r\n Please confirm you wish to register [%s] (y/n):\r\n", email.c_str()));
                    
                    current_state = ST_NEW_ACCOUNT_EMAIL_CONFIRM;
                }
                break;
            }
            case ST_NEW_ACCOUNT_EMAIL_CONFIRM:
            {
                
                string selection = to_lower_copy(input);
                if( selection.length() == 0 )
                {
                }
                else if(selection[0] == 'y')
                {
                    ///temp_new_account_email = email;
                    send( string_format(
                    "\r\nPlease enter a password to use for new account [%s]:\r\n",
                    temp_account_name.c_str()) );
                    send(get_pasword_strength_description());
                    send("\n");
                    //temp_account_name = account_name;
                    current_state = ST_NEW_ACCOUNT_PASSWORD;
                }
                else if(selection[0] == 'n')
                {
                    send( "\r\nPlease provide an email address for your account.\r\n");
                    current_state = ST_NEW_ACCOUNT_EMAIL;
                }
                 

                break;
            }
            case ST_NEW_ACCOUNT_PASSWORD:
            { 
                std::string reason;
                if( is_valid_password(input, reason) )
                {
                    temp_new_account_password = input;
                    current_state = ST_NEW_ACCOUNT_PASSWORD_VERIFY;
                    send("\r\nPlease re-enter your password:\r\n");
                }
                else
                {
                    send("\r\n" + reason + "\r\n");
                    password_try_count++;
                }
                break;
            }
            case ST_NEW_ACCOUNT_PASSWORD_VERIFY:
            {
                std::string reason;
                if( input.compare(temp_new_account_password) != 0)
                {
                    send("\r\nPassword mis-match.\r\n");
                    send( string_format(
                    "\r\nPlease enter a password to use for new account [%s]:\r\n",
                    temp_account_name.c_str()) );
                    send(get_pasword_strength_description());
                    send("\r\n");
                    //temp_account_name = account_name;
                    current_state = ST_NEW_ACCOUNT_PASSWORD;
                    password_try_count++;
                }
                else //if( is_valid_password(input, reason) )
                {
                    
                    shared_ptr<account> ac_new = shared_ptr<account>(new account());
                    
                    ac_new->secure_password = account_manager::get_password_hash(temp_account_name, input);
                    ac_new->username = temp_account_name;
                    ac_new->email = temp_new_account_email;
                    
                    if( account_manager::create_account(*ac_new) )
                    {
                        send( string_format(
                        "\r\nNew account [%s] successfully created.\r\n",
                        temp_account_name.c_str()) );
                        set_account(ac_new);
                        on_auth();
                        current_state = ST_ACCOUNT_VERIFIED;
                    }
                    else
                    {
                        send( string_format(
                        "\r\nServer error.  Please email {%s} if the error continues.\r\n",
                        DEFAULT_SERVER_CONTACT_EMAIL_ADDRESS) );
                        
                        temp_account_name = "";
                        temp_new_account_email = "";
                        temp_new_account_password = "";
                        current_state = ST_ACCOUNT_LOGIN;
                        
                        send("\r\nWelcome, please enter your account username or \"new\" to register an account:");
                        prompt();
                        
                        //disconnect();
                    }

                }
                break;
            }
            case ST_ACCOUNT_VERIFIED:
            {
                // For now, lets go ahead and cheat and just add a player entity to the entity manager representing this new connection.
                //boost::shared_ptr< player_entity > pe = boost::shared_ptr< player_entity >(new player_entity());
                //pe->client_obj = shared_from_this();
                //entity_manager::Instance().player_objs.insert(pe);
                // TODO: a heck of a lot more code.
                on_command(input);
                break;
            }
            case ST_CHAR_SELECTION:
            {
                break;
            }
            case ST_NEW_CHAR:
            {
                break;
            }
            case ST_CHAR_SELECTED:
            {
                break;
            }
            case ST_CONNECT_DONE:
            {
                break;
            }
        }
    }
    
    void on_auth()
    {
        //For now, lets go ahead and cheat and just add a player entity to the entity manager representing this new connection.
       // std::shared_ptr< player_entity > pe = std::shared_ptr< player_entity >(new player_entity());
        //pe->client_obj = self_.get_weak_ptr();//td::weak_ptr<client>(self_);//shared_from_this();
       // account ac-
        
        entity_manager::Instance().load_player(self_.get_shared_ptr());//.get_weak_ptr());
    }
    
        // ======================================================================
    // ON_COMMAND
    // ======================================================================
    void on_command(std::string const &input)
    {
        puts(input.c_str());
        std::string cmd = input;//to_lower_copy(input);
        trim(cmd);
        if( startsWith(cmd, "ls")  )
        {
            std::string s = filesystem_manager_.ls_current_directory();
            send("\r\n"+ s);
        }
        
        if( input.length() == 0 )
            return;
            
        if( startsWith(cmd, "cd") )
        {
            std::vector<string> cmd_tokens = split(cmd, ' ');
            if( cmd_tokens.size() > 1 )
            {
                std::string result;
                if( !filesystem_manager_.command_cd(cmd_tokens[1], result) )
                    send("Error: " + result);
                else
                    send("\r\nOK.\r\n");
            }
            //std::string delimiter = " ";
           // std::string token = s.substr(0, s.find(delimiter)); // token is "scott"
        }

        //printf("on_command %s", input.c_str());
    }
    
    

    
    client                                 &self_;
    boost::asio::strand                     strand_;
    std::shared_ptr<world_context>          context_;
    std::shared_ptr<account>                account_;
    std::shared_ptr<character>              character_;

    std::shared_ptr<connection>             connection_;

    std::mutex                              dispatch_queue_mutex_;
    std::deque<std::function<void ()>>      dispatch_queue_;
    std::string                             last_command_;
    std::string                             temp_account_name;
    std::string                             temp_new_account_password;
    std::string                             temp_new_account_email;
    int                                     password_try_count;
    enum state                              current_state;//   = ST_ACCOUNT_LOGIN;
    filesystem_manager                      filesystem_manager_;

private :
    // ======================================================================
    // DISPATCH_QUEUE
    // ======================================================================
    void dispatch_queue()
    {
        std::function<void ()> fn;

        std::unique_lock<std::mutex> lock(dispatch_queue_mutex_);

        while (!dispatch_queue_.empty())
        {
            fn = dispatch_queue_.front();
            dispatch_queue_.pop_front();
            lock.unlock();

            fn();

            lock.lock();
        }
    }
};


// ==========================================================================
// CONSTRUCTOR
// ==========================================================================
client::client(
    boost::asio::io_service &io_service
  , std::shared_ptr<world_context> ctx)
{
    pimpl_ = std::make_shared<impl>(
        std::ref(*this), std::ref(io_service), ctx);
    
}

// ==========================================================================
// DESTRUCTOR
// ==========================================================================
client::~client()
{
}

// ==========================================================================
// SET_CONNECTION
// ==========================================================================
void client::set_connection(std::shared_ptr<connection> const &cnx)
{
    //puts("set_connection");
    pimpl_->set_connection(cnx);
}

// ==========================================================================
// GET_USER_INTERFACE
// ==========================================================================
//std::shared_ptr<hugin::user_interface> client::get_user_interface()
//{
//    return pimpl_->get_user_interface();
//}

// ==========================================================================
// GET_WINDOW
// ==========================================================================
//std::shared_ptr<munin::window> client::get_window()
//{
//    return pimpl_->get_window();
//}

// ==========================================================================
// SET_WINDOW_TITLE
// ==========================================================================
//void client::set_window_title(std::string const &title)
//{
//    pimpl_->set_window_title(title);/
//}

// ==========================================================================
// SET_WINDOW_SIZE
// ==========================================================================
//void client::set_window_size(odin::u16 width, odin::u16 height)
//{
 //   pimpl_->set_window_size(width, height);
//}

// ==========================================================================
// SET_ACCOUNT
// ==========================================================================
void client::set_account(std::shared_ptr<account> const &acc)
{
    pimpl_->set_account(acc);
}

// ==========================================================================
// GET_ACCOUNT
// ==========================================================================
std::shared_ptr<account> client::get_account() const
{
    return pimpl_->get_account();
}

// ==========================================================================
// SET_CHARACTER
// ==========================================================================
void client::set_character(std::shared_ptr<character> const &ch)
{
    pimpl_->set_character(ch);
}

// ==========================================================================
// GET_CHARACTER
// ==========================================================================
std::shared_ptr<character> client::get_character() const
{
    return pimpl_->get_character();
}

// ==========================================================================
// DISCONNECT
// ==========================================================================
void client::disconnect()
{
    pimpl_->disconnect();
}

// ==========================================================================
// ON_CONNECTION_DEATH
// ==========================================================================
void client::on_connection_death(std::function<void ()> const &callback)
{
    pimpl_->on_connection_death(callback);
}


// ======================================================================
    // DATA
    // ======================================================================
void client::data(std::string const &data)
{
    //puts("DATA");
    //puts(data.c_str());

}
void client::send(char const* text)
{
    send(std::string(text));
}
void client::send(std::string const& data)
{
    pimpl_->send(data);
}
