
include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
)

add_library( 
	${PROJECT_NAME} 
	MODULE
	${PROJECT_NAME}.c
)

target_include_directories(${PROJECT_NAME}
	PUBLIC
	${HOMEBREW_PREFIX}/include
)

target_link_libraries(${PROJECT_NAME}
	PUBLIC 
	${HOMEBREW_PREFIX}/lib/libsamplerate.a
	"-framework Accelerate"
)


include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-base/script/max-posttarget.cmake)
