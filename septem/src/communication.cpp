
#include "communication.hpp"
//#include "paradice/character.hpp"
#include "server/client.hpp"
#include "server/connection.hpp"
#include "world_context.hpp"
//#include "paradice/utility.hpp"
//#include "hugin/user_interface.hpp"
//#include "munin/algorithm.hpp"
#include "odin/tokenise.hpp"
#include "odin/core.hpp"
#include "terminalpp/encoder.hpp"
#include <boost/algorithm/string/trim.hpp>
#include <boost/format.hpp>

// ==========================================================================
// SEND_TO_ALL
// ==========================================================================
void send_to_all(
    std::shared_ptr<world_context> &ctx,
    std::string const        &text)
{
    send_to_all(ctx, terminalpp::encode(text));
}

// ==========================================================================
// SEND_TO_ALL
// ==========================================================================
void send_to_all(
    std::shared_ptr<world_context> &ctx,
    terminalpp::string const &text)
{
    for (auto cur_client : ctx->get_clients())
    {
        //cur_client->get_user_interface()->add_output_text(text);
    }
}

// ==========================================================================
// SEND_TO_PLAYER
// ==========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx,
    std::string const        &text,
    std::shared_ptr<client>  &conn)
{
    send_to_player(ctx, terminalpp::encode(text), conn);
}

// ==========================================================================
// SEND_TO_PLAYER
// ==========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx, 
    char const *text, 
    std::shared_ptr<client> &conn)
{
    send_to_player(ctx, terminalpp::encode(text), conn);
}

// ==========================================================================
// SEND_TO_PLAYER
// ==========================================================================
void send_to_player(
    std::shared_ptr<world_context> &ctx,
    terminalpp::string const &text,
    std::shared_ptr<client>  &conn)
{
    
   // conn->get_user_interface()->add_output_text(text);
}

// ==========================================================================
// SEND_TO_ROOM
// ==========================================================================
void send_to_room(
    std::shared_ptr<world_context> &ctx,
    std::string const        &text,
    std::shared_ptr<client>  &conn)
{
    send_to_room(ctx, terminalpp::encode(text), conn);
}

// ==========================================================================
// SEND_TO_ROOM
// ==========================================================================
void send_to_room(
    std::shared_ptr<world_context> &ctx,
    terminalpp::string const &text,
    std::shared_ptr<client>  &conn)
{
    for (auto cur_client : ctx->get_clients())
    {
        if (cur_client != conn)
        {
            //cur_client->get_user_interface()->add_output_text(text);
        }
    }
}


