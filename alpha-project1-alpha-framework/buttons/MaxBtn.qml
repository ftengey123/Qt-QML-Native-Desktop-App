import QtQuick 2.9
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.3

Button{
    id: btnTopBar
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../resources/icons/maximize_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    Connections {
        target: btnTopBar
        function onClicked() {
            main_window.showMaximized()
        }
    }

    width: 35
    height: 35
    text: ""
    display: AbstractButton.IconOnly

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
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


