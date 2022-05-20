//11滚键盘，使用模拟器的数字触发技能

Sub gunjianpan()
TracePrint "滚键盘"
Call Plugin.Bkgnd.KeyPress(Hwnd, 97)
Delay 50
Call Plugin.Bkgnd.KeyPress(Hwnd, 97)
Call Plugin.Bkgnd.KeyPress(Hwnd, 97)
Delay 1000
Call Plugin.Bkgnd.KeyPress(Hwnd, 98)
Delay 50
Call Plugin.Bkgnd.KeyPress(Hwnd, 98)
Call Plugin.Bkgnd.KeyPress(Hwnd, 98)
Delay 1000
Call Plugin.Bkgnd.KeyPress(Hwnd, 99)
Delay 50
Call Plugin.Bkgnd.KeyPress(Hwnd, 99)
Call Plugin.Bkgnd.KeyPress(Hwnd, 99)
Delay 1000
Call Plugin.Bkgnd.KeyPress(Hwnd, 100)
Delay 50
Call Plugin.Bkgnd.KeyPress(Hwnd, 100)
Call Plugin.Bkgnd.KeyPress(Hwnd, 100)
Delay 1000
End Sub