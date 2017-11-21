option(ARABICA_DIR "Arabica installation directory" ../Arabica)

if(WIN32)
	file(TO_CMAKE_PATH $ENV{APPDATA} APPDATA)
else()
	find_package(LibXml2 REQUIRED)
endif()

find_path(ARABICA_INCLUDE_DIR
	NAMES arabica/SAX/ArabicaConfig.hpp
	PATH_SUFFIXES include
	HINTS
		../Arabica
		${APPDATA}/Arabica
		${ARABICA_DIR}
)

find_library(ARABICA_LIBRARY
    NAMES arabica
	PATH_SUFFIXES
		bin
		lib/static
    HINTS
		../Libraries/Arabica
		${APPDATA}/Arabica
		${ARABICA_DIR}
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set ARABICA_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(Arabica DEFAULT_MSG ARABICA_LIBRARY ARABICA_INCLUDE_DIR)
mark_as_advanced(ARABICA_INCLUDE_DIR ARABICA_LIBRARY)

set(ARABICA_LIBRARIES ${ARABICA_LIBRARY} ${LIBXML2_LIBRARY})
set(ARABICA_INCLUDE_DIRS ${ARABICA_INCLUDE_DIR} ${ARABICA_INCLUDE_DIR}/arabica ${LIBXML2_INCLUDE_DIR})
