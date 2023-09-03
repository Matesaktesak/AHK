#Requires AutoHotkey v2.0
TraySetIcon("shell32.dll", 283) ;tray icon is now a little keyboard, or piece of paper or something

#include lib/general/pushToTalk.ahk
#include lib/general/search.ahk
#include lib/general/back.ahk
#include lib/general/instantExplorer.ahk
#include lib/general/saveExplorerLocation.ahk
#include lib/general/recallExplorerLocation.ahk
#include lib/premiere/pr_presets.ahk
#include lib/premiere/pr_setClipSpeed.ahk
#include lib/premiere/pr_changeClipGain.ahk

SetKeyDelay 0 ;warning ---this was absent for some reason. i just added it back in. IDK if I removed it for a reason or not...

InstallKeybdHook()
InstallMouseHook()
#UseHook true

#SingleInstance
A_MaxHotkeysPerInterval := 2000
#WinActivateForce

detecthiddenwindows("on")

;Avoid using stupid CTRL when alt is released https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
A_MenuMaskKey := "vkFF"  ; vkFF is unassigned.

; Let me type the Scharfes S (ß) on my stupid keyboard layout!
<^>!§:: Send("ß")

::xd::😂
::njn::no jo, no...

; ----------------- All Windows ----------------------
^+!F11:: search()
^+!F12:: back()

~$Pause:: PTT()

#HotIf GetKeyState("F21", "P") ; F21 Modifier (Second keyboard)
F21:: return ; Has to be allowed to return because it WAS pressed

F13:: instantExplorer("D:\install")
F14:: instantExplorer("X:\SOUND")
F15:: instantExplorer("D:\Pictures")
F16:: instantExplorer("H:")
+F13:: instantExplorer("R:\Klienti")
NumpadDiv:: instantExplorer("Y:\Klienti")
NumpadMult:: instantExplorer("Z:\Klienti")
NumpadSub:: instantExplorer("X:")

; Explorer save and recall macros
F17:: saveExplorerLocation(0) ;
+F17:: recallExplorerLocation(0) ;
F18:: saveExplorerLocation(1) ;
+F18:: recallExplorerLocation(1) ;
F19:: saveExplorerLocation(2) ;
+F19:: recallExplorerLocation(2) ;

; ++++++++++++++++++++++++++++++++++++++++++
; +++++++++ Shortcuts for Premiere +++++++++
; ++++++++++++++++++++++++++++++++++++++++++
#HotIf GetKeyState("F21", "P") && WinActive("ahk_exe Adobe Premiere Pro.exe")

; --------- Presets ------------
; Semicolon by scancode...
SC029:: pr_selectPreset("Warp Stabilizer 20%") ; Warp Stabilizer with 20% smoothness
; plus by scancode...
SC002:: pr_selectPreset("Warp Stabilizer 50%") ; Warp Stabilizer with 50% smoothness
ě:: pr_selectPreset("BRAW to Extended Video") ; bRAW colorspace transform

; --------- Clip speeds --------------------
ý:: pr_setClipSpeed(50) ; Set clip speed to 50%
á:: pr_setClipSpeed(80) ;
í:: pr_setClipSpeed(100) ;
é:: pr_setClipSpeed(200) ;
=:: pr_setClipSpeed(300) ;
SC00D:: pr_setClipSpeed(500) ;

; --------- Clip gains ---------------------
F5:: pr_changeClipGain(-8) ; Adjusts clip gain by -8db
F6:: pr_changeClipGain(-4) ; 
F7:: pr_changeClipGain(+4) ; 
F8:: pr_changeClipGain(+8) ; 