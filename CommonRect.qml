import QtQuick 2.0
Item{
    property alias myHeight: rect.height
    property alias myWidth: rect.width
    Rectangle{
        id:rect
        width: 480
        height: 240
        opacity: 0.5
        color: "#444444"
        radius: 15
    }
}
