# Sunny Compass Labs Website

## Project Overview
Product showcase website for Sunny Compass Labs, hosted on Cloudflare Pages at `sunnycompasslabs.com`.

## Tech Stack
- **Framework:** Astro 6 with `@astrojs/cloudflare` adapter
- **Styling:** Tailwind CSS 4
- **Hosting:** Cloudflare Pages (static output)
- **Deployment:** Wrangler CLI with API token auth
- **Content:** Astro Content Collections (typed product schemas)

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

## Environment Variables (from .env)
- `CLOUDFLARE_API_TOKEN` -- CF API token (Zone:DNS:Edit, Pages:Edit, Zone:Read)
- `CLOUDFLARE_ACCOUNT_ID` -- CF account ID
- `CLOUDFLARE_ZONE_ID` -- Zone ID for sunnycompasslabs.com

## Key Commands
- `npm run dev` -- Start dev server (localhost:4321)
- `npm run build` -- Build to `dist/`
- `./scripts/deploy.sh` -- Check token + build + deploy to CF Pages
- `./scripts/check-token.sh` -- Verify CF API token status and expiration
