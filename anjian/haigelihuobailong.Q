//优化,针对某种技能释放方式
//由于双击智能施法,技能会释放到鼠标知道的方向
//思路,在双击技能前,后台移动鼠标,再进行双击
//先获取句柄
HwndEx = Plugin.Window.Find(0, "雷电模拟器(64)")
//HwndEx = Plugin.Window.Find(0, "哈利波特:魔法觉醒 - 标准引擎")
//HwndEx = Plugin.Window.Find(0, "雷电模拟器-1(64)")
//HwndEx = Plugin.Window.Find(0, "雷电模拟器-2(64)")
//HwndEx = Plugin.Window.Find(0, "雷电模拟器-3(64)")
Hwnd = Plugin.Window.FindEx(HwndEx, 0, 0, 0)
//MsgBox "查找到的父窗口句柄为："& Hwnd &"test"
//再获取坐标
Randomize
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


//LogStart "D:\a.log"

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

Sub yidongfuwei()
Call Plugin.Bkgnd.LeftClick(Hwnd, 300, 450)
Call Plugin.Bkgnd.LeftClick(Hwnd, 300, 450)
End Sub

//丢毒瓶

Sub diuduping()
	
End Sub

//丢增益

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

//万圣嗅嗅
Sub panduanwanshengxiuxiu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "C3D0E0",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X+50 & "," & Y
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到wanshengxiuxiu" & "点击坐标" & X & Y
    //Call diujineng()
	End If
	
End Sub

//嗅嗅

Sub panduanxiuxiu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5C7697",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
	
	If X < 0 Then 
    	TracePrint "没有找到嗅嗅" & X & "," & Y	
    End If
	
    TracePrint "x,y" & X+50 & "," & Y
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到xiuxiu" & "点击坐标" & X & Y
    //Call diujineng()
	End If
	
End Sub
Sub zhadan()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "4667A8",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim zhadanarray
	zhadanarray = Split(XY, "|")
	X = Clng(zhadanarray(0))
	Y = Clng(zhadanarray(1))
	
	If X < 0 Then 
    	TracePrint "没有找到炸弹" & X & "," & Y	
    End If
	
    TracePrint "x,y" & X+50 & "," & Y
    If X > 0 Then 
    //Call shibieren()
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到炸弹" & "点击坐标" & X & Y
    //Call diujineng()
	End If
	
End Sub
//56C5F1 3953A2
Sub panduanfeizei()
		XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1400, 967, "485C5F",1,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    If X < 0 Then 
    	TracePrint "没有找到飞贼" & X & "," & Y	
    End If
    If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "3953A2", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到妖怪书" & X & "," & Y	
    End If
    If X > 0 Then 
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
    Delay 50
     Call Plugin.Bkgnd.LeftClick(Hwnd, X - 50, Y)
      Delay 50
         Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
    
    TracePrint "找到飞贼" & "点击坐标" & X & Y
    //Call diujineng()
	End If
	
End Sub

//厉火
Sub panduanlihuo()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "202EB1",0, 1)
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
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到厉火"
    End If
End Sub

//蜘蛛
Sub zhizhu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "D88B83",0, 1)
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
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到蜘蛛" & "点击坐标" & X & Y
    End If
End Sub

//;雷鸟B0BEA8 ACC1A2
Sub leiniao()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "B2C0A5",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    
     If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "B0BDA2", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到雷鸟" & X & "," & Y	
    End If
    
   If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "558AA7", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到雷鸟" & X & "," & Y	
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
    TracePrint "找到雷鸟" & "点击坐标" & X & Y
    End If
End Sub
//3C434A 小精灵
Sub xiaojingling()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "7E523E",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    
    If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "81543E", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到小精灵" & X & "," & Y	
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
    TracePrint "找到小精灵" & "点击坐标" & X & Y
    End If
End Sub
//马人
Sub panduanmaren()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "87B8E2",0, 1)
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
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    TracePrint "找到马人" & "点击坐标" & X & Y
    End If
End Sub

//白龙
Sub panduanbailong()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "DEF8DF",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X+50 & "," & Y
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
    TracePrint "找到白龙" & "点击坐标" & X & Y
    End If
End Sub

//牛牛
Sub niuniu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5E6B9A",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X & "," & Y
  If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "7284D0", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到牛牛" & X & "," & Y	
    End If
    
    If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6475AC", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到牛牛" & X & "," & Y	
    End If
    
        If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6B79BC", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到3牛牛" & X & "," & Y	
    End If
    
     If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6971A9", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到牛牛" & X & "," & Y	
    End If
   If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, " 6473AA", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到牛牛" & X & "," & Y	
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
    TracePrint "找到牛牛" & "点击坐标" & X & Y
    End If
