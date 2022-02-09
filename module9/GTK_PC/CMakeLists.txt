cmake_minimum_required(VERSION 3.0.0)

project(GTK_PC)

find_package(PkgConfig REQUIRED)

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

    target_include_directories(${PROJECT_NAME}_app PRIVATE ${GTK3_INCLUDE_DIRS})

    target_link_libraries(${PROJECT_NAME}_app PRIVATE ${GTK3_LIBRARIES})
else()
    message("Could not find PKG")
endif()