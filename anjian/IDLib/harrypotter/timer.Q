//获取当前的小时和分钟
 h = Hour(Now)
 s = Minute(Now)

If h > 4 Then 
Call init()
ElseIf h<5 and h>0 Then
TracePrint "此刻处0到5"
Else 
TracePrint "此刻非"
End If

Sub init()
	TracePrint "执行"
End Sub

