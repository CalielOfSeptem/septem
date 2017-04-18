#include "server/httpserv.h"
#include "../../../Simple-Web-Server/server_http.hpp"
#include "../../../Simple-Web-Server/client_http.hpp"
#include "../../../json/src/json.hpp"
#include "config.h"
#include "entity_manager.h"

// for convenience
using json = nlohmann::json;
//Added for the json-example
#define BOOST_SPIRIT_THREADSAFE
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

//Added for the default_resource example
#include <fstream>
#include <boost/filesystem.hpp>
#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/filesystem/fstream.hpp>
#include <boost/lambda/bind.hpp>
#include <boost/array.hpp>

#include <vector>
#include <iostream>
#include <algorithm>
#ifdef HAVE_OPENSSL
#include "crypto.hpp"
#endif

using namespace std;
//Added for the json-example:
using namespace boost::property_tree;
namespace fs = boost::filesystem;
using namespace boost::lambda;
typedef SimpleWeb::Server<SimpleWeb::HTTP> HttpServer;
typedef SimpleWeb::Client<SimpleWeb::HTTP> HttpClient;

class Exception: public std::exception
{
public:
    /** Constructor (C strings).
     *  @param message C-style string error message.
     *                 The string contents are copied upon construction.
     *                 Hence, responsibility for deleting the char* lies
     *                 with the caller. 
     */
    explicit Exception(const char* message):
      msg_(message)
      {
      }

    /** Constructor (C++ STL strings).
     *  @param message The error message.
     */
    explicit Exception(const std::string& message):
      msg_(message)
      {}

    /** Destructor.
     * Virtual to allow for subclassing.
     */
    virtual ~Exception() throw (){}

    /** Returns a pointer to the (constant) error description.
     *  @return A pointer to a const char*. The underlying memory
     *          is in posession of the Exception object. Callers must
     *          not attempt to free the memory.
     */
    virtual const char* what() const throw (){
       return msg_.c_str();
    }

protected:
    /** Error message.
     */
    std::string msg_;
};

//Added for the default_resource example
void default_resource_send(const HttpServer &server, const shared_ptr<HttpServer::Response> &response,
                           const shared_ptr<ifstream> &ifs);
	struct element
	{
		std::string filename;
		bool is_directory;
		std::vector<element> my_children;
	};
    
    string unescape(const string& s)
    {
      string res;
      string::const_iterator it = s.begin();
      while (it != s.end())
      {
        char c = *it++;
        if (c == '\\' && it != s.end())
        {
          switch (*it++) {
          case '\\': c = '\\'; break;
          case 'n': c = '\n'; break;
          case 't': c = '\t'; break;
          // all other escapes
          default: 
            // invalid escape sequence - skip it. alternatively you can copy it as is, throw an exception...
            continue;
          }
        }
        res += c;
      }

      return res;
    }

