var component;
var ball;

function createCircles() {
    component = Qt.createComponent("Ball.qml");
    if (component.status == Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status == Component.Ready) {
        var randomPos = randomizePos()
        var randomSize = randomizeSize()
        ball = component.createObject(window, {x: randomPos, y: randomPos, height: randomSize, width: randomSize});
        if (ball == null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}

function randomizePos() {
    return Math.floor(Math.random() * window.height);
}

function randomizeSize() {
    return Math.floor(Math.random() * 150) + 10
}


function createCustom() {
    component = Qt.createComponent("Ball.qml");
    var randomPos = randomizePos()
    var randomSize = randomizeSize()
    if (component.status == Component.Ready){
        ball = component.createObject(window, {x: randomPos, y: randomPos, height: randomSize, width: randomSize});
        if (ball == null) {
            // Error Handling
            console.log("Error creating object");
        }
    }
    else
        console.log("Error loading component:", component.errorString());
}
