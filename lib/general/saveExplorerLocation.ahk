#Requires AutoHotkey v2.0
#SingleInstance

saveExplorerLocation(saveIndex){
    if(!IsNumber(saveIndex)){
        throw(TypeError("saveIndex needs to be an integer!")) ;
    }

    SetTitleMatchMode("Slow") ; More secure way to match titles, significantly worse performance

    expWindowID := WinGetID("A") ;
    expWindowClass := WinGetClass(expWindowID) ;

    if(expWindowClass != "CabinetWClass" && expWindowClass != "ExploreWClass"){
        throw(TargetError("Active window is not an explorer window.")) ;
    }

    path := getExplorerPath(expWindowID) ;


    RegWrite(path, "REG_SZ", "HKEY_CURRENT_USER\Software\AutoHotkey\ExplorerLocations", "Location" . saveIndex) ;

    MsgBox("Saved '" . path . "' at location " . saveIndex, "Success!", "T1") ; 
    SetTitleMatchMode("Fast") ; Reset to the fast mode... You should do it in every script, but who does... 
}

getExplorerPath(hwnd){
    winClass := WinGetClass(hwnd) ;

    ; Also match #32770
    if(winClass ~= "(Cabinet|Explore)WClass"){
        for(window in ComObject("Shell.Application").Windows){
            if(window.hwnd = hwnd){
                return window.Document.Folder.Self.Path
            }
        }
    } else {
        throw(TargetError("Supplied HWND doesn't point to Explorer")) ;
    }
}