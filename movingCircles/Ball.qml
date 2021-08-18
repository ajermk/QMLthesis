import QtQuick 2.0

Item {
    id: root
    property var ifDownTrue: (Math.floor(Math.random() * 2) === 1) ? true : false
    property var randomDuration: Math.floor(Math.random() * 2000)
    Rectangle {
        id: body
        anchors.fill: parent
        radius: parent.width
        width: parent.width
        gradient: Gradient {
            GradientStop { position: 0.0; color: randomizeColor() }
            GradientStop { position: 0.5; color: randomizeColor()  }
            GradientStop { position: 1.0; color: randomizeColor()  }
        }


    }
    SequentialAnimation {
        id: xAxisAnim
            running: (!ifDownTrue) ? true : false
            loops: Animation.Infinite
            NumberAnimation { id: right; target: root; property: "x"; from: 0; to: winwidth-body.width; duration: randomDuration; }
            NumberAnimation { id: left; target: root; property: "x"; from: winwidth-body.width; to: 0; duration: randomDuration; }


        }

    SequentialAnimation {
        id: yAxisAnim
            running: ifDownTrue ? true : false
            loops: Animation.Infinite
            NumberAnimation { id: down; target: root; property: "y"; from: 0; to: winheight - body.height; duration: randomDuration }
            NumberAnimation { id: up; target: root; property: "y"; from: winheight - body.height; to: 0; duration: randomDuration }


        }

    function randomizeColor() {
        var x=Math.round(0xffffff * Math.random()).toString(16);
        var y=(6-x.length);
        var z="000000";
        var z1 = z.substring(0,y);
        var color= "#" + z1 + x;
        return color;
    }


}
