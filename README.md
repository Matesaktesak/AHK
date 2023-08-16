# Macros

All rewriten macros for AHKv2

The enterypoint is **hotkeys.ahk** - thats where ALL mapping should be done.

`lib` folder includes macros callable from other scripts after `#include`ing those files;
whereas `scripts` folder has standalone macros, which can be run directly (eg. from Corsair iCUE) or at startup (eg. Timeline scrub). I allways compile all the scripts to .exe into a ../bin/ directory - but its gitignored

Most of the original AHK Windows and Premiere macros are from a deprecated fork of @TaranVh 's 2nd_keyboard repo. They are just too old and can't ever be merged back in.

## Directlaunching scripts
I'm very frustrated that Corsair iCUE won't let me run an .exe file with arguments... Because of that, many macros have to be assigned in the `hotkeys.ahk` files.
