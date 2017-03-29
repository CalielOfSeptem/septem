
#ifndef TELNETPP_EXPORT_H
#define TELNETPP_EXPORT_H

#ifdef TELNETPP_STATIC_DEFINE
#  define TELNETPP_EXPORT
#  define TELNETPP_NO_EXPORT
#else
#  ifndef TELNETPP_EXPORT
#    ifdef telnetpp_EXPORTS
        /* We are building this library */
#      define TELNETPP_EXPORT 
#    else
        /* We are using this library */
#      define TELNETPP_EXPORT 
#    endif
#  endif

#  ifndef TELNETPP_NO_EXPORT
#    define TELNETPP_NO_EXPORT 
#  endif
#endif

#ifndef TELNETPP_DEPRECATED
#  define TELNETPP_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef TELNETPP_DEPRECATED_EXPORT
#  define TELNETPP_DEPRECATED_EXPORT TELNETPP_EXPORT TELNETPP_DEPRECATED
#endif

#ifndef TELNETPP_DEPRECATED_NO_EXPORT
#  define TELNETPP_DEPRECATED_NO_EXPORT TELNETPP_NO_EXPORT TELNETPP_DEPRECATED
#endif

#define DEFINE_NO_DEPRECATED 0
#if DEFINE_NO_DEPRECATED
# define TELNETPP_NO_DEPRECATED
#endif

#endif
