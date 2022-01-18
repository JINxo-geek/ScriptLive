Sub yidonghefangjineng()
TracePrint "移动到位置(200,100),等待5秒"
Call Plugin.Bkgnd.LeftClick(Hwnd, 200,100)
Delay 5000
//滚键盘,触发雷电模拟器录制的释放技能F
Call Plugin.Bkgnd.KeyPress(Hwnd, 192)
End Sub
