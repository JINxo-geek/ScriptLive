
Hwnd = Plugin.Window.Find(0, "傲软投屏直播窗口")

//获取句柄输出
TracePrint "第一层句柄"& Hwnd
//需要全屏显示的时候
//第二层句柄一直获取失败,需要手动抓取

HwndEx = 527818




//返回按钮
Sub back()
	 Call Plugin.Bkgnd.LeftClick(HwndEx, 500, 1300)
	 TracePrint "点击返回"
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
    	 TracePrint "没有找到" & X & "," & Y
    End If
    
End Sub

//等待15s返回
Sub wait()
TracePrint "等待20S"
	Delay 20000
TracePrint "等待结束,返回"	
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

//Call init()
Call back()