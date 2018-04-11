import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    id : window
    visible: true
    minimumHeight: 640
    minimumWidth: 480
    width: 640
    height: 480
    color: "#263238"
    title: qsTr("@kusstas - Toggle")

    Rectangle {

        property bool state : false

        id : toggle
        anchors.centerIn: parent
        width: 400
        height: width / 2.25
        radius: height / 2.05
        color: "#78909C"
        Rectangle {

            id : switcher
            property int originX : (parent.width - width) / 2
            property int originY : (parent.height - height) / 2

            property int border : 15

            property int positionFixR : originX + ((parent.width - width) / 2 - border)
            property int positionFixL: originX - ((parent.width - width) / 2 - border)

            width: parent.height * 0.875
            height: parent.height * 0.875
            radius: width / 2
            x : state ? positionFixR : positionFixL
            y : originY

            color: "#B0BEC5"

            MouseArea {
                anchors.fill : parent
                property int prevX: 0

                onPressed: {
                    prevX = mouseX
                }

                onMouseXChanged: {
                    var dx = mouseX - prevX
                    switcher.x += dx
                    if (switcher.x > switcher.positionFixR)
                        switcher.x = switcher.positionFixR
                    if (switcher.x < switcher.positionFixL)
                        switcher.x = switcher.positionFixL
                }

                onReleased: {

                    if (switcher.x >= switcher.originX) {
                        toggle.state = true
                        switcher.x = switcher.positionFixR
                    }

                    if (switcher.x < switcher.originX) {
                        toggle.state = false
                        switcher.x = switcher.positionFixL
                    }
                }
            }
        }
    }
}
