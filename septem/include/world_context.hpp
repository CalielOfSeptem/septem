
#ifndef SE7EN_WORLD_CONTEXT_HPP_
#define SE7EN_WORLD_CONTEXT_HPP_

#include <memory>
#include <vector>


class account;
class character;
class client;

class world_context
{
public :
    //* =====================================================================
    /// \brief Destructor
    //* =====================================================================
    virtual ~world_context() {}

    //* =====================================================================
    /// \brief Retrieves a list of clients currently connected to Se7enMud.
    //* =====================================================================
    virtual std::vector<std::shared_ptr<client>> get_clients() = 0;

    //* =====================================================================
    /// \brief Adds a client to the list of clients currently connected
    /// to Paradice.
    //* =====================================================================
    virtual void add_client(std::shared_ptr<client> const &cli) = 0;

    //* =====================================================================
    /// \brief Removes a client from the list of clients currently
    /// connected to Paradice.
    //* =====================================================================
    virtual void remove_client(std::shared_ptr<client> const &cli) = 0;

    //* =====================================================================
    /// \brief For all clients, updates their lists of names.
    //* =====================================================================
  //  virtual void update_names() = 0;

    //* =====================================================================
    /// \brief Returns how a character appears to others, including prefix
    /// and suffix.
    //* =====================================================================
   // virtual std::string get_moniker(std::shared_ptr<character> const &ch) = 0;

    //* =====================================================================
    /// \brief Loads an account from a specific account name and returns it.
    /// Returns an empty shared_ptr<> if there was no account with that name
    /// found.
    //* =====================================================================
    virtual std::shared_ptr<account> load_account(
        std::string const &name) = 0;

    //* =====================================================================
    /// \brief Saves an account.
    //* =====================================================================
    virtual void save_account(std::shared_ptr<account> const &acct) = 0;

    //* =====================================================================
    /// \brief Loads a character that is identified by the passed name and
    /// returns it.  Returns an empty shared_ptr<> if there was no character
    /// with that name found.
    //* =====================================================================
   // virtual std::shared_ptr<character> load_character(
   //     std::string const &name) = 0;

    //* =====================================================================
    /// \brief Saves a character.
    //* =====================================================================
   // virtual void save_character(std::shared_ptr<character> const &ch) = 0;

    //* =====================================================================
    /// \brief Enacts a server shutdown.
    //* =====================================================================
    virtual void shutdown() = 0;
  
};



#endif