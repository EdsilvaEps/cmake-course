# USING AN EXTERNAL LIBRARY

# Download the source code (github/official website)
# cmake -> make -> sudo make install
# <library>-config.cmake in the installed location 
# use command find_package(<library>) to use it in our project

# what if the lib doesnt contain the <library>-config.cmake file?
# either get it from the devs or write your own
# or even write a *config module

# *config module location: Standard Directories (/usr/local)
# Find* module: Inside your project 

# Uses CMake based build generation process
 # - config.cmake present
 # - No config.cmake present

# Uses NON-CMake based build generation process 
#    - CMake or library provides Find* or *config modules
#      Uses pkg-config
#      No pkg-config file present
