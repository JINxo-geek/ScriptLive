//结束战斗,点击确认
Sub endfight()
Call clickgoon()
	Color5 = Plugin.BkgndColor.GetPixelColor(HwndEx, 896, 970)
	Color6 = Plugin.BkgndColor.GetPixelColor(HwndEx,1309,156)
	TracePrint "此时结束战斗" & Color5
	TracePrint "此时结束战斗,胜利了" & Color6
	If Color5 = "3752013" Then 
	TracePrint "点击确认"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	

	End If

XY = Plugin.BkgndColor.FindColorEx(HwndEx, 1276, 92, 1523, 207, "92F5FE",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim colorv
	colorv = Split(XY, "|")
	X = Clng(colorv(0))
	Y = Clng(colorv(1))
    TracePrint "x,y" & X & "," & Y
   	If X < 0 Then 
   		TracePrint "没有胜利" & X & "," & Y	
   	End If
   	If X < 0 Then 
   	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6B85C1", 0, 1)
   	colorv = Split(XY, "|")
   	X = Clng(colorv(0))
   	Y = Clng(colorv(1))
   		TracePrint "没有胜利" & X & "," & Y	
   	End If
    If X > 0 Then 
     //Call shibieren()
    //Call Plugin.Bkgnd.MoveTo(Hwnd, X, Y)
    TracePrint "当前x,y" & X & "and" & Y
    TracePrint "胜利了继续" & "点击坐标"
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)    
    End If
End Sub