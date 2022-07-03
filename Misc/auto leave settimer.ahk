InputBox, wait, please insert number in Miliseconds 1000 = 1 Seconds 
if ErrorLevel = 1
{
    ExitApp
    return
}

if ProcessExist("RobloxPlayerBeta.exe")
{
    Sleep %Wait%
    Process,Close,RobloxPlayerBeta.exe
    ExitApp
    Return
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}
