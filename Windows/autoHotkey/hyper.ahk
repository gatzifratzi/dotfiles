#Requires AutoHotkey v2.0
#SingleInstance Force

; The Caps Lock switch sends F13 (set in the keyboard software).
; F13 itself sends nothing. While it is held, every listed key is held down
; for as long as you hold it:
;   1 to = and Esc  -> F1 to F12 and the ISO key
;   other keys      -> Ctrl+Alt+Shift + key (Hyper)
; Modifiers are only sent while a Hyper key is held, so games never see them
; when you use the F row.
; Win is left out on purpose: Win+Ctrl+Alt+Shift is the Office key.

*F13::return

; Scan code (physical key) -> key to send instead. Esc sends the ISO key:
; < on the German layout, > with Shift.
layer := Map(
    "SC002", "F1",  "SC003", "F2",  "SC004", "F3",  "SC005", "F4",
    "SC006", "F5",  "SC007", "F6",  "SC008", "F7",  "SC009", "F8",
    "SC00A", "F9",  "SC00B", "F10", "SC00C", "F11", "SC00D", "F12",
    "SC001", "SC056"
)
hyper := HyperScanCodes()

layerHeld := Map()   ; layer keys the script has pressed down
hyperHeld := Map()   ; Hyper keys the script has pressed down

; F13 & key is matched inside the keyboard hook, so normal typing
; never waits for the script.
for sc, target in layer
    Hotkey "F13 & " sc, LayerDown.Bind(sc, target)
for sc in hyper
    Hotkey "F13 & " sc, HyperDown.Bind(sc)

; Releases are not tied to F13, so letting go of F13 first can't leave
; a key stuck. ~ lets the physical release through.
for sc, target in layer
    Hotkey "~*" sc " up", LayerUp.Bind(sc, target)
for sc in hyper
    Hotkey "~*" sc " up", HyperUp.Bind(sc)

LayerDown(sc, target, *) {
    layerHeld[sc] := true
    Send "{Blind}{" target " down}"
}

LayerUp(sc, target, *) {
    if !layerHeld.Has(sc)
        return
    layerHeld.Delete(sc)
    Send "{Blind}{" target " up}"
}

HyperDown(sc, *) {
    hyperHeld[sc] := true
    Send "{Blind}{LCtrl down}{LAlt down}{LShift down}{" sc " down}"
}

; The physical release already went through (~), so only the
; modifiers are left, once the last Hyper key is up.
HyperUp(sc, *) {
    if !hyperHeld.Has(sc)
        return
    hyperHeld.Delete(sc)
    if hyperHeld.Count = 0
        ReleaseModifiers()
}

; Releases Ctrl+Alt+Shift in one Send, except the ones you are physically holding.
ReleaseModifiers() {
    ups := ""
    for mod in ["LCtrl", "LAlt", "LShift"]
        if !GetKeyState(mod, "P")
            ups .= "{" mod " up}"
    if ups != ""
        Send "{Blind}" ups
}

; Backspace to Enter, A to `, \ to /, then Space and the navigation block.
HyperScanCodes() {
    codes := []
    for range in [[0x0E, 0x1C], [0x1E, 0x29], [0x2B, 0x35]]
        Loop range[2] - range[1] + 1
            codes.Push(Format("SC{:03X}", range[1] + A_Index - 1))
    for sc in [0x39, 0x147, 0x148, 0x149, 0x14B, 0x14D, 0x14F, 0x150, 0x151, 0x152, 0x153]
        codes.Push(Format("SC{:03X}", sc))
    return codes
}
