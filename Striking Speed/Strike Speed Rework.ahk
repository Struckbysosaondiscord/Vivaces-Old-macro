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
    tooltip
}

IfNotExist, %A_ScriptDir%\bin2\slotempty.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin2\training.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}



InputBox, logs, how many ss you want to do?, recommended put 500+ for 400+ ss
If ErrorLevel = 1
{
    ExitApp
}


end::reload

f1::
macro_on := !macro_on
if (macro_on)
{
    CoordMode, Mouse, Window
    CoordMode, Pixel, Window
    SetBatchLines, -1
    {
        L = 0
        Loop,
        {
            f = 0
            Loop, ; buy
            {
                Click, 10
                f++
                ImageSearch, x, y, 60, 520, 790, 590, *10 %A_ScriptDir%\bin2\training.png
                if ErrorLevel = 0
                {
                    send 2{Click}
                    Sleep 100
                    Send 1r
                    Break
                }
                if f = 10
                {
                    sleep 100
                    send 1
                }
            }
            StartTime2 := A_TickCount
            Loop, ; ss 
            {
                ImageSearch, x, y, 10, 30, 800, 630, *5 %A_ScriptDir%\bin2\ss.png
                If ErrorLevel = 0
                {
                    Break
                }
            } Until A_TickCount - StartTime2 > 4000
            Notactivate := A_TickCount
            Loop,
            {
                Loop, 4
                {
                    ImageSearch, x, y, 60, 520, 790, 590, *10 %A_ScriptDir%\bin2\slotempty.png
                    if ErrorLevel = 0
                    {
                        Break
                    }
                    Click
                    Sleep 1080
                }
                ImageSearch, x, y, 60, 520, 790, 590, *10 %A_ScriptDir%\bin2\slotempty.png
                if ErrorLevel = 0
                {
                    Break
                }
                Click, Right
                Sleep 1080
                If A_TickCount - Notactivate > 40000
                {
                    Break
                }
            }
            Sleep 100
            Send 1
            Sleep 100
            L++
            Tooltip, %L%
            SetTimer, removetooltip, -1000
            if L = %logs%
            {
                Send !{f4}
                ExitApp
            }
        }
    }
}
else
{
    Reload
}
Return
