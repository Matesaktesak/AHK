#SingleInstance 

switchToExplorer(){
    if(!WinExist("ahk_class CabinetWClass")) {
        Run("explorer.exe")
    }
    
    GroupAdd("plorers", "ahk_class CabinetWClass")
    GroupAdd("plorers", "ahk_class ExploreWClass")
    
    if(WinActive("ahk_exe explorer.exe")){
        GroupActivate("plorers", "R")
    } else WinActivate("ahk_class CabinetWClass") ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToExplorer()
    