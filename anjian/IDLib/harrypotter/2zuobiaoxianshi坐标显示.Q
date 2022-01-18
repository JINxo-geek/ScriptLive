// 坐标定位函数
Sub zuobiaoxianshi()
TracePrint "显示坐标"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 775)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 967)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 967)
End Sub