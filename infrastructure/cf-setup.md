# Cloudflare Infrastructure Setup

## Domain
- **Domain:** sunnycompasslabs.com
- **Registrar:** Cloudflare

## Cloudflare Pages Project
- **Project name:** sunny-compass-labs
- **Production branch:** main
- **Pages URL:** https://sunny-compass-labs.pages.dev

## DNS Records
| Type | Name | Content | Proxied |
|------|------|---------|---------|
| CNAME | sunnycompasslabs.com | sunny-compass-labs.pages.dev | Yes |
| CNAME | www | sunny-compass-labs.pages.dev | Yes |

## Custom Domains
- sunnycompasslabs.com -> Pages project
- www.sunnycompasslabs.com -> Pages project

## API Token
- **Name:** sunny-compass-labs-deploy
- **Permissions:** Account:Cloudflare Pages:Edit, Zone:DNS:Edit, Zone:Zone:Read
- **Scope:** sunnycompasslabs.com zone only
- **Expires:** 2027-04-01

## Scripts
- `scripts/check-token.sh` -- Verifies API token status and expiration
- `scripts/deploy.sh` -- Full build + deploy pipeline with token check

## Management
- Dashboard: https://dash.cloudflare.com
- API tokens: https://dash.cloudflare.com/profile/api-tokens
