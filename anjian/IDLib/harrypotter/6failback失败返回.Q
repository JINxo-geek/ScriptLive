
//6失败匹配
Sub failback()
	Color = Plugin.BkgndColor.GetPixelColor(HwndEx, 896, 970)
	TracePrint "此时失败位置的颜色" & Color
		If Color = failColor Then 
	TracePrint "失败返回"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	End If
	If Color = "7711161" Then 
	TracePrint "失败返回"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	End If
End Sub