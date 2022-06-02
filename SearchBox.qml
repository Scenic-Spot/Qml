import QtQuick 2.0
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.0
import QtQml 2.2
Item {
    Rectangle {
        id: rec
        width: 80
        height: 80
        color: "#80444444"  //父控件的透明度会被子控件继承，但是color属性不会，使用8位32进制颜色值，前两位代表透明度
        radius: 15

        Image {
            id: search
            source: "qrc:/Images/search.png"       //增加图片
            anchors.fill: parent
            anchors.margins: 20
        }

        ListModel{
            id:list_model
            ListElement { name: "嘉瑞新艺术仓库" }
            ListElement { name: "罐子书屋" }
            ListElement { name: "旻古艺术" }
            ListElement { name: "新时代画廊" }
            ListElement { name: "3818库" }
            ListElement { name: "世纪翰墨" }
            ListElement { name: "圣东方" }
            ListElement { name: "千年时间" }
            ListElement { name: "八大画廊" }
            ListElement { name: "星空间" }
            ListElement { name: "协民国际" }
            ListElement { name: "北京空间" }
            ListElement { name: "龚伟艺术空间" }
            ListElement { name: "麦杰艺术" }
            ListElement { name: "灿艺术" }
            ListElement { name: "亚洲艺术中心" }
            ListElement { name: "物波空间" }
            ListElement { name: "卓越艺术" }
            ListElement { name: "山艺术" }
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

            Text{
                visible: (searchMenu.height == 500) ? true : false
                id:text1
                font.pointSize: 15
                font.bold: true
                anchors{
                    left:parent.left
                    leftMargin: 10
                    verticalCenter: choice.verticalCenter
                }
                text:"请选择搜索方式"
            }

            ComboBox {
                id:choice
                visible: (searchMenu.height == 500) ? true : false
                currentIndex: 0
                model: ["景点查找", "路径规划","最小生成树"]
                anchors{
                    top:parent.top
                    topMargin: 20
                    left:text1.right
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 10
                }
            }

            Button{
                visible: (searchMenu.height == 500 && choice.currentIndex == 2) ? true : false
                text:"确定"
                font.pointSize: 15
                font.bold: true
                onClicked: {
                    _pathList.startKrustal(from.currentIndex,to.currentIndex)
                    _pathList.setIsRunnig(true);
                    _pathList.setIsVisible(true);
                    _pathList.draw();
                    stopanimation.running = true
                }
                anchors{
                    top:place.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
            }

            ComboBox {
                id:place
                visible: (searchMenu.height == 500 && choice.currentIndex == 0) ? true : false
                currentIndex: 0
                model: list_model
                anchors{
                    top:choice.bottom
                    topMargin: 20
                    left:parent.left
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 10
                }
            }

            Button{
                visible: (searchMenu.height == 500 && choice.currentIndex == 0) ? true : false
                text:"确定"
                font.pointSize: 15
                font.bold: true
                onClicked: {
                    stopanimation.running = true
                }
                anchors{
                    top:place.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text{
                visible: (searchMenu.height == 500 && choice.currentIndex == 1) ? true : false
                id:text2
                font.pointSize: 15
                font.bold: true
                anchors{
                    verticalCenter: from.verticalCenter
                    left:parent.left
                    leftMargin: 10
                }
                text:"From: "
            }

            ComboBox {
                id:from
                visible: (searchMenu.height == 500 && choice.currentIndex == 1) ? true : false
                currentIndex: 0
                model: list_model
                anchors{
                    top:choice.bottom
                    topMargin: 20
                    left:text2.right
                    leftMargin: 10
                    right: parent.right
                    rightMargin: 10
                }
            }

            Text{
                visible: (searchMenu.height == 500 && choice.currentIndex == 1) ? true : false
                id:text3
                font.pointSize: 15
                font.bold: true
                anchors{
                    verticalCenter: to.verticalCenter
                    left:parent.left
                    leftMargin: 10
                }
                text:"To: "
            }

            ComboBox {
                id:to
                visible: (searchMenu.height == 500 && choice.currentIndex == 1) ? true : false
                currentIndex: 0
                model: list_model
                anchors{
                    top:from.bottom
                    topMargin: 20
                    left:from.left
                    right: parent.right
                    rightMargin: 10
                }
            }

            Button{
                visible: (searchMenu.height == 500 && choice.currentIndex == 1) ? true : false
                text:"确定"
                font.pointSize: 15
                font.bold: true
                onClicked: {
                    _pathList.startDijstra(from.currentIndex,to.currentIndex)
                    _pathList.setIsRunnig(true);
                    _pathList.setIsVisible(true);
                    _pathList.draw();
                    stopanimation.running = true
                }
                anchors{
                    top:to.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
            }
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
