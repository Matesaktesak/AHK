TraySetIcon("shell32.dll", 283) ;tray icon is now a little keyboard, or piece of paper or something

#include lib/pushToTalk.ahk
#include lib/search.ahk
#include lib/back.ahk
#Include lib/instantExplorer.ahk

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

::xd:: 😂

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
+F14:: instantExplorer("Y:\Klienti")
+F15:: instantExplorer("Z:\Klienti")
+F16:: instantExplorer("X:")

;NumpadSub:: {
;	;MsgBox(ControlGetEnabled("DroverLord - Window Class12"))
;	MsgBox(ControlGetClassNN(ControlGetFocus("ahk_exe Adobe Premiere Pro.exe")))
;}