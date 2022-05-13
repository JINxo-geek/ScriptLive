//4识别库
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
		XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1400, 967, "5B7383",1,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    If X < 0 Then 
    	TracePrint "没有找到飞贼2" & X & "," & Y	
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
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
     Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
      Delay 50
         Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    

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
        	TracePrint "没有找到雷鸟" & X & "," & Y	
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "B0BAA2", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))

    End If

   If X < 0 Then 
  TracePrint "没有找到雷鸟4" & X & "," & Y	

    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "5B93B4", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))

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
	XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "79ADC1",0,1)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 710, 775)
    //Call Plugin.Bkgnd.LeftClick(Hwnd, 1477, 976)
	Dim lihuoarray
	lihuarray = Split(XY, "|")
	X = Clng(lihuarray(0))
	Y = Clng(lihuarray(1))
    TracePrint "x,y" & X + 50 & "," & Y
    

    If X < 0 Then 
TracePrint "没有找到小精灵1" & X & "," & Y	
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "956444", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))

    End If
    
 If X < 0 Then 
TracePrint "没有找到小精灵4" & X & "," & Y	
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "81543E", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))

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
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
     Delay 50
    Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
    Delay 50
      Call Plugin.Bkgnd.LeftClick(Hwnd, X, Y)
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
If X < 0 Then 
TracePrint "没有找到epo3" & X & "," & Y
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "6C73B3", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    End If
     If X < 0 Then 
TracePrint "没有找到epo2" & X & "," & Y	
    XY = Plugin.BkgndColor.FindColorEx(HwndEx, 710, 775, 1477, 967, "9495E5", 0, 1)
    lihuoarray = Split(XY, "|")
    X = Clng(lihuoarray(0))
    Y = Clng(lihuoarray(1))
    End If
          If X < 0 Then 
TracePrint "没有找到epo4" & X & "," & Y	

    End If
              If X < 0 Then 
TracePrint "没有找到epo4" & X & "," & Y	


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