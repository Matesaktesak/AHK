#SingleInstance

back(){
    if(WinActive("ahk_exe brave.exe"))
        Send("{Browser_Back}")
    else if(WinActive("ahk_class Notepad++"))
        Send("^+{tab}")
    else if(WinActive("ahk_exe Adobe Premiere Pro.exe"))
        Send("^+b") ;ctrl alt shift B  is my shortcut in premiere for "go back"(in bins)(the project panel)
    else if(WinActive("ahk_exe explorer.exe"))
        Send("!{left}") ;alt left is the explorer shortcut to go "back" or "down" one folder level.
    else if(WinActive("ahk_class OpusApp"))
        Send("{F2}") ;"go to previous comment" in Word.
}    