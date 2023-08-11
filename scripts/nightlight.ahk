toggleNightLight(){
	Send("#a") ; open Windows Action Center

	Sleep(650) ; wait for the animation...

	; Send +{Tab} ; go to the last box (the one with all the toggles)
	Send("{Home}") ; go to the first button in said box
	Sleep(10)
	Send("{Right 2}") ; navigate to the Night Light toggle
	; Send("{Down}")
	;Sleep(50)
	Send("{Space}") ; Press the button

	;Sleep(50)

	Send("{Esc}") ;Close the action center

	;CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
	;ImageSearch, FoundX, FoundY, A_ScreenWidth*3/4, A_ScreenHeight*3/4, A_ScreenWidth, A_ScreenHeight, C:\Users\matya\Desktop\PremiereAHK\nightlight.jpg
	;if (ErrorLevel = 2)
	;	MsgBox Could not conduct the search.
	;else if (ErrorLevel = 1)
	;	MsgBox Icon could not be found on the screen.
	;else
	;	MouseC
}

toggleNightLight()
ExitApp