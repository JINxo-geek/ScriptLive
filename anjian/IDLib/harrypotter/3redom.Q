Randomize
//GetClientRect得到窗口句柄的客户区大小
sRect = Plugin.Window.GetClientRect(Hwnd)
Dim MyArray
MyArray = Split(sRect, "|")
L = Clng(MyArray(0))
T = Clng(MyArray(1))
R = Clng(MyArray(2))
B = Clng(MyArray(3))
//进行随机坐标
Y = Int((800 - 200 + 1) * Rnd + 200)
X = Int((600 - 200 + 1) * Rnd + 200)
//TracePrint X
//TracePrint Y
//Msgbox "左" & L & ",右 " & R & ",上" & T & ",下" & B
//记录日志
//LogStart "D:\a.log"