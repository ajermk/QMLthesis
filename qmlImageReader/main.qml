import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.folderlistmodel 2.15
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.3

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("imageGallery")
    property string filename: ""

    Popup {
        id: imgPopup
        modal: true
        focus: true
        anchors.centerIn: parent
        margins: 50
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Image { // 2
            anchors.fill: parent
            source: filename
            fillMode: Image.PreserveAspectFit
        }
    }

    GridView {
        id: gridView
        property var index: currentIndex
        anchors.fill: parent
        cellWidth: width / 4
        cellHeight: height / 2
        focus: true

        FolderListModel {
            id: folderModel
            nameFilters: ["*.png", "*.jpg"]
            folder: "PATHHERE"
        }

        Component {
            id: fileDelegate

            Column {
                //property variant myData: model
                    Image {
                        id: img
                        width: gridView.cellWidth - 20
                        height: gridView.cellHeight - 20
                        fillMode: Image.PreserveAspectFit
                        smooth: true
                        source: folderModel.folder + "/" + fileName
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log(fileName)
                                filename = img.source
                                imgPopup.open()
                            }
                        }
                    }
                    Text {
                        text: fileName
                        width: gridView.cellWidth - 20
                        wrapMode: Text.Wrap
                    }
            }

        }

        model: folderModel
        delegate: fileDelegate
    }

}
