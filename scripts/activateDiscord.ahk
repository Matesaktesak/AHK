#SingleInstance 

switchToDiscord(){
    if(!WinExist("ahk_exe Discord.exe")) {
        Run("C:\Users\matya\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Discord Inc\Discord.lnk")
    } else {
        if(WinActive("ahk_exe Discord.exe")){
            SendInput "^!{Down}"
        } else WinActivate("ahk_exe Discord.exe")
    }
    
}

switchToDiscord()
ExitApp