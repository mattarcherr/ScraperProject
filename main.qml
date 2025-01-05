import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: leftNavBar
        implicitWidth: 30
        width: 50
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Rectangle {
        id: mainPane
        color: "#c7c7c7"
        anchors {
            left: leftNavBar.right
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        Text {
            id: _text
            text: qsTr("Targets")
            font.pixelSize: 16
            font.family: "Verdana"

            topPadding: 10
            leftPadding: 10
        }

        Button {
            x: 8
            y: 45
            height: 30
            width: 160
            Text {
                text: qsTr("Add new Target")
                anchors.centerIn: parent
            }
        }
    }


}
