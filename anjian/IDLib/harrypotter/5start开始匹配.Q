//5开始匹配


//为了在失败时bug进入其他卡牌界面的措施,在匹配颜色判断的另一个条件下
//开始匹配
Sub startpipei()
Color = Plugin.BkgndColor.GetPixelColor(HwndEx, 1570, 873)
Colorbug = Plugin.BkgndColor.GetPixelColor(HwndEx, 1736,384)

TracePrint "设置的Colorbug取值" & Colorbug
TracePrint "此时匹配位置的颜色" & Color
TracePrint "设置的startColor取值" & startColor
Delay 1000
If Color = startColor Then
TracePrint "开始匹配"
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
	Delay 6000
ElseIf Colorbug = "10997994"  Then
TracePrint "此时未匹配，进入bug返回"
//保险确认
//Call Plugin.Bkgnd.LeftClick(Hwnd, 1615, 890)
Delay 1000
//雷电模拟器自带的B返回,B的键盘码是66
Call Plugin.Bkgnd.KeyPress(Hwnd,66)
Delay 2000
End If
End Sub
