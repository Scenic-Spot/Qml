import QtQuick 2.0
import QtGraphicalEffects 1.12

Rectangle{

    id:background

    FastBlur {
            anchors.fill: background
            source: background
            radius: 32
        }
    width: status.implicitWidth+20
    height: parent.height
    radius: 10
    property alias text: status.text
    property alias mousearea: mousearea
    color: this.mousearea.containsMouse?"white":parent.color

    MouseArea{
        id:mousearea
        hoverEnabled: true
        anchors.fill:parent

    }
    Text {
        id: status
        anchors.centerIn: parent
        anchors.margins: 20
        font.pixelSize: 40
        font.family: "Consolas"
//        text: qsTr("I is the block for position")
    }
}
