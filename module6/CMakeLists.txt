cmake_minimum_required(VERSION 3.0.0) # minimum required version of cmake for this script to work

project(Calculator_project VERSION 1.0.0) # setting project name and version

# add_subdirectory(<directory>) tells cmake to go into those directories and search for other cmakelists files
# and run those one by one
add_subdirectory(my_math)
add_subdirectory(my_print)


# add_executable(<Exec Name> <Source Files>) => used when we want an executable at the end of the build process
add_executable(calculator
main.cpp)

# target_link_libraries(<executable> <lib1> <lib2>...) => links a library to an executable
target_link_libraries(calculator PRIVATE my_math my_print)

# setting cache variables - value will be stored CMakeCache.txt file
# set(varname varvalue CACHE VARTYPE vardescription)
set(A "123" CACHE STRING "This command sets variable A in persisten cache")

# Cache variable dereferencing
# $CACHE{varname}
message($CACHE{A})

# when a variable is dereferenced withouth the keyword CACHE, it is looked for in:
# the following order:
# 1 . LOCAL SCOPE
# 2 . GLOBAL SCOPE
# 3 . CACHE SCOPE

# Environment variables (GLOBAL SCOPE):
# set(ENV varname varvalue)
# deferencing:
# $ENV{varname}

##################### modifying cache variables ################################
# 3 ways to do it:
# 1. Edit CMakeCache.txt
message("------modifying cache vars--------")
set(Name Alice CACHE STRING "the name variable")
message($CACHE{Name})
# 2. Use FORCE keyword (not recommended)
set(Name Bob CACHE STRING "the modified name variable" FORCE)
message($CACHE{Name})
# 3. Use -D flag (recommended)
# on terminal:
# $ cmake -DName=Charlie ..

# FORCE keyword > -D flag

##################### frequenty used cache variables ###########################
message("---------cache vars-----------")
# CMAKE_VERSION
message(CMAKE_VERSION=${CMAKE_VERSION})
# CMAKE_MAJOR_VERSION
message(CMAKE_MAJOR_VERSION=${CMAKE_MAJOR_VERSION})

# CMAKE_MINOR_VERSION
message(CMAKE_MINOR_VERSION=${CMAKE_MINOR_VERSION})

# CMAKE_PATCH_VERSION
message(CMAKE_PATCH_VERSION=${CMAKE_PATCH_VERSION})

#CMAKE_PROJECT_NAME
message(CMAKE_PROJECT_NAME=${CMAKE_PROJECT_NAME}) #  SHOWS TOP CMAKE PROJECT NAME

#PROJECT_NAME
message(PROJECT_NAME=${PROJECT_NAME})

#CMAKE_GENERATOR -- SHOWS BUILD SYSTEM
message(CMAKE_GENERATOR=${CMAKE_GENERATOR})

