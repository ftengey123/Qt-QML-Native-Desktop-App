import QtQuick 2.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12

Button{
    id: btnTopBarMin
    // CUSTOM PROPERTIES
    property url btnIconSource: "../resources/icons/minimize_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBarMin.down){
                                       btnTopBarMin.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBarMin.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    Connections {
        target: btnTopBarMin
        onClicked: main_window.showMinimized()
    }

    width: 35
    height: 35
    display: AbstractButton.IconOnly

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            anchors.verticalCenter: parent.verticalCenter
            source: "../resources/icons/minimize_icon.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            height: 9
            width: 9
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}


