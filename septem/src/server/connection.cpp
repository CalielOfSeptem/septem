// ==========================================================================
// Paradice Connection
//
// Copyright (C) 2010 Matthew Chaplain, All Rights Reserved.
//
// Permission to reproduce, distribute, perform, display, and to prepare
// derivitive works from this file under the following conditions:
//
// 1. Any copy, reproduction or derivitive work of any part of this file
//    contains this copyright notice and licence in its entirety.
//
// 2. The rights granted to you under this license automatically terminate
//    should you attempt to assert any patent claims against the licensor
//    or contributors, which in any way restrict the ability of any party
//    from using this software or portions thereof in any form under the
//    terms of this license.
//
// Disclaimer: THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
//             KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//             WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//             PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//             OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//             OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//             OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//             SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// ==========================================================================
#include "server/connection.hpp"
#include "odin/net/socket.hpp"
#include <telnetpp/telnetpp.hpp>
#include <telnetpp/byte_converter.hpp>
#include <telnetpp/options/echo/server.hpp>
#include <telnetpp/options/mccp/codec.hpp>
#include <telnetpp/options/mccp/server.hpp>
#include <telnetpp/options/mccp/zlib/compressor.hpp>
#include <telnetpp/options/mccp/zlib/decompressor.hpp>
#include <telnetpp/options/naws/client.hpp>
#include <telnetpp/options/suppress_ga/server.hpp>
#include <telnetpp/options/terminal_type/client.hpp>
#include <boost/asio/deadline_timer.hpp>
#include <boost/asio/placeholders.hpp>
#include <deque>
#include <string>
#include <utility>
#include "config.h"

/*
#include <iostream>
#include <boost/msm/back/state_machine.hpp>
 
#include <boost/msm/front/state_machine_def.hpp>
#include <boost/msm/front/functor_row.hpp>
#include <boost/static_assert.hpp>
#include <boost/algorithm/string.hpp>
#include "welcome_screen.hpp"
#include "account_manager.hpp"
#include "account.hpp"
#include "utils/stringutils.hpp"
#include "utils/password_validator.hpp"
*/

