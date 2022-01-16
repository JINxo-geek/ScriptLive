HwndEx = Plugin.Window.Find(0, "哈利10g版(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-2(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-3(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-4(64)")

Hwnd = Plugin.Window.FindEx(HwndEx, 0, 0, 0)
//获取句柄输出
TracePrint "取色句柄"& HwndEx
TracePrint "操作句柄"& Hwnd

