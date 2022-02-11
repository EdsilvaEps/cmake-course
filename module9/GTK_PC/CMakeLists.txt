cmake_minimum_required(VERSION 3.0.0)

project(GTK_PC)

find_package(PkgConfig REQUIRED) # adding the PkgConfig module to this CMakeLists.txt

# checks for the package and uses the first available
# pkg_check_modules(<libkeyword> MODE lib)
# will by defaout look for it on a standard location (like /usr/lib)
# will set <libkeyword>_INCLUDE_DIRS and <libkeyword>_LIBRARIES
pkg_check_modules(GTK3 REQUIRED gtk+-3.0) # if module is found, the GTK3_ variables below will be set

# to specify where a target is located, should edit the CMAKE_PREFIX_PATH (cmake var) or the PKG_CONFIG_PATH (env var) 
# ways to modify a path env:
# set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} "/home/edson/Desktop") --> append to the original var, instead of overwriting it
# list(APPEND CMAKE_PREFIX_PATH "/home/edson/Desktop")
# set(PKG_CONFIG_PATH "$ENV{PKG_CONFIG_PATH}:/home/edson/Desktop")
# look into FindPkgConfig on the official cmake page

if(PKG_CONFIG_FOUND)
    message("PKG FOUND")

    add_executable(${PROJECT_NAME}_app main.cpp)

    target_include_directories(${PROJECT_NAME}_app PRIVATE ${GTK3_INCLUDE_DIRS}) # INCLUDE_DIRS could also be the link to the path

    target_link_libraries(${PROJECT_NAME}_app PRIVATE ${GTK3_LIBRARIES}) # LIBRARIES could also be the link to the path
else()
    message("Could not find PKG")
endif()

# command to search a lib on a number of possible paths
# find_library(<VAR> <lib-name> <path1> <path2>...)
# ex: find_library(abc_LIBRARY abc HINTS /home/edson/Downloads/abc)
# ex: find_library(abc_LIBRARY abc HINTS /home/edson/Downloads/abc
#               PATH_SUFIXES lib lib/abc-1.14) -> this adds new links with suffix lib and lib/abc-1.14
# abc_LIBRARY = /home/edson/Downloads/abc/libabc.so
#
# find_path(<VAR> <lib-name> <path1> <path2>... <suffix1>...) -> find headers
# find_path(abc_INCLUDE abc.h HINTS /home/edson/Downloads/abc)
#
# default location for find_library  search
# /usr/lib
# /usr/lib/x86_64-linux-gnu

# default location for find_path
# /usr/include
# /usr/include/x86_64-linux-gnu