import QtQuick 2.0
import QtQuick.Controls 2.15
Item {
    Rectangle {
        id: rec
        width: 80
        height: 80
        color: "#80444444"  //父控件的透明度会被子控件继承，但是color属性不会，使用8位32进制颜色值，前两位代表透明度，半
        radius: 15

        Image {
            id: search
            source: "search.png"
            anchors.fill: parent
            anchors.margins: 20
        }

        Rectangle {
            id: searchMenu
            height: 0
            width: 0
            radius: 15
            color: "#FFFAF0"
            anchors {
                left: parent.left
                bottom: parent.bottom
            }
            //未来的内容填充
            /*Rectangle {
                id: textrec
                visible: false
                height: 50
                width: 400
                border.color: "lightsteelblue"
                radius: 15
                anchors {
                    top: searchMenu.top
                    left: searchMenu.left
                    margins: 30
                }
            }*/

        }

        //展开动画
        ParallelAnimation {
            id: startanimation
            NumberAnimation {
                target: searchMenu
                properties: "height"
                from: 0
                to: 500
                duration: 100
            }
            NumberAnimation {
                target: searchMenu
                properties: "width"
                from: 0
                to: 500
                duration: 100
            }
        }

        //收回动画
        ParallelAnimation {
            id: stopanimation
            NumberAnimation {
                target: searchMenu
                properties: "height"
                from: 500
                to: 0
                duration: 100
            }
            NumberAnimation {
                target: searchMenu
                properties: "width"
                from: 500
                to: 0
                duration: 100
            }
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton      //左键点击有效
            hoverEnabled: true

            onClicked: {
                if(searchMenu.height == 0) {
                    startanimation.running = true
                } else {
                    stopanimation.running = true
                }
            }
            onEntered: {
                rec.color = "#FF444444"
            }
            onExited: {
                rec.color = "#80444444"
            }
        }
    }
}








