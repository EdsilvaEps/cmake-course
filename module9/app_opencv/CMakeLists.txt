cmake_minimum_required(VERSION 3.0.0)

project(DisplayImage)

# REQUIRE is specifying this as an obligatory dependency
find_package(OpenCV REQUIRED) # --> OpenCVConfig.cmake
# find_package(opencv REQUIRED) --> opencvConfig.cmake

add_executable(DisplayImage main.cpp)

# the following likes are based on /usr/local/lib/cmake/opencv4/OpenCVConfig.cmake
# including libs and dirs
target_include_directories(DisplayImage PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(DisplayImage PRIVATE ${OpenCV_LIBS})

message("OpenCV Include Direcotiries: " ${OpenCV_INCLUDE_DIRS})
message("OpenCV Libraries: " ${OpenCV_LIBS})

