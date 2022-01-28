# this module we run CMakeLists.txt on script mode 
cmake_minimum_required(VERSION 3.0.0)

# project() command is not scriptable and will break on script mode 
# project(module4 VERSION 1.0.0)

# message(<mode-of-display> "message")
# most common types:
# message("Hello world")
# message(STATUS "Hello world")
# message(DEBUG "Hello world ")
# message(WARNING "Hello world ")
# message(FATAL ERROR "Hello world ")
# message("Hello world")

# set(<variable_name> <variable_value>) --> creates a variable in cmake
# all the variables in cmake are of string type
# ${variable_name} => to reference the variable
# not referenced variables will return empty string
set(NAME "BOB Smith") # variable with one string of two words
set(NAME2 BOB SMITH) # variable cotaining a list of two strings
set(HEIGHT 190)
set(AGE 30)

#message(STATUS "Hello, my name is ${NAME}, my height is ${HEIGHT}kg and my age is ${AGE} yrs ")

# list(<subcommand> <name_of_list> <args>... <return_variable>) => to operate lists in cmake
# most comman subcommands:
# APPEND
# INSERT 
# FILTER 
# GET 
# JOIN 
# REMOVE_ITEM
# REVERSE
# REMOVE_DUPLICATES
# SORT
set(VAR a b c;d "e;f" 2.7 "Hello There")
list(APPEND VAR 1.6 XX)
message(${VAR})

list(REMOVE_AT VAR 2 -3)
message(${VAR})

list(REMOVE_ITEM VAR a 2.7)
message(${VAR})

list(INSERT VAR 2 XX 2.7)
message(${VAR})

list(REVERSE VAR)
message(${VAR})

list(REMOVE_DUPLICATES VAR)
message(${VAR})

list(SORT VAR)
message(${VAR})

# RESULT
# list(APPEND VAR 1.6 XX) -     abcdef2.7Hello There1.6XX
# list(REMOVE_AT VAR 2 -3) -    abdef2.71.6XX
# list(REMOVE_ITEM VAR a 2.7) - bdef1.6XX
# list(INSERT VAR 2 XX 2.7) -   bdXX2.7ef1.6XX
# list(REVERSE VAR)-            XX1.6fe2.7XXdb
# ist(REMOVE_DUPLICATES VAR) -  XX1.6fe2.7db
# list(SORT VAR) -              1.62.7XXbdef



# string() => to operate strings in cmake
# most common commands 
# FIND
# REPLACE
# PREPEND
# APPEND
# TOLOWER
# TOUPPER
# COMPARE 
message("______STRING_____")
set(VAR "CMake for Cross-Platform C++ Projects")

string(FIND ${VAR} "for" find_var)
message(${find_var})

string(FIND ${VAR} "For" find_var)
message(${find_var})


string(REPLACE "Projects" "Project" replaced_var ${VAR} )
message(${replaced_var})

string(PREPEND replaced_var "Master ")
message(${replaced_var})

string(APPEND replaced_var " Building")
message(${replaced_var})

string(TOLOWER ${replaced_var} lower_case_var)
message(${lower_case_var})

string(TOUPPER ${lower_case_var} upper_case_var)
message(${upper_case_var})


string(COMPARE EQUAL ${upper_case_var} "MASTER CMAKE FOR CROSS-PLATFORM C++ PROJECT BUILDING"  equality_check_var)
message(${equality_check_var})

string(COMPARE GREATER ${upper_case_var} "some random string"  greater_check_var)
message(${greater_check_var})
