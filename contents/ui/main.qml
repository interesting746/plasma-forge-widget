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
                height: 40

                required property string name
                required property string iconurl
                required property string process

                RowLayout {
                    id: item 

                    width: forgeListView.width
                    height: 40
                    spacing: 0

                    Image {
                        Layout.alignment: verticalAlignment
                        Layout.leftMargin: 10
                        Layout.preferredWidth: 20
                        Layout.preferredHeight: 20
                        source: Qt.resolvedUrl(itemDelegate.iconurl)
                    }

                    ColumnLayout {

                        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                        Layout.fillWidth: true

                        spacing: 0

                        Text {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
                            Layout.leftMargin: 10

                            text: itemDelegate.name
                            font.bold: true
                            font.pointSize: 11
                            color: "white"
                        }

                        Text {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillWidth: true
                            Layout.leftMargin: 10

                            text: itemDelegate.process
                            font.pointSize: 10
                            color: "#dedede"
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
