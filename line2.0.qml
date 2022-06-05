import QtQuick 2.15
import QtQuick.Window 2.0

Window {
    visible: true
    width: 640
    height: 480

    Canvas{
            id: canvas
            width: parent.width
            height: parent.height
            onPaint: {
                  var ctx = getContext("2d");
                  draw(ctx);
            }

            function draw(ctx ) {
                // 画之前清空画布
                ctx.clearRect(0, 0, parent.width, parent.height);
                ctx.fillStyle ="#FFFFFF";
                ctx.fillRect(0, 0,parent.width, parent.height);

                ctx.fillStyle ="#111";           // 设置画笔属性
                ctx.strokeStyle = "#333";
                ctx.lineWidth = 4

                ctx.beginPath();                  // 开始一条路径
                ctx.moveTo(100, 100);         // 移动到指定位置
                ctx.lineTo(parent.width, parent.height);

                ctx.fillText("这里填路径长度", parent.width / 2, parent.height / 2);
                ctx.stroke();

            }
        }

}
