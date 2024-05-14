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

Label {
    id: displayText

    property string displayTextLength: calcwindow.displayText.length > 0 ? calcwindow.displayText : calcwindow.displayPrevious
    property int minimumSize: Dims.l(9)

    anchors {
        leftMargin: DeviceInfo.hasRoundScreen ? Dims.w(9) : Dims.w(6)
        rightMargin: DeviceInfo.hasRoundScreen ? Dims.w(9) : Dims.w(6)
    }
    font.styleName: "ExtraCondensed Medium"
    verticalAlignment: Text.AlignBottom
    horizontalAlignment: DeviceInfo.hasRoundScreen ? Text.AlignHCenter : Text.AlignRight

    onDisplayTextLengthChanged: refitText()
    Component.onCompleted: refitText()
    onWidthChanged: refitText()
    onHeightChanged: refitText()
    onTextChanged: refitText()

    // calculate the existing precision of the passed num
    function trailing(num) {
        var nn = num.toString();
        var dp = nn.indexOf(".");
        return dp == -1 ? 0 : nn.length - dp - 1
    }
    // format number according to existing precision and current locale
    function localeformat(num) {
        return Number(num).toLocaleString(Qt.locale(), 'f', trailing(num))
    }
    function refitText() {
        if (DeviceInfo.hasRoundScreen) {
            switch (displayTextLength.length) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5: {
                    font.pixelSize = Dims.l(15)
                    return
                }
                case 6: {
                    font.pixelSize = Dims.l(14)
                    return
                }
                case 7: {
                    font.pixelSize = Dims.l(13)
                    return
                }
                case 8: {
                    font.pixelSize = Dims.l(12.5)
                    return
                }
                case 9: {
                    font.pixelSize = Dims.l(12)
                    return
                }
                case 10:
                case 11: {
                    font.pixelSize = Dims.l(11)
                    return
                }
                case 12: {
                    font.pixelSize = Dims.l(10.5)
                    return
                }
                case 13: {
                    font.pixelSize = Dims.l(10)
                    return
                }
                case 14: {
                    font.pixelSize = Dims.l(9.5)
                    return
                }
                default: {
                    font.pixelSize = Dims.l(9)
                    return
                }
            }
        }
        else {
            switch (displayTextLength.length) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12: {
                    font.pixelSize = Dims.l(15)
                    return
                }
                case 13: {
                    font.pixelSize = Dims.l(14.5)
                    return
                }
                case 14: {
                    font.pixelSize = Dims.l(14)
                    return
                }
                case 15: {
                    font.pixelSize = Dims.l(13.5)
                    return
                }
                default: {
                    font.pixelSize = Dims.l(13)
                    return
                }
            }
        }
    }

    text: localeformat(displayTextLength)
}
