# Configure Doxyfile
find_package(Doxygen)
if(Doxygen_FOUND)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile @ONLY)
    file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/../README.md DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
    add_custom_target(doc ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR} COMMENT "Generating API documentation with Doxygen" VERBATIM)
endif()
