option(ARABICA_DIR "Location of Arabica library" ${CMAKE_CURRENT_SOURCE_DIR}/../Arabica)

if(IS_DIRECTORY ${ARABICA_DIR})
    set(ARABICA_INCLUDE_DIR ${ARABICA_DIR}/include)
endif()

find_library(ARABICA_LIBRARY NAMES arabica libarabica
        HINTS ${ARABICA_DIR} ${ARABICA_DIR}/cmake-build-debug)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set ARABICA_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Arabica DEFAULT_MSG
        ARABICA_LIBRARY ARABICA_INCLUDE_DIR)

mark_as_advanced(ARABICA_INCLUDE_DIR ARABICA_LIBRARY)

set(ARABICA_LIBRARIES ${ARABICA_LIBRARY})
set(ARABICA_INCLUDE_DIRS ${ARABICA_INCLUDE_DIR} ${ARABICA_DIR}/cmake-build-debug/include)