# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ken/git-repos/Se7enMud/lua

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ken/git-repos/Se7enMud/lua/build

# Include any dependencies generated for this target.
include CMakeFiles/lua.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lua.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lua.dir/flags.make

CMakeFiles/lua.dir/src/lua.c.o: CMakeFiles/lua.dir/flags.make
CMakeFiles/lua.dir/src/lua.c.o: ../src/lua.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ken/git-repos/Se7enMud/lua/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lua.dir/src/lua.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lua.dir/src/lua.c.o   -c /home/ken/git-repos/Se7enMud/lua/src/lua.c

CMakeFiles/lua.dir/src/lua.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lua.dir/src/lua.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ken/git-repos/Se7enMud/lua/src/lua.c > CMakeFiles/lua.dir/src/lua.c.i

CMakeFiles/lua.dir/src/lua.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lua.dir/src/lua.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ken/git-repos/Se7enMud/lua/src/lua.c -o CMakeFiles/lua.dir/src/lua.c.s

CMakeFiles/lua.dir/src/lua.c.o.requires:

.PHONY : CMakeFiles/lua.dir/src/lua.c.o.requires

CMakeFiles/lua.dir/src/lua.c.o.provides: CMakeFiles/lua.dir/src/lua.c.o.requires
	$(MAKE) -f CMakeFiles/lua.dir/build.make CMakeFiles/lua.dir/src/lua.c.o.provides.build
.PHONY : CMakeFiles/lua.dir/src/lua.c.o.provides

CMakeFiles/lua.dir/src/lua.c.o.provides.build: CMakeFiles/lua.dir/src/lua.c.o


# Object files for target lua
lua_OBJECTS = \
"CMakeFiles/lua.dir/src/lua.c.o"

# External object files for target lua
lua_EXTERNAL_OBJECTS =

lua: CMakeFiles/lua.dir/src/lua.c.o
lua: CMakeFiles/lua.dir/build.make
lua: liblua.so
lua: /usr/lib/x86_64-linux-gnu/libm.so
lua: /usr/lib/x86_64-linux-gnu/libdl.so
lua: CMakeFiles/lua.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ken/git-repos/Se7enMud/lua/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable lua"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lua.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lua.dir/build: lua

.PHONY : CMakeFiles/lua.dir/build

CMakeFiles/lua.dir/requires: CMakeFiles/lua.dir/src/lua.c.o.requires

.PHONY : CMakeFiles/lua.dir/requires

CMakeFiles/lua.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lua.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lua.dir/clean

CMakeFiles/lua.dir/depend:
	cd /home/ken/git-repos/Se7enMud/lua/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ken/git-repos/Se7enMud/lua /home/ken/git-repos/Se7enMud/lua /home/ken/git-repos/Se7enMud/lua/build /home/ken/git-repos/Se7enMud/lua/build /home/ken/git-repos/Se7enMud/lua/build/CMakeFiles/lua.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lua.dir/depend
