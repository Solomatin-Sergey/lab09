cmake_minimum_required(VERSION 3.4)
add_definitions(-std=c++0x)


include("cmake/HunterGate.cmake")

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.23.251.tar.gz"
    SHA1 "5659b15dc0884d4b03dbd95710e6a1fa0fc3258d"
)

project(release)

hunter_add_package(Boost)

find_package(Boost CONFIG REQUIRED)

include_directories(formatter_ex_lib)

add_subdirectory(formatter_ex_lib)
add_executable(hello_world hello_world.cpp)

target_link_libraries(hello_world PUBLIC Boost::boost formatter_ex)

install(TARGETS hello_world DESTINATION bin)
set(CPACK_PACKAGE_NAME "hello_world")
set(CPACK_PACKAGE_VENDOR "No name")
set(CPACK_PACKAGE_CONTACT "contact")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "maintainer")
set(CPACK_PACKAGE_DESCRIPTION "description")
set(CPACK_GENERATOR "DEB" "RPM")
include(CPack)
