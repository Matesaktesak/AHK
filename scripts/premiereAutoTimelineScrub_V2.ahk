#Requires AutoHotkey v2.0

#SingleInstance ; only 1 instance of this script may run at a time.

InstallKeybdHook() ;
InstallMouseHook() ;
#UseHook true

CoordMode("Mouse", "Screen") ;
CoordMode("Pixel", "Screen") ;

TraySetIcon("imageres.dll", 90) ; 

; ORIGINAL SOURCE: https://github.com/TaranVH/2nd-keyboard/blob/master/Taran's_Premiere_Mods/PREMIERE_MOD_Right_click_timeline_to_move_playhead.ahk

; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; NOTE THAT YOU MUST ASSIGN \ (backslash) TO "Move playhead to cursor" IN PREMIERE'S KEYBOARD SHORTCUTS PANEL!
; YOU SHOULD ALSO ASSIGN CTRL SHIFT A to "DESELECT ALL" 
; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;NOTE: This does not, and cannot work on the timeline where there are no tracks visible.
;That is color 0x212121, and last I checked, it shows up in many other places in premiere, not just that part of the timeline.
;The easy solution is to just fill up your timeline with tracks; have no blank space.

;---------------------------------------------------------------------------------------

;First, we define all the timeline's DEFAULT possible colors.
;(Note that your colors will be different if you changed the UI brightness inside preferences > appearance > brightness.)
;I used Window Spy (it comes with AHK) to detect the exact colors onscreen.
timeline1 := 0x424242 ;timeline color inside the in/out points ON a targeted track
timeline2 := 0x313131 ;timeline color of the separating LINES between targeted AND non targeted tracks inside the in/out points
timeline3 := 0x1C1C1C ;the timeline color inside in/out points on a NON targeted track
timeline4 := 0x202020 ;the color of the bare timeline NOT inside the in out points
timeline5 := 0xDFDFDF ;the color of a SELECTED blank space on the timeline, NOT in the in/out points
timeline6 := 0xE4E4E4 ;the color of a SELECTED blank space on the timeline, IN the in/out points, on a TARGETED track
timeline7 := 0xBEBEBE ;the color of a SELECTED blank space on the timeline, IN the in/out points, on an UNTARGETED track

#HotIf WinActive("ahk_exe Adobe Premiere Pro.exe") ;
Rbutton:: scrubTimeline()

scrubTimeline(){
    if(!WinActive("ahk_exe Adobe Premiere Pro.exe")) { ; exact name was gotten from windowspy
        return ; Don't do anything outside of PPro
    }

    MouseGetPos(&X, &Y) ;
    colorr := PixelGetColor(X, Y) ;
    if (colorr = timeline5 || colorr = timeline6 || colorr = timeline7) { ;these are the timeline colors of a selected clip or blank space, in or outside of in/out points.
        Send("^+A") ; Deselect
        ; Send("{ESC}") ;in Premiere, also deselects

        moveTime() ; 
    } else if (colorr = timeline1 || colorr = timeline2 || colorr = timeline3 || colorr = timeline4 ) {
        moveTime() ; 
    } else {
        SendInput("{Rbutton}") ;this is to make up for the lack of a ~ in front of Rbutton. ... ~Rbutton. It allows the command to pass through, but only if the above conditions were NOT met.
    }

    return ;
}

moveTime(){
    ;BREAKTHROUGH -- it looks like a middle mouse click will BRING FOCUS TO a panel without doing ANYTHING ELSE like selecting or going through tabs or anything. Unfortunately, i still can't know with AHK which panel is already in focus.
    Click("Middle") ;sends the middle mouse button to BRING FOCUS TO the timeline, WITHOUT selecting any clips or empty spaces between clips. very nice!
    
    while(GetKeyState("Rbutton", "P")) { ;<----THIS is the only way to phrase this query.
        Send("\") ;in premiere, this must be set to "move playhead to cursor."
        Tooltip("Autoscrub (RClick)") ;you can remove this line if you don't like the tooltip.
        Sleep(25) ;this loop will repeat every 25 milliseconds.
    }

    Tooltip("") ; Remove the tooltip
    Send("{ESC}") ;in case you end up inside the "delete" right click menu from the timeline
    ;MouseClick, left ;notice how this is commented out. I deemed it inferior to using ESCAPE.
}