using namespace std;
/*
namespace server {
    namespace msm = boost::msm;
    namespace msmf = boost::msm::front;
    namespace mpl = boost::mpl;
 
    // ----- Events
    struct Event1 {};
    struct Event2 {};
    struct Event3 {};
    
   // struct ConnectionEstablished{};
    struct ConnectionClosed{};
    struct ConnectionReceived{};
    struct InputReceived{};
    
    struct NewAccountNameRetry{}; // To force transition
    struct NewAccoutNameVerify{};
    struct NewAccountRegisterNameYN{};
    struct NewAccountUseEmail{}; // use email address as account name transition
    struct NewAccountRegEmail{}; // register a new email address
    struct NewAccountRegEmailYN{}; // confirm new email
    
    struct NewAccountPassword{};
    struct NewAccountPasswordVerify{};
    struct NewAccountPasswordRetry{};
    struct NewAccountComplete{};
    struct NewAccountError{};
    
    // Event for new account creation when in the account_prompt state
    struct NewAccountRequested{};
    
    struct input_received
    {
        input_received(const std::string& input, const boost::function<void(std::string)> &send)
            : input(input), send(send)
        {}
        std::string input;
        boost::function<void(std::string)> send; 
    };
    
    struct new_account_name
    {
        new_account_name(std::string input)
            : input(input)
        {}
        std::string input;
    };
    
                
    struct connectionsm_:msmf::state_machine_def<connectionsm_>
    {
        struct waiting_for_connection:msmf::state<>
        {
            template <class Event,class Fsm>
            void on_entry(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "waiting_for_connection::on_entry()" << std::endl;
                //puts("TEST");
            }
            template <class Event,class Fsm>
            void on_exit(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "waiting_for_connection::on_exit()" << std::endl;
            }
        };
        
        struct connection_established:msmf::state<>
        {
            template <class Event,class Fsm>
            void on_entry(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "connection_established::on_entry()" << std::endl;
            }
            template <class Event,class Fsm>
            void on_exit(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "connection_established::on_exit()" << std::endl;
            }
        };
        
        
        struct account_prompt:msmf::state<>
        {
            template <class Event,class Fsm>
            void on_entry(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "account_prompt::on_entry()" << std::endl;
            }
            template <class Event,class Fsm>
            void on_exit(Event const&, Fsm&) const {
                BOOST_STATIC_ASSERT((boost::is_convertible<Fsm, connectionsm_>::value));
                std::cout << "account_prompt::on_exit()" << std::endl;
            } 
        };
       
        
        struct State2_:msmf::state_machine_def<State2_>
        {
            template <class Event,class Fsm>
            void on_entry(Event const&, Fsm&) const {
                std::cout << "State2_::on_entry()" << std::endl;
            }
            template <class Event,class Fsm>
            void on_exit(Event const&, Fsm&) const {
                std::cout << "State2_::on_exit()" << std::endl;
            }
            
            struct SubState1:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "SubState1::on_entry()" << std::endl;
                }
                template <class Event,class Fsm>
                void on_exit(Event const&, Fsm&) const {
                    std::cout << "SubState1::on_exit()" << std::endl;
                }
            };
            
            struct new_account_prompt_account_name_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_prompt_account_name_st::on_entry()" << std::endl;
                }
                template <class Event,class Fsm>
                void on_exit(Event const&, Fsm&) const {
                    std::cout << "new_account_prompt_account_name_st::on_exit()" << std::endl;
                }
            };
            struct new_account_prompt_password_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_prompt_password_st::on_entry()" << std::endl;
                }
            };
            struct retry_new_account_name_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "retry_new_account_name_st::on_entry()" << std::endl;
                }
            };
            struct new_account_name_register_yn_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_name_register_yn_st::on_entry()" << std::endl;
                }
            };
            
            struct new_account_name_use_email_yn_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_name_use_email_yn_st::on_entry()" << std::endl;
                }
            };
        
            struct new_account_reg_email_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_reg_email_st::on_entry()" << std::endl;
                }
            };
            
            struct new_account_reg_email_yn_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_reg_email_yn_st::on_entry()" << std::endl;
                }
            };
            
            struct new_account_password_prompt_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_password_prompt_st::on_entry()" << std::endl;
                }
            };
            
            struct new_account_password_confirm_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_password_confirm_st::on_entry()" << std::endl;
                }
            };
            
            
            struct new_account_password_verify_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_password_verify_st::on_entry()" << std::endl;
                }
            };
            struct new_account_password_retry_st:msmf::state<> {
                template <class Event,class Fsm>
                void on_entry(Event const&, Fsm&) const {
                    std::cout << "new_account_password_retry_st::on_entry()" << std::endl;
                }
            };
            
            // ACTIONS:
           struct verify_new_account_name_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState&,TargetState& )
                {
                   // fsm.test_sm_calls();
                    std::string account_name = boost::to_lower_copy(ev.input);
                    //ev.send("TEST");
                    //string account_name = to_lower_copy(input);
                    fsm.temp_account_name = account_name;
                    if( account_name.length() == 0 )
                    {
                        ev.send("\r\nAccount name must be at least 5 characters, please try again:\r\n");
                        fsm.process_event(NewAccountNameRetry());
                    }
                    else if( account_manager::account_exists(account_name) )
                    {
                        ev.send( string_format(
                        "\r\nAccount name [%s] already in use, please try another:\r\n",
                        account_name.c_str()) );
                    }
                    else if(account_name.length() < 5)
                    {
                        ev.send("\r\nAccount name must be at least 5 characters, please try again:\r\n");
                        fsm.process_event(NewAccountNameRetry());
                    }
                    else
                    {
                        ev.send(string_format("\r\n Please confirm you wish to register account [%s] [y/n]:\r\n", account_name.c_str()));
                        fsm.process_event(NewAccountRegisterNameYN());
                    }
                }
            };
            
           struct new_account_name_verify_yn_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    
                   // fsm.test_sm_calls();
                    std::string selection = boost::to_lower_copy(ev.input);
                    if( selection.length() == 0 )
                    {
                        ev.send("\r\nThe only valid options are [Y]es or [N]o:\r\n");
                        fsm.process_event(NewAccountRegisterNameYN());
                    }
                    else if(selection[0] == 'y')
                    {
                        if( is_email_valid(fsm.temp_account_name) )
                        {
                            ev.send( string_format(
                            "\r\nYour account name also appears to be a valid email address, would you like to use [%s] as your registered email address [y/n]?\r\n[Note, the registered email address is primarily used for password recovery and occasional emails from Septem.]\r\n",
                            fsm.temp_account_name.c_str()) );
                           // current_state = ST_NEW_ACCOUNT_EMAIL_USE_ACCOUNT_NAME;
                           fsm.process_event(NewAccountUseEmail());
                        }
                        else
                        {
                            ev.send( "\r\nPlease provide an email address for your account:\r\n[Note, the registered email address is primarily used for password recovery and occasional emails from Septem.]\r\n");
                            fsm.process_event(NewAccountRegEmail());
                           // current_state = ST_NEW_ACCOUNT_EMAIL;
                           // TODO: ADD STATE INTO STATE MACHINE !!!
                        }
                    }
                    else if(selection[0] == 'n')
                    {
                       // current_state = ST_NEW_ACCOUNT;
                        fsm.temp_account_name = "";
                        ev.send("\r\nPlease enter the account name you wish to register:");
                        fsm.process_event(NewAccountNameRetry());
                    }
                    
                 
                }
            };
            
           struct new_account_name_use_email_yn_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    string selection = boost::to_lower_copy(ev.input);
                    if( selection.length() == 0 )
                    {   
                        fsm.process_event(NewAccountUseEmail());
                    }
                    else if(selection[0] == 'y')
                    {
                        fsm.temp_new_account_email = fsm.temp_account_name;
                        ev.send( string_format(
                        "\r\nPlease enter a password to use for new account [%s]:\r\n",
                        fsm.temp_account_name.c_str()) );
                        ev.send(get_pasword_strength_description());
                        ev.send("\r\n");
                       // temp_account_name = account_name;
                       // current_state = ST_NEW_ACCOUNT_PASSWORD;
                    }
                    else if(selection[0] == 'n')
                    {
                        ev.send( "\r\nPlease provide an email address for your account.\r\n");
                        fsm.process_event(NewAccountRegEmail());
                    }
                }
            };
           
           struct new_account_reg_email_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    string email = boost::to_lower_copy(ev.input);
                    if( !is_email_valid(email) )
                    {
                        ev.send("\r\nPlease enter a valid email address:\r\n");
                        fsm.process_event(NewAccountRegEmail());
                        
                    }
                    else
                    {
                        fsm.temp_new_account_email = email;
                        ev.send(string_format("\r\nPlease confirm you wish to register [%s] [y/n]:\r\n", email.c_str()));
                        fsm.process_event(NewAccountRegEmailYN());
                    }
                }
           };
           
           struct new_account_reg_email_yn_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    string selection = boost::to_lower_copy(ev.input);
                    if( selection.length() == 0 )
                    {
                         fsm.process_event(NewAccountRegEmailYN());
                    }
                    else if(selection[0] == 'y')
                    {
                        ///temp_new_account_email = email;
                        ev.send( string_format(
                        "\r\nPlease enter a password to use for new account [%s]:\r\n",
                        fsm.temp_account_name.c_str()) );
                        ev.send(get_pasword_strength_description());
                        ev.send("\r\n");
                        fsm.process_event(NewAccountPassword());
                        
                        //current_state = ST_NEW_ACCOUNT_PASSWORD;
                    }
                    else if(selection[0] == 'n')
                    {
                        ev.send( "\r\nPlease provide an email address for your account.\r\n");
                        fsm.process_event(NewAccountRegEmail());
                     //   current_state = ST_NEW_ACCOUNT_EMAIL;
                    }
                }
           };
           
           
           struct new_account_password_prompt_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    std::string reason;
                    if( is_valid_password(ev.input, reason) )
                    {
                        //current_state = ST_NEW_ACCOUNT_PASSWORD_VERIFY;
                        ev.send("\r\nPlease re-enter your password:\r\n");
                        fsm.process_event(NewAccountPasswordVerify());
                    }
                    else
                    {
                        ev.send("\r\n" + reason + "\r\n");
                        fsm.process_event(NewAccountPasswordRetry());
                    }
                }
           };
           
           struct new_account_password_verify_a
           {
                template <class Event,class Fsm,class SourceState,class TargetState>
                void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
                {
                    std::string reason;
                    if( ev.input.compare(fsm.temp_new_account_password) != 0 )
                    {
                        ev.send("\r\nError. Password does not match.\r\n");
                        ev.send( string_format(
                        "\r\nPlease enter a password to use for new account [%s]:\r\n",
                        fsm.temp_account_name.c_str()) );
                        ev.send(get_pasword_strength_description());
                        ev.send("\r\n");
                        fsm.process_event(NewAccountPassword());
                        //fsm.process_event(NewAccountPasswordRetry());
                    }
                    else// ( is_valid_password(ev.input, reason) )
                    {
                        
                        account ac_new;
                        
                        ac_new.secure_password = account_manager::get_password_hash(fsm.temp_account_name, ev.input);
                        ac_new.username = fsm.temp_account_name;
                        ac_new.email = fsm.temp_new_account_email;
                        if( account_manager::create_account(ac_new) )
                        {
                            ev.send( string_format(
                            "\r\nNew account [%s] successfully created.\r\n",
                            fsm.temp_account_name.c_str()) );
                            fsm.process_event(NewAccountComplete());
                            //current_state = ST_ACCOUNT_VERIFIED;
                        }
                        else
                        {
                            ev.send( string_format(
                            "\r\nServer error.  Please email {%s} if the error continues.\r\n",
                            DEFAULT_SERVER_CONTACT_EMAIL_ADDRESS) );
                            
                            fsm.temp_account_name = "";
                            fsm.temp_new_account_email = "";
                            fsm.temp_new_account_password = "";
                            fsm.process_event(NewAccountError());
                            //current_state = ST_ACCOUNT_LOGIN;
                            
                            //send("\r\nWelcome, please enter your account username or \"new\" to register an account:");
                            //prompt();
                            
                            //disconnect();
                        }

                    }
                    //else
                  //  {
                   //     ev.send("\r\n" + reason + "\r\n");
                  //  }
                }
           };
            
            struct Entry1:msmf::entry_pseudo_state<> {}; // === entry_pseudo_state
            struct Exit1:msmf::exit_pseudo_state<msmf::none> {};
            struct ExitError:msmf::exit_pseudo_state<msmf::none> {};
 
            // Set initial state
            typedef mpl::vector<new_account_prompt_account_name_st> initial_state;
            
            std::string temp_account_name; // to store an account name to register
            std::string temp_new_account_email; // email to register with new account
            std::string temp_new_account_password;
            
            // Transition table

            //  TODO, complete the states below to handle the remainder of new account creation
            struct transition_table:mpl::vector<
                //          Start                                   Event                               Next                            Action                              Guard
                msmf::Row < Entry1,                                 boost::any,                     new_account_prompt_account_name_st, msmf::none,                         msmf::none >, // === boost::any
                msmf::Row < new_account_prompt_account_name_st,     input_received,                 new_account_prompt_account_name_st, verify_new_account_name_a,          msmf::none >,
                
                msmf::Row < new_account_prompt_account_name_st,     NewAccountNameRetry,            retry_new_account_name_st,           msmf::none,                        msmf::none >,
                msmf::Row < retry_new_account_name_st,              input_received,                 new_account_prompt_account_name_st,  verify_new_account_name_a,         msmf::none >,
                msmf::Row < new_account_prompt_account_name_st,     NewAccountRegisterNameYN,       new_account_name_register_yn_st,     msmf::none,                        msmf::none >,
                
                msmf::Row < new_account_name_register_yn_st,        input_received,                 new_account_name_register_yn_st,     new_account_name_verify_yn_a,      msmf::none >,
                msmf::Row < new_account_name_register_yn_st,        NewAccountRegEmail,             new_account_reg_email_st,            msmf::none,                        msmf::none >,
                msmf::Row < new_account_name_register_yn_st,        NewAccountNameRetry,            retry_new_account_name_st,           msmf::none,                        msmf::none >,
                msmf::Row < new_account_name_register_yn_st,        NewAccountRegisterNameYN,       new_account_name_register_yn_st,     msmf::none,                        msmf::none >,
                msmf::Row < new_account_name_register_yn_st,        NewAccountUseEmail,             new_account_name_use_email_yn_st,    msmf::none,                        msmf::none >,
                
                msmf::Row < new_account_name_use_email_yn_st,       input_received,                 new_account_name_use_email_yn_st,    new_account_name_use_email_yn_a,   msmf::none >,
                msmf::Row < new_account_name_use_email_yn_st,       NewAccountUseEmail,             new_account_name_use_email_yn_st,    msmf::none,                        msmf::none >,
                msmf::Row < new_account_name_use_email_yn_st,       NewAccountRegEmail,             new_account_reg_email_st,            msmf::none,                        msmf::none >,
                
                msmf::Row < new_account_reg_email_st,               input_received,                 new_account_reg_email_st,            new_account_reg_email_a,           msmf::none >,
                msmf::Row < new_account_reg_email_st,               NewAccountRegEmail,             new_account_reg_email_st,            msmf::none,                        msmf::none >,
                msmf::Row < new_account_reg_email_st,               NewAccountRegEmailYN,           new_account_reg_email_yn_st,         msmf::none,                        msmf::none >,
                
                msmf::Row < new_account_reg_email_yn_st,            input_received,                 new_account_reg_email_yn_st,         new_account_reg_email_yn_a,        msmf::none >,
                msmf::Row < new_account_reg_email_yn_st,            NewAccountRegEmailYN,           new_account_reg_email_yn_st,         msmf::none,                        msmf::none >,
                msmf::Row < new_account_reg_email_yn_st,            NewAccountRegEmail,             new_account_reg_email_st,            msmf::none,                        msmf::none >,
                msmf::Row < new_account_reg_email_yn_st,            NewAccountPassword,             new_account_password_prompt_st,      msmf::none,                        msmf::none >,
                
                msmf::Row < new_account_password_prompt_st,         input_received,                 new_account_password_prompt_st,      new_account_password_prompt_a,     msmf::none >,
                msmf::Row < new_account_password_prompt_st,         NewAccountPasswordRetry,        new_account_password_retry_st,       msmf::none,                        msmf::none >,
                //msmf::Row < new_account_password_retry_st,          input_received,                 new_account_password_prompt_st,      new_account_password_prompt_a,     msmf::none >,
              //  msmf::Row < new_account_password_prompt_st,         NewAccountPasswordVerify,       new_account_password_verify_st,      msmf::none,                        msmf::none >,
                
              //  msmf::Row < new_account_password_verify_st,         input_received,                 new_account_password_verify_st,      new_account_password_verify_a,     msmf::none >,
               // msmf::Row < new_account_password_verify_st,         NewAccountPassword,             new_account_password_prompt_st,      msmf::none,                        msmf::none >,
                
                msmf::Row < SubState1,         Event1,             Exit1,                        msmf::none,                        msmf::none >
               // msmf::Row < new_account_password_verify_st,         NewAccountError,                ExitError,                           msmf::none,                        msmf::none >
                > {};
        };
 
        typedef msm::back::state_machine<State2_> State2;
        
        // Actions
        struct welcome_message {
            template <class Event, class Fsm, class SourceState, class TargetState>
            void operator()(Event const&, Fsm& sm, SourceState&, TargetState&)
            {
                //std::cout << "Welcome.. please enter your account name:" << std::endl;
                sm.display_welcome();
            }
        };
        
        struct verify_account_name
        {
            template <class Event,class Fsm,class SourceState,class TargetState>
            void operator()(Event const& ev,Fsm& fsm,SourceState& ,TargetState& )
            {
                
                std::string account_name = ev.input;
                
                if( account_name.size() == 0 )
                {
                    //return false;
                    // do nothing and wait for more input
                }
                else if( account_name.compare("new") == 0)
                {
                    fsm.send_to_connection("\r\nPlease enter the account name you wish to register:");
                    fsm.process_event(NewAccountRequested());
                   // fsm.process_event(new_account_name("test"));
                    // switch to the new account state
                }
                else if( !account_manager::account_exists(account_name) )
                {
                    // account does not exist, give the message and then re-prompt
                    fsm.send_to_connection( string_format(
                    "\r\nNo account is registered with that name, please try another or type \"new\" to register a new account:\r\n",
                    account_name.c_str()) );
                }
                else
                {
                    fsm.send_to_connection( string_format(
                    "\r\nPlease enter the password for account [%s]:\r\n",
                    account_name.c_str()) );
                }

            }
        };
        

        void receive_input(input_received const& input) 
        { 
            std::cout << "connectionsm::receive_input\r\n"; 
            std::cout << input.input << std::endl;
        }

        
        // Set initial state
        typedef waiting_for_connection initial_state;
        // Transition table
        struct transition_table:mpl::vector<
            //          Start                           Event                   Next                    Action                  Guard
            msmf::Row   < waiting_for_connection,       ConnectionReceived,   account_prompt,         welcome_message,          msmf::none >,
            msmf::Row   < account_prompt,               input_received,         account_prompt,       verify_account_name,      msmf::none >,
                        //          Start   Event       Next               Action      Guard
            msmf::Row < account_prompt, NewAccountRequested, State2::entry_pt                             // === entry_pt
                                            <State2_::Entry1>, msmf::none, msmf::none >,
            msmf::Row < State2::exit_pt
                        <State2_::Exit1>, msmf::none, msmf::none, msmf::none, msmf::none >
                                            
        > {};
        
        
        // ======================================================================
        // ON_SEND_TO_CONNETION
        // ======================================================================
        //void on_send_to_connection(std::function<void (std::string const &)> const &callback)
        //{
        //    on_send_data = callback;
        //}
        
        //std::function<void (std::string const &)>   on_send_data;
        virtual void send_to_connection(const std::string & str) { };
        
        void display_welcome()
        {
            send_to_connection(logo_data);
            send_to_connection("\r\nWelcome, please enter your account username or \"new\" to register an account:");
            //prompt();
        }
        
        bool is_account_registered(std::string accountname)
        {

             
            if( !account_manager::account_exists(accountname) )
            {

                return false;
            }
            else
            {

                return true;
            }
        }
        
    };
    
    typedef msm::back::state_machine<connectionsm_> connectionsm;

}
*/

