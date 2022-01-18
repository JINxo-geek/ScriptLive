//12判断是否在决斗场
Sub induel()
	    //根据下边颜色
    	Color4 = Plugin.BkgndColor.GetPixelColor(HwndEx,250,980)
    	TracePrint "是否进入角斗场ColorStart" & Color4
    	//梨木
    	//Do Until Color <> "2697762"
    	//海格魔杖有能量 & 无能量3290415 
        TracePrint "induelColor" & induelColor
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