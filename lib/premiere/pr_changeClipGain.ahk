#Requires AutoHotkey v2.0

#include ../general/waitForControlChange.ahk

pr_changeClipGain(gain){
    if(!WinActive("ahk_exe Adobe Premiere Pro.exe")){ ; Error if Premiere is not active
        throw(TargetError("Premiere has to be active")) ; 
    }

    waitWindow(1000, () => Send("a")) ; This has to be mapped to Audio Gain dialog in PrPro
    sleep(50) ;
    Send("{Shift down}{TAB}{Shift up}{Up 3}{Down}{TAB}") ; Tab to the radio buttons, get to the top, go one down and reselect the field
    sleep(10) ;

    ControlSetText(gain, ControlGetFocus("A")) ; insert the new speed into the defaultly selected textbox

    Send("{ENTER}") ; Exit the dialog
}