// ==========================================================================
// CONNECTION::IMPLEMENTATION STRUCTURE
// ==========================================================================
struct connection::impl
    : public std::enable_shared_from_this<impl>
{
    // ======================================================================
    // CONSTRUCTOR
    // ======================================================================
    impl(std::shared_ptr<odin::net::socket> const &socket)
      : socket_(socket),
        telnet_session_(
            [this](auto &&text) -> std::vector<telnetpp::token>
            {
                this->on_text(text);
                return {};
            }),
        telnet_mccp_codec_(
            std::make_shared<telnetpp::options::mccp::zlib::compressor>(),
            std::make_shared<telnetpp::options::mccp::zlib::decompressor>())
    {
        telnet_echo_server_.set_activatable();
        telnet_session_.install(telnet_echo_server_);
        
        telnet_suppress_ga_server_.set_activatable();
        telnet_session_.install(telnet_suppress_ga_server_);
         
        telnet_naws_client_.set_activatable();
        telnet_naws_client_.on_window_size_changed.connect(
            [this](auto &&width, auto &&height) -> std::vector<telnetpp::token>
            {
                this->on_window_size_changed(width, height);
                return {};
            });
        telnet_session_.install(telnet_naws_client_);

        telnet_terminal_type_client_.set_activatable();
        telnet_terminal_type_client_.on_terminal_type.connect(
            [this](auto &&type) -> std::vector<telnetpp::token>
            {
                this->on_terminal_type_detected(type);
                return {};
            });
        telnet_terminal_type_client_.on_state_changed.connect(
            [this](auto &&state) -> std::vector<telnetpp::token>
            {
                if (telnet_terminal_type_client_.is_active())
                {
                    return telnet_terminal_type_client_.request_terminal_type();
                }
                
                return {};
            });
        telnet_session_.install(telnet_terminal_type_client_);

        telnet_mccp_server_.set_activatable();
        write(telnet_session_.send(telnet_mccp_server_.begin_compression()));
        telnet_session_.install(telnet_mccp_server_);
        
        // Begin the keepalive process.  This sends regular heartbeats to the
        // client to help guard against his network settings timing him out
        // due to lack of activity.
        keepalive_timer_ =
            std::make_shared<boost::asio::deadline_timer>(
                std::ref(socket_->get_io_service()));
        schedule_keepalive();
        
        // Send the required activations.
        write(telnet_session_.send(telnet_echo_server_.activate()));
        write(telnet_session_.send(telnet_suppress_ga_server_.activate()));
        write(telnet_session_.send(telnet_naws_client_.activate()));
        write(telnet_session_.send(telnet_terminal_type_client_.activate()));
        write(telnet_session_.send(telnet_mccp_server_.activate()));
        
       //this->start();
       //process_event(server::ConnectionReceived());
    }
    


    // ======================================================================
    // START
    // ======================================================================
    void start()
    {
        schedule_next_read();
    }
    
    
    // ======================================================================
    // WRITE
    // ======================================================================
    void write(std::vector<telnetpp::stream_token> const &data)
    {
        auto const &compressed_data = telnet_mccp_codec_.send(data);
        auto const &stream = telnet_byte_converter_.send(compressed_data);
        
        if (stream.size() != 0)
        {
            socket_->async_write({stream.begin(), stream.end()}, nullptr);
        }
        
    }

    // ======================================================================
    // SCHEDULE_NEXT_READ
    // ======================================================================
    void schedule_next_read()
    {
        if (!socket_->is_alive())
        {
            return;
        }

        auto available = socket_->available();
        auto amount = available 
                    ? *available 
                    : odin::net::socket::input_size_type{1};
                    
        socket_->async_read(
            amount,
            [this](auto &&data)
            {
                this->on_data(data);
            });
    }

    // ======================================================================
    // ON_DATA
    // ======================================================================
    void on_data(std::vector<odin::u8> const &data)
    {
        write(telnet_session_.send(
            telnet_session_.receive({data.begin(), data.end()})));
            
        schedule_next_read();
    }
    
    // ======================================================================
    // ON_KEEPALIVE
    // ======================================================================
    void on_keepalive(boost::system::error_code const &error)
    {
        if (!error && socket_->is_alive())
        {
            write(telnet_session_.send({
                    telnetpp::element(telnetpp::command(telnetpp::nop))
                }));

            schedule_keepalive();
        }
    }

    // ======================================================================
    // SCHEDULE_KEEPALIVE
    // ======================================================================
    void schedule_keepalive()
    {
        keepalive_timer_->expires_from_now(boost::posix_time::seconds(30));
        keepalive_timer_->async_wait(
            [this](auto const &error_code)
            {
                this->on_keepalive(error_code);
            });
    }

    // ======================================================================
    // ON_TEXT
    // ======================================================================
    void on_text(std::string const &text)
    {
       // puts(text.c_str());
       /*
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
        */
        /*
        {
            std::string::size_type pos = 0; // Must initialize
            std::string str = text;
            while ( ( pos = str.find ("\n",pos) ) != string::npos )
            {
                str.erase ( pos, 1 );
            }
                        //data.erase(std::remove(data.begin(), data.end(), '\n'), data.end());
          //  send(str);
        }
        for( int x = 0; x < text.length(); x++ )
        {
            char c = text[x];
            //printf("[%d]", c);

            if( c ==  NEW_LINE_CHAR )
            {
                //cout << "Command Received! : " << input_buffer.c_str() << endl;
               // on_input_entered(input_buffer);
               // prompt();
              // process_event(server::input_received(input_buffer_, bind(&impl::send_to_connection, shared_from_this(), _1)));
               input_buffer_ = "";
                
            }
            else if( c >= 32 && c <= 126 )
            {
                input_buffer_ += text[x];
                
            }
            else if( c == 127 )
            {
                if( input_buffer_.length() > 0 )
                {
                    input_buffer_ = input_buffer_.substr(0, input_buffer_.size()-1);
                }
            }
            //printf("[%d]", c);
        }
        */
        if (on_data_read_)
        {
            on_data_read_(text);
        }
    }

    // ======================================================================
    // ON_WINDOW_SIZE_CHANGED
    // ======================================================================
    void on_window_size_changed(odin::u16 width, odin::u16 height)
    {
		//puts("Window resize!");
        if (on_window_size_changed_)
        {
            on_window_size_changed_(width, height);
        }
    }

    // ======================================================================
    // ON_TERMINAL_TYPE_DETECTED
    // ======================================================================
    void on_terminal_type_detected(std::string const &type)
    {
        terminal_type_ = type;
        announce_terminal_type();
    }

    // ======================================================================
    // ANNOUNCE_TERMINAL_TYPE
    // ======================================================================
    void announce_terminal_type()
    {
        for (auto const &callback : terminal_type_requests_)
        {
            callback(terminal_type_);
        }

        terminal_type_requests_.clear();
    }
    
    // virtual function from connnection statemachine
    void send_to_connection(const std::string& str)
    {
        write(telnet_session_.send({
        telnetpp::element(str)
        }));
    }
    
    std::shared_ptr<odin::net::socket>                   socket_;
    std::vector<odin::u8>                                unparsed_bytes_;
    
    std::function<void (std::string const &)>            on_data_read_;
    telnetpp::session                                    telnet_session_;
    telnetpp::options::echo::server                      telnet_echo_server_;
    telnetpp::options::suppress_ga::server               telnet_suppress_ga_server_;
    telnetpp::options::mccp::server                      telnet_mccp_server_;
    telnetpp::options::mccp::codec                       telnet_mccp_codec_;
    telnetpp::options::naws::client                      telnet_naws_client_;
    telnetpp::options::terminal_type::client             telnet_terminal_type_client_;
    
    telnetpp::byte_converter                             telnet_byte_converter_;
    
    std::function<void (odin::u16, odin::u16)>           on_window_size_changed_;
    std::shared_ptr<boost::asio::deadline_timer>         keepalive_timer_;

    std::string                                          terminal_type_;
    std::vector<std::function<void (std::string)>>       terminal_type_requests_;
    std::string input_buffer_;
    
    
};

