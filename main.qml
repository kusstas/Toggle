import QtQuick 2.10
import QtQuick.Window 2.10
import QtGraphicalEffects 1.0

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
        id : toggle
        anchors.centerIn: parent
        width: 400
        height: width / 2.25
        radius: height / 2.05
        color: "#78909C"

        property bool state : false

        MouseArea {
            anchors.fill: parent

            onPressed: {
                if (mouseX >= toggle.width / 2 && !toggle.state || mouseX < toggle.width / 2 && toggle.state) {
                    toggle.state = !toggle.state;
                    animSwitcherFix.start();
                }
            }
        }


        Rectangle {
            id : switcher
            color: "#B0BEC5"

            property int originX : (parent.width - width) / 2
            property int originY : (parent.height - height) / 2
            property int offsetFix : 15

            property int positionFixR : originX + ((parent.width - width) / 2 - offsetFix)
            property int positionFixL: originX - ((parent.width - width) / 2 - offsetFix)

            width: parent.height * 0.875
            height: parent.height * 0.875
            radius: width / 2
            x : state ? positionFixR : positionFixL
            y : originY

            Text {
                id : textState
                x : (parent.width - width) / 2
                y : (parent.height - height) / 2
                font.pixelSize: 48
                font.family: "Cambria"
                font.bold: true
                color: "#263238"
                text : toggle.state ? "ON" : "OFF"
            }

            DropShadow {
                anchors.fill: textState
                horizontalOffset: 3
                verticalOffset: 3
                radius: 8
                samples: 17
                color: "#80000000"
                source: textState
            }

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
                    else if (switcher.x < switcher.positionFixL)
                        switcher.x = switcher.positionFixL
                }

                onReleased: {
                    if (switcher.x >= switcher.originX)
                        toggle.state = true
                    else if (switcher.x < switcher.originX)
                        toggle.state = false
                    animSwitcherFix.start()
                }
            }
        }

        PropertyAnimation {
            id : animSwitcherFix
            target : switcher
            properties: "x"
            to : toggle.state ? switcher.positionFixR : switcher.positionFixL
            duration: 100
        }

        DropShadow {
            anchors.fill: switcher
            horizontalOffset: 8
            verticalOffset: 8
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: switcher
        }
    }

    DropShadow {
        anchors.fill: toggle
        horizontalOffset: 12
        verticalOffset: 12
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: toggle
    }
}
