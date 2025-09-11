#!/usr/bin/env bash
# Purpose: Append a bullet list of staged file changes into the Unreleased section of CHANGELOG.md
# Why: Ensures every commit records what changed, improving traceability

set -euo pipefail

# Resolve repository root for consistent paths
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

CHANGELOG_FILE="$REPO_ROOT/CHANGELOG.md"

# Collect staged changes (name-status shows Added/Modified/Deleted etc.)
STAGED_CHANGES_RAW="$(git diff --cached --name-status || true)"

# If nothing is staged, do nothing
if [ -z "$STAGED_CHANGES_RAW" ]; then
  exit 0
fi

# Ensure changelog exists with required Unreleased section
if [ ! -f "$CHANGELOG_FILE" ]; then
  {
    echo "# Changelog"
    echo
    echo "All notable changes to this repository are documented in this file."
    echo
    echo "## [Unreleased]"
    echo
  } > "$CHANGELOG_FILE"
fi

# Prepare a human-readable bullet list of staged changes
# Example line: "M pages/README.md" -> " - M pages/README.md"
STAGED_CHANGES_BULLETS="$(echo "$STAGED_CHANGES_RAW" | sed 's/^/ - /')"

# Timestamp in UTC for consistent ordering
NOW_UTC="$(date -u '+%Y-%m-%d %H:%M UTC')"

# Block to insert under the Unreleased section
INSERT_BLOCK="### Changes on ${NOW_UTC}
${STAGED_CHANGES_BULLETS}
"

# Insert the block immediately after the first occurrence of the Unreleased heading
awk -v block="$INSERT_BLOCK" '
  BEGIN { inserted=0 }
  {
    print $0
    if (inserted==0 && $0 ~ /^## \[Unreleased\]/) {
      print ""
      n=split(block, arr, "\n")
      for (i=1; i<=n; i++) print arr[i]
      print ""
      inserted=1
    }
  }
' "$CHANGELOG_FILE" > "$CHANGELOG_FILE.tmp"

mv "$CHANGELOG_FILE.tmp" "$CHANGELOG_FILE"

# Stage the updated changelog so it becomes part of the commit
git add "$CHANGELOG_FILE"
