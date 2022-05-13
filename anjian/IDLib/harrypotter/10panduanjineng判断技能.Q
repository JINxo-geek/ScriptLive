//10判断技能
Sub panduanjineng()
Call gunjianpan()
    Call epo()
    Delay 200
   Call zhaohuanhuoban()
    Call niuniu()
     Delay 200
    Call shehu()
    Call leiniao()
    Call zhizhuchao()
     Delay 200
    Call mao()
     Delay 200
    Call panduanfeizei()
    Delay 200
    Call xiaojingling()
    TracePrint "技能释放完毕"

End Sub

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