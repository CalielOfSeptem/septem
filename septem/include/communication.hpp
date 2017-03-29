
// ==========================================================================
#ifndef SE7EN_COMMUNICATION_HPP_
#define SE7EN_COMMUNICATION_HPP_

#include <string>
#include <boost/shared_ptr.hpp>

namespace terminalpp {
    class string;
}



class client;
class world_context;

//* =========================================================================
/// \brief Send a text message to all connected players.
//* =========================================================================
void send_to_all(
    boost::shared_ptr<world_context> &ctx
  , std::string const        &text);

//* =========================================================================
/// \brief Send a text message to all connected players.
//* =========================================================================
void send_to_all(
    std::shared_ptr<world_context> &ctx
  , terminalpp::string const &text);

//* =========================================================================
/// \brief Send a text message to a single player.
//* =========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx
  , char const *text
  , std::shared_ptr< client >& player);

//* =========================================================================
/// \brief Send a text message to a single player.
//* =========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx
  , std::string const        &text
  , std::shared_ptr<client>  &player);

//* =========================================================================
/// \brief Send a text message to a single player.
//* ========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx
  , terminalpp::string const &text
  , std::shared_ptr<client>  &player);

//* =========================================================================
/// \brief Send a text message to all players in the same room as player,
/// but not to player.
//* =========================================================================
void send_to_room(
    std::shared_ptr<world_context> &ctx
  , std::string const        &text
  , std::shared_ptr<client>  &player);

//* =========================================================================
/// \brief Send a text message to all players in the same room as player,
/// but not to player.
//* =========================================================================
void send_to_room(
    std::shared_ptr<world_context> &ctx
  , terminalpp::string const &text
  , std::shared_ptr<client>  &player);





#endif
