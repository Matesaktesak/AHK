#Requires AutoHotkey v2.0

waitControl(hwnd, upto, callback){
    previousPanel := ControlGetFocus(hwnd) ; note the first control
    
    callback() ; call the lambda

    while(ControlGetFocus(hwnd) == previousPanel){   ; While the panel hasn't switched, keep waiting
        Tooltip("Waiting " . upto) ;

        Sleep(10) ;
        upto -= 10 ;

        if(upto <= 0){
            Tooltip("") ;
            throw(TimeoutError("The suspected control didn't change!")) ; only wait upto the set ammount of time, than default.. 
        }
    }

    Tooltip("") ; 
}

waitWindow(upto, callback){
    previousPanel := WinGetID("A") ; note the first window

    callback() ; call the lambda

    while(WinGetID("A") == previousPanel){   ; While the panel hasn't switched, keep waiting
        Tooltip("Waiting " . upto) ;

        Sleep(10) ;
        upto -= 10 ;

        if(upto <= 0){
            Tooltip("") ;
            throw(TimeoutError("The suspected window didn't change!")) ; only wait upto the set ammount of time, than default.. 
        }
    }

    Tooltip("") ; 
}