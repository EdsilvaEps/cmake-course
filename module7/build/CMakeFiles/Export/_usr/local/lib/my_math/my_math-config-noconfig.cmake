#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "my_math" for configuration ""
set_property(TARGET my_math APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(my_math PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "/usr/local/lib/my_math/libmy_math.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS my_math )
list(APPEND _IMPORT_CHECK_FILES_FOR_my_math "/usr/local/lib/my_math/libmy_math.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
