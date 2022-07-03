#SingleInstance, force
#NoEnv
#MaxThreadsPerHotkey, 2
SetBatchLines, -1
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
;url:="bruh" ; use the url from Discord webhook bot
;userid:="<@12345678910>" ;example
; True, False
autorhythm = True
flow = True
; do not change
Oneside = false ; start doing at left screen
ruined = False
rhythm = False
; - dialog -
; will be working on webhook soon
knock = false
nofood = false
lowhunder = false

IfNotExist, %A_ScriptDir%\bin
{
	msgbox,, file missing,Look like you didn't extract file,3
	ExitApp 
}

Resize1(WinTitle) {	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (0)-(10), (0)-(10), 100, 100
}
Resize2(WinTitle) {	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (0)-(-790), (0)-(10), 100, 100
}

removetooltip() {
    tooltip
}
Back:
Winactive("Roblox")
MsgBox, 262144,vivace Auto Dura,Select account for left side
IfMsgBox, Ok
{
    Resize1("Roblox")
}
Winactive("Roblox")
MsgBox, 262144,vivace Auto Dura,Select account for right side
IfMsgBox, Ok
{
    Resize2("Roblox")
}

MsgBox, 4,vivace Auto Dura,both side are set correctly?
IfMsgBox, No
{
    Goto, back
}
 ; 100, 500 buy dura
 ; 0, 0
 ; 800, 0
 ;ImageSearch, x, y, 15, 100, 115, 160, *10 %A_ScriptDir%\bin\fullhp.png

