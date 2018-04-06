set(CPACK_PACKAGE_NAME "libcimpp${CIM_DIR}")
set(CPACK_PACKAGE_VENDOR "Institute for Automation of Complex Power Systems, RWTH Aachen University")
set(CPACK_PACKAGE_CONTACT "Lukas Razik <lrazik@eonerc.rwth-aachen.de>")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CIM++ is deserialiser library for C++ objects from XML/RDF documents based on CIM standards")
set(CPACK_PACKAGE_VERSION_MAJOR ${CIMPP_MAJOR_VERSION})
set(CPACK_PACKAGE_VERSION_MINOR ${CIMPP_MINOR_VERSION})
set(CPACK_PACKAGE_VERSION_PATCH ${CIMPP_PATCH_VERSION})

set(CPACK_DEBIAN_PACKAGE_DEPENDS "libarabica")
set(CPACK_DEBIAN_PACKAGE_SECTION "devel")
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "http://www.fein-aachen.org/projects/cimpp/")

set(CPACK_RPM_PACKAGE_LICENSE "MPL 2.0")
set(CPACK_RPM_PACKAGE_URL "http://www.fein-aachen.org/projects/cimpp/")
set(CPACK_RPM_PACKAGE_REQUIRES "libarabica")
set(CPACK_RPM_PACKAGE_GROUP "Development/Libraries")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

set(CPACK_GENERATOR "DEB;RPM;TGZ")

include(CPack)
