# Roadmap

Owner: producer-marketer. Year-one goal: **ship and learn** — a real game on
Google Play, the full pipeline learned, positioned for revenue on game #2 or a
strong update cycle on game #1. Learning velocity beats polish perfection.

## Milestones

### M0 — Studio scaffolded ✅ (2026-06-10)
Repo initialized, six-agent studio, Godot project skeleton (boots, one
placeholder level, rolling-ball stand-in), CI pipeline that ships a debug APK
as a GitHub pre-release on every merge to main, all docs seeded.

### M1 — Vertical slice on the founder's phone (next)
One bike that feels *promising*, 3 levels, two-thumb controls, crash +
instant restart, level timer, debug tuning overlay. Exit: founder plays all
3 levels on his phone and wants one more try.

### M2 — Feel locked + content
15–20 levels with a real difficulty curve, minimalist art pass, sound.
Exit: a stranger could enjoy 20 minutes without explanation.

### M3 — Internal testing
Play Console internal testing track live; 5–10 friends/family testers;
anonymous analytics in (session length, level completion, retry counts);
release keystore + Play App Signing; Gradle/AAB builds.

### M4 — Public launch on Google Play
Devlog material packaged into store listing + posts. Post-launch: read the
data, then decide monetization and game #2 vs. update cycle.

## Visibility plan
Deferred until after M1 *and* the founder says the slice is fun. Format bet:
short gameplay clips (proven for this genre). Draft lives here when written.

## Store-readiness checklist (start early, finish by M4)
- [ ] 4–8 phone screenshots (landscape)
- [ ] Feature graphic 1024×500
- [ ] Short + full store description
- [ ] Content rating questionnaire answers
- [ ] Privacy policy URL (required: analytics) — can live on sunnycompasslabs.com
- [ ] Contact email
- [ ] Play Console account ($25 one-time) — needs founder
- [ ] Release keystore created + stored as repo secret (never committed)

## Devlog drafts

### M0 — "We hired six robots" (draft)
Sunny Compass Labs' game studio is live: one human founder with under five
hours a week, six AI agents, and a rule that every week ends with a playable
build on a phone. Game #1 is Climbin' Simon, a minimalist physics trials
game — three colors, one terrain line, all feel. The entire art pipeline is
text files; even the physics tuning history is public in the repo. First
milestone: a bike worth crashing.
