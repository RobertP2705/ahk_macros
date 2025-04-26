#Persistent
SetTimer, JumpClickAndWiggle, 1000

; Initialize variables
readyToExit := false
lastMouseX := 0
lastMouseY := 0

return

JumpClickAndWiggle:
if (readyToExit) {
    MouseGetPos, currentMouseX, currentMouseY
    if (currentMouseX != lastMouseX or currentMouseY != lastMouseY) {
        ExitApp
    }
}
Send, {Space}
Click

MouseGetPos, mouseX, mouseY
Random, randX, -5, 5
Random, randY, -5, 5
MouseMove, %randX%, %randY%, 0, R
Click  
MouseMove, mouseX, mouseY, 0  
Click  

return

e::
readyToExit := true
MouseGetPos, lastMouseX, lastMouseY
return

^q::ExitApp