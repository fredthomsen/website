#!/bin/bash
# Sync resume data from resume repository to website
# Usage: ./scripts/sync-resume.sh [path-to-resume-repo]

set -e

RESUME_REPO=${1:-"../resume"}
RESUME_DATA="$RESUME_REPO/data/resume.yml"
WEBSITE_DATA="src/data/resume.yaml"

if [ ! -f "$RESUME_DATA" ]; then
  echo "Error: Resume data not found at $RESUME_DATA"
  echo "Usage: $0 [path-to-resume-repo]"
  exit 1
fi

echo "📋 Syncing resume data from $RESUME_REPO"

cp "$RESUME_DATA" "$WEBSITE_DATA"

echo "✅ Sync complete!"
echo ""
echo "Review changes:"
git diff "$WEBSITE_DATA"
echo ""
echo "Next steps:"
echo "  1. Review the diff above"
echo "  2. Test: make serve"
echo "  3. Commit if satisfied"
