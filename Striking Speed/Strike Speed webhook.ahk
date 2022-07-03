#SingleInstance, force
#NoEnv
#MaxThreadsPerHotkey, 2
SetBatchLines, -1
CoordMode, Pixel, Window
CoordMode, Mouse, Window
url:="bruh" ; use the url from Discord webhook bot
userid:="<@userid>" ; Copy ID from discord
; True, False
autorhythm = true
flow = true
; do not change after this line
Webhook = true ; can't be disable since i never test with no webhook


ruined = False
ss = false
m2 = 0
aa = 0
; - dialog -
combattag = false
combattaga=
(
	{
		"username": "i love vivace's macro",
		"content": "%userid% Combat tag detected!",
		"embeds": null
	}
)
pushed = false
pushed1=
(
	{
		"username": "i love vivace's macro",
		"content": "%userid% you were pushed too far away from ss!",
		"embeds": null
	}
)
cantbuy = false
cantbuy1=
(
	{
		"username": "i love vivace's macro",
		"content": "%userid% Strike Speed not found!",
		"embeds": null
	}
)
lowhunder = false
lowhundera=
(
	{
		"username": "i love vivace's macro",
		"content": "%userid% your hunger was too low!",
		"embeds": null
	}
)
autoleave=
(
	{
		"username": "i love vivace's macro",
		"content": "auto leave in 5 minutes",
		"embeds": null
	}
)

IfNotExist, %A_ScriptDir%\bin2
{
	msgbox,, file missing,Look like you didn't extract file,3
	ExitApp 
}

if webhook = true
{
	if url = bruh
	{
		MsgBox, 0, Something Went Wrong, Your webhook was invalid, 3
		ExitApp
	}
	if userid = <@userid>
	{
		MsgBox, 0, Something Went Wrong, You have to put your userid after enable Webhook, 3
		ExitApp
	}
	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", url, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
}
if WinExist("Roblox") {
	WinActivate
    CenterWindow("ahk_exe RobloxPlayerBeta.exe")
} else {
	tooltip, Roblox not found
	settimer, removetooltip, -3000
	Sleep 3000
	ExitApp
}
CenterWindow(WinTitle) {	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,,,, 800, 599
}
removetooltip() {
    tooltip
}
$end::reload ; for stop macro
$f1:: ; change hotkey here https://www.autohotkey.com/docs/KeyList.htm key list
toggle := !toggle
if (toggle)
{ ;remember to make less loop possible for best performence and always put timer in loop if stuck in loop
	Loop, ; Start of the loop
	{
		currentss=
		(
			{
				"username": "i love vivace's macro",
				"content": "Current ss is %aa%",
				"embeds": null
			}
		)
		finishedss=
		(
			{
				"username": "i love vivace's macro",
				"content": "Finish %aa% time",
				"embeds": null
			}
		)
		if ss = false
		{
            Send {BackSpace}
			Sleep 100
            ImageSearch, x, y, 65, 525, 750, 585, %A_ScriptDir%\bin2\trainingss.png
            if ErrorLevel = 0
            {
				Sleep 200
                send 2{Click}
                Sleep 3000
				Send 1
				if autorhythm = true
				{
					send r
				}
                ss = true
				m2 = 0
				aa++
				ok = 0
				if webhook = true
				{
					WebRequest.Send(currentss)
				}
            }
			else
			{
				Click, 10
				Sleep 200
			}
			ok++
			if ok = 15
			{
				ruined = true
				cantbuy = true
			}
		}
        if ss = true
        {
            Click
			uh++
			if uh = 40 ;been hitting over 40 time
			{
				ruined = true
				pushed = true
			}
			m2++
			if m2 = 4
			{
				Sleep 900
			}
			else
			{
				Sleep 860
			}
            if m2 = 4
            {
				Click, Right
                Sleep 1000
                m2 = 0
            }
            ImageSearch, x, y, 65, 525, 750, 585, %A_ScriptDir%\bin2\trainingss.png
            If ErrorLevel = 1
            {
                Send {BackSpace}
                Sleep 100
                ss = false
				uh = 0
				if webhook = true
				{
					WebRequest.Send(finishedss)
				}
            }
        }
		; misc
		If Flow = True
		{
			PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
            If ErrorLevel = 0
            {
                Send e
            }
		}
		; low hunger
		PixelSearch, x, y, 34, 144, 35, 146, 0x3A3A3A, 40, Fast ; too low hunger
		If ErrorLevel = 0
		{
			if webhook = true
			{
				lowhunder = true
				ruined = true
			}
			else
			{
				send !{f4}
				ExitApp
			}
		}
		; Combat tag detector
		Pixelsearch, x, y, 80, 95, 81, 96, 0x37378A, 10, Fast ; Combat Tag 
		if ErrorLevel = 0
		{
			combattag = true
			ruined = true
		}

		If ruined = true
		{
			if webhook = true
			{
				if pushed = true
				{
					WebRequest.Send(pushed1) 
				}
				if cantbuy = true
				{
					WebRequest.Send(cantbuy1) 
				}
				if combattag = true
				{
					WebRequest.Send(combattaga) 
				}
				if lowhunder = true
				{
					WebRequest.Send(lowhundera)
				}
				WebRequest.Send(autoleave)
				Sleep 300000
				Send !{f4}
				Sleep 200
				ExitApp
			}
			else
			{
				tooltip, leave in 3 min
				Sleep 120000
				Send !{f4}
				Sleep 200
				ExitApp
			}
		}
	}
	
}
else
{
	ExitApp ; if not toggle
}
Return
