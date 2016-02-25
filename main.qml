/*
 * Copyright (C) 2015 - Florent Revest <revestflo@gmail.com>
 *               2011 - Nokia Corporation and/or its subsidiary(-ies).
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import QtQuick.Controls 1.3
import org.asteroid.controls 1.0
import "calculator.js" as CalcEngine

Application {
    id: calcwindow

    property string displayOperation: ""
    property string displayText: "0"
    property string displayPrevious: ""

    function doOp(operation) {
        CalcEngine.doOperation(operation)
        displayOperation = CalcEngine.currentOperation
        displayText = CalcEngine.currentText
        displayPrevious = CalcEngine.lastText
    }

    Item {
        id: content
        anchors.centerIn: parent
        width: DeviceInfo.hadRoundScreen ? parent.width/Math.sqrt(2) : parent.width
        height: DeviceInfo.hasRoundScreen ? parent.height/Math.sqrt(2) : parent.height

        Display {
            id: display
            height: parent.height * 0.2
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
        }

        Grid {
            id: grid
            spacing: 4
            rows: 5
            columns: 4
            anchors {
                top: display.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            property real w: (grid.width / columns) - ((spacing * (columns - 1)) / columns)
            property real h: (grid.height / rows) - ((spacing * (rows - 1)) / rows)

            CalcButton { width: grid.w; height: grid.h; operation: "C" }
            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.leftArrow }
            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.plusminus }
            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.division; }


            CalcButton { width: grid.w; height: grid.h; operation: "7"; }
            CalcButton { width: grid.w; height: grid.h; operation: "8"; }
            CalcButton { width: grid.w; height: grid.h; operation: "9"; }
            CalcButton { width: grid.w; height: grid.h; operation: CalcEngine.multiplication; }

            CalcButton { width: grid.w; height: grid.h; operation: "4"; }
            CalcButton { width: grid.w; height: grid.h; operation: "5"; }
            CalcButton { width: grid.w; height: grid.h; operation: "6"; }
            CalcButton { width: grid.w; height: grid.h; operation: "-"; }

            CalcButton { width: grid.w; height: grid.h; operation: "1"; }
            CalcButton { width: grid.w; height: grid.h; operation: "2"; }
            CalcButton { width: grid.w; height: grid.h; operation: "3"; }
            CalcButton { width: grid.w; height: grid.h; operation: "+"; }

            Item       { width: grid.w; height: grid.h; }
            CalcButton { width: grid.w; height: grid.h; operation: "0"; }
            CalcButton { width: grid.w; height: grid.h; operation: "."; }
            CalcButton { width: grid.w; height: grid.h; operation: "="; }
        }
    }
}

