
#ifndef TERMINALPP_EXPORT_H
#define TERMINALPP_EXPORT_H

#ifdef TERMINALPP_STATIC_DEFINE
#  define TERMINALPP_EXPORT
#  define TERMINALPP_NO_EXPORT
#else
#  ifndef TERMINALPP_EXPORT
#    ifdef terminalpp_EXPORTS
        /* We are building this library */
#      define TERMINALPP_EXPORT 
#    else
        /* We are using this library */
#      define TERMINALPP_EXPORT 
#    endif
#  endif

#  ifndef TERMINALPP_NO_EXPORT
#    define TERMINALPP_NO_EXPORT 
#  endif
#endif

#ifndef TERMINALPP_DEPRECATED
#  define TERMINALPP_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef TERMINALPP_DEPRECATED_EXPORT
#  define TERMINALPP_DEPRECATED_EXPORT TERMINALPP_EXPORT TERMINALPP_DEPRECATED
#endif

#ifndef TERMINALPP_DEPRECATED_NO_EXPORT
#  define TERMINALPP_DEPRECATED_NO_EXPORT TERMINALPP_NO_EXPORT TERMINALPP_DEPRECATED
#endif

#define DEFINE_NO_DEPRECATED 0
#if DEFINE_NO_DEPRECATED
# define TERMINALPP_NO_DEPRECATED
#endif

#endif
