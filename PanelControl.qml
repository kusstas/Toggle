import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import CustomControllers 1.0

Rectangle {

    id: panelControl
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    height: 25
    color: "#CFD8DC"

    MouseChecker {
        id: mouseChecker
    }

    MouseArea {
        anchors.fill: parent

        property int offsetX: 0
        property int offsetY: 0

        onPressed: {
            offsetX = mouseChecker.pos.x - window.x
            offsetY = mouseChecker.pos.y - window.y
        }

        onMouseXChanged: {
            window.setX(mouseChecker.pos.x - offsetX)
        }

        onMouseYChanged: {
            window.setY(mouseChecker.pos.y - offsetY)
        }
    }

    RowLayout {
        z: 1
        anchors {
            top: parent.top
            left: parent.right
            bottom: parent.bottom
            right: parent.right
        }

        layoutDirection: "RightToLeft"

        spacing: 0

        Button {

            id : buttonClose

            Layout.fillHeight: true
            implicitWidth: height

            onClicked: {
                window.close();
            }

            text: "X"
            font.bold: true
        }

        Button {

            id : buttonResize

            Layout.fillHeight: true
            implicitWidth: height

            onClicked: {
                if (window.visibility == ApplicationWindow.Maximized || window.visibility == ApplicationWindow.FullScreen) {
                    window.showNormal()
                }
                else {
                    window.showMaximized()
                }
            }

            text: "▭"
            font.bold: true
        }

        Button {

            id : buttonHide

            Layout.fillHeight: true
            implicitWidth: height

            onClicked: {
                window.showMinimized()
            }

            text: "_"
            font.bold: true
        }
    }
}
