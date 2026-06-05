add_library(asteroid-calculator main.cpp resources.qrc)
set_target_properties(asteroid-calculator PROPERTIES PREFIX "")

asteroid_app_qml_module(asteroid-calculator
	main.qml
	CalcButton.qml
	Display.qml
)

target_link_libraries(
	asteroid-calculator
	PRIVATE
		Asteroid::AsteroidApp6
)

install(
	TARGETS asteroid-calculator
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
