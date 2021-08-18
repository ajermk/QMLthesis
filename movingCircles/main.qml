import QtQuick 2.12
import QtQuick.Window 2.12

import "code.js" as Code
import com.company.fpsText 1.0

Window {
    id: window
    property var winwidth: window.width
    property var winheight: window.height

    width: 700
    height: 350
    visible: true
    title: qsTr("Hello World")

    FPSText{
            id: fps_text
            Text {
                    anchors.centerIn: parent
                    text: fps_text.fps.toFixed(2)
                }
        }

    Component.onCompleted: {
        for(var i = 0; i < 5000; i++)
        Code.createCustom();
   }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "red" }
            GradientStop { position: 0.5; color: "yellow" }
            GradientStop { position: 1.0; color: "green" }
        }
    }
}

/*
Performance and Limitations

Calculating gradients can be computationally expensive compared to the use of solid color fills or images. Consider using gradients for static items in a user interface.
  */
