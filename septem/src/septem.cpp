#include "septem.hpp"
#include "server/client.hpp"
#include "server/context_impl.hpp"
//#include "paradice/character.hpp"

//#include "paradice/communication.hpp"
#include "server/connection.hpp"
#include "odin/net/server.hpp"
#include "odin/net/socket.hpp"
#include <boost/asio/io_service.hpp>
#include <boost/asio/placeholders.hpp>
#include <map>
#include <utility>
#include <entity_manager.h>

//#include "entity_mananger.h"
//#include "script/scriptmgr.h"
//CScriptMgr *scriptMgr = 0;

// ==========================================================================
// PARADICE9::IMPLEMENTATION STRUCTURE
// ==========================================================================
struct septem::impl
{
public :
    // ======================================================================
    // CONSTRUCTOR
    // ======================================================================
    impl(
        boost::asio::io_service                        &io_service
      , std::shared_ptr<boost::asio::io_service::work>  work
      , unsigned int                                    port)
        : io_service_(io_service) 
        , server_(new odin::net::server(
              io_service_
            , port
            , [this](auto socket){
                  this->on_accept(socket);
              }))
        , context_(std::make_shared<context_impl>(
              std::ref(io_service), server_, std::ref(work)))
    {
		//puts("Starting up!!");
        
        std::string reason;
        std::string path_to_script = "/home/ken/git-repos/septem/game_data/realms/void";
         entity_manager::Instance().load_daemon_from_fs(DEFAULT_DAEMON_PATH);
        entity_manager::Instance().load_entities_from_fs( DEFAULT_REALMS_PATH ); ///"/home/ken/git-repos/septem/game_data/realms/" );
        entity_manager::Instance().load_commands_from_fs(DEFAULT_COMMANDS_PATH);
    }

private :
    // ======================================================================
    // ON_ACCEPT
    // ======================================================================
    void on_accept(std::shared_ptr<odin::net::socket> const &socket)
    {
		//puts("on_accept!!");
        // Create the connection and client structures for the socket.
        auto connection_test = std::make_shared<connection>(socket);
        pending_connections_.push_back(connection_test);
        
        // Before creating a client object, we first negotiate some
        // knowledge about the connection.  Set up the callbacks for this.
        connection_test->on_socket_death(
            [this, wp=std::weak_ptr<connection>(connection_test)] 
            {
                this->on_connection_death(wp);
            });
    
        connection_test->on_window_size_changed(
            [this, wp=std::weak_ptr<connection>(connection_test)]
            (auto w, auto h) 
            {
                this->on_window_size_changed(wp, w, h);
            });
			

        connection_test->async_get_terminal_type(
            [this, 
             ws=std::weak_ptr<odin::net::socket>(socket),
             wc=std::weak_ptr<connection>(connection_test)]
            (auto const &type)
            {
                this->on_terminal_type(ws, wc, type);
            });
			

        connection_test->start();
    }

    // ======================================================================
    // ON_TERMINAL_TYPE
    // ======================================================================
    void on_terminal_type(
        std::weak_ptr<odin::net::socket>     weak_socket
      , std::weak_ptr<connection>  weak_connection
      , std::string const                   &terminal_type)
    {
        printf("Terminal type is: \"%s\"\n", terminal_type.c_str());
        
        auto socket =     weak_socket.lock();
        auto connection = weak_connection.lock();
        
        if (socket != NULL && connection != NULL)
        {
            auto pending_connection =
                std::find(
                    pending_connections_.begin()
                  , pending_connections_.end()
                  , connection);
            
            // There is a possibility that this is a stray terminal type.
            // If so, ignore it.
            if (pending_connection == pending_connections_.end())
            {
                return;
            }
            
            pending_connections_.erase(pending_connection);

            auto cl=
                std::make_shared<client>(std::ref(io_service_), context_);
            cl->set_connection(connection);
            
            cl->on_connection_death(bind(
                &impl::on_client_death
              , this
              , std::weak_ptr<client>(cl)));

            context_->add_client(cl);
           // context_->update_names();
            
            // If the window's size has been set by the NAWS process,
            // then update it to that.  Otherwise, use the standard 80,24.
            /*
            auto psize = pending_sizes_.find(connection);
            
            if (psize != pending_sizes_.end())
            {
                client->set_window_size(
                    psize->second.first
                  , psize->second.second);
                pending_sizes_.erase(connection);
            }
            else
            {
                client->set_window_size(80, 24);
            }
			*/
        }
		
    }
    
    // ======================================================================
    // ON_CONNECTION_DEATH
    // ======================================================================
    void on_connection_death(std::weak_ptr<connection> const &weak_connection)
    {
        puts("on_connection_death");
        auto connection = weak_connection.lock();
    
        if (connection != NULL)
        {
            pending_connections_.erase(remove(
                    pending_connections_.begin()
                  , pending_connections_.end()
                  , connection)
              , pending_connections_.end());
            pending_sizes_.erase(connection);
        }
    }
    
    void on_client_authorized( std::weak_ptr<connection> const &weak_connection )
    {
        
    }
    
    // ======================================================================
    // ON_CLIENT_DEATH
    // ======================================================================
    void on_client_death(std::weak_ptr<client> &weak_client)
    {
		puts("on_client_death");
        auto cclient = weak_client.lock();
        
        if (cclient != NULL)
        {
            context_->remove_client(cclient);
            /*
            context_->update_names();
    
            auto character = cclient->get_character();
            
            if (character != NULL)
            {
                auto name = character->get_name();
            
                if (!name.empty())
                {
                    send_to_all(
                        context_
                      , "#SERVER: "
                      + context_->get_moniker(character)
                      + " has left septem.\n");
                }
            }
            */
        }
		
    }
	
    
    // ======================================================================
    // ON_WINDOW_SIZE_CHANGED
    // ======================================================================
    void on_window_size_changed(
        std::weak_ptr<connection> weak_connection,
        odin::u16                           width,
        odin::u16                           height)
    {
        // This is only called during the negotiation process.  We save
        // the size so that it can be given to the client once the process
        // has completed.
        auto connection = weak_connection.lock();
       // printf("on_window_size_changed, w=%d, h=%d\r\n", width, height);
        if (connection != NULL)
        {
            
            pending_sizes_[connection] = std::make_pair(width, height);
        }
    }
	
    
    boost::asio::io_service            &io_service_;
    std::shared_ptr<odin::net::server>  server_;
    std::shared_ptr<world_context>  context_;
    
    // A vector of clients whose connections are being negotiated.
    std::vector<std::shared_ptr<connection>> pending_connections_;
    std::map<
        std::shared_ptr<connection>, 
        std::pair<odin::u16, odin::u16> > pending_sizes_; 
};

// ==========================================================================
// CONSTRUCTOR
// ==========================================================================
septem::septem(
    boost::asio::io_service                        &io_service
  , std::shared_ptr<boost::asio::io_service::work>  work
  , unsigned int                        port)
    : pimpl_(new impl(io_service, work, port))  
{
}
