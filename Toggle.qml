import QtQuick 2.0
import QtGraphicalEffects 1.0

Item  {
    id : toggle
    property bool state: false
    property alias bgColor: bg.color
    property alias switcherColor: switcher.color
    property alias scaleSwitcher: switcher.scale

    onStateChanged: {

    }

    Rectangle {
        id: bg
        anchors.fill: parent
        radius: height / 2
        color: "#78909C"

        border.width: 5
        border.color: "#B0BEC5"
    }

    Rectangle {
        id: switcher
        scale: 1.05

        property int originX : (parent.width - width) / 2
        property int valueFix: originX
        property int fixR: originX + valueFix
        property int fixL: originX - valueFix


        x: toggle.state ? fixR : fixL
        width: parent.height
        height: parent.height
        radius: height / 2

        border.color: "#CFD8DC"
        border.width: 8

        color: "#B0BEC5"

        Text {
            id : textState
            x : (parent.width - width) / 2
            y : (parent.height - height) / 2
            font.pointSize: switcher.height / 5
            font.family: "Arial"
            font.bold: true
            color: "#607D8B"
            text : toggle.state ? "ON" : "OFF"
        }

        DropShadow {
            anchors.fill: textState
            horizontalOffset: 3
            verticalOffset: 3
            radius: 5
            samples: 10
            color: "#50000000"
            source: textState
        }
    }

    PropertyAnimation {
        id : animSwitcherFix
        target : switcher
        properties: "x"
        to : toggle.state ? switcher.fixR : switcher.fixL
        duration: 100
    }
}
