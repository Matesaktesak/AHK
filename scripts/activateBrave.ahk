#SingleInstance 

switchToChrome(){
    if(!WinExist("ahk_exe brave.exe")) {
        Run("brave.exe")
    } else {
        if(WinActive("ahk_exe brave.exe")){
            SendInput "^{tab}"
        } else WinActivate("ahk_exe brave.exe")
    }
    
}

switchToChrome()