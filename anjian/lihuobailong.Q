//优化,针对某种技能释放方式
//由于双击智能施法,技能会释放到鼠标知道的方向
//思路,在双击技能前,后台移动鼠标,再进行双击
//先获取句柄
Hwnd = Plugin.Window.Find("Win32Window", "哈利波特：魔法觉醒")
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


LogStart "D:\a.log"

// 坐标定位函数

Sub zuobiaoxianshi()
TracePrint "显示坐标"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1000, 75)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1679, 75)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1679, 730)
	Delay 500
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1000, 730)
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
	XY = Plugin.Bkgnd.FindPic(Hwnd, 200, 75, 1679, 730, "C:\Users\Administrator\Pictures\13级.bmp", 0, 0.9)
	Dim zhaoarray
	zhaoarray = Split(XY, "|")
	X = Clng(zhaoarray(0))
	Y = Clng(zhaoarray(1))
    If X < 0 Then 
    	TracePrint "没有找到白龙,尝试使用颜色识别白龙" & X & "," & Y
    XY = Plugin.BkgndColor.FindColorEx(Hwnd,  200, 75, 1679, 730, "94917B", 0, 0.9)  
	zhaoarray = Split(XY, "|")
	X = Clng(zhaoarray(0))
	Y = Clng(zhaoarray(1))
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
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 1000, 75, 1679, 730, "EDD41F",0,0.9)
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



Sub yidongfuwei()
Call Plugin.Bkgnd.LeftClick(Hwnd, 300, 450)
Call Plugin.Bkgnd.LeftClick(Hwnd, 300, 450)
End Sub

//丢毒瓶

Sub diuduping()
	
End Sub

//丢增益


Sub diuzengyi()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "72A56B",0,1)
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
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "546472",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim baixianarray
	baixianarray = Split(XY, "|")
	X = Clng(baixianarray(0))
	Y = Clng(baixianarray(1))+50
    TracePrint "膨胀x,y" & X + 50 & "," & Y
    
    If X < 0 Then 
    	TracePrint "没有找到白鲜"
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
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "546472",0,1)
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
	XY = Plugin.BkgndColor.FindColor(Hwnd, 710, 775, 1477, 967, "5075A2")
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
    TracePrint "找到wanshengxiuxiu"
    //Call diujineng()
	End If
	
End Sub
//嗅嗅

Sub panduanxiuxiu()
	XY = Plugin.BkgndColor.FindColor(Hwnd, 710, 775, 1477, 967, "5075A2")
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
    TracePrint "找到xiuxiu"
    //Call diujineng()
	End If
	
End Sub

Sub panduanfeizei()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "4F77A1",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X+50 & "," & Y
    If X > 0 Then 
    TracePrint "当前x,y" & X & "and" & Y
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    
    TracePrint "找到飞贼"
    //Call diujineng()
	End If
	
End Sub
Sub panduanlihuo
XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "2039CC",0, 1)
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
    //Call diujineng()
	End If
	
End Sub
Sub panduanzhizhu()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "8A836C",0, 1)
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
    TracePrint "找到蜘蛛"
    End If
End Sub

Sub panduanmaren()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "706645",0, 1)
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
    TracePrint "找到馬人"
    End If
End Sub

//白龙
Sub panduanbailong()
	XY = Plugin.BkgndColor.FindColorEx(Hwnd, 710, 775, 1477, 967, "35474D",0, 1)
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
    TracePrint "召唤白龙"
    End If
End Sub

//开始匹配
Sub startpipei()
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
End Sub

//Call shibiewu()
//Call shibieren()
Sub zhaohuanhuoban()
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
End Sub

//判断技能
Sub panduanjineng()
	Call zhaohuanhuoban()
	Call panduanbailong()
	//Call panduanlihuo()
	//Delay 1000
	//Call panduanzhizhu()
	Call panduanwanshengxiuxiu()
	//Call panduanmaren()
	Delay 500
	Call diupengzhang()
	Call diubaixian()
	//Call diuzengyi()
	Call panduanfeizei()
End Sub

//等待蓝
Sub waitlan()
	    //先丢嗅嗅飞贼,等待魔力大于7
	    Call panduanfeizei()
	    Call panduanwanshengxiuxiu()
    	Color = Plugin.BkgndColor.GetPixelColor(Hwnd, 1200, 980)
    	TracePrint "ColorStart" & Color
    	Do Until Color <> "5460893"
    	Color = Plugin.BkgndColor.GetPixelColor(Hwnd, 1200, 980)
    	TracePrint "Color" & Color
    	TracePrint "waitlan"
    	
     	//Call Plugin.Bkgnd.LeftClick(Hwnd, 1288, 980)
     	//Call Plugin.Bkgnd.LeftClick(Hwnd, 1288, 980)
     	TracePrint "开始匹配"
     	Call startpipei()
     	Delay 200
     	TracePrint "按下继续按钮返回按钮"
     	Call Plugin.Bkgnd.RightDown(Hwnd, 1000, 930)
 		Delay 500
 		Loop
	Call panduanjineng()
End Sub

Call startpipei()
Call Plugin.Bkgnd.RightDown(Hwnd, 1000, 930)
//Delay 200
//Call Plugin.Bkgnd.RightDown(Hwnd, 1000, 930)

Call waitlan()

