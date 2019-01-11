/*
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
*/

; Allow multiple threads so that this hotkey can "turn itself off":
#MaxThreadsPerHotkey 2
^j:: 
#MaxThreadsPerHotkey 1
if ContinueScript {	;This means underlying thread is already running the loop
	;Signal loop to stop
	ContinueScript := false
	return	;End this thread
}

ContinueScript := true

Loop {
	;Move mouse over "Greydawn Wood"
	MouseMove, 925, 375, 80
	Click
	Sleep 1000

	;Move mouse over to "QuickStart"
	MouseMove, 925, 625, 80
	Sleep 2000
	Click

	;Wait for the level finish
	;Wait 45 seconds
	Sleep 45000

	;Click Skip
	MouseMove, 335, -350, 80, R
	Click

	;User signaled loop to stop by pressing Ctrl-J again
	if not ContinueScript
		break
}
;Reset in preparation for next press of hotkey
ContinueScript := false

return