//5开始匹配


//为了在失败时bug进入其他卡牌界面的措施,在匹配颜色判断的另一个条件下
//开始匹配
Sub startpipei()
Color = Plugin.BkgndColor.GetPixelColor(HwndEx, 1570, 873)
Colorbug = Plugin.BkgndColor.GetPixelColor(HwndEx, 80, 92)
TracePrint "设置的Colorbug取值g" & Colorbug
TracePrint "此时匹配位置的颜色" & Color
TracePrint "设置的startColor取值" & startColor
If Color = startColor Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Delay 2000
ElseIf Colorbug = "13762559" Then
TracePrint "此时未匹配，进入bug返回"
//雷电模拟器自带的B返回,B的键盘码是66
Call Plugin.Bkgnd.KeyPress(Hwnd,66)

End If

End Sub
