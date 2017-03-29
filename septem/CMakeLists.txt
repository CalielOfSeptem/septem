set (se7en_SOURCES
    src/context_impl.cpp
	src/main.cpp
	src/se7en.cpp
	src/connection.cpp
	src/utils/tinyxml2.cpp
	src/test.cpp
)

add_executable(se7en ${se7en_SOURCES})

set_target_properties(se7en
    PROPERTIES
        CXX_VISIBILITY_PRESET hidden
)

target_include_directories(se7en
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# Select the best cryptography available.
if (CRYPTO++_FOUND)
    target_compile_definitions(se7en
        PRIVATE
            se7en_USE_CRYPTOPP)
            
    target_link_libraries(se7en
        PRIVATE 
            cryptopp)
else()
    target_compile_definitions(se7en
        PRIVATE
            se7en_NOCRYPT)
endif()

target_compile_definitions(se7en
    PRIVATE
        BOOST_SIGNALS_NO_DEPRECATION_WARNING
)

target_compile_features(se7en
    PRIVATE
        cxx_right_angle_brackets
        cxx_generic_lambdas
)

target_link_libraries(se7en
    PUBLIC
		odin
		terminalpp
		ttvfs
		pthread
        ${Boost_SERIALIZATION_LIBRARY}
    PRIVATE
        telnetpp
        ${Boost_RANDOM_LIBRARY}
        ${Boost_SYSTEM_LIBRARY}
		${Boost_PROGRAM_OPTIONS_LIBRARY}
		${Boost_FILESYSTEM_LIBRARY}
        ${Boost_SYSTEM_LIBRARY}
) 




