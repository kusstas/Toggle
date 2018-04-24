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

    PanelControl {
        id: customPanelControl
    }

    Toggle {
        id : toggle
        anchors.centerIn: parent
        height: 250
        width: 500
        state: true

        onStateChanged: {
            if (state) {
                window.flags |= Qt.FramelessWindowHint
                customPanelControl.visible = true
                window.height += customPanelControl.height
            }
            else {
                window.flags &= ~Qt.FramelessWindowHint
                customPanelControl.visible = false
                window.height -= customPanelControl.height
            }
        }
    }
}