End Sub

//凤凰 6CC9D7
Sub fenghuang()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "61DEF6",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X & "," & Y
    
   	If X < 0 Then 
    	TracePrint "没有找到凤凰" & X & "," & Y	
    End If
    
  If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6CC9D7", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到凤凰" & X & "," & Y	
    End If
      If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "706F8A", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到凤凰" & X & "," & Y	
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
    TracePrint "找到凤凰" & "点击坐标" & X & Y
    End If
End Sub

//妖怪书
Sub yaoguaishu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5171A7",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X & "," & Y
    
   	If X < 0 Then 
    	TracePrint "没有找到妖怪书" & X & "," & Y	
    End If
    
  	If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6B85C1", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到妖怪书" & X & "," & Y	
    End If
    
    If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "496091", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到4妖怪书" & X & "," & Y	
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
    TracePrint "找到妖怪书" & "点击坐标" & X & Y
    End If
End Sub

//猫
Sub mao()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "3B3A34",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim maoarray
	maoarray = Split(XY, "|")
	X = Clng(maoarray(0))
	Y = Clng(maoarray(1))
    TracePrint "x,y" & X & "," & Y
    
      If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "403B33", 0, 1)
    lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    	TracePrint "没有找到灵猫" & X & "," & Y	
    End If
    
    
    If X > 0 Then 
     //Call shibieren()
    //Call Plugin.Bkgnd.MoveTo(Hwnd, X, Y)
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
    Delay 50
      Call Plugin.Bkgnd.LeftClick(Hwnd, X-50, Y)
    TracePrint "找到猫" & "点击坐标" & X & Y
    End If
End Sub

//开始匹配 3552827
Sub startpipei()
Color3 = Plugin.BkgndColor.GetPixelColor(HwndEx, 1570, 873)
TracePrint "此时匹配位置的颜色" & Color3
If Color3 = "3552827" Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
End If

End Sub

//伙伴
Sub zhaohuanhuoban()
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
Delay 500
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
End Sub

//失败匹配
Sub failback()
	Color2 = Plugin.BkgndColor.GetPixelColor(HwndEx, 896, 970)

	TracePrint "此时失败位置的颜色" & Color2
	
	If Color2 = "7711161" Then 
	TracePrint "失败返回"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	
	End If

End Sub

//结束战斗,点击确认
Sub endfight()
	Color5 = Plugin.BkgndColor.GetPixelColor(HwndEx, 896, 970)
	Color6 = Plugin.BkgndColor.GetPixelColor(HwndEx,1309,156 )
	TracePrint "此时结束战斗" & Color5
	TracePrint "此时结束战斗,胜利了" & Color6
	If Color5 = "3752013" Then 
	TracePrint "点击确认"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	
	End If
	
	If Color5 = "3692402" Then 
	TracePrint "胜利了点击继续"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	
	End If
	
	If Color5 = "2575467" Then 
	TracePrint "胜利了点击继续"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率
Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	
	End If
End Sub


Sub yidong()
	Call Plugin.Bkgnd.KeyPress(Hwnd, 9)
End Sub


//判断技能
Sub panduanjineng()

    //Call panduanlihuo()
    Call fenghuang()
    Delay 200
	Call zhaohuanhuoban()
	 Delay 200
	Call niuniu()
	 Delay 200
	Call zhizhu()
	 Delay 200
	 Call yaoguaishu()
	 Delay 200
	//Call panduanbailong()
	Call leiniao()
	 Delay 200
	Call xiaojingling()
	 Delay 200
	Call mao()
	 Delay 200
	Call panduanwanshengxiuxiu()
	 Delay 200
	Call panduanxiuxiu()
	 Delay 200
	Call zhutu()
	 Delay 200
	Call zhadan()
	 Delay 200
	Call panduanmaren()
	 Delay 200
	//Call diupengzhang()
	//Call diuzengyi()
	Call panduanfeizei()
	TracePrint "技能释放完毕"
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

//判断是否在决斗场
Sub induel()
	    //根据下边颜色
    	Color4 = Plugin.BkgndColor.GetPixelColor(HwndEx,250,980)
    	TracePrint "是否进入角斗场ColorStart" & Color4
    	//梨木
    	//Do Until Color <> "2697762"
    	//海格魔杖有能量 & 无能量3290415 
If Color4 = "2564119" Then 
	TracePrint "在决斗场内,释放技能"
	Call panduanjineng()
End If

End Sub



Sub test()
Dim Color
Color = "1111"

While Color = "1111"
TracePrint "循环"
	Delay 1000
Wend	
	
End Sub
Call startpipei()
Call failback()
Call endfight()
Call yidong()
//Call zuobiaoxianshi()
Call induel()
Delay 1000

