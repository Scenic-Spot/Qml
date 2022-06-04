import QtQuick 2.0
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

    property double pathList_restCurrentDistance: _pathList.pathFirstRest_Distance()
    property string name: _pathList.getFirstPathName()
    property point pointLeftUp: Qt.point(0,0)
    property point pointRightUp: Qt.point(0,0)
    property int add_x: 0
    property int add_y: 0
    property bool isVisibile: false

    Image{
        source: "qrc:/Images/map.jpg"
        anchors.centerIn: parent
    }

    Rectangle {
            x: 297+add_x;
            y: 130+add_y;
            width: 20;
            height: 20;
            color: "blue";
            radius: 100;
            clip: true;
            visible: isVisibile
    }

    Item{
        ListModel{
            id:myModel
        }

        Component{
            id:myDelegate
            Line{
                id:line
                x:307
                y:140
                point1:Qt.point(x1,y1)
                point2:Qt.point(x2,y2)
                lineWidth: 4
                lineColor: "red"
            }
        }

        Repeater{
            model:myModel
            delegate: myDelegate
        }
    }

    Timer{
        id: firstTimer
        interval:1000
        repeat: true
        running: false
        onTriggered: {
            pathList_restCurrentDistance = _pathList.pathFirstRest_Distance()
            name =  _pathList.getFirstPathName()
        }
    }

    Item{
        focus: true
        Keys.onEscapePressed: {
            window.close()
        }
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
        visible: false

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

                text: pathList_restCurrentDistance.toFixed(2) + " mi"
                font.pixelSize: 50
                font.family: "Consolas"
                font.bold: true
                color:"white"
            }
            Text {
                id: streetName
                text: qsTr(name)
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

    Connections{
        target:_pathList
        function onIsRunningChanged()
        {
            pathProgress.isRunningSecond = _pathList.getIsRunnig();
            firstTimer.running = _pathList.getIsRunnig();
        }

        function onIsVisibleChanged()
        {
            pathProgress.pp_visible = _pathList.getIsVisible();
            gogogo.visible = _pathList.getIsVisible();
        }
        function onPointLeftUpChanged()
        {
            isVisibile = false;
            pointLeftUp=Qt.point(_pathList.getPointLeftUp().x,_pathList.getPointLeftUp().y);
            pointRightUp = Qt.point(_pathList.getPointRightUp().x,_pathList.getPointRightUp().y);
            var pointLeftUp2=pointLeftUp
            var pointRightUp2=pointRightUp
            myModel.append({x1:pointLeftUp2.x,y1:pointLeftUp2.y,x2:pointRightUp2.x,y2:pointRightUp2.y})
            console.log(pointLeftUp);
        }
        function onPointRightUpChanged()
        {
            isVisibile = false;
            pointLeftUp=Qt.point(_pathList.getPointLeftUp().x,_pathList.getPointLeftUp().y);
            pointRightUp = Qt.point(_pathList.getPointRightUp().x,_pathList.getPointRightUp().y);
            var pointLeftUp2=pointLeftUp
            var pointRightUp2=pointRightUp
            myModel.append({x1:pointLeftUp2.x,y1:pointLeftUp2.y,x2:pointRightUp2.x,y2:pointRightUp2.y})
            console.log(pointRightUp)
        }
        function onIconChanged(){
            myModel.clear();
        }
        function onSearchChanged(){
            add_x = _pathList.getAdd_x();
            add_y = _pathList.getAdd_y();
            isVisibile = true;
        }
    }
}
