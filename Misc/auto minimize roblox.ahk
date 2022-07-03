Loop, 3
    CenterWindow("ahk_exe RobloxPlayerBeta.exe")
    Sleep 100
return
CenterWindow(WinTitle)
{
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}
exitapp