#Requires AutoHotkey v2.0

#include pr_focusPanel.ahk
#include ../general/search.ahk
#include ../general/waitForControlChange.ahk

pr_selectPreset(name){
    BlockInput(true) ; Prevent the user from moving the mouse

    CoordMode("Mouse", "Screen") ; Set coordmode to be relative to the screen
    MouseGetPos(&startX, &startY) ; Note the starting position of the mouse
    
    CoordMode("Mouse", "Client") ; 
  
    SetKeyDelay(0) ; All keys are typed in instantly, not one at a time
    
    MouseClick("Middle") ; Activate window under mouse
    ; pr_focusPanel("programMonitor") ; Focus the monitor so that the Shuttle stop command works
    Send("k") ; Shuttle stop

    Sleep(50) ;

    pr_focusPanel("effects") ;  Focus the effects panel

    pr_effectsType(name) ;  Select the search box and clear it

    premiereHWND := WinGetID("A") ; Can't use "ahk_exe Adobe Pre....exe" when the effects pannel may be outside the main Pr window...
    ControlGetPos(&panelX, &panelY, , , ControlGetFocus(premiereHWND)) ; Get the position of the effects box relative to the client area
    MouseMove(panelX + 40, panelY + 73, 0) ; Move mouse at full speed to absolute coords onto the selected preset

    CoordMode("Mouse", "Screen") ; Reset coordmode
    MouseGetPos(&cx, &cy) ;
    MouseClickDrag("Left", cx, cy, startX, startY, 0) ; Drag the preset at full speed to the original mouse position

    MouseClick("Middle") ; 

    BlockInput(false) ; Reenable the user to interact with the PC
}

pr_effectsType(text := ""){
    pr_focusPanel("effects") ;  Select the effects panel

    pHWND := WinGetID("A") ; Note the ID of premiere

    waitControl(pHWND, 300, () => Send("^!f")) ;   Select the find box and wait for it to focus
    
    focusedID := ControlGetFocus(pHWND) ; We unfortunatelly cannot get the searchbox by ID nor name, because it changes a lot
    ControlSetText(text, focusedID, pHWND) ;
}