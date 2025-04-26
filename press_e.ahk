#NoEnv  
#SingleInstance Force 
SetWorkingDir %A_ScriptDir% 
SetBatchLines, -1

Gui, +AlwaysOnTop +ToolWindow
Gui, Color, F0F0F0
Gui, Font, s10 bold, Segoe UI
Gui, Add, Text, x20 y15 w200 h25 cBlue, E Key Spammer
Gui, Font, s9 norm, Segoe UI
Gui, Add, Text, x20 y45 w200 h20, Status:
Gui, Add, Text, vStatusText x75 y45 w150 h20 cRed, Ready
Gui, Add, Button, vStartBtn gStartSpam x20 y100 w80 h30, Start
Gui, Add, Button, gPauseSpam x110 y100 w80 h30, Pause
Gui, Add, Button, gExitApp x65 y140 w80 h30, Close
Gui, Show, w210 h185, E Key Spammer

global isRunning := false
global DelayTime := 100
return

StartSpam:
    if (!isRunning) {
        isRunning := true
        GuiControl,, StatusText, Running
        GuiControl, Disable, StartBtn
        SetTimer, SpamE, %DelayTime%
    }
return

PauseSpam:
    if (isRunning) {
        isRunning := false
        SetTimer, SpamE, Off
        GuiControl,, StatusText, Paused
        GuiControl, Enable, StartBtn
    }
return

SpamE:
    Send, e
return

GuiClose:
ExitApp:
    ExitApp
return