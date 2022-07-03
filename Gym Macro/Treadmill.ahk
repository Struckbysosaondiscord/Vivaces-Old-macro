#maxThreadsPerHotkey, 2

SetPrimaryMonitorScaling(100) ; https://www.autohotkey.com/boards/viewtopic.php?t=94218
Sleep 100
SetPrimaryMonitorScaling(value) {
; possible values 100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500
   static SPI_GETLOGICALDPIOVERRIDE := 0x009E
        , SPI_SETLOGICALDPIOVERRIDE := 0x009F
        , SPIF_UPDATEINIFILE := 0x00000001
        , MONITOR_DEFAULTTOPRIMARY := 0x00000001
        , ScaleValues := [100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500]
        
   for k, v in ScaleValues
      if (value = v && found := true)
         break
   if !found
      throw "Incorrect value: " . value . ". Allowed values: 100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500"
   if !DllCall("SystemParametersInfo", "UInt", SPI_GETLOGICALDPIOVERRIDE, "Int", 0, "IntP", v, "UInt", 0)
      throw "SPI_GETLOGICALDPIOVERRIDE unsupported"
   if !recommendedScaling := ScaleValues[ 1 - v ]
      throw "Something wrong"
   for k, v in ScaleValues {
      (v = value && s := k)
      (v = recommendedScaling && r := k)
   } until s && r
   if !DllCall("SystemParametersInfo", "UInt", SPI_SETLOGICALDPIOVERRIDE, "Int", s - r, "Ptr", 0, "UInt", SPIF_UPDATEINIFILE)
      throw "Failed to set new scale factor"
   hMon := DllCall("MonitorFromWindow", "Ptr", 0, "UInt", MONITOR_DEFAULTTOPRIMARY, "Ptr")
   DllCall("Shcore\GetScaleFactorForMonitor", "Ptr", hMon, "UIntP", scale)
   Return scale
}

IfNotExist, %A_ScriptDir%\bin\w.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\a.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\s.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\d.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
MsgBox, 4,, Stamina or RunningSpeed? (press Yes for Stamina or No for RunningSpeed)
IfMsgBox Yes
{
    tread = false
}
else
{
	tread = true
}

InputBox, level, Treadmill Level, Please enter level., , 200, 150
if ErrorLevel = 1
{
	ExitApp
}

If not (level = "1" or level = "2" or level = "3" or level = "4" or level = "5")
{
    tooltip, Look like level %level% not exist in this version of macro
    SetTimer, removetooltip, -3000
    return
}

InputBox, logs,Auto Leave, how many tread you want to do?`nPlease enter Number., , 400, 150

MsgBox, 4, Stamina Detection
IfMsgBox Yes
{
	detect = true
}
Else
{
	detect = false
}
MsgBox, 0,Tutorial, F1 for activate macro. END for Stop, 3

if WinExist("Roblox") {
	WinActivate
}
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
	ToolTip
}

end::Reload

F1::
macro_on := !macro_on
if (macro_on)
{	
	CoordMode , Pixel, Window
	slot = 1
	current = 0
	PixelGetColor , color2, 250, 130,
	Loop ,
	{	   
		CoordMode , Click, Window
		toolTip, %A_Index%
		SetTimer, removetooltip, -3000
		if tread = true ; rs
		{
			Click , 520, 310
			Click , 520, 311
			Sleep 1000
		}
		if tread = false ; stam
		{
			Click , 290, 310
			Click , 290, 311
			Sleep 1000
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
		Sleep 100
		Click , 410, 355
		Click , 410, 351
		Sleep 3000
		StartTime := A_TickCount
		Loop ,
		{			
			CoordMode , Pixel, Window
			CoordMode , Click, Window
			SetBatchLines, -1
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\w.png
			if (errorlevel = 0)
			{				
				Send {w down}{w up}
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\a.png
			if (errorlevel = 0)
			{				
				Send {a down}{a up}
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\s.png
			if (errorlevel = 0)
			{				
				Send {s down}{s up}
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\d.png
			if (errorlevel = 0)
			{				
				Send {d down}{d up}
			}
			if detect = true
			{
				PixelSearch , x, y, 30, 130, 40, 133, 0x3A3A3A, 40, Fast
				If ErrorLevel = 0
				{				
					Sleep 8000
				}	
			}
		} Until A_TickCount - StartTime > 60000
		PixelSearch , x, y, 70, 144, 75, 146, 0x3A3A3A, 40, Fast
		If ErrorLevel = 0
		{
			if current <= 5
			{
                Loop,
                {
                    PixelSearch, x, y, 439, 455, 440, 456, 0x494995, 3, Fast
                    If ErrorLevel = 0
                    {
                        Sleep 100
                    }
                    else
                    {
                        Break
                    }
                }
                Sleep 100
				Send %slot%
				Click, 400, 610, 10
				Sleep 3500
				Send %slot%
				current++
			}
			if slot = 0
			{
				if current >= 5
				{
					Send !{f4}
					Exitapp
				}
			}
			if current >= 5
			{
				slot++
				current = 0
				if slot >= 10
				{
					slot = 0
				}
			}
		}	
		StartTime2 := A_TickCount
		Loop ,
		{			
			Click , 409, 296
			Click , 409, 295
		} Until A_TickCount - StartTime2 > 4000
			
		if A_Index = %logs%
		{			
			Send !{f4}
			ExitApp
		}		
		StartTime4 := A_TickCount
		Loop,
		{			
			Sleep 100
			PixelSearch , x, y, 249, 129, 250, 130, color2, , Fast
			If ErrorLevel = 0
			{				
				Break
			}		
		} Until A_TickCount - StartTime4 > 17000
	}
}
else
{	
	ExitApp
}
Return
