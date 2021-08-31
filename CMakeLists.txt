cmake_minimum_required(VERSION 3.2.0)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_BUILD_TYPE_INIT Release)

SET(GCC_COVERAGE_COMPILE_FLAGS "-fprofile-arcs -ftest-coverage --coverage -g -O0")
SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${GCC_COVERAGE_COMPILE_FLAGS}")

project(GcovTest CXX)

file(GLOB CppSource CONFIGURE "${PROJECT_SOURCE_DIR}/*.cpp")

add_executable(GcovTest ${CppSource})
set_target_properties(GcovTest PROPERTIES LINKER_LANGUAGE CXX)
