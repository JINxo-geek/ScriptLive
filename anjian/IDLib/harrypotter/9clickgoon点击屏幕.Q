//9点击屏幕,为了方便如复制卡成功后等的继续
Sub clickgoon()
TracePrint "移动点击到位置400.697,等待3秒"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 400,697)
  Delay 3000
End Sub
