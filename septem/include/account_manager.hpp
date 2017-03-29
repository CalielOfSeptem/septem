// ==========================================================================
// septem
//
// Copyright (C) 2017 Kenneth Thompson, All Rights Reserved.
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

/**
 * @file player_manager.h
 * @author Ken Thompson
 * @date 15 Feb 2017
 * @brief Player manager class
 *
 * Account Manager Class
 * TODO: Finish documentation
 * @see http://www.blah..
 */
#include <string>
#ifndef ACCOUNT_MANAGER_HPP_
#define ACCOUNT_MANAGER_HPP_

#include <boost/filesystem/operations.hpp>
#include <boost/filesystem/path.hpp>
#include <boost/shared_ptr.hpp>

#include "account.hpp"

namespace fs = boost::filesystem;

 /*! A test class */
class account_manager
{
  public:
    account_manager();   //!< constructor
    
    static std::string get_accounts_path();
    
    static std::string get_chars_path();
    
    static bool create_account(account ac);
    
    static bool load_account(std::string username, account &ac);
    
    static bool accounts_path_exists();
    
    static bool chars_path_exists();
    
    static bool account_exists(std::string username);
    
    void testcryptopp();
    
    static std::string get_password_hash(std::string username, std::string password);
    
protected:

    int value;       /*!< an integer value */

private:
    
   
};
#endif