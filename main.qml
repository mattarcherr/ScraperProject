import QtQuick
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Scraper Project")


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
            id: targetsText
            text: qsTr("Targets")
            font.pixelSize: 16
            font.family: "Verdana"

            topPadding: 10
            leftPadding: 20
        }

        Button {
            id: addNewButton
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: targetsText.bottom
            anchors.topMargin: 20

            height: 30
            width: 160

            Text {
                text: qsTr("Add new Target")
                anchors.centerIn: parent
            }
            onClicked: {
                console.debug("Debug")

                popup.open()
            }
        }


        Rectangle {
            color: "transparent"
            border.color: "red"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: addNewButton.bottom
            anchors.topMargin: 20
            width: 250
            height: 300

            Component {
                id: targetDelegate
                Item {
                    width: parent.width; height: 40

                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border.color: "green"

                        Text {
                            anchors.fill: parent
                            text: title;
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }


                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: cursorShape = Qt.PointingHandCursor
                    }
                }
            }

            ListView {
                anchors.fill: parent;
                delegate: targetDelegate
                model: targetsListModel
                spacing: 20
            }
        }

        Popup {
            id: popup
            anchors.centerIn: parent

            width: parent.width / 2
            height: parent.height / 1.3
            modal: true
            focus: true
            dim: true

            contentItem: Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: "red"

                TextEdit {
                    anchors.centerIn: parent
                }
            }

            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            onClosed: {
                addEntry("test")
            }
        }
    }

    Component.onCompleted: {
        addEntry("avsd");
    }

    function addEntry(title){
         console.log("start");
        var obj = {title: title}
        targetsListModel.append(obj)
        console.log("finish");
    }
}
