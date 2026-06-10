# Backlog

Format: `- [ ] (owner) task — done-when`. Top of the list = next session's
work. qa-playtester adds triaged playtest items; producer-marketer orders
everything; nobody else reorders.

## M1 — vertical slice (in order)

- [ ] (build-release-engineer) Prove the pipeline: first CI run on main green,
      pre-release APK published — done when the founder installs it on his
      phone and sees the M0 skeleton.
- [ ] (gameplay-engineer) Bike rig: frame + 2 wheels + pins + spring
      suspension, rear-wheel torque from keyboard input — done when it drives
      the flat of level_001 in-editor and suspension visibly compresses.
- [ ] (gameplay-engineer) Two-thumb touch controls + HUD buttons — done when
      throttle/brake/lean all work by touch with oversized hit zones.
- [ ] (gameplay-engineer) Rider bodies + crash detection + ragdoll + instant
      restart — done when head-plant → ragdoll → riding again in < 0.5 s.
- [ ] (gameplay-engineer) Debug tuning overlay: live sliders for all
      Tuning.params, on-device persistence, export-as-text — done when the
      founder can change gravity mid-level and paste values into PLAYTEST.md.
- [ ] (gameplay-engineer) Follow camera: velocity lookahead + landing framing
      — done when fast riding shows terrain ahead, not the bike centered.
- [ ] (level-designer) Levels 1–3: "Throttle" (gas/brake), "Lean" (weight
      shift), "Commit" (first real obstacle) + timer HUD + finish gates —
      done when all three are beatable and registered in levels.json.
- [ ] (physics-feel-tuner) First tuning pass from the founder's first
      PLAYTEST.md notes — done when TUNING.md has its first history entries.
- [ ] (producer-marketer) M1 review: roadmap status, devlog draft #2,
      store-readiness checklist progress — done when ROADMAP.md is current.

## Triage inbox (qa-playtester writes here)

*(empty — no playtest notes yet)*

## What's working (don't break these)

*(empty)*

## Icebox (explicitly not now)

- Sound (M2). Art pass beyond palette (M2). Analytics (M3). Any menu beyond
  the level picker (post-slice). Monetization (post-launch decision).
