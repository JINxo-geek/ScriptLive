//15 autoline
//自动走到中线位置，加快死亡

//9点击屏幕,为了方便如复制卡成功后等的继续
Sub autoline()
TracePrint "移动点击到位置400.697,等待3秒"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 400,697)
  Delay 1000
End Sub

