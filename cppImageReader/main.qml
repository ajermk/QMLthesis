import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

import QtQml.Models 2.15
import com.company.imgReader 1.0

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Viewer")
    // used between image component
    property string filename: ""

    property alias filePath: imgReader.path


    ImgReader {
        id: imgReader
        path: "PATHHERE"
//        Component.onCompleted: {
//            console.log(imgReader.files)
//        }
    }

    Popup {
        id: imgPopup
        modal: true
        focus: true
        anchors.centerIn: parent
        margins: 50
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Image {
            anchors.fill: parent
            source: filename
            fillMode: Image.PreserveAspectFit
        }
    }

    GridView {
        id: mainList
        focus: true
        anchors.fill: parent
        cellWidth: width / 4
        cellHeight: height / 2

        model: imgReader.files

        delegate: ImageComp {
        }

    }
}
