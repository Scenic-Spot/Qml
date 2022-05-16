import QtQuick 2.15
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15

Item {
    //搜索图标
    Rectangle {
        id: rec
        width: 80
        height: 80
        color: "#80444444"  //父控件的透明度会被子控件继承，但是color属性不会，使用8位32进制颜色值，前两位代表透明度
        radius: 15
        visible: true
        opacity: searchMenu.height == 0 ? 1 : 0

        Image {
            id: search
            source: "qrc:/Images/search.png"
            anchors.fill: parent
            anchors.margins: 20
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
    //展开栏
    Rectangle {
        id: searchMenu
        height: 0
        width: 0
        radius: 15
        color: "#80444444"
        anchors {
            left: rec.left
            bottom: rec.bottom
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

        //搜索框
        Rectangle {
            id: textrec
            visible: (searchMenu.height == 500) ? true : false
            height: 50
            width: searchMenu.width - textrec.anchors.margins * 2
            border.color: "lightsteelblue"
            color: "white"
            radius: 15
            opacity: 1
            anchors {
                top: searchMenu.top
                left: searchMenu.left
                margins: 30
            }
            TextInput {
                id: input
                height: 50
                font.pointSize: 20
                width: textrec.width - 40
                visible: (searchMenu.height == 0) ? false : true
                x: 20
                y: 10
                clip: true
                Keys.onReturnPressed: {     //Enter
                    input.focus = false;
                }
            }
        }

        //展示栏
        //自定义框组件
        Rectangle {
            id: showblock
            width: 440
            height: 360
            color: "white"
            border.color: "#DCE2F1"
            visible: (searchMenu.height == 500) ? true : false
            radius: 15
            anchors {
                top: textrec.bottom
                left: textrec.left
                topMargin: 30
            }

            ListView {
                id: listView
                x: 6
                y: 6
                width: parent.width - 12
                height: parent.height - 12
                clip: true
                model: model

                delegate: delegate
                ListModel {
                    id: model
                    ListElement {
                        src: "qrc:/Images/scenery.ico"
                        name: "天安门"
                    }
                    ListElement {
                        src: "qrc:/Images/scenery.ico"
                        name: "故宫"
                    }
                    ListElement {
                        src: "qrc:/Images/school.ico"
                        name: "北京邮电大学"
                    }
                    ListElement {
                        src: "qrc:/Images/park.ico"
                        name: "北海公园"
                    }
                    ListElement {
                        src: "qrc:/Images/scenery.ico"
                        name: "南锣鼓巷"
                    }
                    ListElement {
                        src: "qrc:/Images/scenery.ico"
                        name: "长城"
                    }
                    ListElement {
                        src: "qrc:/Images/school.ico"
                        name: "中国邮电大学"
                    }
                    ListElement {
                        src: "qrc:/Images/park.ico"
                        name: "天坛公园"
                    }
                }
                Component {
                    id: delegate
                    Rectangle {
                        id: rec
                        width: listView.width
                        height: 50
                        color: "white"

                        visible: true
                        //圆形图片
                        Item {
                            width: parent.height
                            height: parent.height
                            anchors {
                                left: parent.left
                                leftMargin: 50
                            }
                            Image {
                                id: image
                                source: src
                                sourceSize: Qt.size(parent.width, parent.height)
                                smooth: true
                                visible: false
                            }
                            Rectangle {
                                id: mask
                                width: parent.width
                                height: parent.height
                                radius: width/2
                                visible: false
                            }
                            OpacityMask {
                                anchors.fill: image
                                source: image
                                maskSource: mask
                            }
                        }
                        //分割线
                        Rectangle {
                            id: line
                            width: parent.width - 25
                            height: 1
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right

                            color: "#C0C0C0"
                        }
                        //文本描述
                        Text {
                            x: 200
                            text: name
                            font.bold: true
                            font.pointSize: 20
                            font.family: "Consolas"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        //鼠标事件
                        MouseArea {
                            anchors.fill: rec
                            hoverEnabled:true
                            onEntered: {
                                rec.color = "#DCE2F1"
                            }
                            onExited: {
                                rec.color = "white"
                            }
                            //propagateComposedEvents: false
                        }
                    }
                }
            }
        }
    }
}
