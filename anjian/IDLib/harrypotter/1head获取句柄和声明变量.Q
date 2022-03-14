//1head
//HwndEx = Plugin.Window.Find(0, "哈利10g版(64)")
HwndEx = Plugin.Window.Find(0, "哈利10g版-2(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-3(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-4(64)")
//HwndEx = Plugin.Window.Find(0, "雷电模拟器带微信(64)")

//操作句柄
Hwnd = Plugin.Window.FindEx(HwndEx, 0, 0, 0)

//获取句柄输出
TracePrint "取色句柄"& HwndEx
TracePrint "操作句柄"& Hwnd
//变量区
Dim startColor
Dim failColor
Dim induelColor
Dim selectColor
Dim selectjinlin
//训练模式2171427
//排位模式2105379
startColor = 2171427
failColor = 7646139
induelColor = 2564119
selectColor = 13236216
selectjinlin = 13882799


