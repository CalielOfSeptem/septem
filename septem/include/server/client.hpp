#ifndef SE7EN_CLIENT_HPP_
#define SE7EN_CLIENT_HPP_

#include <functional>
#include <memory>
#include <vector>
#include "account.hpp"
class world_context;
class character;
class connection;
    
namespace boost { namespace asio {
    class io_service;
}}


class client
    : public std::enable_shared_from_this<client>
{
public :
    //* =====================================================================
    /// \brief Constructor
    //* =====================================================================
    client(
        boost::asio::io_service  &io_service
      , std::shared_ptr<world_context>  ctx);

    //* =====================================================================
    /// \brief Destructor
    //* =====================================================================
    ~client();

    //* =====================================================================
    /// \brief Sets the connection on which this client operates.
    //* =====================================================================
    void set_connection(std::shared_ptr<connection> const &new_connection);

    //* =====================================================================
    /// \brief Gets the user interface for the client.
    //* =====================================================================
   // std::shared_ptr<hugin::user_interface> get_user_interface();

    //* =====================================================================
    /// \brief Gets the window for the client.
    //* =====================================================================
  //  std::shared_ptr<munin::window> get_window();

    //* =====================================================================
    /// \brief Sets the title of the client's window
    //* =====================================================================
    //void set_window_title(std::string const &title);

    //* =====================================================================
    /// \brief Sets the size of the client's window
    //* =====================================================================
  //  void set_window_size(odin::u16 width, odin::u16 height);

    //* =====================================================================
    /// \brief Sets the account that the client is currently using.
    //* =====================================================================
    void set_account(std::shared_ptr<account> const &acc);

    //* =====================================================================
    /// \brief Retrieves the account that the client is currently using.
    //* =====================================================================
    std::shared_ptr<account> get_account() const;

    //* =====================================================================
    /// \brief Sets the character that the client is currently using.
    //* =====================================================================
    void set_character(std::shared_ptr<character> const &ch);

    //* =====================================================================
    /// \brief Retreives the character that the client is currently using.
    //* =====================================================================
    std::shared_ptr<character> get_character() const;
    

    std::shared_ptr<client> get_shared_ptr() {
        return shared_from_this();//std::weak_ptr<client>(shared_from_this());
    }

    //* =====================================================================
    /// \brief Disconnects the client from the server.
    //* =====================================================================
    void disconnect();

    //* =====================================================================
    /// \brief Sets up a callback for if the client's connection dies.
    //* =====================================================================
    void on_connection_death(std::function<void ()> const &callback);
    
    // ======================================================================
    // DATA
    // ======================================================================
    void data(std::string const &data);
    
    void send(std::string const &data);
    
    void send(char const * text);
    
 

private :
    class impl;
    std::shared_ptr<impl> pimpl_;
   
};

#endif