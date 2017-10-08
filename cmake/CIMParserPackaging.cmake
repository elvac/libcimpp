set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "Institute for Automation of Complex Power Systems, RWTH Aachen University")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CIM++ is deserialiser library for C++ objects from XML/RDF documents based on CIM standards")
set(CPACK_PACKAGE_VERSION_MAJOR ${CIMParser_MAJOR_VERSION})
set(CPACK_PACKAGE_VERSION_MINOR ${CIMParser_MINOR_VERSION})
set(CPACK_PACKAGE_VERSION_PATCH ${CIMParser_PATH_VERSION})

set(CPACK_RPM_PACKAGE_RELEASE "1.${USE_CIM_VERSION}")
set(CPACK_RPM_PACKAGE_LICENSE "MPL 2.0")
set(CPACK_RPM_PACKAGE_URL "http://www.fein-aachen.org/projects/dpsim/")
set(CPACK_RPM_PACKAGE_REQUIRES "libxml2")
set(CPACK_RPM_PACKAGE_GROUP "Development/Libraries")

# As close as possible to Fedoras naming
set(CPACK_RPM_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-${CPACK_RPM_PACKAGE_RELEASE}.${CPACK_RPM_PACKAGE_ARCHITECTURE}.rpm")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

set(CPACK_GENERATOR "RPM;TGZ")

include(CPack)
