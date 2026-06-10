# Moving the game studio to its own repo

The `climbin-simon/` directory on this branch is the complete, ready-to-run
contents of a new repository. It was staged here because this session could
only push to `crew` (the GitHub App returned 403 creating org repos). This
branch is a staging area only — **never merge it into crew's main**.

## Founder steps (≈2 minutes)

1. **Create the repo:** github.com → Sunny-Compass-Labs org → New repository →
   name `climbin-simon`, private, completely empty (no README, no .gitignore).
2. **Grant access:** GitHub → Settings → Integrations → GitHub Apps →
   Claude Code (or claude.ai/code repository settings) → add `climbin-simon`
   to the repositories the app can access.
3. **Start a Claude Code session on the new repo** and say:

   > Transplant the game studio: copy the contents of the `climbin-simon/`
   > directory from the `crew` repo, branch `claude/game-studio-kickoff-40amyd`,
   > into this repo's root as commit #1, then delete that staging branch in crew.

That session should verify afterwards that the `Build` workflow can be run
(Actions → Build → Run workflow) — its first green run publishes the first
installable APK as a pre-release on the Releases page.

## What's in the box

Godot 4.4 project that boots to a level picker with one placeholder level
(rolling-ball stand-in for the bike), six studio agents in `.claude/agents/`,
studio conventions in `CLAUDE.md`, CI that smoke-tests PRs and ships a signed
debug APK pre-release on every merge to main, and all studio docs seeded
(GDD, ROADMAP, BACKLOG with the M1 plan, TUNING, LEVELS, PLAYTEST).
