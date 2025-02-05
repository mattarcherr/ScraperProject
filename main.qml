import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    ListModel { id: targetsListModel }

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
            onClicked: {
                console.debug("Debug")

                addEntry()
            }
        }


        Rectangle {
            color: "transparent"
            anchors.centerIn: parent
            width: 300
            height: 300

            Component {
                id: targetDelegate
                Item {
                    width: 180; height: 40
                    Column {
                        Text { text: title }
                        Text { text: link; elide: Text.ElideRight; clip:true }
                    }
                    MouseArea{
                        anchors.fill: parent
                    }
                }
            }

            ListView {
                anchors.fill: parent;
                orientation: ListView.Vertical;
                // delegate: Rectangle {
                //     width: parent.width;
                //     height: 100;
                //     color: bgcolor;
                // }
                delegate: targetDelegate

                model: targetsListModel

            // }

                highlight: Rectangle { color: "lightsteelblue"; }
                focus: true
            }
        }
    }

    Component.onCompleted: {
        addEntry();
    }

    function addEntry(){
         console.log("start");
        var obj = {bgcolor: "red"}
        targetsListModel.append(obj)
        console.log("finish");
    }
}
