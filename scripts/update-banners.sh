#!/usr/bin/env bash
# Purpose: Ensure every markdown page under pages/ shows the MYOB banner at the top
# Behavior:
# - If a banner image referencing myob-banner exists anywhere, standardize it to the correct relative path and alt text
# - Otherwise, insert the banner at the top (after YAML front matter if present)
# - Uses depth-aware relative path to assets/images/myob-banner.png
# Standards: Follows asset-management rules for image references and alt text

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

BANNER_FILE="assets/images/myob-banner.png"

# Verify banner file exists
if [ ! -f "$BANNER_FILE" ]; then
  echo "ERROR: Banner image not found at $BANNER_FILE" >&2
  exit 1
fi

# Iterate over all markdown files under pages/
find pages -type f -name "*.md" | while read -r file; do
  # Compute the directory components after pages/
  subpath="${file#pages/}"
  dir_after_pages="$(dirname "$subpath")"

  # Determine how many levels to go up to reach repo root
  # Always at least 1 (to go from pages/ to repo root)
  if [ "$dir_after_pages" = "." ]; then
    depth=1
  else
    # number of segments in dir_after_pages = number of slashes + 1
    slash_count=$(awk -v s="$dir_after_pages" 'BEGIN{ n=gsub("/","/",s); print n }')
    segments=$((slash_count + 1))
    depth=$((1 + segments))
  fi

  # Build prefix of ../ repeated depth times
  prefix=""
  for _ in $(seq 1 $depth); do prefix="../${prefix}"; done

  # Desired banner markdown
  desired_banner="![MYOB Banner](${prefix}assets/images/myob-banner.png)"

  # If file already contains any myob-banner reference, normalize the first one
  if grep -qE "!\[[^\]]*\]\([^)]*myob-banner[^)]*\)" "$file"; then
    awk -v repl="$desired_banner" '
      BEGIN{done=0}
      {
        if(done==0 && $0 ~ /!\[[^\]]*\]\([^)]*myob-banner[^)]*\)/){
          print repl
          done=1
        } else {
          print $0
        }
      }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  else
    # Insert at top; if YAML front matter present, insert after it
    if head -1 "$file" | grep -q "^---$"; then
      end_line=$(awk 'NR>1 && $0=="---"{print NR; exit}' "$file")
      if [ -n "${end_line:-}" ]; then
        awk -v line=$end_line -v banner="$desired_banner" '
          NR==line { print $0; print ""; print banner; print ""; next }
          { print $0 }
        ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      else
        printf "%s\n\n" "$desired_banner" | cat - "$file" > "$file.tmp" && mv "$file.tmp" "$file"
      fi
    else
      printf "%s\n\n" "$desired_banner" | cat - "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    fi
  fi

done

# Stage updated files for commit
git add -A pages
