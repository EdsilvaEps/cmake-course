


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

# to install a package
# install(FILES filename DESTINATION dir)
#           or 
# install(TARGETS tgtname DESTINATION dir)
# arguments itens to copy  and destination for pasting the items (default in /usr/local)
# $CMAKE_INSTALL_PREFIX - default pasting location
# header files - recommended to pasted to /usr/local/include/packagename
# targets - recommended to pasted to /usr/local/lib/packagename
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/my_math/include/my_math/addition.h ${CMAKE_CURRENT_SOURCE_DIR}/my_math/include/my_math/division.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/my_math)


# find_package(ABC) --> ABC-config.make
# looks for package in /usr/local/lib/ABC
# for find package to work:
# ADD TARGETS TO EXPORT GROUP
install(TARGETS my_math EXPORT my_export DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)

# INSTALL THE EXPORT GROUP
install(EXPORT my_export FILE my_math-config.cmake DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)

# MODIFY THE TARGET_INCLUDE_DIRECTORIES() commands
target_include_directories(my_math PUBLIC 
$<INSTALL_INTERFACE:include>
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)