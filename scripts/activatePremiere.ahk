#SingleInstance 

switchToPremiere(){
    if(!WinExist("ahk_class Premiere Pro")) {
        Run("Adobe Premiere Pro.exe")
    } else if(!WinActive("ahk_class Premiere Pro")){
        WinActivate("ahk_class Premiere Pro")
    }
}

switchToPremiere()
    