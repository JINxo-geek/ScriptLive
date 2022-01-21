//13禁林紫红本选择技能,头顶上方文字为13882799颜色
Sub selectfuncjinlin()
	Color5 = Plugin.BkgndColor.GetPixelColor(HwndEx,1010,85)
  	TracePrint "jin'lin'jin是否选择技能,此时头顶文字色" & Color5
    TracePrint "selectjinlin" & selectjinlin
 If Color5 = selectjinlin Then 
TracePrint "选择技能按T"
Delay 4000
 //选择第二个
//键盘码T为84
Call Plugin.Bkgnd.KeyPress(Hwnd, 84)
End If

End Sub