$F1::
toggle := !toggle
if (toggle)
{
	CoordMode, Pixel, Window
	MouseMove, 0 , 0
	Send {MButton} ;active windows 1
	ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
	If ErrorLevel = 0
	{
		CoordMode, Mouse, Window
		Loop, 30
		{
			Click, 100, 470
		}
		CoordMode, Mouse, Screen
		Send 1
		if autorhythm = True
		Send r
	}
	MouseMove, 810 , 0
	Send {MButton} ;active windows 1
	ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
	If ErrorLevel = 0
	{
		CoordMode, Mouse, Window
		Loop, 30
		{
			Click, 100, 470
		}
		CoordMode, Mouse, Screen
		Send 1
		if autorhythm = True
		Send r
	}
	CoordMode, Pixel, Screen
	Loop,
	{
		if Oneside = true
		{
			ImageSearch, x, y, 10, 100, 260, 120, *10 %A_ScriptDir%\bin\fullhp.png ; Left windows
			If ErrorLevel = 0
			{
				MouseMove, 0 , 0
				Send {MButton}
				CoordMode, Pixel, Window
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
				if ErrorLevel = 1
				{
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
					If ErrorLevel = 0
					{
						Send 1
					}
					CoordMode, Mouse, Window
					Loop, 50
					{
						Click, 100, 470
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
						If ErrorLevel = 0
						{
							CoordMode, Mouse, Screen
							CoordMode, Pixel, Screen
							Break
						}
						if A_Index = 50
						{
							MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
							ExitApp
						}
					}
			
				}
				else
				{
					If Flow = True
					{
						CoordMode, Pixel, Window
						PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
						If ErrorLevel = 0
						{
							Send e
						}
						CoordMode, Pixel, Screen
					}
					Send 2{Click, 100, 470}
					duratimer := A_TickCount
					MouseMove, 810 , 0
					Send {MButton} ;active windows 2
					CoordMode, Mouse, Window
					MouseMove, 100, 500
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
					If ErrorLevel = 0
					{
						Send 1
						if autorhythm = True
						Send r
					}
					CoordMode, Pixel, Screen
					Loop, ;fast phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 130, 105, 131, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 130, 105, 131, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 150
					}
					Loop, ; under half slow phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 70, 105, 71, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 70, 105, 71, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 300
					}
					Loop, ;30% phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 28, 105, 30, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 28, 105, 30, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 450
					}
					CoordMode, Mouse, Screen
					MouseMove, 0 , 0
					CoordMode, Mouse, Window
					Send {MButton}{Click, 100, 470} ;active windows 1
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Window
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
					if ErrorLevel = 1
					{
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
						If ErrorLevel = 0
						{
							Send 1
						}
						CoordMode, Mouse, Window
						Loop, 50
						{
							Click, 100, 470
							ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
							If ErrorLevel = 0
							{
								ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
								If ErrorLevel = 0
								{
									CoordMode, Mouse, Screen
									CoordMode, Pixel, Screen
									Send 1
									if autorhythm = True
									Send r
								}
								Break
							}
							if A_Index = 50
							{
								MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
								ExitApp
							}
						}
					}
				
				}
			}
			PixelSearch , x, y, 84, 133, 85, 134, 0x3A3A3A, 40, Fast
			If ErrorLevel = 0
			{
				MouseMove, 0 , 0
				Send {MButton}
				CoordMode, Mouse, Window
				MouseMove, 100, 500
				Send {BackSpace}34567890 ;active windows 1
				Sleep 200
				time := A_TickCount
				aw = 0
				CoordMode, Pixel, Window
				Loop, ; Eating part
				{
					Click, 100, 470, 10
					Sleep 100
					PixelSearch, x, y, 119, 144, 110, 146, 0x3A3A3A, 40, Fast ; full hunger
					If ErrorLevel = 1
					{
						Break
					}
					ImageSearch, x, y, 60, 515, 760, 600, *20 %A_ScriptDir%\bin\equipx.png ;if not found equiped slot /and still not full hunger
					If ErrorLevel = 1
					{
						Sendinput, 34567890
						aw++
					}
					if aw = 3
					{
						Break
					}
					
				} Until A_TickCount - time > 60000
				Send {BackSpace}
				Sleep 100
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
				If ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Screen
					Send 1
					if autorhythm = True
					Send r
				}
			}
		}
		else
		{
			ImageSearch, x, y, 10, 100, 260, 120, *10 %A_ScriptDir%\bin\fullhp.png ; Left windows
			If ErrorLevel = 0
			{
				MouseMove, 0 , 0
				Send {MButton}
				CoordMode, Pixel, Window
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
				if ErrorLevel = 1
				{
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
					If ErrorLevel = 0
					{
						Send 1
					}
					CoordMode, Mouse, Window
					Loop, 50
					{
						Click, 100, 470
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
						If ErrorLevel = 0
						{
							CoordMode, Mouse, Screen
							CoordMode, Pixel, Screen
							Break
						}
						if A_Index = 50
						{
							MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
							ExitApp
						}
					}
			
				}
				else
				{
					If Flow = True
					{
						CoordMode, Pixel, Window
						PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
						If ErrorLevel = 0
						{
							Send e
						}
						CoordMode, Pixel, Screen
					}
					Send 2{Click, 100, 470}
					duratimer := A_TickCount
					MouseMove, 810 , 0
					Send {MButton} ;active windows 2
					CoordMode, Mouse, Window
					MouseMove, 100, 500
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
					If ErrorLevel = 0
					{
						Send 1
						if autorhythm = True
						Send r
					}
					CoordMode, Pixel, Screen
					Loop, ;fast phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 130, 105, 131, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 130, 105, 131, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 130
					}
					Loop, ; under half slow phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 70, 105, 71, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 70, 105, 71, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 330
					}
					Loop, ;30% phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 28, 105, 30, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 28, 105, 30, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 430
					}
					CoordMode, Mouse, Screen
					MouseMove, 0 , 0
					CoordMode, Mouse, Window
					Send {MButton}{Click, 100, 470} ;active windows 1
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Window
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
					if ErrorLevel = 1
					{
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
						If ErrorLevel = 0
						{
							Send 1
						}
						CoordMode, Mouse, Window
						Loop, 50
						{
							Click, 100, 470
							ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
							If ErrorLevel = 0
							{
								ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
								If ErrorLevel = 0
								{
									CoordMode, Mouse, Screen
									CoordMode, Pixel, Screen
									Send 1
									if autorhythm = True
									Send r
								}
								Break
							}
							if A_Index = 50
							{
								MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
								ExitApp
							}
						}
					}
				
				}
			}
			PixelSearch , x, y, 84, 133, 85, 134, 0x3A3A3A, 40, Fast
			If ErrorLevel = 0
			{
				MouseMove, 0 , 0
				Send {MButton}
				CoordMode, Mouse, Window
				MouseMove, 100, 500
				Send {BackSpace}34567890 ;active windows 2
				Sleep 200
				time := A_TickCount
				aw = 0
				CoordMode, Pixel, Window
				Loop, ; Eating part
				{
					Click, 100, 470, 10
					Sleep 100
					PixelSearch, x, y, 119, 144, 110, 146, 0x3A3A3A, 40, Fast ; full hunger
					If ErrorLevel = 1
					{
						Break
					}
					ImageSearch, x, y, 60, 515, 760, 600, *20 %A_ScriptDir%\bin\equipx.png ;if not found equiped slot /and still not full hunger
					If ErrorLevel = 1
					{
						Sendinput, 34567890
						aw++
					}
					if aw = 3
					{
						Break
					}
					
				} Until A_TickCount - time > 60000
				Send {BackSpace}
				Sleep 100
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
				If ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Screen
					Send 1
					if autorhythm = True
					Send r
				}
			}
			ImageSearch, x, y, 810, 100, 1060, 120, *10 %A_ScriptDir%\bin\fullhp.png ; Right windows
			If ErrorLevel = 0
			{
				MouseMove, 810 , 0
				Send {MButton} ;active windows 2
				CoordMode, Pixel, Window
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
				if ErrorLevel = 1
				{
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
					If ErrorLevel = 0
					{
						Send 1
					}
					CoordMode, Mouse, Window
					Loop, 50
					{
						Click, 100, 470
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
						If ErrorLevel = 0
						{
							CoordMode, Mouse, Screen
							CoordMode, Pixel, Screen
							Break
						}
						if A_Index = 50
						{
							MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
							ExitApp
						}
					}
				}
				else
				{
					If Flow = True
					{
						CoordMode, Pixel, Window
						PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
						If ErrorLevel = 0
						{
							Send e
						}
						CoordMode, Pixel, Screen
					}
					CoordMode, Mouse, Window
					Send 2{Click, 100, 470}
					CoordMode, Mouse, Screen
					duratimer := A_TickCount
					MouseMove, 0 , 0
					Send {MButton} ;active windows 1
					CoordMode, Mouse, Window
					MouseMove, 100, 500
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
					If ErrorLevel = 0
					{
						Send 1
						if autorhythm = True
						Send r
					}
					CoordMode, Pixel, Screen
					Loop, ;fast phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 930, 105, 931, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 930, 105, 931, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 150
					}
					Loop, ; under half slow phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 870, 105, 871, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 870, 105, 871, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 300
					}
					Loop, ;30% phase
					{
						aa := A_TickCount - duratimer
						if (aa > 26000)
						{
							Break
						}
						PixelSearch, x, y, 828, 105, 830, 106, 0x444444, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						PixelSearch, x, y, 828, 105, 830, 106, 0x3D3DA2, 20, Fast 
						If ErrorLevel = 0
						{
							Break
						}
						Click
						Sleep 450
					}
					CoordMode, Mouse, Screen
					MouseMove, 810 , 0
					CoordMode, Mouse, window
					Send {MButton}{Click, 100, 470} ;active windows 1
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Window
					ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
					if ErrorLevel = 1
					{
						ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combaty.png 
						If ErrorLevel = 0
						{
							Send 1
						}
						CoordMode, Mouse, Window
						Loop, 50
						{
							Click, 100, 470
							ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\dura.png
							If ErrorLevel = 0
							{
								ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
								If ErrorLevel = 0
								{
									CoordMode, Mouse, Screen
									CoordMode, Pixel, Screen
									Send 1
									if autorhythm = True
									Send r
								}
								Break
							}
							if A_Index = 50
							{
								MsgBox,,Vivace Auto Dura, Cannot buy dura, 3
								ExitApp
							}
						}
					}
				
				}
			}
			PixelSearch , x, y, 884, 133, 885, 134, 0x3A3A3A, 40, Fast
			If ErrorLevel = 0
			{
				MouseMove, 810 , 0
				Send {MButton}
				CoordMode, Mouse, Window
				Send {Click, 100, 470}{BackSpace}34567890 ;active windows 1
				Sleep 200
				time := A_TickCount
				aw = 0
				CoordMode, Pixel, Window
				Loop, ; Eating part
				{
					Click, 100, 470, 10
					Sleep 100
					PixelSearch, x, y, 119, 144, 110, 146, 0x3A3A3A, 40, Fast ; full hunger
					If ErrorLevel = 1
					{
						Break
					}
					ImageSearch, x, y, 60, 515, 760, 600, *20 %A_ScriptDir%\bin\equipx.png ;if not found equiped slot /and still not full hunger
					If ErrorLevel = 1
					{
						Sendinput, 34567890
						aw++
					}
					if aw = 3
					{
						Break
					}
				} Until A_TickCount - time > 60000
				Send {BackSpace}
				Sleep 100
				ImageSearch, x, y, 65, 525, 750, 585, *10 %A_ScriptDir%\bin\combatx.png 
				If ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					CoordMode, Pixel, Screen
					Send 1
					if autorhythm = True
					Send r
				}
			}
		}
	}
}
else
{
    ExitApp
}
Return


\::ExitApp