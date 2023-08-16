# Macros

All rewriten macros for AHKv2

The enterypoint is **hotkeys.ahk** - thats where ALL mapping should be done.

`lib` folder includes macros callable from other scripts after `#include`ing those files;
whereas `scripts` folder has standalone macros, which can be run directly (eg. from Corsair iCUE) or at startup (eg. Timeline scrub). I allways compile all the scripts to .exe into a ../bin/ directory - but its gitignored

Most of the original AHK Windows and Premiere macros are from a deprecated fork of @TaranVh 's 2nd_keyboard repo. They are just too old and can't ever be merged back in.

## Directlaunching scripts
I'm very frustrated that Corsair iCUE won't let me run an .exe file with arguments... Because of that, many macros have to be assigned in the `hotkeys.ahk` files.

# Roadmap
1. Finish pr_presets.ahk
2. Add pr_warpStabilizer macro (its a pr_presets for Warp, which also clicks the 'Analyze button')
3. Add pr_clipSpeed macros (eg. set clip speed to 200%)
4. Add pr_audioSelectMonoChannel macros (eg. only use left channel from source for both outputs)
5. Add pr_audioGain macros (eg. add 8db gain)
6. Add pr_audioNormalize macro
7. Add ae_presets (same as in PrPro but for After Effects)
8. Add pr_showLabels (just map the keys) - **easy**
9. Add pr_soloTrackUnderMouse and pr_muteTrackUnderMouse script (when a button is pressed, the track that the mouse is hovering above should toggle the switch) - ideally this needs to work in the Audio Track Mixer panel as well...
