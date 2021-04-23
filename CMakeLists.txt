cmake_minimum_required(VERSION 3.6.0)

project(asteroid-calculator
	VERSION 0.0.1
	DESCRIPTION "Default calculator app for AsteroidOS")

find_package(AsteroidApp REQUIRED)

set(CMAKE_MODULE_PATH ${ASTEROID_MODULE_PATH})

include(FeatureSummary)
include(GNUInstallDirs)
include(AsteroidCMakeSettings)
include(AsteroidTranslations)

add_subdirectory(src)

build_translations(i18n)
generate_desktop(${CMAKE_SOURCE_DIR} asteroid-calculator)

feature_summary(WHAT ALL FATAL_ON_MISSING_REQUIRED_PACKAGES)
