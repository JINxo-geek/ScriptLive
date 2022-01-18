//demo
Sub demo()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "D88B83",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim demoarray
	demoarray = Split(XY, "|")
	X = Clng(demoarray(0))
	Y = Clng(demoarray(1))
   
    If X < 0 Then   
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5A6C6D", 0, 1)
    demoarray = Split(XY, "|")
    X = Clng(demoarray(0))
    Y = Clng(demoarray(1))
    	TracePrint "没有找到demo2" & X & "," & Y	
    End If
    If X < 0 Then   
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5A6C6D", 0, 1)
    demoarray = Split(XY, "|")
    X = Clng(demoarray(0))
    Y = Clng(demoarray(1))
    	TracePrint "没有找到demo3" & X & "," & Y	
    End If
    If X < 0 Then   
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5A6C6D", 0, 1)
    demoarray = Split(XY, "|")
    X = Clng(demoarray(0))
    Y = Clng(demoarray(1))
    	TracePrint "没有找到demo4" & X & "," & Y	
    End If

    If X > 0 Then 
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到demo1" & "点击坐标" & X & Y
    End If
End Sub
