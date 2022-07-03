InputBox, logs, how many ss you want to do?
if ErrorLevel = 1
{
    ExitApp
}
removetooltip:
ToolTip
return
f1::
loop,
{
    Tooltip, % A_Index
    SetTimer, removetooltip, -3000
    Send {Click 3}
    Sleep 500
    Send 2{Click}
    Sleep 500
    Send 1r
    Sleep 2700
    Loop, 4
    {
	Loop, 4
	{
		Send {Click}
		Sleep 1050
	}
	Sleep 100
	Send {Click, Right}
	Sleep 1050
    }
    Send {Click}
    Sleep 1100
    Send {Click}
    Sleep 1100
    Send {Click}
    Sleep 1100
    Send 1
    Sleep 1100
    if A_Index = %logs%
    {
	Send !{f4}
        ExitApp
    } 
}
Return
end::reload
