# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/dev/test_projects/cmake_project/projects/main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/dev/test_projects/cmake_project/projects/main

# Include any dependencies generated for this target.
include CMakeFiles/app.out.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/app.out.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/app.out.dir/flags.make

CMakeFiles/app.out.dir/source/custom_math.o: CMakeFiles/app.out.dir/flags.make
CMakeFiles/app.out.dir/source/custom_math.o: source/custom_math.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/dev/test_projects/cmake_project/projects/main/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/app.out.dir/source/custom_math.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/app.out.dir/source/custom_math.o   -c /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/custom_math.c

CMakeFiles/app.out.dir/source/custom_math.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/app.out.dir/source/custom_math.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/custom_math.c > CMakeFiles/app.out.dir/source/custom_math.i

CMakeFiles/app.out.dir/source/custom_math.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/app.out.dir/source/custom_math.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/custom_math.c -o CMakeFiles/app.out.dir/source/custom_math.s

CMakeFiles/app.out.dir/source/custom_math.o.requires:

.PHONY : CMakeFiles/app.out.dir/source/custom_math.o.requires

CMakeFiles/app.out.dir/source/custom_math.o.provides: CMakeFiles/app.out.dir/source/custom_math.o.requires
	$(MAKE) -f CMakeFiles/app.out.dir/build.make CMakeFiles/app.out.dir/source/custom_math.o.provides.build
.PHONY : CMakeFiles/app.out.dir/source/custom_math.o.provides

CMakeFiles/app.out.dir/source/custom_math.o.provides.build: CMakeFiles/app.out.dir/source/custom_math.o


CMakeFiles/app.out.dir/source/main.o: CMakeFiles/app.out.dir/flags.make
CMakeFiles/app.out.dir/source/main.o: source/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/dev/test_projects/cmake_project/projects/main/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/app.out.dir/source/main.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/app.out.dir/source/main.o   -c /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/main.c

CMakeFiles/app.out.dir/source/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/app.out.dir/source/main.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/main.c > CMakeFiles/app.out.dir/source/main.i

CMakeFiles/app.out.dir/source/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/app.out.dir/source/main.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ubuntu/dev/test_projects/cmake_project/projects/main/source/main.c -o CMakeFiles/app.out.dir/source/main.s

CMakeFiles/app.out.dir/source/main.o.requires:

.PHONY : CMakeFiles/app.out.dir/source/main.o.requires

CMakeFiles/app.out.dir/source/main.o.provides: CMakeFiles/app.out.dir/source/main.o.requires
	$(MAKE) -f CMakeFiles/app.out.dir/build.make CMakeFiles/app.out.dir/source/main.o.provides.build
.PHONY : CMakeFiles/app.out.dir/source/main.o.provides

CMakeFiles/app.out.dir/source/main.o.provides.build: CMakeFiles/app.out.dir/source/main.o


# Object files for target app.out
app_out_OBJECTS = \
"CMakeFiles/app.out.dir/source/custom_math.o" \
"CMakeFiles/app.out.dir/source/main.o"

# External object files for target app.out
app_out_EXTERNAL_OBJECTS =

app.out: CMakeFiles/app.out.dir/source/custom_math.o
app.out: CMakeFiles/app.out.dir/source/main.o
app.out: CMakeFiles/app.out.dir/build.make
app.out: CMakeFiles/app.out.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/dev/test_projects/cmake_project/projects/main/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable app.out"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/app.out.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/app.out.dir/build: app.out

.PHONY : CMakeFiles/app.out.dir/build

CMakeFiles/app.out.dir/requires: CMakeFiles/app.out.dir/source/custom_math.o.requires
CMakeFiles/app.out.dir/requires: CMakeFiles/app.out.dir/source/main.o.requires

.PHONY : CMakeFiles/app.out.dir/requires

CMakeFiles/app.out.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/app.out.dir/cmake_clean.cmake
.PHONY : CMakeFiles/app.out.dir/clean

CMakeFiles/app.out.dir/depend:
	cd /home/ubuntu/dev/test_projects/cmake_project/projects/main && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/dev/test_projects/cmake_project/projects/main /home/ubuntu/dev/test_projects/cmake_project/projects/main /home/ubuntu/dev/test_projects/cmake_project/projects/main /home/ubuntu/dev/test_projects/cmake_project/projects/main /home/ubuntu/dev/test_projects/cmake_project/projects/main/CMakeFiles/app.out.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/app.out.dir/depend