//[{"text" : "Root", "id" : "1", "children" : true}]

    std::string SplitFilename (const string& str)
    {
      size_t found;
      //cout << "Splitting: " << str << endl;
      found=str.find_last_of("/\\");
      //cout << " folder: " << str.substr(0,found) << endl;
      //cout << " file: " << str.substr(found+1) << endl;
      return str.substr(found+1);
    }
    std::string SplitDirectoryname(const string& str)
    {
      size_t found;
      //cout << "Splitting: " << str << endl;
      found=str.find_last_of("/\\");
      //cout << " folder: " << str.substr(0,found) << endl;
      //cout << " file: " << str.substr(found+1) << endl;
      return str.substr(0, found);
    }

	bool load_directory_map( const fs::path & dir_path, json& j )
	{
        if ( !exists( dir_path ) ) return false;
        if(!is_directory(dir_path) )
        {
            return false;
        }
        std::string tmp_path = dir_path.string();
        if( tmp_path[tmp_path.size()-1] == '/' )
            tmp_path.erase(tmp_path.size()-1);
        
        //std::string dname = dir_path.parent_path().string();
        tmp_path = SplitFilename(tmp_path);
        j["text"] = tmp_path;//itr->path().string();
        j["type"] = "directory";
        j["data"]["relativePath"] = std::regex_replace(dir_path.string(), std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");
        j["data"]["systemPath"] = dir_path.string();
       // cout << dir_path.string() << endl;
        //cout << tmp_path.c_str() << endl;
        std::size_t str_hash = std::hash<std::string>{}(dir_path.string());
        
        j["id"] = std::to_string( str_hash );
        
        int cnt = std::count_if( fs::directory_iterator(dir_path), fs::directory_iterator(), static_cast<bool(*)(const fs::path&)>(fs::is_regular_file) );
        
        if( cnt > 0 )
        {
             //j["children"] = true;
             j["children"] = { };
        }
        else
        {
            j["children"] = false;
            return true;
        }

	  
	  fs::directory_iterator end_itr; // default construction yields past-the-end
	  for ( fs::directory_iterator itr( dir_path );
		itr != end_itr;
		++itr )
	  {
	    if ( is_directory(itr->status()) )
	    {
            // if its a directory child..
            json new_child;
            load_directory_map( itr->path(), new_child);
            j["children"].push_back(new_child);
            

	    }
	    else //if ( itr->leaf() == file_name ) // see below
	    {
            json new_child;
            new_child["children"] = false;
            std::size_t str_hash2 = std::hash<std::string>{}(itr->path().string());
        
            new_child["id"] = std::to_string( str_hash2 );
            new_child["text"] = itr->path().filename().string();//
            new_child["data"]["relativePath"] = std::regex_replace(itr->path().string(), std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");
            new_child["data"]["systemPath"] = itr->path().string();
            new_child["icon"] = "jstree-file";
            new_child["type"] = "file";
           // load_directory_map( itr->path(), new_child);
            j["children"].push_back(new_child);
            
		//element e;
		//e.is_directory = false;
		//e.filename = itr->filename();
		//fs_map.push_back(e);
	      //path_found = itr->path();
	     // return false;
	    }
	  }
	  return false;
	}

     
int start_serv(int port) {

    HttpServer server;
    //HTTP-server at port 8080 using 1 thread
    //Unless you do more heavy non-threaded processing in the resources,
    //1 thread is usually faster than several threads
    
    server.config.port=port;
    
    //Add resources using path-regex and method-string, and an anonymous function
    //POST-example for the path /string, responds the posted string
    server.resource["^/string$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        //Retrieve string:
        auto content=request->content.string();
        //request->content.string() is a convenience function for:
        //stringstream ss;
        //ss << request->content.rdbuf();
        //string content=ss.str();
        
        *response << "HTTP/1.1 200 OK\r\nContent-Length: " << content.length() << "\r\n\r\n" << content;
    };
    
    //POST-example for the path /json, responds firstName+" "+lastName from the posted json
    //Responds with an appropriate error message if the posted json is not valid, or if firstName or lastName is missing
    //Example posted json:
    //{
    //  "firstName": "John",
    //  "lastName": "Smith",
    //  "age": 25
    //}
    server.resource["^/json$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            ptree pt;
            read_json(request->content, pt);

            string name=pt.get<string>("firstName")+" "+pt.get<string>("lastName");

            *response << "HTTP/1.1 200 OK\r\n"
                      << "Content-Type: application/json\r\n"
                      << "Content-Length: " << name.length() << "\r\n\r\n"
                      << name;
        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };


    server.resource["^/authenticate$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            json j;
            j << request->content;
           // cout << j["relativePath"];
            json resp;
            std::size_t str_hash = std::hash<std::string>{}("fake");
            resp["sessionKey"] = std::to_string( str_hash );
            
            std::string jsonstr = resp.dump();
            
           /// std::string path_to_save = DEFAULT_GAME_DATA_PATH;
           // path_to_save += j["relativePath"];
                *response << "HTTP/1.1 200 OK\r\n"
                      << "Content-Type: application/json\r\n"
                      << "Access-Control-Allow-Origin: *\r\n"
                      << "Content-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };

    server.resource["^/authenticate$"]["OPTIONS"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {

            *response << "HTTP/1.1 200 OK\r\n"
                      << "Date: Mon, 01 Dec 2008 01:15:39 GMT\r\n"
                      << "Access-Control-Allow-Origin: *\r\n"
                      << "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
                      << "Access-Control-Allow-Headers: Content-Type\r\n"
                      << "Accept-Encoding: *\r\n"
                      << "Accept-Language: *\r\n"
                      << "Accept\r\n"
                      << "Cache-Control:public, max-age=31536000\r\n"
                      << "Access-Control-Max-Age: 31536000\r\n"
                      << "Content-Length: 0\r\n";

        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };
    
    
 
    //POST-example for the path /save, responds firstName+" "+lastName from the posted json
    //Responds with an appropriate error message if the posted json is not valid, or if firstName or lastName is missing
    //Example posted json:
    //{
    //  "firstName": "John",
    //  "lastName": "Smith",
    //  "age": 25
    //}
    server.resource["^/save$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            json j;
            j << request->content;
           // cout << j["relativePath"];
            
            std::string path_to_save = DEFAULT_GAME_DATA_PATH;
            path_to_save += j["relativePath"];
            
            if( j["create"] && fs::exists(fs::path(path_to_save) ))
            {
                std::string relpath = j["relativePath"];
                std::string ferror = "Error. File " + relpath + " already exists.";
                *response << "HTTP/1.1 400 Bad Request\r\n"
                 << "Access-Control-Allow-Origin: *\r\n"
                 << "Content-Length: " << ferror.length() << "\r\n\r\n" << ferror;
                return;
            }
            /*
            if( j["isDirectory"] )
            {
                json resp;
                resp["relativePath"] = j["relativePath"];
                std::size_t str_hash = std::hash<std::string>{}(path_to_save);
            
                resp["id"] = std::to_string( str_hash );
                std::string jsonstr = resp.dump();
                
                boost::filesystem::path dir(path_to_save);
                if (boost::filesystem::create_directory(dir))
                {

                    //std::cout<<"wrote the file successfully!"<<std::endl;
                    *response << "HTTP/1.1 200 OK\r\n"
                          << "Content-Type: application/json\r\n"
                          << "Access-Control-Allow-Origin: *\r\n"
                          << "Content-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
                }
                else
                {
                    //std::cerr<<"Failed to open file : "<<SYSERROR()<<std::endl;
                    //return -1;
                    std::string ferror = "Unable to save file " + path_to_save;
                    *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << ferror.length() << "\r\n\r\n" << ferror;
                }
                return;
            }
             */
         
            cout << "Saving file: " << path_to_save << endl;
            
           // std::string l = j.dump(4);
            //cout << l << endl;
            
            //std::string input;
            //std::cin >> input;
            std::string source = unescape(j["source"]);
            cout << source << endl;
            std::ofstream out(path_to_save);
            
            json resp;
            resp["relativePath"] = j["relativePath"];
            std::size_t str_hash = std::hash<std::string>{}(path_to_save);
        
            resp["id"] = std::to_string( str_hash );
            std::string jsonstr = resp.dump();
            if(out.is_open())
            {
                out << source;
                out.flush();
                out.close();
                //std::cout<<"wrote the file successfully!"<<std::endl;
                *response << "HTTP/1.1 200 OK\r\n"
                      << "Content-Type: application/json\r\n"
                      << "Access-Control-Allow-Origin: *\r\n"
                      << "Content-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
            }
            else
            {
                //std::cerr<<"Failed to open file : "<<SYSERROR()<<std::endl;
                //return -1;
                std::string ferror = "Unable to save file " + path_to_save;
                *response << "HTTP/1.1 400 Bad Request\r\n"
                << "Access-Control-Allow-Origin: *\r\n"
                << "Content-Length: " << ferror.length() << "\r\n\r\n" << ferror;
            }

           // ptree pt;
           // read_json(request->content, pt);

           // string name=pt.get<string>("firstName")+" "+pt.get<string>("lastName");

           // *response << "HTTP/1.1 200 OK\r\n"
           //           << "Content-Type: application/json\r\n"
            ////          << "Access-Control-Allow-Origin: *\r\n"
           //           << "Content-Length: 0" << "\r\n\r\n";
        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };

    server.resource["^/save$"]["OPTIONS"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {

            *response << "HTTP/1.1 200 OK\r\n"
                      << "Date: Mon, 01 Dec 2008 01:15:39 GMT\r\n"
                      << "Access-Control-Allow-Origin: *\r\n"
                      << "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
                      << "Access-Control-Allow-Headers: Content-Type\r\n"
                      << "Accept-Encoding: *\r\n"
                      << "Accept-Language: *\r\n"
                      << "Accept\r\n"
                      << "Cache-Control:public, max-age=31536000\r\n"
                      << "Access-Control-Max-Age: 31536000\r\n"
                      << "Content-Length: 0\r\n";

        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };

    server.resource["^/fs$"]["OPTIONS"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {

            *response << "HTTP/1.1 200 OK\r\n"
                      << "Date: Mon, 01 Dec 2008 01:15:39 GMT\r\n"
                      << "Access-Control-Allow-Origin: *\r\n"
                      << "Access-Control-Allow-Methods: POST, GET, OPTIONS\r\n"
                      << "Access-Control-Allow-Headers: Content-Type\r\n"
                      << "Accept-Encoding: *\r\n"
                      << "Accept-Language: *\r\n"
                      << "Accept\r\n"
                      << "Cache-Control:public, max-age=31536000\r\n"
                      << "Access-Control-Max-Age: 31536000\r\n"
                      << "Content-Length: 0\r\n";

        }
        catch(exception& e) {
            *response << "HTTP/1.1 400 Bad Request\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }
    };
    
    
    //GET-example for the path /info
    //Responds with request-information
    server.resource["^/info$"]["GET"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        stringstream content_stream;
        content_stream << "<h1>Request from " << request->remote_endpoint_address << " (" << request->remote_endpoint_port << ")</h1>";
        content_stream << request->method << " " << request->path << " HTTP/" << request->http_version << "<br>";
        for(auto& header: request->header) {
            content_stream << header.first << ": " << header.second << "<br>";
        }
        
        //find length of content_stream (length received using content_stream.tellp())
        content_stream.seekp(0, ios::end);
        
        *response <<  "HTTP/1.1 200 OK\r\nContent-Length: " << content_stream.tellp() << "\r\n\r\n" << content_stream.rdbuf();
    };
    
   
    server.resource["^/fs$"]["POST"]=[](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
            
        try
        {
            json j;
            j << request->content;
            
            if( j["op"] == "mkdir")
            {
                std::string game_path = DEFAULT_GAME_DATA_PATH;
                
                //std::string relpath = j["relativePath"];

                //relpath = SplitDirectoryname(relpath);
                
                //game_path += relpath;
                
                std::string fileA = j["fileA"];
                fileA = game_path  + fileA;
                
                if( fs::exists(fileA) )
                {
                    throw Exception( "File already exists.");
                }
                fs::create_directory( fs::path(fileA) );//rename( fs::path(fileA), fs::path(fileB) );
                
                json resp;
                resp["relativePath"] =  std::regex_replace(fileA, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");//j["relativePath"];
                std::size_t str_hash = std::hash<std::string>{}(fileA);
        
                resp["id"] = std::to_string( str_hash );
                std::string jsonstr = resp.dump();
                
                *response <<  "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
            }
            else if( j["op"] == "rm")
            {
                std::string game_path = DEFAULT_GAME_DATA_PATH;
                
                std::string relpath = j["relativePath"];
                
                game_path += relpath;
                
                if( !fs::exists(game_path) )
                {
                    throw Exception( "File does not exist.");
                }
                fs::remove( fs::path(game_path) );//rename( fs::path(fileA), fs::path(fileB) );
                
                json resp;
                resp["relativePath"] =  std::regex_replace(game_path, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");//j["relativePath"];
                std::size_t str_hash = std::hash<std::string>{}(game_path);
        
                resp["id"] = std::to_string( str_hash );
                std::string jsonstr = resp.dump();
                
                *response <<  "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
            }
            else if( j["op"] == "rename")
            {
                std::string game_path = DEFAULT_GAME_DATA_PATH;
                
                std::string relpath = j["relativePath"];
                
                relpath = SplitDirectoryname(relpath);
                game_path += relpath;
                std::string fileA = j["fileA"];
                fileA = game_path  + "/" + fileA;
                std::string fileB = j["fileB"];
                fileB = game_path  + "/" + fileB;
               // fs::path fileA = fs::path(path_to_save + "/" + "")
               
                if( !fs::exists(fileA) )
                {
                    throw Exception( "File does not exist.");
                }
                if( fs::exists(fileB) )
                {
                    throw Exception("File already exists with that name.");
                }
                fs::rename( fs::path(fileA), fs::path(fileB) );
                
                json resp;
                resp["relativePath"] =  std::regex_replace(fileB, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");//j["relativePath"];
                std::size_t str_hash = std::hash<std::string>{}(fileB);
        
                resp["id"] = std::to_string( str_hash );
                std::string jsonstr = resp.dump();
                
                *response <<  "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
               // fs::rename()
                
            }
            else if( j["op"] == "compile")
            {
                std::string game_path = DEFAULT_GAME_DATA_PATH;
                std::string fileA = j["fileA"];
                fileA = game_path + fileA;

                if( !fs::exists(fileA) )
                {
                    throw Exception( "File does not exist.");
                }

                //fs::rename( fs::path(fileA), fs::path(fileB) );
                std::string reason;
                if( entity_manager::Instance().compile_entity(fileA, reason) )
                {
                    json resp;
                    //std::size_t str_hash = std::hash<std::string>{}(fileA);
            
                    resp["result"] = "OK";
                    resp["text"] = "Compiled " + std::regex_replace(fileA, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");
                    std::string jsonstr = resp.dump();
                    
                    *response <<  "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
                }
                else
                {
                    throw Exception(reason);
                }
                

               // fs::rename()
                
            }
            else if( j["op"] == "move")
            {
                std::string game_path = DEFAULT_GAME_DATA_PATH;
                std::string fileA = j["fileA"];
                fileA = game_path  + fileA;
                std::string fileB = j["fileB"];
                fileB = game_path  + fileB;
                
                std::string new_file_path = fileB + "/" + SplitFilename(fileA);
               // fs::path fileA = fs::path(path_to_save + "/" + "")
               
                if( !fs::exists(fileA) )
                {
                    throw Exception( "File does not exist.");
                }
                if( fs::exists(new_file_path) )
                {
                    throw Exception("File already exists with that name.");
                }
                fs::rename( fs::path(fileA), fs::path(new_file_path) );
                
                json resp;
                resp["relativePath"] =  std::regex_replace(new_file_path, std::regex("\\" + std::string(DEFAULT_GAME_DATA_PATH)), "");//j["relativePath"];
                std::size_t str_hash = std::hash<std::string>{}(new_file_path);
        
                resp["id"] = std::to_string( str_hash );
                std::string jsonstr = resp.dump();
                
                *response <<  "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << jsonstr.length() << "\r\n\r\n" << jsonstr;
               // fs::rename()
                
            }
            else
            {
                throw Exception("Operation not permitted.");
            }
        }
        catch(const exception &e) {
            
            *response << "HTTP/1.1 400 Bad Request\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << strlen(e.what()) << "\r\n\r\n" << e.what();
        }

    };



    //GET-example for the path /match/[number], responds with the matched string in path (number)
    //For instance a request GET /match/123 will receive: 123
    server.resource["^/list/([0-9]+)$"]["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
	
    json j1;
    load_directory_map(DEFAULT_GAME_DATA_PATH, j1);
    std::string test = j1.dump(4); 
    //cout << s << std::endl;
    //cout << "Servicing request.." << endl;
   // cout << test;
        *response << "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\n"
        << "Content-Length: " << test.length() << "\r\n\r\n" << test;
    };
    
    //Get example simulating heavy work in a separate thread
    server.resource["^/work$"]["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> /*request*/) {
        thread work_thread([response] {
            this_thread::sleep_for(chrono::seconds(0));
            string message="Work done";
            *response << "HTTP/1.1 200 OK\r\nContent-Length: " << message.length() << "\r\n\r\n" << message;
        });
        work_thread.detach();
    };
    
/*
    server.resource["/contents"]["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            auto web_root_path=boost::filesystem::canonical(DEFAULT_GAME_DATA_PATH);
            auto path=boost::filesystem::canonical(web_root_path/request->path);
            //Check if path is within web_root_path
            if(distance(web_root_path.begin(), web_root_path.end())>distance(path.begin(), path.end()) ||
               !equal(web_root_path.begin(), web_root_path.end(), path.begin()))
                throw invalid_argument("path must be within root path");
            if(!boost::filesystem::is_directory(path))
                throw invalid_argument("must be a file");
            if(!(boost::filesystem::exists(path) && boost::filesystem::is_regular_file(path)))
                throw invalid_argument("file does not exist");

            std::string cache_control, etag;

            // Uncomment the following line to enable Cache-Control
             //cache_control="Cache-Control: max-age=86400\r\n";
             
            auto ifs=make_shared<ifstream>();
            ifs->open(path.string(), ifstream::in | ios::binary | ios::ate);
            cout << path.string() <<  endl;
            if(*ifs) {
                auto length=ifs->tellg();
                ifs->seekg(0, ios::beg);
                
                *response << "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\n" << cache_control << etag << "Content-Length: " << length << "\r\n\r\n";
                default_resource_send(server, response, ifs);
            }
            else
                throw invalid_argument("could not read file");
        }
        catch(const exception &e) {
            string content="Could not open path "+request->path+": "+e.what();
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << content.length() << "\r\n\r\n" << content;
        }
    };
     * 
     */
     
    
    //Default GET-example. If no other matches, this anonymous function will be called. 
    //Will respond with content in the web/-directory, and its subdirectories.
    //Default file: index.html
    //Can for instance be used to retrieve an HTML 5 client that uses REST-resources on this server
    server.default_resource["GET"]=[&server](shared_ptr<HttpServer::Response> response, shared_ptr<HttpServer::Request> request) {
        try {
            //cout << "Servicing request.." << endl;
            auto web_root_path=boost::filesystem::canonical(DEFAULT_GAME_DATA_PATH);
            auto path=boost::filesystem::canonical(web_root_path/request->path);
            //Check if path is within web_root_path
            if(distance(web_root_path.begin(), web_root_path.end())>distance(path.begin(), path.end()) ||
               !equal(web_root_path.begin(), web_root_path.end(), path.begin()))
                throw invalid_argument("path must be within root path");
            if(boost::filesystem::is_directory(path))
                throw invalid_argument("must be a file");
            if(!(boost::filesystem::exists(path) && boost::filesystem::is_regular_file(path)))
                throw invalid_argument("file does not exist");

            std::string cache_control, etag;

            // Uncomment the following line to enable Cache-Control
            // cache_control="Cache-Control: max-age=86400\r\n";

#ifdef HAVE_OPENSSL
            // Uncomment the following lines to enable ETag
            // {
            //     ifstream ifs(path.string(), ifstream::in | ios::binary);
            //     if(ifs) {
            //         auto hash=SimpleWeb::Crypto::to_hex_string(SimpleWeb::Crypto::md5(ifs));
            //         etag = "ETag: \""+hash+"\"\r\n";
            //         auto it=request->header.find("If-None-Match");
            //         if(it!=request->header.end()) {
            //             if(!it->second.empty() && it->second.compare(1, hash.size(), hash)==0) {
            //                 *response << "HTTP/1.1 304 Not Modified\r\n" << cache_control << etag << "\r\n\r\n";
            //                 return;
            //             }
            //         }
            //     }
            //     else
            //         throw invalid_argument("could not read file");
            // }
#endif

            auto ifs=make_shared<ifstream>();
            ifs->open(path.string());//, ifstream::in | ios::binary | ios::ate);
            ///std::ifstream t("file.txt");

            
           // cout << path.string() << endl;
            if(*ifs) {
                std::stringstream buffer;
                buffer << (*ifs).rdbuf();
                json jresp;
                jresp["text"] = buffer.str();
                jresp["path"] = path.string();
               // auto length=ifs->tellg();
                //ifs->seekg(0, ios::beg);
                std::string test = jresp.dump(4); 
                //cout << test << std::endl;
                //cout << "Sending response.." << endl;
                *response << "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: " << test.length() << "\r\n\r\n" << test;
                //};
               // *response << "HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\n" << cache_control << etag << "Content-Length: " << length << "\r\n\r\n";
                default_resource_send(server, response, ifs);
               // cout << "Done." << endl;
            }
            else
                throw invalid_argument("could not read file");
        }
        catch(const exception &e) {
            string content="Could not open path "+request->path+": "+e.what();
            *response << "HTTP/1.1 400 Bad Request\r\nContent-Length: " << content.length() << "\r\n\r\n" << content;
        }
    };
    
    thread server_thread([&server](){
        //Start server
        server.start();
    });
    /*
    //Wait for server to start so that the client can connect
    this_thread::sleep_for(chrono::seconds(1));
    
    //Client examples
    HttpClient client("localhost:8090");
    auto r1=client.request("GET", "/match/123");
    cout << r1->content.rdbuf() << endl;

    string json_string="{\"firstName\": \"John\",\"lastName\": \"Smith\",\"age\": 25}";
    auto r2=client.request("POST", "/string", json_string);
    cout << r2->content.rdbuf() << endl;
    
    auto r3=client.request("POST", "/json", json_string);
    cout << r3->content.rdbuf() << endl;
     */
    
    server_thread.join();
    
    return 0;
}

void default_resource_send(const HttpServer &server, const shared_ptr<HttpServer::Response> &response,
                           const shared_ptr<ifstream> &ifs) {
    //read and send 128 KB at a time
    static vector<char> buffer(131072); // Safe when server is running on one thread
    streamsize read_length;
    if((read_length=ifs->read(&buffer[0], buffer.size()).gcount())>0) {
        response->write(&buffer[0], read_length);
        if(read_length==static_cast<streamsize>(buffer.size())) {
            server.send(response, [&server, response, ifs](const boost::system::error_code &ec) {
                if(!ec)
                    default_resource_send(server, response, ifs);
                else
                    cerr << "Connection interrupted" << endl;
            });
        }
    }
}