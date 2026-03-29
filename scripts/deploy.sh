#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

# Load environment variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "Error: .env file not found at $PROJECT_DIR/.env"
  exit 1
fi

# Check token health
echo "Checking Cloudflare API token..."
bash "$SCRIPT_DIR/check-token.sh"
if [ $? -ne 0 ]; then
  echo "Token check failed. Aborting deployment."
  exit 1
fi

# Build
echo ""
echo "Building site..."
npm run build
echo "Build complete."

# Deploy
echo ""
echo "Deploying to Cloudflare Pages..."
npx wrangler pages deploy dist/client/ --project-name=sunny-compass-labs --commit-dirty=true
echo ""

# Verify
echo "Verifying deployment..."
sleep 10
HTTP_STATUS=$(curl -sI https://sunnycompasslabs.com | head -1)
echo "Response: $HTTP_STATUS"

if echo "$HTTP_STATUS" | grep -q "200\|301\|302"; then
  echo "Deployment verified successfully!"
else
  echo "Warning: Unexpected response. DNS may still be propagating."
fi
