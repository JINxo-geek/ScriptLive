//12判断是否在决斗场
Sub induel()
	    //根据下边颜色
    	Color4 = Plugin.BkgndColor.GetPixelColor(HwndEx,250,980)  
    	//Do Until Color <> "2697762"
        TracePrint "设置的induelColor为" & induelColor
         TracePrint "获取到的induelColor为" & Color4
If Color4 = induelColor Then 
	TracePrint "在决斗场内,释放技能"
	Call panduanjineng()
  //Call yidonghefangjineng()
End If
If Color4 = "2236190" Then 
	TracePrint "在决斗场内,释放技能"
	Call panduanjineng()
End If

End Sub