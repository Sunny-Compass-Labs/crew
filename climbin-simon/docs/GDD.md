# Climbin' Simon — Game Design Doc (one page)

**Working title:** Climbin' Simon (founder-chosen). Tagline direction:
*lean, throttle, tumble, retry.*

**Distinct in one sentence:** A trials game so minimal it's all feel — three
colors, one unbroken terrain line, and physics tuned in public (TUNING.md
ships in the repo).

## Core loop
Attempt → crash or finish → **instant restart** (< 0.5 s, no UI) → beat your
time. The fun lives in physics feel and "one more try." Sessions are
30-second bites; a phone game for hallways and couches.

## Controls (decided)
Landscape, two-thumb buttons, multi-touch:
- **Left thumb:** lean back / lean forward (two buttons)
- **Right thumb:** brake / throttle (two buttons)
- Oversized invisible hit zones, visible press feedback, no gyro.
- Keyboard dev mapping: Up = throttle, Down = brake, Left = lean back,
  Right = lean forward, R = restart, Esc = menu.

## Physics architecture
Everything RigidBody2D at the fixed 60 Hz tick; every constant lives in
`tuning.gd` and is live-editable on-device via the **debug overlay** (sliders
for gravity, engine torque, lean torque, wheel friction, suspension
stiffness/damping; values persist and export as JSON for PLAYTEST.md).

- **Bike:** frame body + two wheel bodies on PinJoint2D (rear wheel motorized
  by applied torque) + a DampedSpringJoint2D per wheel for suspension.
- **Lean:** torque applied to the frame — rotation control in the air,
  weight-shift on the ground. This one mechanic is the whole skill ceiling.
- **Rider:** torso + head bodies pinned to the frame. Head or torso touching
  terrain = crash → joints freed (ragdoll) → restart prompt.

## Levels
One text .tscn per level. Terrain = StaticBody2D with CollisionPolygon2D +
Polygon2D fill from the same point array (hand-authorable coordinate lists).
Start gate, finish gate, kill-zone floor. Registry in `levels.json`: every
level declares the **skill it teaches**, a **par time**, and a **twist**.
Difficulty curve lives in LEVELS.md.

## Art direction
Flat shapes, no outlines, no image assets. Five colors, defined once in
`palette.gd`: deep navy sky `#0d2137`, sand terrain `#e8b04b`, coral bike
`#ff6f59`, off-white rider `#f5f1e8`, gold accents `#ffd166`.
References: Alto's Odyssey (silhouette readability), Dune! (flat terrain
elegance), Elasto Mania (function-first clarity). GL Compatibility renderer —
flat 2D needs no Vulkan, and old phones stay supported.

## Out of scope for v1 (locked)
Monetization, skins, story, settings screens, online anything. Anonymous
analytics (session length, completion, retries) arrive at M3.
