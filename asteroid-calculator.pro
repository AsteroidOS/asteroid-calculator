TEMPLATE = app
QT += widgets qml quick

SOURCES +=     main.cpp
RESOURCES +=   resources.qrc
OTHER_FILES += calculator.js \
               main.qml \
               Display.qml \
               CalcButton.qml

TARGET = asteroid-calculator
target.path = /usr/bin/

desktop.files = asteroid-calculator.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop
