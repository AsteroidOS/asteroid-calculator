/*
 * Copyright (C) 2021 - Timo Könnecke <github.com/eLtMosen>
*                2015 - Florent Revest <revestflo@gmail.com>
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

MouseArea {
    id: button

    property alias operation: buttonText.text
    property alias color: buttonText.color

    Label {
        id: buttonText

        anchors.centerIn: parent
        font.pixelSize: parent.width > parent.height ? parent.height * .7 : parent.width * .7
        smooth: true
        clip: false

        Rectangle {
            id: shade

            anchors.centerIn: parent
            width: Math.max(parent.width, parent.height)
            height: width
            radius: width / 2
            color: "#E83F6F"
            opacity: 0
            z: parent.z - 1
        }
    }

    onClicked: doOp(operation)

    states: [
       State {
           name: "pressed"
           when: button.pressed === true

           PropertyChanges { target: button; z: 2 }
           PropertyChanges { target: shade; opacity: 1 }
           PropertyChanges { target: shade; scale: 1 }
           PropertyChanges { target: buttonText; font.pixelSize: parent.width * 1.2 }
           PropertyChanges { target: buttonText; font.styleName: "Black" }
           PropertyChanges {
               target: buttonText
               anchors.verticalCenterOffset:
                   switch (buttonText.text) {
                       case "-": {
                           -button.height * 1.14
                           break
                       }
                       case "\u00f7": {
                           -button.height * 1.14
                           break
                       }
                       case "7": {
                           -button.height * 1.1
                           break
                       }
                       case "8": {
                           -button.height * 1.2
                           break
                       }
                       case "9": {
                           -button.height * 1.1
                           break
                       }
                       default: {
                           -button.height * 1.5
                           break
                       }
                   }
           }
           PropertyChanges {
               target: buttonText
               anchors.horizontalCenterOffset:
                   switch (buttonText.text) {
                       case "-": {
                           -button.height * 0.7
                           break
                       }
                       case "\u00f7": {
                           button.height * 0.7
                           break
                       }
                       case "\u00d7": {
                           button.height * 0.3
                           break
                       }
                       case "+": {
                           -button.height * 0.3
                           break
                       }
                       default: {
                           0
                           break
                       }
                   }
           }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "pressed"
            NumberAnimation {
                properties: "z,scale,anchors.verticalCenterOffset,anchors.horizontalCenterOffset,font.pixelSize"
                easing.type: Easing.OutExpo
                duration: 30
            }
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.OutExpo
                duration: 40
            }
        },
        Transition {
            from: "pressed"
            to: ""
            NumberAnimation {
                properties: "z,scale,anchors.verticalCenterOffset,anchors.horizontalCenterOffset,font.pixelSize"
                easing.type: Easing.InExpo
                duration: 60
            }
            NumberAnimation {
                properties: "opacity"
                easing.type: Easing.InExpo
                duration: 80
            }
        }
    ]
}
