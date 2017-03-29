#ifndef SE7EN_HPP_
#define SE7EN_HPP_

#include <boost/asio/io_service.hpp>
#include <memory>

//* =========================================================================
/// \brief A class that implements the main engine for the Se7en server.
/// \param io_service - The engine will be run within using the dispatch
///        mechanisms of this object.
/// \brief work - A "work" object.  While this is not reset, the threads'
///        run() methods will not terminate.  Resetting this work object
///        is part of the shutdown protocol.
/// \brief port - The server will be set up on this port number.
//* =========================================================================
class se7en
{
public :
    se7en(
        boost::asio::io_service                        &io_service
      , std::shared_ptr<boost::asio::io_service::work>  work
      , unsigned int                                    port);
    
private :
    struct impl;
    std::shared_ptr<impl> pimpl_;
};

#endif