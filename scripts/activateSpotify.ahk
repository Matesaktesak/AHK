#SingleInstance 

switchToSpotify(){
    if(!WinExist("ahk_exe Spotify.exe")) {
        Run("Spotify.exe")
    } else {
        WinActivate("ahk_exe Spotify.exe")
    }
}

switchToSpotify()
    