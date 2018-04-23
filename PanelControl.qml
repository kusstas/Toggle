import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Rectangle {

    signal close
    signal hide
    signal resize

    id: panelControl
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    height: 25
    color: "#CFD8DC"

    MouseArea {
        anchors.fill: parent
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
                close();
            }

            text: "X"
            font.bold: true
        }

        Button {

            id : buttonResize

            Layout.fillHeight: true
            implicitWidth: height

            onClicked: {
                resize();
            }

            text: "▭"
            font.bold: true
        }

        Button {

            id : buttonHide

            Layout.fillHeight: true
            implicitWidth: height

            onClicked: {
                hide();
            }

            text: "_"
            font.bold: true
        }
    }
}
