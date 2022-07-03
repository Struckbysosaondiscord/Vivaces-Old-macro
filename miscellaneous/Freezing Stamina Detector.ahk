#SingleInstance, force
#NoEnv
#MaxThreadsPerHotkey, 2
SetBatchLines, -1
CoordMode, Pixel, Window
url:="bruh" ; use the url from Discord webhook bot
userid:="<@userid>" ;example make sure to put your id inside "<@123123213213>"
username:="your roblox username" ; for appealing if you somehow got banned
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

$f2:: ; change hotkey here https://www.autohotkey.com/docs/KeyList.htm key list
toggle := !toggle
if (toggle)
{
    uh = 250
    uh1 = 249
    stage = 0
    Loop,
    {
        aa := A_TickCount - StartTime
        PixelSearch, x, y, %uh1%, 132, %uh%, 134, 0x3A3A3A, 40, Fast ;Full Stamina 1
        If ErrorLevel = 0
        {
            uh:=uh-10
            uh1:=uh1-10
            stage++
            StartTime := A_TickCount
        }
        Sleep 200
        PixelSearch, x, y, uh1+10, 132, uh+10, 134, 0x3A3A3A, 40, Fast ;Full Stamina 1
        If ErrorLevel = 1
        {
            uh = 250
            uh1 = 249
            stage = 0
        }
 	PixelSearch, x, y, 249, 132, 250, 134, 0x3A3A3A, 40, Fast ;Full Stamina 1
        If ErrorLevel = 1
        {
            StartTime := A_TickCount
        }
        if ( aa > 20000 )
        {
            ; post webhook
            WebRequest.Send(alert)
            Sleep 10000
            Send !{f4}
            Sleep 100
            Break
        }
        alert=
        (
            {
                "username": "i love vivace's macro",
                "content": "%userid% Username:%username% YOUR STAMINA IS FREEZING AT STAGE %stage% FOR OVER 20 SECOND AUTO LEAVE IN 10 SECOND ",
                "embeds": null
            }
        )
    }
}
else
{
    ExitApp
}
Return
