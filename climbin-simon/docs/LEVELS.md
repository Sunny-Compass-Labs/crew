# Levels & Difficulty Curve

Owner: level-designer. One skill per level; introduce safely, then test under
pressure. Par times 20–60 s. Difficulty comes from terrain geometry only.
Every level has a twist — the moment a player tells a friend about.

## Curve philosophy

1. **Teach** (lvl 1–3): each core verb in isolation — throttle/brake, lean,
   committing to a jump. Failure should be nearly impossible in the teaching
   half, instructive in the testing half.
2. **Combine** (M2): verbs together — brake into a drop, lean through a
   rhythm section.
3. **Test** (M2): execution under pressure; par times start mattering.

## Level register

| # | Name | Skill taught | Par | Twist | Status |
|---|---|---|---|---|---|
| 001 | Throttle | gas and brake | 20 s | one gentle hill that punishes holding full throttle | M0 placeholder terrain — rebuild in M1 |
| 002 | Lean | weight shift on slopes | 30 s | a slope you simply cannot climb without leaning forward | sketch |
| 003 | Commit | jumping a gap at speed | 40 s | the gap looks bigger than it is; hesitation is the only way to fail | sketch |

## Authoring conventions

- Terrain: StaticBody2D → CollisionPolygon2D + Polygon2D with the **same**
  point array. No colors in scenes (level.gd applies the palette).
- Y is down. Ground reference ~y=500 at start; start gate near x=200.
- Close polygons below the visible floor (y ≥ 700) so bodies can't escape.
- Required per level: start position, finish gate, kill-zone floor (template
  nodes arrive with the M1 bike rig work).
- Register every level in `levels.json` (id, name, scene, skill, par_time,
  twist) — the menu and smoke test are driven by it.
