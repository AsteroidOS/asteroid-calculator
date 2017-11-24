TARGET = asteroid-calculator
CONFIG += asteroidapp

SOURCES +=     main.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += calculator.js \
               main.qml \
               Display.qml \
               CalcButton.qml

lupdate_only{ SOURCES += i18n/asteroid-calculator.desktop.h }
TRANSLATIONS = $$files(i18n/$$TARGET.*.ts)
