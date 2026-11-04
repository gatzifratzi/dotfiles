#Requires AutoHotkey v2.0
#SingleInstance Force

; The Caps Lock switch sends F13 (set in the keyboard software).
; Holding it holds Ctrl+Alt+Shift, so every key not listed below is Hyper.
; Win is left out on purpose: Win+Ctrl+Alt+Shift is the Office key.
*F13::Send "{Blind}{LCtrl DownR}{LAlt DownR}{LShift DownR}"
*F13 up::Send "{Blind}{LCtrl up}{LAlt up}{LShift up}"

#HotIf GetKeyState("F13", "P")

; F13 + numbers = frow. F13+Alt+4 is Alt+F4.
*1::Layer("F1")
*2::Layer("F2")
*3::Layer("F3")
*4::Layer("F4")
*5::Layer("F5")
*6::Layer("F6")
*7::Layer("F7")
*8::Layer("F8")
*9::Layer("F9")
*0::Layer("F10")
; - and = move on the German layout, so these use scan codes.
*SC00C::Layer("F11")
*SC00D::Layer("F12")

; ISO key: < on the German layout, > with Shift.
*Esc::Layer("SC056")

#HotIf

; Sends a key without the Hyper modifiers, keeping only the ones physically
; held. Without {Blind}, Send lifts Ctrl+Alt+Shift and DownR restores them.
Layer(key) {
    mods := (GetKeyState("Ctrl", "P") ? "^" : "")
          . (GetKeyState("Alt", "P") ? "!" : "")
          . (GetKeyState("Shift", "P") ? "+" : "")
    Send mods "{" key "}"
}
