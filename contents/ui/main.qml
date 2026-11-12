pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents

PlasmoidItem {
    id: root

    property date currentTime: new Date()

    compactRepresentation: Component {
        MouseArea {
            id: compactRoot

            implicitWidth: 16
            implicitHeight: 16

            
            onClicked: (mouse) => {
                if (mouse.button === Qt.LeftButton) {
                    root.expanded = !root.expanded
                }
            }

            Image {
                anchors.centerIn: parent
                width: parent.width * 0.6
                height: parent.width * 0.6
                source: Qt.resolvedUrl("../assets/forgeicon.svg")
            }
        }        
    }

    Plasmoid.title: "Forge Timer"

    fullRepresentation: ColumnLayout {
        id: forgeFullRepresentation

        Layout.preferredWidth: 280
        Layout.preferredHeight: 340
        spacing: 6

        ColumnLayout {
            id: infoContainer

            Layout.preferredHeight: 30
            Layout.preferredWidth: parent.width

            Text {
                text: "Some info here..."
                color: '#a8a8a8'
            }

        }

        ListModel {
            id: forgeItems

            ListElement { 
                name: "Slot 1"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 2"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 3"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 4"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 5"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 6"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
            ListElement { 
                name: "Slot 7"
                process: "Empty"
                iconurl: "../assets/forgeicon.svg" 
            }
        }

        ListView {
            id: forgeListView

            Layout.preferredWidth: 280
            Layout.preferredHeight: 320
            clip: true

            model: forgeItems
            spacing: 4

            delegate: PlasmaComponents.ItemDelegate {
                id: itemDelegate

                width: ListView.view.width
                height: itemContainer.isExpanded ? 240 : 40

                required property string name
                required property string iconurl
                required property string process

                Rectangle {
                    anchors.fill: parent

                    color: "transparent"
                    border.color: "red"
                    border.width: 1
                }

                contentItem: ColumnLayout {
                    id: itemContainer

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    property bool isExpanded: false

                    RowLayout {
                        id: item 

                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        spacing: 0

                        Image {
                            Layout.alignment: verticalAlignment
                            Layout.leftMargin: 10
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: 20
                            source: Qt.resolvedUrl(itemDelegate.iconurl)

                            Rectangle {
                                anchors.fill: parent

                                color: "transparent"
                                border.color: "green"
                                border.width: 1
                            }
                        }

                        ColumnLayout {

                            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                            Layout.fillWidth: true

                            spacing: 0

                            Text {
                                Layout.alignment: Qt.AlignLeft
                                Layout.fillWidth: true
                                Layout.leftMargin: 15

                                text: itemDelegate.name
                                font.bold: true
                                font.pointSize: 11
                                color: "white"

                                Rectangle {
                                    anchors.fill: parent

                                    color: "transparent"
                                    border.color: "purple"
                                    border.width: 1
                                }
                            }

                            Text {
                                Layout.alignment: Qt.AlignLeft
                                Layout.fillWidth: true
                                Layout.leftMargin: 15

                                text: itemDelegate.process
                                font.pointSize: 10
                                color: "#dedede"

                                Rectangle {
                                    anchors.fill: parent

                                    color: "transparent"
                                    border.color: "purple"
                                    border.width: 1
                                }
                            }

                        }

                        PlasmaComponents.Button {
                            Layout.preferredHeight: 20
                            Layout.preferredWidth: 20
                            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                            Layout.leftMargin: 10
                            Layout.rightMargin: 10

                            Text {
                                anchors.centerIn: parent

                                color: "white"
                                text: itemContainer.isExpanded ? "▼" : "▶"
                            }

                            onClicked: {
                                itemContainer.isExpanded = !itemContainer.isExpanded
                            }
                            
                        }
                        
                    }

                    ColumnLayout {
                        id: itemSettings

                        Layout.fillWidth: true
                        Layout.preferredHeight: itemContainer.isExpanded ? 200 : 0
                        Layout.minimumHeight: 0

                        clip: true
                        spacing: 0

                        Behavior on Layout.preferredHeight {
                            NumberAnimation {
                                duration: 100
                                easing.type: Easing.InOutQuad
                            }
                        }

                        Text {
                            text: "test"
                            color: "white"

                            Rectangle {
                                anchors.fill: parent

                                color: "transparent"
                                border.color: "purple"
                                border.width: 1
                            }
                        }

                        Rectangle {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            color: "transparent"
                            border.color: "white"
                            border.width: 1
                        }

                    }

                }

            }

        }
        
    }

    // refresh the clock every 5 seconds
    Timer {
        interval: 5000
        running: true
        repeat: true
        
        onTriggered: {
            root.currentTime = new Date() 
        }
    }

}
