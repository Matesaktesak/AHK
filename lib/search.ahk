#SingleInstance

search(){
    if(Winactive("ahk_exe Adobe Premiere Pro.exe")) {
        try {
            activeSubwindow := ControlGetClassNN(ControlGetFocus("ahk_exe Adobe Premiere Pro.exe"))
            
            if(activeSubwindow = "DroverLord - Window Class12" || activeSubwindow = "DroverLord - Window Class41"){
                Send("^!f{Backspace}")
            }
        }
        ; if A_IsFunc("effectsPanelType") {
        ;     Func := Func("effectsPanelType")
        ;     RetVal := Func.Call(directory ,"") 
        ; }     
        ;This just CLEARS the effects panel search bar so that you can type something in.
    } else if(WinActive("ahk_exe notepad++.exe")){
        Send("^f")
    } else if(WinActive("ahk_exe brave.exe")){
        Send("^l{Backspace}")
    } else if(WinActive("ahk_exe VSCodium.exe")){
        Send("^f")
    } else if(WinActive("ahk_class CabinetWClass")){
        Send("^e")
        Sleep 200
        Send("^a")
        Sleep 200
        Send("{Backspace}")
    } else if(WinActive("ahk_exe Spotify.exe")){
        Send("^l")
    }
}