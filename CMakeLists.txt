cmake_minimum_required(VERSION 3.5)

project(CIMpp CXX)

# Enable C++11 support
set(CMAKE_CXX_STANDARD 11)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

add_subdirectory(thirdparty)
add_subdirectory(doc)

set(CIMPP_MAJOR_VERSION 2)
set(CIMPP_MINOR_VERSION 1)
set(CIMPP_PATCH_VERSION 2)
set(CIMPP_VERSION ${CIMPP_MAJOR_VERSION}.${CIMPP_MINOR_VERSION}.${CIMPP_PATCH_VERSION})

# Options
option(BUILD_SHARED_LIBS "Build shared library" OFF)
set(USE_CIM_VERSION "IEC61970_16v29a" CACHE STRING "Define CIM Version")

# Select CIM version
if(USE_CIM_VERSION STREQUAL "IEC61970_17v07")
  set(CIM_FOLDER "17v07")
  set(CIM_NAME "IEC61970 17v07")
elseif(USE_CIM_VERSION STREQUAL "IEC61970_16v29a")
  set(CIM_FOLDER "16v29a")
  set(CIM_NAME "IEC61970 16v29a")
elseif(USE_CIM_VERSION STREQUAL "IEC61970_16v29a_IEC61968_12v08")
  set(CIM_FOLDER "16v29a_12v08")
  set(CIM_NAME "IEC61970 16v29a - IEC61968 12v08")
elseif(USE_CIM_VERSION STREQUAL "IEC61970_16v29a_SINERGIEN")
  set(CIM_FOLDER "16v29a_SINERGIEN")
  set(CIM_NAME "16v29a SINERGIEN")
else()
  message(FATAL_ERROR "${USE_CIM_VERSION} is an invalid value for USE_CIM_VERSION")
endif()

file(GLOB_RECURSE SRC src/*.cpp)
file(GLOB_RECURSE CIM_SRC ${CIM_FOLDER}/*.cpp)
file(GLOB_RECURSE CIM_HEADERS ${CIM_FOLDER}/*.hpp)

add_library(cimpp ${SRC})
set_target_properties(cimpp PROPERTIES LIBRARY_OUTPUT_NAME cimpp${CIM_FOLDER})

include_directories($<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>)

target_sources(cimpp PRIVATE ${CIM_SRC})
target_include_directories(cimpp PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${CIM_FOLDER}>)

find_package(Arabica REQUIRED)
target_link_libraries(cimpp PUBLIC ${ARABICA_LIBRARIES})
target_include_directories(cimpp PUBLIC ${ARABICA_INCLUDE_DIRS})

if(WIN32 AND BUILD_SHARED_LIBS)
    error("This library can not be linked dynamically on Win32!")
endif()

include(GNUInstallDirs)

install(TARGETS cimpp
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}/static
)

file(GLOB HEADERS "src/*.h" "src/*.hpp")
install(FILES ${HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cimpp/${CIM_FOLDER}
    COMPONENT devel
)

install(DIRECTORY ${CIM_FOLDER}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/cimpp
    COMPONENT devel
    FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
)

# Show feature summary
include(FeatureSummary)
feature_summary(WHAT ALL VAR enabledFeaturesText)
message(STATUS "${enabledFeaturesText}")
message(STATUS "Building CIMpp with USE_CIM_VERSION=${USE_CIM_VERSION}")

include(CIMppPackaging)
