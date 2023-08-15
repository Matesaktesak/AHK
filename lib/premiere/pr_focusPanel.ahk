#Requires AutoHotkey v2.0

#include ../general/waitForControlChange.ahk

pr_focusPanel(panel){
    if(!WinActive("ahk_exe Adobe Premiere Pro.exe")){
        throw(TargetError("Premier has to be active, when using prFocus")) ;
    }

    premiereHWND := WinGetID("ahk_exe Adobe Premiere Pro.exe") ; 

    waitControl(premiereHWND, 200, () => switchPanel(panel)) ; Had to refactor the labda outside...
}

switchPanel(panel){
    switch(panel){
        case "project": Send "^+!{F1}" ;
        case "sourceMonitor": Send "^+!{F2}" ;
        case "timeline": Send "^+!{F3}" ; 
        case "programMonitor": Send "^+!{F4}" ;
        case "effectControls": Send "^+!{F5}" ;
        case "audioTrackMixer": Send "^+!{F6}" ;
        case "effects": Send "^+!{F7}" ;
        case "text": Send "^+!{F8}" ;
        case "lumetri": Send "^+!{F9}" ;
        case "lumetriScopes": Send "^+!{F10}" ;

        case "referenceMonitor": Send "{F7}" ;
    } 
}