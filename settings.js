// ============================================================
//  STICK COMBAT — Key Bindings
// ============================================================
//
//  Edit this file to change key bindings.
//  Changes take effect after restarting the game (refresh the page).
//
//  Values use the standard KeyboardEvent.code format.
//  Common examples:
//    Letters:    "KeyA", "KeyB", ..., "KeyZ"
//    Digits:     "Digit1", "Digit2", ...
//    Arrows:     "ArrowLeft", "ArrowRight", "ArrowUp", "ArrowDown"
//    Modifiers:  "ControlLeft", "ControlRight", "ShiftLeft", "ShiftRight",
//                "AltLeft", "AltRight"
//    Other:      "Space", "Enter", "Backspace", "Tab", "Escape"
//
//  Full reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code/code_values
//
//  Each action accepts an array of key codes so you can have
//  multiple keys bound to the same action.
// ============================================================

const KEYBINDS = {
  moveLeft:    ["KeyA"],
  moveRight:   ["KeyD"],
  lightAttack: ["KeyJ"],
  heavyAttack: ["KeyL"],
  block:       ["ControlLeft"],
  restart:     ["Enter"],
};
