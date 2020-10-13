[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=0c26952d-74f7-465b-9cf2-53dea0abb6e6
Description=我的脚本2
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
DO
For 5
FindPic 0,0,1920,1080,"D:\1\00.bmp",0.8,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 3000
End If
FindPic 0,0,1920,1080,"D:\1\13.bmp",0.8,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 3000
End If
FindPic 0,0,1920,1080,"D:\1\14.bmp",0.8,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 5000
MoveTo 900, 450
End If
FindPic 0,0,1920,1080,"D:\1\01.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 3000
End If
FindPic 0,0,1920,1080,"D:\1\02.bmp",0.8,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
End If
FindPic 0,0,1920,1080,"D:\1\03.bmp",0.7,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
RightClick 1
End If
FindPic 0,0,1920,1080,"D:\1\05.bmp",0.8,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
RightClick 1
End If
FindPic 0,0,1920,1080,"D:\1\06.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
End If
FindPic 0,0,1920,1080,"D:\1\07.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 5000
MoveTo 900, 450
End If
FindPic 0,0,1920,1080,"D:\1\08.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 1000
MoveTo 900, 450
RightClick 1
End If
FindPic 0,0,1920,1080,"D:\1\09.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 1000
MoveTo 600, 250
RightClick 1
End If
FindPic 0,0,1920,1080,"D:\1\10.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 1000
MoveTo 1000, 550
RightClick 1
End If
FindPic 0,0,1920,1080,"D:\1\11.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
MoveTo intX, intY
Delay 500
LeftClick 1
Delay 1000
MoveTo 1200, 250
RightClick 1
End If
delay 500
next
MoveTo 400, 1000
LeftClick 1
deley 1000
Loop

