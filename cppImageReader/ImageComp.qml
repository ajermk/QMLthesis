import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

Item {
    id: imgItem

    Column {
        Image {
            id: image
            width: mainList.cellWidth - 20
            height: mainList.cellHeight - 20
            fillMode: Image.PreserveAspectFit
            source: "file://" + imgReader.path + "/" + modelData

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //console.log(image.source)
                    filename = image.source
                    imgPopup.open()
                }
            }
        }
        Label {
            id: lblFile
            text: modelData

            width: mainList.cellWidth - 20
            wrapMode: Text.Wrap
        }
    }
}
