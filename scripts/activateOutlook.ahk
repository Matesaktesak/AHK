#SingleInstance 

switchToOutlook(){
    if(!WinExist("ahk_exe OUTLOOK.EXE")) {
        Run("OUTLOOK.EXE")
    } else {
        WinActivate("ahk_exe OUTLOOK.EXE")
    }
}

switchToOutlook()
ExitApp