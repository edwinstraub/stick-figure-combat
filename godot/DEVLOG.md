# Stick Combat — Development Log

## Project Vision

A **single-player 2D stick figure fighting game** with **Batman Arkham-style hand-to-hand combat**. Smooth animations, smooth transitions between animations, but slower and more deliberate for a realistic feel.

### Style
- All black and white — black stick figure on a white background, nothing else
- Minimalist and clean

### Combat Design
- Arkham-style: animation-driven, fluid blending between attack/counter/dodge/redirect
- Controls: punch, kick, crouch, jump, block (each separate)
- Deliberate pacing — commitment to actions, weight in animations

---

## Technology Decisions

### Why Godot (not HTML Canvas)
- Started as an HTML Canvas/JS prototype (`stick-combat.html` still in repo root)
- Decided to move to **Godot 4.x** because Arkham-style combat requires:
  - Animation blending and state machines (`AnimationTree`)
  - Skeletal animation for smooth pose interpolation (`Skeleton2D`)
  - Animation curves for weight and timing (ease-in/out on strikes, recovery frames)
- Canvas/JS would mean reinventing a full animation system from scratch

### Why NOT DragonBones (for now)
- Godot's built-in **Skeleton2D + AnimationPlayer/AnimationTree** can do everything needed
- Avoids juggling two separate tools
- Can revisit DragonBones later if the visual animation editor is needed

### Godot Setup
- Godot 4.x, standard version (not .NET)
- **GDScript** over C# — simpler for getting started, Python-like syntax
- **Compatibility** renderer — lightest weight for 2D

---

## What's Been Built

### Project Structure
```
godot/
  scenes/
    main_menu.tscn    — Title screen with "Stick Combat" label and Play button
    player.tscn       — CharacterBody2D with collision and stick figure drawing
    game.tscn         — Game scene with floor, player instance, and pause menu
  scripts/
    main_menu.gd      — Play button loads game scene
    player.gd         — Movement: left/right arrows, jump with Up arrow
    stick_figure.gd   — Draws stick figure using _draw() (lines + circle)
    pause_menu.gd     — Escape toggles pause overlay, Quit returns to title
```

### Main Menu (`main_menu.tscn`)
- Control root node with VBoxContainer (centered)
- Label: "Stick Combat" (font size 48, black)
- Button: "Play" — connected to `_on_button_pressed()` which loads `game.tscn`

### Player (`player.tscn`)
- **CharacterBody2D** root with script `player.gd`
- **CollisionShape2D**: CapsuleShape2D (radius 10, height 60), position offset `y: -25` to align with drawn stick figure
- **StickFigure** (Node2D): draws head circle, body line, arms, legs using `_draw()`
- Movement: speed 300, jump force -500, gravity 1200

### Game Scene (`game.tscn`)
- **Node2D** root
- **Floor**: StaticBody2D at position `(576, 400)` with:
  - CollisionShape2D: RectangleShape2D (1200 x 20)
  - ColorRect: thin black line for visibility (1200 x 4)
- **Player** instance at position `(576, 0)`
- **PauseLayer** (CanvasLayer) containing:
  - **PauseOverlay** (ColorRect): semi-transparent black, full rect, hidden by default
  - VBoxContainer (centered) with Settings and Quit buttons
  - Process mode set to ALWAYS so it works while paused

### Input Map
| Action | Default Key |
|--------|------------|
| move_left | Left Arrow |
| move_right | Right Arrow |
| jump | Up Arrow |
| crouch | Down Arrow |
| punch | Z |
| kick | X |
| block | C |
| pause | Escape |

### Project Settings
- Default clear color: white (#FFFFFF)
- Main scene: `res://scenes/main_menu.tscn`

---

## Game Flow (Working)

1. Launch → Main Menu with title and Play button
2. Click Play → Game scene, player on floor
3. Arrow keys move, Up jumps
4. Escape → pause overlay with Settings and Quit
5. Escape again → resume
6. Quit → back to Main Menu

---

## Next Steps (Priority Order)

1. **Key bindings settings screen** — wire up the Settings button in pause menu, allow rebinding controls
2. **Skeleton2D setup** — replace line-drawn stick figure with bone-based skeleton for smooth animation
3. **Combat state machine** — AnimationTree with states for idle, walk, punch, kick, block, crouch, jump
4. **Enemy AI** — basic enemies that approach and attack
5. **Arkham-style combat polish** — counters, redirects, hit reactions, camera/timing effects

---

## Developer Notes

- Developer has 18 years Java enterprise experience, simulation background, first time using Godot
- GDScript is comfortable given the programming background
- Approach: incremental — get basics working, then layer features
- Original Canvas prototype in repo root can be used as design reference
