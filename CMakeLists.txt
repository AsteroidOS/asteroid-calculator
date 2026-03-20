cmake_minimum_required(VERSION 3.10.0)

project(
	asteroid-calculator
	VERSION 2.0
	DESCRIPTION "Default calculator app for AsteroidOS"
)

find_package(AsteroidApp6 REQUIRED)

set(CMAKE_MODULE_PATH ${ASTEROID_MODULE_PATH})

include(FeatureSummary)
include(GNUInstallDirs)
include(Asteroid6CMakeSettings)
include(Asteroid6Translations)

add_subdirectory(src)

configure_file(
	${CMAKE_CURRENT_SOURCE_DIR}/asteroid-calculator.in
	${CMAKE_BINARY_DIR}/asteroid-calculator
	@ONLY
)

install(
	PROGRAMS ${CMAKE_BINARY_DIR}/asteroid-calculator
	DESTINATION ${CMAKE_INSTALL_BINDIR}
)

build_translations(i18n)
generate_desktop(${CMAKE_SOURCE_DIR} asteroid-calculator)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
