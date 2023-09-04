#Requires AutoHotkey v2.0

#include ../general/waitForControlChange.ahk

pr_changeClipGain(action, gain){
    if(!WinActive("ahk_exe Adobe Premiere Pro.exe")){ ; Error if Premiere is not active
        throw(TargetError("Premiere has to be active")) ; 
    }

    if(gain = ""){
           gain := 0 ;
    }

    waitWindow(1000, () => Send("a")) ; This has to be mapped to Audio Gain dialog in PrPro
    sleep(50) ;

    Send("{Shift down}{TAB}{Shift up}{Up 3}") ; Tab to the radio buttons, get to the top and reselect the field
    switch(action){
        case "set": doNothing() ;   
        case "normalize_max": Send("{Down 2}") ;
        case "normalize_all": Send("{Down 3}") ;
        case "adjust": Send("{Down 1}") ;          
        default: Send("{Down 1}") ;          
    }
    Send("{TAB}") ; 

    sleep(10) ;

    ControlSetText(gain, ControlGetFocus("A")) ; insert the new speed into the defaultly selected textbox

    Send("{ENTER}") ; Exit the dialog
}

doNothing(){
    return ; Do nothing... 😂 
}