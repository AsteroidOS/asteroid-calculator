/*
 * Copyright (C) 2021 - Timo Könnecke <github.com/eLtMosen>
 *               2015 - Florent Revest <revestflo@gmail.com>
 *               2011 - Nokia Corporation and/or its subsidiary(-ies).
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import org.asteroid.controls 1.0
import org.asteroid.utils 1.0
import "calculator.js" as CalcEngine

Application {
    id: calcwindow

    centerColor: "#7CA600"
    outerColor: "#0C0B00"

    property string displayText: "0"
    property string displayPrevious: ""
    property string displayOperation: ""

    function doOp(operation) {
        CalcEngine.doOperation(operation)
        displayOperation = CalcEngine.currentOperation
        displayText = CalcEngine.currentText
        displayPrevious = CalcEngine.lastText
    }

    Item {
        id: content

        anchors {
            fill: parent
            leftMargin: DeviceSpecs.hasRoundScreen ? Dims.w(8) : 0
            rightMargin: DeviceSpecs.hasRoundScreen ? Dims.w(8) : 0
            bottomMargin: DeviceSpecs.hasRoundScreen ? Dims.h(7) : 0
        }

        Item {
            id: displayBackground

            Display {
                id: display

                anchors.fill: parent
                anchors.bottomMargin: Dims.w(2)
            }

            height: parent.height/4
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            Rectangle {
                id: displaySpacer

                z: -1
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    leftMargin: -Dims.w(8)
                    rightMargin: -Dims.w(8)
                }
                height: content.height/4
                color: "#bb19381F"
            }

            MouseArea {
                anchors.fill: displayBackground
                onClicked: doOp(CalcEngine.plusminus)
            }
        }

        Grid {
            id: grid

            spacing: Dims.w(2)
            rows: 4
            columns: 5
            anchors {
                top: displayBackground.bottom
                topMargin: Dims.h(1)
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            property real w: (grid.width / columns) - ((spacing * (columns - 1)) / columns)
            property real h: (grid.height / rows) - ((spacing * (rows - 1)) / rows)

            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.division; }
            CalcButton { width: grid.w; height: grid.h; operation: "7"; }
            CalcButton { width: grid.w; height: grid.h; operation: "8"; }
            CalcButton { width: grid.w; height: grid.h; operation: "9"; }
            CalcButton { width: grid.w; height: grid.h; operation: "-"; }

            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.multiplication; }
            CalcButton { width: grid.w; height: grid.h; operation: "4"; }
            CalcButton { width: grid.w; height: grid.h; operation: "5"; }
            CalcButton { width: grid.w; height: grid.h; operation: "6"; }
            CalcButton { width: grid.w; height: grid.h; operation: "+"; }

            CalcButton { width: grid.w; height: grid.h; operation: "C"  }
            CalcButton { width: grid.w; height: grid.h; operation: "1"; }
            CalcButton { width: grid.w; height: grid.h; operation: "2"; }
            CalcButton { width: grid.w; height: grid.h; operation: "3"; }
            CalcButton { width: grid.w; height: grid.h; operation: "="; }

            Item { width: grid.w; height: width; }
            CalcButton { width: grid.w; height: grid.h; operation: "."; }
            CalcButton { width: grid.w; height: grid.h; operation: "0"; }
            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.leftArrow }
        }
    }
}
