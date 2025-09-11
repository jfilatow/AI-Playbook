#!/usr/bin/env bash
# Purpose: Regenerate REPO_STRUCTURE.md to reflect current repository files
# Why: Keeps the repository structure map up-to-date for discoverability

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
OUTPUT_FILE="$REPO_ROOT/REPO_STRUCTURE.md"

# Write header and generation timestamp
{
  echo "# Repository Structure"
  echo
  echo "Generated on: $(date -u)"
  echo
  echo '```'
} > "$OUTPUT_FILE"

# List relevant files; exclude common noisy paths
find "$REPO_ROOT" -type f \( \
  -name "*.md" -o \
  -name "*.mdc" -o \
  -name "*.yml" -o \
  -name "*.yaml" -o \
  -name "*.scss" -o \
  -name "*.png" -o \
  -name "*.jpg" -o \
  -name "*.jpeg" -o \
  -name "*.svg" \
\) \
  | sed "s|$REPO_ROOT/||" \
  | grep -Ev "^(\.git/|node_modules/|\.next/|dist/|build/|\.cache/)" \
  | sort >> "$OUTPUT_FILE"

echo '```' >> "$OUTPUT_FILE"

# Stage the structure file for commit if changed
git add "$OUTPUT_FILE" 2>/dev/null || true
