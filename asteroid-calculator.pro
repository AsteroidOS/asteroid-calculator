TEMPLATE = app
QT += qml quick
CONFIG += link_pkgconfig
PKGCONFIG += qdeclarative5-boostable

SOURCES +=     main.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += calculator.js \
               main.qml \
               Display.qml \
               CalcButton.qml

lupdate_only{
    SOURCES = i18n/asteroid-calculator.desktop.h
}

# Needed for lupdate
TRANSLATIONS = i18n/asteroid-calculator.de.ts \
               i18n/asteroid-calculator.es.ts \
               i18n/asteroid-calculator.fr.ts \
               i18n/asteroid-calculator.ko.ts \
               i18n/asteroid-calculator.nl.ts \
               i18n/asteroid-calculator.pl.ts \
               i18n/asteroid-calculator.pt_BR.ts \
               i18n/asteroid-calculator.ru.ts \
               i18n/asteroid-calculator.sv.ts \
               i18n/asteroid-calculator.uk.ts

TARGET = asteroid-calculator
target.path = /usr/bin/

desktop.commands = bash $$PWD/i18n/generate-desktop.sh $$PWD asteroid-calculator.desktop
desktop.files = $$OUT_PWD/asteroid-calculator.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop
