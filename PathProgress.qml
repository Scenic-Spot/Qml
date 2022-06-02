import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.2

Rectangle{
    id: root
    width: 400
    height: 100
    color: Qt.rgba(68/255,68/255,68/255,0.5)
    radius: 15
    visible:false

    property alias isRunningSecond: secondTimer.running
    property double pathList_restDistance: _pathList.pathFirstRest_Distance()
    property int minute: _minute.minuteShow(_car.run(),_pathList.pathFirstRest_Distance())
    property double pathList_initCurrentDistance: _pathList.pathInitCurrent_Distance()
    property alias pp_visible: root.visible
    property string clock:{
        var currentDate = new Date()
        var value = currentDate.getTime()
        var ptDate = new Date(value)
        clock = ptDate.toLocaleString(Qt.locale("de_DE"),"HH:mm")
    }

    Timer{
        id: secondTimer
        interval:1000
        repeat: true
        running: false
        onTriggered: {
            if(_pathList.mpaths_isEmpty()){
                console.log(1)
                _pathList.setIsRunnig(false);
                _pathList.setIsVisible(false);
            }else{
                pathList_restDistance = _pathList.pathDistanceChange(_car.run())
                minute = _minute.minuteShow(_car.run(),_pathList.pathFirstRest_Distance())
                pathList_initCurrentDistance = _pathList.pathInitCurrent_Distance()

                var currentDate = new Date()
                var value = currentDate.getTime()
                var ptDate = new Date(value)
                clock = ptDate.toLocaleString(Qt.locale("de_DE"),"HH:mm")

                console.log(_minute.getMinute())
                console.log(_pathList.pathFirstRest_Distance())
                console.log(_car.run())
                console.log(clock)
            }
        }
    }

    Text {
        id: pathDistShow
        x:31;y:18
        width:66;height:24
        text: pathList_restDistance.toFixed(2) + " mi"
        font.pixelSize: 20
        font.family: "Consolas"
        font.bold: true
        color:"white"
    }

    Text {
        id: pathTimeShow
        x: 157
        y: 18
        text: (minute>0) ? (minute + "min") : ("< 1 min")
        font.pixelSize: 20
        font.family: "Consolas"
        font.bold: true
        color:"white"
    }

    Text {
        id: pathClockShow
        x: 260
        y: 18
        text: qsTr(clock)
        font.pixelSize: 20
        font.family: "Consolas"
        font.bold: true
        color:"white"
    }

    Slider {
        id: slider;
        objectName: "Slider";

        x:31
        y:63
        width: 284
        height: 12
        from: 0
        value: (pathList_initCurrentDistance - pathList_restDistance)
        to: pathList_initCurrentDistance
        stepSize: 0.01

        background: Rectangle{
            id: rect1
            z:1
            color:Qt.rgba(61/255,91/255,153/255,0.5)
            radius: 15
            width: slider.width
            height:slider.height

            Rectangle{
                id: rect2
                z:3
                color: "cyan"
                radius: rect1.radius
                anchors {
                    top: parent.top;
                    bottom: parent.bottom;
                    left: parent.left;
                }
                opacity: 0.5
                width: slider.width * (slider.value/pathList_initCurrentDistance);
                height: slider.height
            }
        }

        handle: Image {
            z: 5
            x: slider.width * (slider.value/pathList_initCurrentDistance)-width/2
            y: slider.height/2-height/2
            width: 30
            height: 30
            source:"qrc:/Images/orientation.png"
        }
    }

    Button{
        id: invisible
        x: 342
        y: 25
        width: 50
        height: 50
        onClicked: {
            pp_visible = false
        }
        icon.source:"qrc:/Images/close.png"
        icon.color:"transparent"
        background: Rectangle{
            radius: 15
            opacity: 0.2
        }
    }
}
