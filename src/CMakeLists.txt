add_library(asteroid-calculator main.cpp resources.qrc)
set_target_properties(asteroid-calculator PROPERTIES PREFIX "" SUFFIX "")

target_link_libraries(asteroid-calculator PUBLIC
	AsteroidApp)

install(TARGETS asteroid-calculator
	DESTINATION ${CMAKE_INSTALL_BINDIR})
