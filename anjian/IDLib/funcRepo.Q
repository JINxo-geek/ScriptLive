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
//识别雾
Sub shibiewu()
	XY = Plugin.BkgndColor.FindColor(Hwnd, 1000, 200, 1679, 730, "969F95")
	Dim wuarray
	wuarray = Split(XY, "|")
	X = Clng(wuarray(0))
	Y = Clng(wuarray(1))
    TracePrint "x,y" & X+50 & "," & Y+300
    If X > 0 Then 
    TracePrint "丢技能"
    Call diujineng()
	End If
End Sub

//根据红色血条判断对面目标位置
Sub shibieren()
	XY = Plugin.BkgndColor.FindColor(Hwnd, 1000, 75, 1679, 730, "1F49E1")
	Dim wuarray
	wuarray = Split(XY, "|")
	X = Clng(wuarray(0))
	Y = Clng(wuarray(1))
    TracePrint "x,y" & X+50 & "," & Y+300
    If X > 0 Then 
    Call Plugin.Bkgnd.MoveTo(Hwnd, X+50, Y+100)
    TracePrint "向人丢技能"
	End If
End Sub

//识别白龙位置,最简单的是根据白龙等级,进行图片识别
Sub shibiebailongweizhi()
	//Call zuobiaoxianshi()
	XY = Plugin.Bkgnd.FindPic(Hwnd, 200, 75, 1679, 730, "C:\Users\Administrator\Pictures\13级.bmp", 0, 1)
	Dim zhaoarray
	zhaoarray = Split(XY, "|")
	X = Clng(zhaoarray(0))
	Y = Clng(zhaoarray(1))
    If X < 0 Then 
    	TracePrint "没有找到白龙" & X & "," & Y
    	Call Plugin.Bkgnd.LeftUp(Hwnd, X + 50, Y + 300)
    	

    End If
    
    If X > 0 Then 
    TracePrint "找到白龙,鼠标移动至x,y" & X & "," & Y
    //MoveTo X+50,Y+100
    Call Plugin.Bkgnd.MoveTo(Hwnd, X + 50, Y + 300)
    TracePrint "LeftUp向自己白龙召唤物丢技能,弹起左键" 
    Call Plugin.Bkgnd.LeftUp(Hwnd, X+50, Y+300) 
    End If

End Sub

//识别召唤物，对面位置上的，给膨胀，白鲜使用

Sub shibiezhaohuan()
	//Call zuobiaoxianshi()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 1000, 75, 1679, 730, "EDD41F",0,1)
	Dim zhaoarray
	zhaoarray = Split(XY, "|")
	X = Clng(zhaoarray(0))
	Y = Clng(zhaoarray(1))
    If X < 0 Then 
    	TracePrint "没有找到对面场友方" & X & "," & Y
    	Call Plugin.Bkgnd.LeftUp(Hwnd, X+50, Y+300) 
    End If
    

    If X > 0 Then 
    TracePrint "鼠标移动至x,y" & X & "," & Y
    //MoveTo X+50,Y+100
    Call Plugin.Bkgnd.MoveTo(Hwnd, X + 50, Y + 300)
    TracePrint "LeftUp向自己召唤物丢技能,弹起左键"
    Call Plugin.Bkgnd.LeftUp(Hwnd, X+50, Y+300) 
    End If

End Sub

//滚键盘丢技能
Sub diujineng()
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
Call Plugin.Bkgnd.KeyPress(Hwnd, 49)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 49)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 49)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 50)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 50)
Call Plugin.Bkgnd.KeyPress(Hwnd, 51)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 51)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 51)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 52)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 52)
Delay 100
Call Plugin.Bkgnd.KeyPress(Hwnd, 52)
End Sub

//猪突,纽特技能
Sub zhutu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "595D27",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim zhutuarray
	zhutuarray = Split(XY, "|")
	X = Clng(zhutuarray(0))
	Y = Clng(zhutuarray(1))
    TracePrint "x,y" & X & "," & Y
    

        If X < 0 Then 
    	TracePrint "没有找到纽特猪突"
    End If
    
    If X > 0 Then 
     //Call shibieren()
    //Call Plugin.Bkgnd.MoveTo(Hwnd, X, Y)
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "释放猪突" & "点击坐标" & X & Y
    End If

End Sub

//丢增益
Sub diuzengyi()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "72A56B",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim zengyiarray
	zengyiarray = Split(XY, "|")
	X = Clng(zengyiarray(0))
	Y = Clng(zengyiarray(1))+50
    TracePrint "增益x,y" & X + 50 & "," & Y
    

    If X < 0 Then 
    	TracePrint "没有找到增益"
    End If
    
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftDown(Hwnd, X, Y)
    Delay 50
    TracePrint "LeftDown按下左键拖动增益"
    Call shibiebailongweizhi()
    End If

End Sub

//丢白鲜

Sub diubaixian()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "546472",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim baixianarray
	baixianarray = Split(XY, "|")
	X = Clng(baixianarray(0))
	Y = Clng(baixianarray(1))+50
    TracePrint "膨胀x,y" & X + 50 & "," & Y
    

    If X < 0 Then 
    	TracePrint "没有找到白鲜" & "点击坐标" & X & Y
    End If
    
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftDown(Hwnd, X, Y)
    Delay 50
    TracePrint "LeftDown按下左键拖动白鲜"
    Call shibiebailongweizhi()
    End If

End Sub

//丢膨胀

Sub diupengzhang()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "546472",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim penzhangarray
	penzhangarray = Split(XY, "|")
	X = Clng(penzhangarray(0))
	Y = Clng(penzhangarray(1))+50
    TracePrint "膨胀x,y" & X + 50 & "," & Y
    

    If X < 0 Then 
    	TracePrint "没有找到膨胀"
    End If
    
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftDown(Hwnd, X, Y)
    Delay 50
    TracePrint "LeftDown按下左键拖动膨胀"
    Call shibiebailongweizhi()
    End If

End Sub

//等待蓝
Sub waitlan()
	    //先丢嗅嗅飞贼,等待魔力大于7
    	Color = Plugin.BkgndColor.GetPixelColor(HwndEx,250,980)
    	TracePrint "是否进入角斗场ColorStart" & Color
    	//梨木
    	//Do Until Color <> "2697762"
    	//海格魔杖有能量 & 无能量3290415 
    While Color = "3290415"
    	Color = Plugin.BkgndColor.GetPixelColor(HwndEx, 700, 980)
    	TracePrint "此时能量条Color" & Color
    	TracePrint "waitlan"
	    

     	Call startpipei()
     	Delay 200
     	Call failback()
    	Delay 1000
    Wend
    
    TracePrint "跳出能量等待"
    Call panduanjineng()

End Sub

Sub test()
Dim Color
Color = "1111"

While Color = "1111"
TracePrint "循环"
	Delay 1000
Wend	
	
End Sub

//随机数

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