// ==========================================================================
// CONSTRUCTOR
// ==========================================================================
connection::connection(std::shared_ptr<odin::net::socket> const &socket)
    : pimpl_(std::make_shared<impl>(socket))
{
}

// ==========================================================================
// DESTRUCTOR
// ==========================================================================
connection::~connection()
{
    disconnect();
}

// ==========================================================================
// START
// ==========================================================================
void connection::start()
{
    pimpl_->start();
}

// ==========================================================================
// WRITE
// ==========================================================================
void connection::write(std::string const &data)
{
    if (pimpl_->socket_ == nullptr)
        return;
    pimpl_->write(pimpl_->telnet_session_.send({
        telnetpp::element(data)
    }));
}

// ==========================================================================
// ON_DATA_READ
// ==========================================================================
void connection::on_data_read(
    std::function<void (std::string const &)> const &callback)
{
    pimpl_->on_data_read_ = callback;
}

// ==========================================================================
// ON_WINDOW_SIZE_CHANGED
// ==========================================================================
void connection::on_window_size_changed(
    std::function<void (odin::u16, odin::u16)> const &callback)
{
    pimpl_->on_window_size_changed_ = callback;
}

// ==========================================================================
// ON_SOCKET_DEATH
// ==========================================================================
void connection::on_socket_death(std::function<void ()> const &callback)
{
    pimpl_->socket_->on_death(callback);
}

// ==========================================================================
// DISCONNECT
// ==========================================================================
void connection::disconnect()
{
    if (pimpl_->keepalive_timer_ != nullptr)
    {
        boost::system::error_code unused_error_code;
        pimpl_->keepalive_timer_->cancel(unused_error_code);
    }

    if (pimpl_->socket_ != nullptr)
    {
        pimpl_->socket_->close();
        pimpl_->socket_.reset();
    }
}

// ==========================================================================
// ASYNC_GET_TERMINAL_TYPE
// ==========================================================================
void connection::async_get_terminal_type(
    std::function<void (std::string const &)> const &callback)
{
    pimpl_->terminal_type_requests_.push_back(callback);
}

//}
