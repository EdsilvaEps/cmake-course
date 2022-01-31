cmake_minimum_required(VERSION 3.0.0)
# conditionals in cmake 
# 1, ON, YES, TRUE, Y and any non zero number = TRUE on if statements
# 0, OFF, NO, FALSE, N, IGNORE, NOTFOUND, emptry strings, string ending with -NOTFOUND = FALSE on if statements

set(VAR YES)

if (VAR) # no need to derreference the variable with ${VAR}, the if command already does that 
    message("If block executed")
else()
    message("else block executed")
endif()

# UNARY TESTS
# DEFINED - checks if a variable is set or not 
# COMMAND   - checks if command exists or not
# EXISTS - checks if file or directory exists or not

set(Name Alice)

if(DEFINED Name)
    message("name: If block executed")
else()
    message("name: else block executed")
endif()

if(DEFINED Age)
    message("Age: If block executed")
else()
    message("Age: else block executed")
endif()


if(COMMAND target_link_libraries)
    message("targetlinklibs is a command")
else()
    message("targetlinklibs: is not a command")
endif()

if(COMMAND target_link_library)
    message("targetlinkliby is a command")
else()
    message("targetlinkliby: is not a command")
endif()

if(EXISTS /home/edson/Documents/cmake-course/module5/CMakeLists.txt)
    message("given file exists")
else()
    message("file doesnt exist")
endif()

########################
# BINARY TESTS 

set(Name1 Charlie)
set(Name2 bob)

if(Name1 STRLESS Name2)
    message("${Name1} is less than ${Name2}")
elseif(Name1 STRGREATER Name2)
    message("${Name1} is greater than ${Name2}")
elseif(Name1 STREQUAL Name2)
    message("${Name1} is equal to ${Name2}")
endif()

########################
# BOOLEAN OPERATORS
# NOT, OR, AND

#######################
# LOOPING COMMANDS

set(VAR a)

while(NOT VAR STREQUAL "aaaaaaaa")
    set(VAR ${VAR}a)
    message(${VAR})
endwhile()

foreach(Name Alice Bob Charlie)
    message(${Name})
endforeach()

foreach(x RANGE 100 105)
    message("Person_${x}")
endforeach()
# result 
# Person_100
# Person_101
# Person_102
# Person_103
# Person_104
# Person_105

set(VAR1 0;1)
set(VAR2 2 3)
set(VAR3 "4 5")

foreach(x IN LISTS VAR1 VAR2 VAR3)
    message("x = ${x}")
endforeach()
# result 
# x = 0
# x = 1
# x = 2
# x = 3
# x = 4 5

######################
# CUSTOM FUNCTIONS
#        function name  variables
function(print_detail name_var)
    message("my name is ${name_var}")
endfunction()

set(Name Eddie)
print_detail(${Name})

#####################
# OPTIONAL ARGUMENTS IN FUNCTIONS
function(print_detail name_var)
    message("my name is ${name_var}")

    if(DEFINED ARGV1) # OPTIONAL SECOND ARGUMENT
        message("Hello, my name is ${ARGV1}")
    endif()
    if(DEFINED ARGV2) # OPTIONAL SECOND ARGUMENT
        message("Hello, my name is ${ARGV2}")
    endif()
    if(DEFINED ARGV3) # OPTIONAL SECOND ARGUMENT
        message("Hello, my name is ${ARGV3}")
    endif()

    message("ARGC= ${ARGC}")
    message("ARGV= ${ARGV}")
    message("ARGN= ${ARGN}")

endfunction()

print_detail(BOB JAMES alice)


# ARGC - total count of arguments*
# ARGV - list of all arguments*
# ARGN - list of optional argument
# ARGV0 - first argument 
# ARGV1 - second argument 
# ARGV2 - third argument 
# * named+optional

##########################
# SCOPES

message("---------------SCOPES------------------")

function(print_detail2)
    message("Inside function: before modification ${Name}")
    set(Name Bob)
    message("Inside function: after modification ${Name}")
    
endfunction()

message("Outside the function: before function call : ${Name}")
print_detail2()
message("Outside function: after function call: ${Name}")
# result 
# Outside the function: before function call : Eddie
# Inside function: before modification Eddie
# Inside function: after modification Bob
# Outside function: after function call: Eddie

message("-------- SCOPE MODIFICATION-----")
function(print_detail3)
    message("Inside function: before modification ${Name}")
    set(Name Bob PARENT_SCOPE) # modifying the parent scope(outside) so that the variable can be changed only outside the function
    message("Inside function: after modification ${Name}")
    
endfunction()

message("Outside the function: before function call : ${Name}")
print_detail3()
message("Outside function: after function call: ${Name}")

#################################
# MACROS

message("---------------MACROS------------------")
# Macros do not introduce scopes, we cant use PARENT_SCOPE inside the body of a macro
macro(print_detail_macro name_var)
    message("my name is ${name_var}")
    set(name_var abc)
    message("my name is ${name_var}")
endmacro()

print_detail_macro(Charlie)
# result 
# my name is Charlie
# my name is Charlie

#Cmake is case insensitive
