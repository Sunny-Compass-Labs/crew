#!/usr/bin/env bash
set -euo pipefail

# Resolve project root relative to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Load environment variables
if [[ -f "$PROJECT_ROOT/.env" ]]; then
  set -a
  source "$PROJECT_ROOT/.env"
  set +a
else
  echo -e "\033[31mERROR: .env file not found at $PROJECT_ROOT/.env\033[0m"
  exit 1
fi

if [[ -z "${CLOUDFLARE_API_TOKEN:-}" ]]; then
  echo -e "\033[31mERROR: CLOUDFLARE_API_TOKEN is not set in .env\033[0m"
  exit 1
fi

ROTATION_LINK="https://dash.cloudflare.com/profile/api-tokens"

# Verify the token
RESPONSE=$(curl -s "https://api.cloudflare.com/client/v4/user/tokens/verify" \
  -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
  -H "Content-Type: application/json")

SUCCESS=$(echo "$RESPONSE" | jq -r '.success')
if [[ "$SUCCESS" != "true" ]]; then
  echo -e "\033[31mERROR: Token verification failed.\033[0m"
  echo "Response: $RESPONSE"
  echo -e "Rotate your token at: $ROTATION_LINK"
  exit 1
fi

STATUS=$(echo "$RESPONSE" | jq -r '.result.status')
EXPIRES_ON=$(echo "$RESPONSE" | jq -r '.result.expires_on // empty')

if [[ "$STATUS" != "active" ]]; then
  echo -e "\033[31mERROR: Token status is '$STATUS' (expected 'active').\033[0m"
  echo -e "Rotate your token at: $ROTATION_LINK"
  exit 1
fi

# Calculate days remaining if expiration is set
if [[ -n "$EXPIRES_ON" ]]; then
  EXPIRES_EPOCH=$(date -d "$EXPIRES_ON" +%s 2>/dev/null || date -j -f "%Y-%m-%dT%H:%M:%SZ" "$EXPIRES_ON" +%s 2>/dev/null || echo "")
  NOW_EPOCH=$(date +%s)

  if [[ -n "$EXPIRES_EPOCH" ]]; then
    DAYS_REMAINING=$(( (EXPIRES_EPOCH - NOW_EPOCH) / 86400 ))

    if (( DAYS_REMAINING <= 0 )); then
      echo -e "\033[31mERROR: Token has expired.\033[0m"
      echo -e "Rotate your token at: $ROTATION_LINK"
      exit 1
    elif (( DAYS_REMAINING <= 7 )); then
      echo -e "\033[33mWARNING: Token expires in ${DAYS_REMAINING} day(s) (${EXPIRES_ON}).\033[0m"
      echo -e "Rotate your token at: $ROTATION_LINK"
    else
      echo -e "\033[32mToken is active. Expires in ${DAYS_REMAINING} days (${EXPIRES_ON}).\033[0m"
    fi
  else
    echo -e "\033[32mToken is active. Expiration: ${EXPIRES_ON}\033[0m"
  fi
else
  echo -e "\033[32mToken is active (no expiration set).\033[0m"
fi
