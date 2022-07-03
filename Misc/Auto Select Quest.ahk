CoordMode, Pixel, Window
CoordMode, Mouse, Window
#maxThreadsPerHotkey, 2
f1::
macro_on := !macro_on
if (macro_on)
{
MouseGetPos, x1, y1
Loop,
{
    Click, %x1% %y1%
    Sleep 300
    ImageSearch, x, y, 0, 450, 100, 490, *100 nah.png
    If ErrorLevel = 0
    {
        Break
    }
    else
    {
        Click, 100 468
    }
}
reload
}
else
{
Return
}
Return
end::Reload
