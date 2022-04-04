# Qml
## mainWindow.qml
mainWindow 里面有主窗口的样子，退出的时候可以按顶部的红色按钮，也可以按Esc键
## StatusButton.qml
StatusButton 里面有状态栏的控件
## CommonRect.qml
CommonRect 是通用的框框，统一了颜色，不透明度，圆角。由于水平有限，使用CommonRect指定大小时，**需要指定** `myHeight` , `myWidth` 来指定高度，宽度
## SearchBox.qml
SearchBox 包括了左下角搜索框的全部功能及实现，图标自行添加
## PathProgress
PathProgress包括显示当前路径节点下的剩余路径长度（单位km），剩余时间（单位min），当前时刻（HH:MM）
更新是通过ObjectOwnership+Timer实现的
* 关于PathProgress模块最后的显示时间，一般来说是预估这段路程结束时刻，最后选择显示当前时刻，是因为讨论未明确+还没对时间进行处理，因此此时显示的是当前时刻。
* 使用：先点击最上面的按钮（这个逻辑打算用在输入目的地的确认键处，然后Timer启动，PathProgress显示）
### Class Car
Car是用来设置跑路线的假车的速度的类，设想**设置**里可以更改car的速度从而模拟真实的车速，后续增加拥堵与否的时候可以据拥堵程度改变speed
单位：m/s
### Class Minute
Minute用来初始化一段路程的时间，和随着Timer变化改变剩余路程需要花费的时间
根据输入的Car的speed和Path的rest_distance，通过单位换算计算得到此时的Minute
* 后续可以考虑改变单位，此时改变换算公式即可
单位：int
### Class Path
路径节点，用来记录路径名称，距离长度` distance `，剩余距离长度` rest_distance `，和现在的距离长度（即按下目的地确认键之后当前位置的距离长度）` current_distance `
其余函数见Timer逻辑
### Class PathList
整个路径，可以记录` count `个数和目的地` dest `（当前未用），pathList类似队列
其余函数见Timer逻辑
### Timer逻辑
先初始化属性值后，在Timer中每次更新
pathList类的` pathDistanceChange ` -> path类的` rest_distanceChange ` -> 如果` rest_distance = 0 ` -> 发送` compeleted `信号，` complete `接收 -> pathList类的` pathDistanceChange `检查当前Path的` isComplete ` -> 如果为真，调用` dequeuePath() `，将该Ptah从List中删除
其余逻辑较为简单，不再赘述
