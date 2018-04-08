/*
 * Copyright (C) 2015 - Florent Revest <revestflo@gmail.com>
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
        style: Text.Sunken; styleColor: Qt.darker(color, 1.2); smooth: true
        clip: false

        Rectangle {
            id: shade
            anchors.centerIn: parent;
            width: Math.max(parent.width, parent.height)
            height: width
            radius: width/2;
            color: "#618404";
            opacity: 0
            z: parent.z-1
            border.width: 1
            border.color: "#517008"
        }
    }

    onClicked: doOp(operation)

    states: [
       State {
           name: "pressed"; when: button.pressed == true
           PropertyChanges { target: shade; opacity: 1.0 }
           PropertyChanges { target: shade; scale: 2.0 }
           PropertyChanges { target: buttonText; anchors.verticalCenterOffset: -button.height }
           PropertyChanges { target: button; z: 1 }
       }
    ]

    transitions: [
        Transition {
            from: ""
            to: "pressed"
            NumberAnimation {
                properties: "z,scale,anchors.verticalCenterOffset";
                easing.type: Easing.OutExpo;
                duration: 50
            }
            NumberAnimation {
               properties: "opacity";
               easing.type: Easing.OutExpo;
               duration: 100
            }
        },
        Transition {
            from: "pressed"
            to: ""
            NumberAnimation {
               properties: "z,scale,anchors.verticalCenterOffset";
               easing.type: Easing.OutExpo;
               duration: 200
            }
            NumberAnimation {
               properties: "opacity";
               easing.type: Easing.OutExpo;
               duration: 300
            }
        }
    ]
}

