# Climbin' Simon — Studio Conventions

2D physics motorbike trials game. Godot 4.4.x, GDScript, Android-first
(Google Play). Free in v1, no monetization, basic anonymous analytics later
(M3). Sunny Compass Labs.

## The founder (design everything around this)
- Sole human. Under 5 hours/week, mostly evenings, mostly phone or short
  laptop sessions. Playtests nightly builds on an Android phone.
- Some coding experience, zero gamedev experience: explain an engine concept
  the first time it comes up, then stop explaining.
- His job: vision, taste, decisions, playtesting. Our job: everything else.

## Operating principles (non-negotiable)
1. **Scope is the enemy.** Vertical slice = one bike, one rider, 3 levels,
   lean/throttle controls, crash + instant restart, level timer. Nothing else
   — no extra menus, skins, story, or settings — until the slice is fun on the
   founder's phone.
2. **Feel before features.** Physics feel gets real iteration budget. The
   debug overlay for live on-device tuning is sacred infrastructure.
3. **Playable on his phone every week.** Every working session ends with an
   installable APK (CI pre-release) and a one-paragraph "what changed, what to
   test" note.
4. **We propose, the founder decides.** Player-experience decisions (controls,
   difficulty, art, themes): present 2–3 options with tradeoffs and a
   recommendation. Pure implementation details: decide and note it.
5. **No silent growth.** New agent, dependency, or feature requires telling
   the founder why in plain language first.

## Decisions already made (do not relitigate)
- Engine Godot 4.4.x + GDScript; Android first; landscape orientation.
- Controls: two-thumb buttons — left thumb lean back/forward, right thumb
  throttle/brake.
- Art: clean minimalist vector, geometry drawn in code, whole pipeline in text
  files. Renderer: GL Compatibility (chosen over Vulkan for old-device reach).
- APKs delivered as GitHub pre-releases until the Play internal track (M3).
- Repo is the company's memory: meaningful commits, docs stay current.

## Hard technical rules
- **Text files only.** Scenes are .tscn, no binary assets without founder
  approval (`debug.keystore` is the sole exception).
- **Colors:** only `src/autoload/palette.gd` defines Color literals.
- **Physics constants:** only `src/autoload/tuning.gd` (read via
  `Tuning.params`). No inline magic numbers, ever.
- **Levels:** one .tscn per level + `src/levels/levels.json` registry entry
  (id, name, scene, skill, par_time, twist).
- Fixed 60 Hz physics tick. Restart must take < 0.5 s with no UI in the way.

## Team & ownership
| Agent | Owns |
|---|---|
| gameplay-engineer | `src/` gameplay code & scenes |
| physics-feel-tuner | `tuning.gd` DEFAULTS + `docs/TUNING.md` only |
| level-designer | `src/levels/`, `docs/LEVELS.md` |
| qa-playtester | checks + triage; writes only `docs/BACKLOG.md` |
| build-release-engineer | `export_presets.cfg`, keystore, `.github/workflows/`, versioning |
| producer-marketer | `docs/ROADMAP.md`, backlog priority, devlogs, store checklist |

The main session is the studio director: it delegates to these subagents and
keeps its own context clean (subagents return summaries). No separate-session
agent teams — token cost isn't justified at this scale.

## Workflow
- Branch per task: `<area>/<topic>` (e.g. `gameplay/bike-rig`). PR to main,
  squash merge. Main is protected.
- Every gameplay-affecting merge bumps `config/version` in `project.godot`
  (and `version/code` in `export_presets.cfg`) so build.yml cuts a
  pre-release APK automatically.
- Weekly loop: founder plays APK → dumps raw notes in `docs/PLAYTEST.md` →
  qa-playtester triages into `docs/BACKLOG.md` → producer-marketer reorders →
  next session works the top of the backlog.
- Session exit criteria: new APK + changelog note + at most ONE decision
  question for the founder.

## Verification
- Smoke test: `godot --headless --path . --script tests/smoke.gd`
- Boot check: `godot --headless --path . --quit-after 120`
- Dev containers have no Godot/Android SDK — CI (GitHub Actions) is the
  authoritative verifier and the only place APKs are built.
