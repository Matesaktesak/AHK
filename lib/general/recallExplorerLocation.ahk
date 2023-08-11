#Requires AutoHotkey v2.0
#SingleInstance

#include instantExplorer.ahk

recallExplorerLocation(saveIndex){
    if(!IsNumber(saveIndex)){
        throw(TypeError("saveIndex has to be a number")) ;
    }

    try{
        path := RegRead("HKEY_CURRENT_USER\Software\AutoHotkey\ExplorerLocations", "Location" . saveIndex) ;
        instantExplorer(path) ;
    } catch OSError as err{
        MsgBox("This location hasn't been set yet!", "Error") ;
    }
}
