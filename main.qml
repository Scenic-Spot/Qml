import QtQuick 2.15
import QtQuick.Window 2.15
import QtTest 1.0
import QtQuick.Controls 2.0
Window {
    width: 640
    height: 480

    property point pointLeftUp: Qt.point(0,0)
            property point pointRightUp: Qt.point(100,0)

            Line{
                id:line1
                x:200
                y:200
                point1:pointLeftUp
                point2:pointRightUp
                lineWidth: 4
            }


}
