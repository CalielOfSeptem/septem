#include <boost/asio/io_service.hpp>
#include <boost/format.hpp>
#include <boost/program_options.hpp>
#include "se7en.hpp"
#include <iostream>
#include <string>
#include <thread>
#include <vector>
#include "config.h"
#include "account_manager.hpp"

#include <boost/shared_ptr.hpp>
//#include "vfs/filesystem_manager.h"
#include "server/connectionsm.hpp"

#include <boost/asio.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/thread.hpp>
#include <boost/thread/mutex.hpp>
#include <boost/bind.hpp>

#include <plog/Log.h>
#include <plog/Appenders/ConsoleAppender.h>



//#include "test_lua.h"
#include "entity_manager.h"
//#include "entity_manager.h"
//#include "script/scriptmgr.h"

//CScriptMgr       *scriptMgr = 0;
//entity_manager   *gameMgr   = 0;

namespace ba = boost::asio;
namespace po = boost::program_options;


boost::mutex global_stream_lock;

static void run_io_service(boost::asio::io_service &io_service)
{
    io_service.run();
}

void TimerHandler(
	const boost::system::error_code & error, 
	boost::shared_ptr< boost::asio::deadline_timer > timer, 
	boost::shared_ptr< boost::asio::io_service::strand > strand
)
{
	if( error )
	{
		global_stream_lock.lock();
		std::cout << "[" << boost::this_thread::get_id()
			<< "] Error: " << error << std::endl;
		global_stream_lock.unlock();
	}
	else
	{
        entity_manager::Instance().invoke_heartbeat();
		//std::cout << "[" << boost::this_thread::get_id()
		//	<< "] TimerHandler " << std::endl;

		timer->expires_from_now( boost::posix_time::seconds( 1 ) );
		timer->async_wait( 
			strand->wrap( boost::bind( &TimerHandler, _1, timer, strand ) )
		);
	}
}

int main(int argc, char *argv[])
{
    unsigned int port        = 4000;
    std::string  threads     = "";
    unsigned int concurrency = 0;
    
    //auto console = spdlog:("console");
    //console->info("Starting Se7en driver..!") ;
    std::string log_path = std::string(DEFAULT_LOG_PATH) + "septem";
    static plog::RollingFileAppender<plog::TxtFormatter> fileAppender(log_path.c_str(), 8000, 3); // Create the 1st appender.
    static plog::ConsoleAppender<plog::TxtFormatter> consoleAppender; // Create the 2nd appender.
    plog::init(plog::verbose, &fileAppender).addAppender(&consoleAppender); // Initialize the logger with the both appenders.
    
    LOG_INFO << "Starting up..";
    // A bunch of log lines that goes to the both appenders: to the file and to the console.
   // for (int i = 0; i < 100; ++i)
   // {
   //     LOG_INFO << "i: " << i;
   // }
    
    po::options_description description("Available options");
    description.add_options()
        ( "help,h",                                       "show this help message"                            )
        ( "port,p",    po::value<unsigned int>(&port),    "port number"                                       )
        ( "threads,t", po::value<std::string>(&threads),  "number of threads of execution (0 for autodetect)" )
        ;

    po::positional_options_description pos_description;
    pos_description.add("port", -1);
    try
    {
        po::variables_map vm;
        po::store(
            po::command_line_parser(argc, argv)
                .options(description)
                .positional(pos_description)
                .run()
          , vm);
        
        po::notify(vm);
      
        if (vm.count("help") != 0)
        {
            throw po::error("");
        }
        else if (vm.count("port") == 0)
        {
            throw po::error("Port number must be specified");
        }

        if (vm.count("threads") == 0)
        {
            concurrency = 1;
        }
        else
        {
            try
            {
                concurrency = boost::lexical_cast<unsigned int>(threads);
            }
            catch(...)
            {
                // Failure is to be expected here, since it might be an empty
                // string.  In this case, concurrency will be a detectable 0.
            }
            
            if (concurrency == 0)
            {
                concurrency = std::thread::hardware_concurrency();
            }

            // According to the Boost docs, "thread::hardware_concurrency()" 
            // may return 0 on platforms that don't have information available
            // about cores/hyperthreading units, etc.  In this case, we will
            // default to one thread.
            if (concurrency == 0)
            {
                concurrency = 1;
            }
        }
    }
    catch(po::error &err)
    {
        if (strlen(err.what()) == 0)
        {
            std::cout << boost::format("USAGE: %s <port number>|<options>\n")
                        % argv[0]
                 << description
                 << std::endl;
                 
            return EXIT_SUCCESS;
        }
        else
        {
            std::cerr << boost::format("ERROR: %s\n\nUSAGE: %s <port number>|<options>\n")
                        % err.what()
                        % argv[0]
                 << description
                 << std::endl;
        }
        
        return EXIT_FAILURE;
    }

    
    boost::asio::io_service io_service;
    boost::shared_ptr< boost::asio::io_service::strand > strand(
		new boost::asio::io_service::strand( io_service )
	);
    se7en application(
        io_service
      , std::make_shared<boost::asio::io_service::work>(std::ref(io_service))
      , port);
 		
    std::vector<std::thread> threadpool;

    for (unsigned int thr = 0; thr < concurrency; ++thr)
    {
        threadpool.emplace_back(&run_io_service, std::ref(io_service));
    }
    
    boost::shared_ptr< boost::asio::deadline_timer > timer(
		new boost::asio::deadline_timer( io_service )
	);
	timer->expires_from_now( boost::posix_time::seconds( 1 ) );
	timer->async_wait( 
		strand->wrap( boost::bind( &TimerHandler, _1, timer, strand ) )
	);

/*
	boost::shared_ptr< boost::asio::io_service > io_service(
		new boost::asio::io_service
	);
	boost::shared_ptr< boost::asio::io_service::work > work(
		new boost::asio::io_service::work( *io_service )
	);
	boost::shared_ptr< boost::asio::io_service::strand > strand(
		new boost::asio::io_service::strand( *io_service )
	);

	global_stream_lock.lock();
	std::cout << "[" << boost::this_thread::get_id()
		<< "] Press [return] to exit." << std::endl;
	global_stream_lock.unlock();

	boost::thread_group worker_threads;
	for( int x = 0; x < 2; ++x )
	{
		worker_threads.create_thread( boost::bind( &WorkerThread, io_service ) );
	}

	boost::this_thread::sleep( boost::posix_time::seconds( 1 ) );

	strand->post( boost::bind( &PrintNum, 1 ) );
	strand->post( boost::bind( &PrintNum, 2 ) );
	strand->post( boost::bind( &PrintNum, 3 ) );
	strand->post( boost::bind( &PrintNum, 4 ) );
	strand->post( boost::bind( &PrintNum, 5 ) );

	boost::shared_ptr< boost::asio::deadline_timer > timer(
		new boost::asio::deadline_timer( *io_service )
	);
	timer->expires_from_now( boost::posix_time::seconds( 1 ) );
	timer->async_wait( 
		strand->wrap( boost::bind( &TimerHandler, _1, timer, strand ) )
	);

	std::cin.get();

	io_service->stop();

	worker_threads.join_all();

	return 0;
    */
    
    for (auto &pthread : threadpool)
    {
        pthread.join();
    }
    
    io_service.stop();

    return EXIT_SUCCESS;
}


