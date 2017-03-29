
#ifndef ODIN_EXPORT_H
#define ODIN_EXPORT_H

#ifdef ODIN_STATIC_DEFINE
#  define ODIN_EXPORT
#  define ODIN_NO_EXPORT
#else
#  ifndef ODIN_EXPORT
#    ifdef odin_EXPORTS
        /* We are building this library */
#      define ODIN_EXPORT 
#    else
        /* We are using this library */
#      define ODIN_EXPORT 
#    endif
#  endif

#  ifndef ODIN_NO_EXPORT
#    define ODIN_NO_EXPORT 
#  endif
#endif

#ifndef ODIN_DEPRECATED
#  define ODIN_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef ODIN_DEPRECATED_EXPORT
#  define ODIN_DEPRECATED_EXPORT ODIN_EXPORT ODIN_DEPRECATED
#endif

#ifndef ODIN_DEPRECATED_NO_EXPORT
#  define ODIN_DEPRECATED_NO_EXPORT ODIN_NO_EXPORT ODIN_DEPRECATED
#endif

#define DEFINE_NO_DEPRECATED 0
#if DEFINE_NO_DEPRECATED
# define ODIN_NO_DEPRECATED
#endif

#endif
