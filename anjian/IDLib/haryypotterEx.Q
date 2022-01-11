
//优化,针对某种技能释放方式
//由于双击智能施法,技能会释放到鼠标知道的方向
//思路,在双击技能前,后台移动鼠标,再进行双击
//先获取句柄
//获取不同模拟器的句柄

//config
Dim startColor
Dim failColor
Dim induelColor
Dim selectColor


startColor = 2171171
failColor = 7842747
induelColor = 2695448
selectColor = 13236216
//HwndEx = Plugin.Window.Find(0, "雷电模拟器-哈利10g版(64)")

//HwndEx = Plugin.Window.Find(0, "雷电模拟器重点(64)")
HwndEx = Plugin.Window.Find(0, "雷电模拟器-哈利10g版(64)")

Hwnd = Plugin.Window.FindEx(HwndEx, 0, 0, 0)
//获取句柄输出
TracePrint "取色句柄"& HwndEx
TracePrint "操作句柄"& Hwnd

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

//记录日志
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
//炸弹
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
//56C5F1 3953A2 金色飞贼
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
//蜘蛛巢穴
Sub zhizhuchao()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "7F8678",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    

     If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5A6C6D", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到蜘蛛巢穴2" & X & "," & Y	
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
    TracePrint "找到蜘蛛巢穴4" & "点击坐标" & X & Y
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
    

    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5B93B4", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到雷鸟4" & X & "," & Y	
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
    

    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5A5435", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到牛牛1" & X & "," & Y	
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

//白龙 6CC9D7
Sub bailong()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6595C3",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X & "," & Y
    

   	If X < 0 Then 
   		TracePrint "没有找到白龙" & X & "," & Y	
   	End If

  If X < 0 Then 
    

    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6687A2", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到白龙" & X & "," & Y	
    End If
      If X < 0 Then 
    
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "92CFF4", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到白龙" & X & "," & Y	
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
    TracePrint "找到白龙" & "点击坐标" & X & Y
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
//蛇壶
Sub shehu()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "50403E",0, 1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuoarray = Split(XY, "|")
	X = Clng(lihuoarray(0))
	Y = Clng(lihuoarray(1))
    TracePrint "x,y" & X & "," & Y
    

   	If X < 0 Then 
   		TracePrint "3号没有找到蛇壶" & X & "," & Y	
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
   	TracePrint "找到蛇壶" & "点击坐标" & X & Y
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
 If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "3D3738", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到灵猫1" & X & "," & Y	
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

//eponiao恶婆鸟
Sub epo()
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "535F87",0, 1)
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
    	TracePrint "没有找到epo3" & X & "," & Y	
    End If
     If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "7979C1", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到epo2" & X & "," & Y	
    End If
          If X < 0 Then 
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6574A4", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    	TracePrint "没有找到epo1" & X & "," & Y	
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
    TracePrint "找到epo" & "点击坐标" & X & Y
    End If

End Sub

//开始匹配 3552827
Sub startpipei()
Color3 = Plugin.BkgndColor.GetPixelColor(HwndEx, 1570, 873)
TracePrint "此时匹配位置的颜色" & Color3
TracePrint "startColor" & startColor
If Color3 = startColor Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
End If
If Color3 = "3552828" Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
End If
If Color3 = "3552827" Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
End If

End Sub

//伙伴
Sub zhaohuanhuoban()
//Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
Delay 500
//Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
//雷电模拟器自带的~绑定的技能键召唤,~的键盘码是192

//雷电模拟器R键82,绑定丢伙伴
Call Plugin.Bkgnd.KeyPress(Hwnd, 82)
End Sub

//失败匹配
Sub failback()
	Color2 = Plugin.BkgndColor.GetPixelColor(HwndEx, 896, 970)

	TracePrint "此时失败位置的颜色" & Color2



		If Color2 = failColor Then 
	TracePrint "失败返回"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率

Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	

	End If
	
	If Color2 = "7711161" Then 
	TracePrint "失败返回"
	//和雷电模拟器快捷键f绑定在失败位置提高准确率

Call Plugin.Bkgnd.KeyPress(Hwnd, 70)
	//Call Plugin.Bkgnd.LeftClick(Hwnd, 900, 920)
	

	End If


End Sub

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

//点击屏幕,为了方便如复制卡成功后等的继续
Sub clickgoon()
TracePrint "移动点击到位置400.697,等待3秒"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 400,697)
  Delay 3000
End Sub




//判断技能
Sub panduanjineng()

    //Call panduanlihuo()
    Call epo()
    //Call bailong()
    Delay 200
    //Call fenghuang()
    Delay 200
   Call zhaohuanhuoban()
    // Delay 200
    Call niuniu()
     Delay 200
    //Call zhizhu()
     //Delay 200
    // Call yaoguaishu()
    // Delay 200
    Call shehu()
    Call leiniao()
    Call zhizhuchao()
     Delay 200
    //Call xiaojingling()
     //Delay 200
    Call mao()
     Delay 200
    //Call panduanwanshengxiuxiu()
     //Delay 200
    //Call panduanxiuxiu()
     //Delay 200
    //Call zhutu()
     //Delay 200
    //Call zhadan()
     //Delay 200
    //Call panduanmaren()
     //Delay 200
    //Call diupengzhang()
    //Call diuzengyi()
    Call panduanfeizei()
    TracePrint "技能释放完毕"

End Sub

Sub yidonghefangjineng()
TracePrint "移动到位置(200,100),等待5秒"
Call Plugin.Bkgnd.LeftClick(Hwnd, 200,100)
Delay 5000
//滚键盘,触发雷电模拟器录制的释放技能F
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
End Sub

//判断是否在决斗场
Sub induel()
	    //根据下边颜色
    	Color4 = Plugin.BkgndColor.GetPixelColor(HwndEx,250,980)
    	TracePrint "是否进入角斗场ColorStart" & Color4
    	//梨木
    	//Do Until Color <> "2697762"
    	//海格魔杖有能量 & 无能量3290415 
        TracePrint "induelColor" & induelColor
If Color4 = induelColor Then 
	TracePrint "在决斗场内,释放技能"
	Call panduanjineng()
  //Call yidonghefangjineng()
End If
If Color4 = "2236190" Then 
	TracePrint "在决斗场内,释放技能"
	Call panduanjineng()
End If

End Sub


//选择人物,第一个或者第二个
Sub selectfunc()
	Color5 = Plugin.BkgndColor.GetPixelColor(HwndEx,1061,938)
  	TracePrint "是否选择人物" & Color4
    TracePrint "selectColor" & selectColor
If Color5 = selectColor Then 
TracePrint "选择人物"
 //选择第二个
//键盘码Tab为9
Call Plugin.Bkgnd.KeyPress(Hwnd, 9)
End If
End Sub


Sub init()
Call startpipei()
//Call selectfunc()
Call failback()
Call endfight()
Call induel()

End Sub
Call init()

//测试显示坐标
//Call zuobiaoxianshi()

Delay 1000

