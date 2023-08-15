#SingleInstance

#include ../premiere/pr_presets.ahk

search(){
    if(Winactive("ahk_exe Adobe Premiere Pro.exe")) {
        try {
            pr_effectsType() ;
        }
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