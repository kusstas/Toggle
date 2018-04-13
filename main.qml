import QtQuick 2.10
import QtQuick.Controls 2.2
import QtQuick.Window 2.10


ApplicationWindow {
    id : window
    visible: true
    minimumHeight: 640
    minimumWidth: 480
    width: 640
    height: 480
    color: "#263238"
    title: qsTr("@kusstas - Toggle")

    //flags : Qt.CustomizeWindowHint | Qt.Window

    Rectangle {
        width: 100
        height: 100
        color: "red"

        MouseArea{
            anchors.fill: parent

            onPressed: {
                toggle.state = !toggle.state
            }
        }
    }

    Toggle{
        id : toggle
        anchors.centerIn: parent
        height: 250
        width: 500
        state: true
    }
}
