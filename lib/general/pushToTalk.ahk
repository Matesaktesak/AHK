; I use Break/Pause as the PTT key in Discord

; If your using this script on its own, uncomment the next line
;~$Pause:: PTT() ; The $ is there just as a percaution from previous versions of the script which were triggering themselfs


PTT(){                              ; Pust-To-Talk function
    SetTitleMatchMode(2)             ; Mach by RegEx anywhere
    detecthiddenwindows("on")
    list := WinGetList("ahk_exe Spotify.exe") ; Find all hidden Spotify windows
    title := ""
    for(win in list){                            ; List trough them untill we find the one we need
        title := WinGetTitle(win)
        if !(title = "" || title = "Default IME" || title = "MSCTFIME UI" || title = "GDI+ Window (Spotify.exe)")
            break
    }
    if(title != "Spotify Premium"){         ; The title is "Spotify Premium" when nothing is playing
        Send("{Media_Stop}")                 ; Stop the song
        KeyWait("Pause")                  ; Wait until the user releases the hotkey (CHANGE this to your hotkey)
        Sleep(250)                          ; Prevent Spotify from "debouncing" the Media_Play_Pause key 😂
        Send("{Media_Play_Pause}")           ; Let Spotify play again
    }
    return 
}