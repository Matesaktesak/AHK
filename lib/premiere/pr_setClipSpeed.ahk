#Requires AutoHotkey v2.0

#include ../general/waitForControlChange.ahk

pr_setClipSpeed(speed){
    SetTitleMatchMode("Slow") ;

    if(!WinActive("ahk_exe Adobe Premiere Pro.exe")){ ; Error if Premiere is not active
        throw(TargetError("Premiere has to be active")) ; 
    }

    waitWindow(1000, () => Send("^!+d")) ; This has to be mapped to Clip Speed dialog in PrPro
    Send("{Ctrl up}{Alt up}{Shift up}{d up}") ; IDK whyyyyyyy????!!!! The modifiers get stuck... So just release them
    sleep(50) ;

    ControlSetText(speed, ControlGetFocus("A")) ; insert the new speed into the defaultly selected textbox

    Send("{ENTER}") ; Exit the dialog
}