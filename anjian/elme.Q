

Hwnd = 134612
HwndEx = 593252
//返回按钮
Sub back()
	 Call Plugin.Bkgnd.LeftClick(HwndEx, 406,1043)
End Sub

Delay 1000

//识别按钮颜色
Sub clickkey()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 400, 0, 500, 1000, "435DF3",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X+50 & "," & Y
    If X > 0 Then 
     //Call shibieren()
    //Call Plugin.Bkgnd.MoveTo(Hwnd, X, Y)
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(HwndEx, X, Y)
    TracePrint "找到按钮" & "点击坐标" & X & Y
    Call wait()
	Call back()
    End If
    If X < 0 Then 
    	Call down
    End If
    
End Sub

//等待15s返回
Sub wait()
TracePrint "等待20S"
	Delay 20000
End Sub

Sub down()
	Call Plugin.Bkgnd.KeyPress(HwndEx, 40)
		Call Plugin.Bkgnd.KeyPress(HwndEx, 40)
			Call Plugin.Bkgnd.KeyPress(HwndEx, 40)
				Call Plugin.Bkgnd.KeyPress(HwndEx, 40)
					Call Plugin.Bkgnd.KeyPress(HwndEx,40)
End Sub

Sub init()
Call clickkey()
//Call back()
End Sub

Call init()
