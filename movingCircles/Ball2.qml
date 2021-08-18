import QtQuick 2.0

Item {
    id: root
    //property var ifDownTrue: (Math.floor(Math.random() * 2) === 1) ? true : false
    //property var randomDuration: Math.floor(Math.random() * 2000)
    width: 10
    height: 10
    x: 10
    y: 10


    Rectangle {
        id: body
        anchors.fill: parent
        radius: parent.width
        width: parent.width
        color: "red"





    }
    SequentialAnimation {
        id: xAxisAnim
            running: true
            loops: Animation.Infinite
            NumberAnimation { id: right; target: root; property: "x"; from: 0; to: 50; duration: 1000; }
            NumberAnimation { id: left; target: root; property: "x"; from: 50; to: 0; duration: 1000; }


        }

//    SequentialAnimation {
//        id: yAxisAnim
//            running: ifDownTrue ? true : false
//            loops: Animation.Infinite
//            NumberAnimation { id: down; target: root; property: "y"; from: 0; to: 50; duration: randomDuration }
//            NumberAnimation { id: up; target: root; property: "y"; from: 50; to: 0; duration: randomDuration }


//        }
}
