
Hwnd = Plugin.Window.Search("手机屏幕")

//获取句柄
TracePrint "第一层句柄"& Hwnd

Dim HwndArray
HwndArray = Split(Hwnd,"|")

If UBound(HwndArray) >= 0 Then 
	i = 0
	For UBound(HwndArray)
		TracePrint "第" & i + 1 & "个句柄窗口为" & Clng(HwndArray(i))
		Hwnd = Clng(HwndArray(i))
		i=i+1
	Next
	
End If


HwndEx = Plugin.Window.FindEx(Hwnd,0,0,0)

TracePrint "Hwnd" & Hwnd
TracePrint "HwndEx" & HwndEx
//返回按钮
Sub back()
  Call Plugin.Bkgnd.LeftClick(HwndEx, 370, 1300)
 Call Plugin.Bkgnd.LeftClick(HwndEx, 100, 100)

	 TracePrint "点击返回"
End Sub

Delay 1000

//识别按钮颜色
Sub clickkey()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 400, 0, 500, 1000, "406AFF",0, 1)
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

Sub click()
	 Call Plugin.Bkgnd.LeftClick(HwndEx, 100, 200)


End Sub

Sub init()
Call clickkey()
//Call back()
End Sub

Call init()
Call click()
//Call back()