

end::reload

f1::
loop,
{
	Sendinput, {w down}{w up}{w down}{s down}
	Sleep 4000
	Sendinput {w up}{s up}
}
Return
