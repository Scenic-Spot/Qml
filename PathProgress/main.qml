import QtQuick 2.0
import QtLocation 5.12
import QtPositioning 5.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Window 2.12

Window {
    //setup for window
    id:window
    flags:Qt.FramelessWindowHint
    FastBlur {
            anchors.fill: statusBar
            source: statusBar
            radius: 32
        }
    visible: true
    width: screen.width
    height: screen.height
    color: "#aaaaaa"
    Item{
        focus: true
        Keys.onEscapePressed: {
            window.close()
        }
    }
    //setup for mapbox
    Plugin {
          id: mapboxglPlugin
          name: "mapboxgl"
    }
    Map {
          anchors.fill: parent
          plugin: mapboxglPlugin
          center: QtPositioning.coordinate(39.9075, 116.3880) // 纬度 经度，换算成度为单位小数，天安门坐标
          zoomLevel: 14
    }
    CommonRect{
        id:gogogo
        myWidth: 460
        myHeight: 200
        anchors{
            left: parent.left
            top: parent.top
            margins: 100
        }

        Rectangle{
            width: 60
            height: 60
            color: "white"
            anchors{
                left: parent.left
                top:parent.top
                margins: 30
            }
            Text {
                id: dist
                anchors{
                    left: parent.right
                    leftMargin: 30
                    verticalCenter: parent.verticalCenter

                }

                text: qsTr("0.5 mi")
                font.pixelSize: 50
                font.family: "Consolas"
                font.bold: true
                color:"white"
            }
            Text {
                id: streetName
                text: qsTr("Mission St.")
                font.pixelSize: 30
                font.family: "Consolas"
                color: "white"
                font.bold:true

                anchors{
                    top: parent.bottom
                    topMargin: 25
                    left: parent.left
                }
            }
        }
    }

    Rectangle{
        property int statusBarMargin: 15
        id:statusBar
        anchors{
            left:parent.left
            right: parent.right
            top:parent.top
        }
        StatusButton{
                id:status
                anchors.centerIn: parent
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: "white"
                text: "I is the block for position"
        }
        StatusButton{
                id:logo
                 anchors.right: status.left
                 anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                text: "Logo"
        }
        StatusButton{
                id:quit
                 anchors.left: status.right
                 anchors.leftMargin: 15
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                color: mousearea.containsMouse?"red":"darkred"
                width: parent.height
                height: parent.height
                //text: "quit"
                mousearea.onClicked: {
                    window.close()
                }

        }
        color: "Grey"
        height: parent.height/30
        opacity: 0.5
    }

    SearchBox {
        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 100
            bottomMargin: 180       //？
        }
    }

    PathProgress{
        id:pathProgress
        width:400
        height:100
        isRunningSecond: false
        pp_visible: false

        anchors{
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: 50
        }
    }

    Button{
        text:"可以放在输入确定处的按钮功能"
        onClicked:{
            pathProgress.isRunningSecond  = true
            pathProgress.pp_visible = true
        }
    }
}
