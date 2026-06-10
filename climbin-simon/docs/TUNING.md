# Physics Tuning

Owner: physics-feel-tuner. Every parameter the game feel depends on, what it
does, and the full history of values tried. All values live in
`src/autoload/tuning.gd` (`DEFAULTS`) and are live-editable on-device via the
debug overlay (M1 backlog).

## Parameters

| Param | What it does | Too low feels | Too high feels | Default |
|---|---|---|---|---|
| `gravity` | Downward accel (px/s²) on all bodies | floaty, moon bike | leaden, jumps die | 980.0 |
| `engine_torque` | Torque applied to rear wheel while throttling | gutless, can't climb | uncontrollable wheelies | 4000.0 |
| `max_wheel_spin` | Rear wheel angular velocity cap (rad/s) | low top speed | wheelspin without grip | 40.0 |
| `brake_torque` | Counter-torque on wheels while braking | mushy stops | endo machine | 6000.0 |
| `lean_torque` | Torque on frame from lean input | sluggish air control | twitchy, flips constantly | 9000.0 |
| `wheel_friction` | Wheel/terrain friction coefficient | ice world | sticky, no slides ever | 1.2 |
| `suspension_stiffness` | Spring constant of wheel suspension | bottoming out, wallowy | rigid, bouncy landings | 60.0 |
| `suspension_damping` | Suspension oscillation damping | pogo stick | dead, no compression feel | 2.5 |

*Defaults are first guesses pending the M1 bike rig — expect the first tuning
pass to move most of them.*

## How to record a change

Append a row per change. Verdict gets filled in after the next playtest —
no verdict, no further changes to that parameter.

## History

| Date | Param | Old → New | Why | Verdict (after playtest) |
|---|---|---|---|---|
| 2026-06-10 | *all* | — → initial defaults | M0 scaffold first guesses, ball-placeholder era | pending M1 rig |
