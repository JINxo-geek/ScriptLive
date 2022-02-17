//1head
//HwndEx = Plugin.Window.Find(0, "哈利10g版(64)")
HwndEx = Plugin.Window.Find(0, "坎公(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-3(64)")
//HwndEx = Plugin.Window.Find(0, "哈利10g版-4(64)")
//HwndEx = Plugin.Window.Find(0, "雷电模拟器带微信(64)")

//操作句柄
Hwnd = Plugin.Window.FindEx(HwndEx, 0, 0, 0)

//获取句柄输出
TracePrint "取色句柄"& HwndEx
TracePrint "操作句柄"& Hwnd
//变量区



//按键码1~9的值为49~57,  A~O的值为65~79
Sub movetoone()


Call Plugin.Bkgnd.KeyPress(Hwnd,49)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,49)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换2"

Call Plugin.Bkgnd.KeyPress(Hwnd,50)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,50)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换3"
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,51)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,51)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换4"

  Call Plugin.Bkgnd.KeyPress(Hwnd,52)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,52)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换5"

  Call Plugin.Bkgnd.KeyPress(Hwnd,53)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,53)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换6"

  Call Plugin.Bkgnd.KeyPress(Hwnd,54)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,54)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换7"

  Call Plugin.Bkgnd.KeyPress(Hwnd,55)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,55)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换8"

  Call Plugin.Bkgnd.KeyPress(Hwnd,56)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,56)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换9"

  Call Plugin.Bkgnd.KeyPress(Hwnd,57)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,57)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换A"

  Call Plugin.Bkgnd.KeyPress(Hwnd,65)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,65)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换B"

  Call Plugin.Bkgnd.KeyPress(Hwnd,66)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,66)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换C"

  Call Plugin.Bkgnd.KeyPress(Hwnd,67)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,67)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换D"

  Call Plugin.Bkgnd.KeyPress(Hwnd,68)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,68)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换E"

  Call Plugin.Bkgnd.KeyPress(Hwnd,69)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,69)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换F"

  Call Plugin.Bkgnd.KeyPress(Hwnd,70)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,70)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换G"

  Call Plugin.Bkgnd.KeyPress(Hwnd,71)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,71)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换H"
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,72)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,72)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换I"
	
	
  Call Plugin.Bkgnd.KeyPress(Hwnd,73)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,73)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换J"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,74)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,74)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换K"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,75)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,75)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换L"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,76)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,76)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换M"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,77)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,77)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换N"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,78)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,78)
TracePrint "暂停"
	Delay 2000
	TracePrint "切换O"
	
  
  Call Plugin.Bkgnd.KeyPress(Hwnd,79)
	Delay 600000
Call Plugin.Bkgnd.KeyPress(Hwnd,79)
TracePrint "暂停"
	Delay 2000
	TracePrint "end"
	
  

End Sub

Call movetoone()