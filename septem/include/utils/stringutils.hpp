#ifndef STRING_UTILS_HPP__
#define STRING_UTILS_HPP__

#include <memory>
#include <iostream>
#include <string>
#include <cstdio>
#include <algorithm>
#include <regex>


#include <functional> 
#include <cctype>
#include <locale>


#include <sstream>
#include <vector>


static inline std::vector<std::string> split(const std::string &s, char delim) {
  std::stringstream ss(s);
  std::string item;
  std::vector<std::string> elems;
  while (std::getline(ss, item, delim)) {
    elems.push_back(item);
    // elems.push_back(std::move(item)); // if C++11 (based on comment from @mchiasson)
  }
  return elems;
}

static inline std::string vector_to_string( const std::vector<std::string> &s, char delim)
{
    std::stringstream ss;
    for (auto str : s)
    {
        ss << str << delim;
    }
    return ss.str();
}

static inline bool startsWith(const std::string& haystack, const std::string& needle) {
    return needle.length() <= haystack.length() 
        && equal(needle.begin(), needle.end(), haystack.begin());
}

// trim from start (in place)
static inline void ltrim(std::string &s) {
    s.erase(s.begin(), std::find_if(s.begin(), s.end(),
            std::not1(std::ptr_fun<int, int>(std::isspace))));
}

// trim from end (in place)
static inline void rtrim(std::string &s) {
    s.erase(std::find_if(s.rbegin(), s.rend(),
            std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
}

// trim from both ends (in place)
static inline void trim(std::string &s) {
    ltrim(s);
    rtrim(s);
}

// trim from start (copying)
static inline std::string ltrimmed(std::string s) {
    ltrim(s);
    return s;
}

// trim from end (copying)
static inline std::string rtrimmed(std::string s) {
    rtrim(s);
    return s;
}

// trim from both ends (copying)
static inline std::string trimmed(std::string s) {
    trim(s);
    return s;
}

static bool is_email_valid(const std::string& email)
{
   // define a regular expression
   const std::regex pattern
      ("(\\w+)(\\.|_)?(\\w*)@(\\w+)(\\.(\\w+))+");

   // try to match the string with the regular expression
   return std::regex_match(email, pattern);
}

template<typename ... Args>
std::string string_format( const std::string& format, Args ... args )
{
    size_t size = snprintf( nullptr, 0, format.c_str(), args ... ) + 1; // Extra space for '\0'
    std::unique_ptr<char[]> buf( new char[ size ] ); 
    snprintf( buf.get(), size, format.c_str(), args ... );
    return std::string( buf.get(), buf.get() + size - 1 ); // We don't want the '\0' inside
}


static void sanitizepassword(std::string& phrase)
{
	for (unsigned int x = 0; x < phrase.length(); x++)
      if(phrase[x] >= 33 && phrase[x] <= 126)
      {phrase[x] = '*';}
}

#endif