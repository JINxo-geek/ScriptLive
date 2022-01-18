
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

