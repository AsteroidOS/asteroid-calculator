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

import QtQuick 2.0
import "calculator.js" as CalcEngine

Text {
    id: displayText
    text: calcwindow.displayText.length > 0 ? calcwindow.displayText : calcwindow.displayPrevious
    color: "#333"; smooth: true; font.bold: true
    Component.onCompleted: refitText()
    horizontalAlignment: Text.AlignRight;
    verticalAlignment: Text.AlignVCenter;

    property int minimumSize: 42

    onWidthChanged: refitText()
    onHeightChanged: refitText()
    onTextChanged: refitText()

    function refitText() {
        if (paintedHeight == -1 || paintedWidth == -1)
            return

        while (paintedWidth > width || paintedHeight > height) {
            if (--font.pixelSize <= minimumSize || font.pixelSize <= 0)
                break
        }

        while (paintedWidth < width && paintedHeight < height) {
            font.pixelSize++

        }

        // sanity cap
        if (font.pixelSize >= 120) {
            font.pixelSize = 120
            return
        }

        font.pixelSize--
    }
}
