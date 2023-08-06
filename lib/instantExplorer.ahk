#SingleInstance
#Warn

;BEGIN savage-folder-navigation CODE!
;I got MOST of this code from https://autohotkey.com/docs/scripts/FavoriteFolders.htm
;and modified it to work with any given keypress , rather than middle mouse click as it had before.

;NEEDED: must not get address by looking at title text , it is unreliable. if you search for a thing for example , it will open a new window. this may or may not be a bad thing... also i can have it clear the search - that WOULD be bad. must do more experiments with this one...
instantExplorer(f_path){

    Send("{SC0E8}") ;scan code of an unassigned key. This is needed to prevent the item from merely FLASHING on the task bar , rather than opening the folder. Don't ask me why , but this works.

	if(!FileExist(f_path)) {
		MsgBox("No such path exists.", , "T1")
		return -1
	}

	; These first few variables are set here and used by f_OpenFavorite:
	f_window_id := WinGetID("A")
	f_class := WinGetClass(f_window_id)
	f_title := WinGetTitle(f_window_id) ;to be used later to see if this is the export dialouge window in Premiere...
	
    
	if(f_path = "")
        return
    
	if(f_class = "#32770"){ ; It's a dialog.
		if(WinActive("ahk_exe Adobe Premiere Pro.exe")) {
            ; IF f_title is "export settings ," with the exe "premiere pro.exe"
            ; go to the end or do something else , since you are in Premiere's export media dialouge box... which has the same #23770 classNN for some reason...
            
            if(f_title = "Export Settings") {
                MsgBox("you are in Premiere's export window , but NOT in the 'Save as' inside of THAT window. no bueno", , "T1")
                return
            }
            
			if(f_title = "Save As" || f_title = "Save Project"){ ;IDK if this OR is properly nested....
				ControlFocus("Edit1", f_window_id) ;this is really important.... it doesn't work if you don't do this...
				; Activate the window so that if the user is middle-clicking
				; outside the dialog , subsequent clicks will also work:
				WinActivate(f_window_id)
				; Retrieve any filename that might already be in the field so
				; that it can be restored after the switch to the new folder:
				f_text := ControlGetText( "Edit1",f_window_id)
				
				ControlSetText(f_path, "Edit1", f_window_id)
				ControlSend("{Enter}", "Edit1", f_window_id)
				Sleep(100)  ; It needs extra time on some dialogs or in some cases.
				ControlSetText(f_text, "Edit1", f_window_id)
                
				return
            }
        }

        if(InStr("#32770 ExploreWClass CabinetWClass", f_class)){
            try{
                ControlGetHwnd("Edit1", f_window_id)
                f_hasEdit1 := true
            } catch Any {
                f_hasEdit1 := false
            }
        }
		
		if(f_hasEdit1){  ; And it has an Edit1 control.
			ControlFocus("Edit1", f_window_id) ;this is really important.... it doesn't work if you don't do this...
			; tippy2("DIALOUGE WITH EDIT1`n`nwait really?`n`nLE controlfocus of edit1 for f_window_id was just engaged." , 1000)
			
			; Activate the window so that if the user is middle-clicking
			; outside the dialog , subsequent clicks will also work:
			WinActivate(f_window_id)
			
			; Retrieve any filename that might already be in the field so
			; that it can be restored after the switch to the new folder:
			f_text := ControlGetText( "Edit1",f_window_id)
			Sleep(20)
			ControlSetText(f_path, "Edit1", f_window_id)
			Sleep(50)
			ControlSend("{Enter}", "Edit1", f_window_id)
			Sleep(100)  ; It needs extra time on some dialogs or in some cases.
			
			;now RESTORE the filename in that text field. I don't like doing it this way...
			ControlSetText(f_text, "Edit1", f_window_id)

			ControlFocus("DirectUIHWND2", f_window_id) ;to try to get the focus back into the center area , so you can now type letters and have it go to a file or fodler , rather than try to SEARCH or try to change the FILE NAME by default.
			return
        }
		; else fall through to the bottom of the subroutine to take standard action.

    } else if(f_class = "CASCADIA_HOSTING_WINDOW_CLASS") { ; In a console window , CD to that directory
		WinActivate(f_window_id) ; Because sometimes the mclick deactivates it.
		SetKeyDelay(0,0) ; This will be in effect only for the duration of this thread.
		
        if(InStr(f_path, ":")){ ; It contains a drive letter
			f_path_drive := SubStr(f_path, 1, 1)
			Send(f_path_drive . ":{enter}")
        }

		Send("cd " . f_path . "{Enter}")
		return
    }

	Run(f_path) ; I got rid of the "Explorer" part because it caused redundant windows to be opened , rather than just switching to the existing window

	Send("{Ctrl up}{Shift up}")

    return
}