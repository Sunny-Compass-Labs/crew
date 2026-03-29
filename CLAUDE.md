# Sunny Compass Labs Website

## Project Overview
Product showcase website for Sunny Compass Labs, hosted on Cloudflare Pages at `sunnycompasslabs.com`.

## Tech Stack
- **Framework:** Astro 6 (static output)
- **Styling:** Tailwind CSS 4
- **Hosting:** Cloudflare Pages
- **Deployment:** Auto-deploy via GitHub integration (push to main triggers deploy)
- **Content:** Astro Content Collections (typed product schemas)
- **CI:** GitHub Actions (build check on PRs)

## Brand & Design Direction
**"Cartoonish pirates meets open sea professionalism"**
- Nautical/adventure theme: compass roses, treasure maps, ocean imagery, pirate-inspired elements
- Generous whitespace, clean typography, professional polish
- Bold colors (deep ocean blues, warm golds/ambers, crisp whites, coral accents) balanced with refined minimalism
- The feeling of setting sail on a new venture -- excitement, exploration, possibility

## Pages
1. **Home** (`/`) -- Hero + value prop + coming-soon product teasers + about preview
2. **About** (`/about`) -- Company story, mission, the adventure metaphor
3. **Products** (`/products`) -- Grid with coming-soon product cards

## File Ownership (agents must respect these boundaries)
| Path | Owner | Others |
|------|-------|--------|
| `src/components/`, `src/styles/`, `src/assets/` | design | read-only |
| `src/layouts/` | design | dev reads |
| `tailwind.config.mjs`, `public/fonts/` | design | read-only |
| `astro.config.mjs`, `tsconfig.json`, `package.json` | dev | read-only |
| `src/content/`, `src/content.config.ts` | dev | design reads |
| `src/pages/` | design creates, dev integrates | shared |
| `wrangler.jsonc`, `scripts/`, `infrastructure/` | infra | read-only |

## Git Workflow
- **main** is protected -- no direct pushes allowed
- All work happens on feature branches: `<agent>/<topic>` (e.g., `design/hero-redesign`)
- When work is complete, the agent creates a PR via `gh pr create`
- The **review** agent reviews the PR, requests fixes if needed, and merges when ready
- Merging to main triggers automatic deployment to Cloudflare Pages
- Always use squash merges to keep main history clean

## Agents
| Agent | Role | Branch prefix |
|-------|------|---------------|
| dev | Astro scaffolding, TypeScript, content, SEO, integration | `dev/` |
| design | Visual identity, UI components, page layouts | `design/` |
| infra | Cloudflare infrastructure, DNS, deployment scripts | `infra/` |
| review | PR review, quality gating, merge to main | N/A (read-only) |

## Environment Variables (from .env)
- `CLOUDFLARE_API_TOKEN` -- CF API token (Zone:DNS:Edit, Pages:Edit, Zone:Read)
- `CLOUDFLARE_ACCOUNT_ID` -- CF account ID
- `CLOUDFLARE_ZONE_ID` -- Zone ID for sunnycompasslabs.com

## Key Commands
- `npm run dev` -- Start dev server (localhost:4321)
- `npm run build` -- Build to `dist/`
- `./scripts/deploy.sh` -- Check token + build + deploy to CF Pages
- `./scripts/check-token.sh` -- Verify CF API token status and expiration
