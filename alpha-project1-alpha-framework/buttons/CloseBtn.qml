import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.12
import QtGraphicalEffects 1.15

Button{
    id: closeBtn
    // CUSTOM PROPERTIES
    property url btnIconSource: "../../resources/icons/close_icon.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(closeBtn.down){
                                       closeBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       closeBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

//    Connections {
//        target: closeBtn
//        function onClicked() {
//            main_window.close()
//        }
//    }

//    Connections {
//        target: closeBtn
//        onClicked: main_window.close()
//    }

    width: 35
    height: 35
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


