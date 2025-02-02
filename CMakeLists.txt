cmake_minimum_required(VERSION 3.19)

project(vb-objects)

if (APPLE)
    if (NOT CMAKE_OSX_ARCHITECTURES)
        if(C74_BUILD_FAT)
            set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64" CACHE STRING "macOS architecture" FORCE)
        else()
            set(CMAKE_OSX_ARCHITECTURES ${CMAKE_SYSTEM_PROCESSOR} CACHE STRING "macOS architecture" FORCE)
        endif()
        message("CMAKE_OSX_ARCHITECTURES set to ${CMAKE_OSX_ARCHITECTURES}")
    endif()
endif()


if(CMAKE_HOST_APPLE)
    execute_process(
        COMMAND brew --prefix
        OUTPUT_VARIABLE HOMEBREW_PREFIX
        OUTPUT_STRIP_TRAILING_WHITESPACE
    )
    if(DEFINED HOMEBREW_PREFIX)
        set(HAS_HOMEBREW 1)
        message(STATUS "HAS_HOMEBREW: ${HAS_HOMEBREW}")
        message(STATUS "HOMEBREW_PREFIX: ${HOMEBREW_PREFIX}")
    endif()
endif()


# Misc setup and subroutines
include(${CMAKE_CURRENT_SOURCE_DIR}/source/max-sdk-base/script/max-package.cmake)


# Generate a project for every folder in the "source/projects" folder
SUBDIRLIST(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
foreach (project_dir ${PROJECT_DIRS})
	if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
		message("Generating: ${project_dir}")
		add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
	endif ()
endforeach ()
