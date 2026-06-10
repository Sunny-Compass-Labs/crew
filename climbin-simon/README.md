# Climbin' Simon

A 2D physics motorbike trials game by Sunny Compass Labs. Lean, throttle,
tumble, retry.

- **Engine:** Godot 4.4.x (GDScript, text scenes only)
- **Platform:** Android (Google Play), landscape
- **Art:** minimalist vector, drawn in code from a 5-color palette
- **Status:** M0 — studio scaffolded, vertical slice in progress

## How builds work

Nobody installs anything. Every merge to `main` runs GitHub Actions
(`.github/workflows/build.yml`): smoke test → headless boot → export a signed
debug APK → publish it as a **pre-release on the Releases page** with notes.
Download the APK on the phone, install, play.

## The weekly loop

1. Founder plays the latest APK in the evening.
2. Raw notes go into `docs/PLAYTEST.md` — typos and half-thoughts welcome.
3. qa-playtester triages them into `docs/BACKLOG.md`; producer-marketer
   re-prioritizes.
4. Next session works the top of the backlog.
5. Session ends with: new APK, changelog note, max one decision question.

## Map

| Where | What |
|---|---|
| `CLAUDE.md` | studio conventions — read first |
| `docs/GDD.md` | one-page game design doc |
| `docs/ROADMAP.md` | milestones M0–M4 + devlog drafts |
| `docs/BACKLOG.md` | prioritized task list |
| `docs/TUNING.md` | physics parameters + history |
| `docs/LEVELS.md` | difficulty curve |
| `docs/PLAYTEST.md` | founder's raw playtest notes |
| `src/` | the game |
| `.claude/agents/` | the six-agent studio team |
