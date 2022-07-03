IfNotExist, %A_ScriptDir%\bin\yellow.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
InputBox, level, weight Level, Please enter level., , 200, 150
if ErrorLevel = 1
{
	ExitApp
}

If not (level = "1" or level = "2" or level = "3" or level = "4" or level = "5" or level = "6")
{
    tooltip, Look like level %level% not exist in this version of macro
    SetTimer, removetooltip, -3000
    return
}
InputBox, logs, how many weight you want to do?, use for auto leave if nonstop put text in it
if ErrorLevel = 1
{	
    ExitApp
}
MsgBox, 4, Auto Protein, Do you want to use protein? [Slot 0]
IfMsgBox Yes
{
	protein = true
}
Else
{
	protein = false
}
MsgBox, 4, Stamina Detection
IfMsgBox Yes
{
	stam = true
}
Else
{
	stam = false
}


#maxThreadsPerHotkey, 2
Loop, 3
{	
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
	Sleep 100
}
CenterWindow(WinTitle)
{	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}
removetooltip()
{
    Tooltip
}
end::reload
f1::
CoordMode, Pixel, Window
CoordMode, Mouse, Window
macro_on := !macro_on
if (macro_on)
{	bruh = 0
	CoordMode , Pixel, Window
	PixelGetColor , color2, 250, 134,
    Loop,
    {

		if protein = true
		{			
			temp++
			Sleep 100
			Click , 410, 455
			Sleep 100
			Send 0
			Sleep 50
			Send {Click 10}
			Sleep 8000
			Send 0
			StartTime7 := A_TickCount
			Loop ,
			{				
				Click, 400, 390
				Sleep 16
			} Until A_TickCount - StartTime7 > 2000
			if temp = 5
			{				
				protein = false
			}		
		}
		Loop, 3
		{
			toolTip, %A_Index%
			SetTimer, removetooltip, -3000
			if level = 6
			{
				Click , 340, 400 ; select level
				Click , 340, 401 ; select level
				Sleep 200
			}
			if level = 5
			{
				Click , 340, 370
				Click , 340, 371
				Sleep 200
			}
			if level = 4
			{
				Click , 340, 340
				Click , 340, 341
				Sleep 200
			}
			if level = 3
			{
				Click , 340, 310
				Click , 340, 311
				Sleep 200
			}
			if level = 2
			{
				Click , 340, 280
				Click , 340, 281
				Sleep 200
			}
			if level = 1
			{
				Click , 340, 250
				Click , 340, 251
				Sleep 200
			}
			Sleep 400
			Click , 410, 355 ; hand
			StartTime := A_TickCount
			Loop,
			{
				SetBatchLines, -1
				StartTime22 := A_TickCount
				ImageSearch, x , y , 250 , 220 , 560 , 440, *25 %A_ScriptDir%\bin\yellow.png
				if (errorlevel = 0)
				{
					ElapsedTime := A_TickCount - StartTime22
					MouseMove, x+5, y+5, 0
					MouseMove, x+5, y+6, 0
					Click, 5
					Sleep 70
					MouseMove, 400, 541, 0
					MouseMove, 400, 540, 0
					Sleep 20
					tooltip, %ElapsedTime% ms
					settimer, removetooltip, -300
				}
				If Stam = true
				{
					PixelSearch, x, y, 40, 132, 65, 134, 0x3A3A3A, 40, Fast
					if ErrorLevel = 0
					{
							Sleep 5000
					}
				}
					
			} Until A_TickCount - StartTime > 62000
			StartTime2 := A_TickCount
			Loop ,
			{				
				Click, 400, 390
				Click, 400, 391
			} Until A_TickCount - StartTime2 > 6000
			bruh++
			if bruh = %logs%
			{				
				Send !{f4}
				ExitApp
			} 
			StartTime4 := A_TickCount
			Loop,
			{				
				Sleep 100
				PixelSearch , x, y, 249, 133, 250, 134, color2, , Fast
				If ErrorLevel = 0
				{					
					Break
				}			
			} Until A_TickCount - StartTime4 > 7000
		}
    }
}
Else
{
    ExitApp
}
Return
