cmake_minimum_required(VERSION 3.6)

project (SAST_Checkmarx)

find_package( Qt5 COMPONENTS Core LinguistTools REQUIRED)

set (FILES_TO_TRANSLATE "")

set (LIB_DIR ${CMAKE_SOURCE_DIR}/lib)
set (APP_DIR ${CMAKE_SOURCE_DIR}/app)

set (QT_INCLUDE_DIR $ENV{QTDIR}/include)
set (QT_LIB_DIR 	$ENV{QTDIR}/lib)


foreach(flag_var
	  CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
	  CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)
 if(${flag_var} MATCHES "/MD")
	string(REGEX REPLACE "/MD" "/MT" ${flag_var} "${${flag_var}}")
 endif(${flag_var} MATCHES "/MD")
endforeach(flag_var)


add_subdirectory(app)
add_subdirectory(lib)