#!/usr/bin/env python3
# Purpose: Normalize markdown page formatting across pages/ to match ethics.md pattern
# - Ensure banner at top remains intact
# - Frame the H1 heading between '---' lines with blank lines around heading
# - Frame the footer Previous/Next line between '---' lines
# - Do not attempt to invent missing Previous/Next links; only frame when present

import sys
import re
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
PAGES_DIR = REPO_ROOT / "pages"

BANNER_RE = re.compile(r"^!\[MYOB Banner\]\(.*myob-banner\.png\)")
H1_RE = re.compile(r"^# ")
FOOTER_RE = re.compile(r"^\*\*Previous:\*\* .* \| \*\*Next:\*\* .*")
HR_RE = re.compile(r"^---\s*$")


def normalize_file(path: Path) -> bool:
    # Read lines
    original = path.read_text(encoding="utf-8").splitlines()
    lines = original[:]

    changed = False

    # Find indices
    banner_idx = next((i for i, l in enumerate(lines) if BANNER_RE.match(l)), None)
    h1_idx = next((i for i, l in enumerate(lines) if H1_RE.match(l)), None)

    # Insert header framing around H1 (keeping banner at very top if present)
    if h1_idx is not None:
        # Ensure there is a '---' between banner and H1
        insert_pos_top_hr = None
        # Determine where the top HR should be: immediately after banner block (banner line)
        if banner_idx is not None:
            # After banner line, unless a HR already follows as the next non-empty line
            # Find next non-empty after banner_idx
            j = banner_idx + 1
            while j < len(lines) and lines[j].strip() == "":
                j += 1
            if not (j < len(lines) and HR_RE.match(lines[j])):
                insert_pos_top_hr = banner_idx + 1
        else:
            # No banner; ensure file starts with HR before H1
            # Check previous non-empty above H1
            j = h1_idx - 1
            while j >= 0 and lines[j].strip() == "":
                j -= 1
            if not (j >= 0 and HR_RE.match(lines[j])):
                insert_pos_top_hr = h1_idx
        if insert_pos_top_hr is not None:
            lines[insert_pos_top_hr:insert_pos_top_hr] = ["---", ""]
            changed = True
            # Adjust indices due to insertion
            if banner_idx is not None and insert_pos_top_hr <= h1_idx:
                h1_idx += 2

        # Ensure there is a blank line immediately before H1
        if h1_idx > 0 and lines[h1_idx - 1].strip() != "":
            lines.insert(h1_idx, "")
            changed = True
            h1_idx += 1

        # Ensure there is a blank line immediately after H1
        if h1_idx + 1 < len(lines):
            if lines[h1_idx + 1].strip() != "":
                lines.insert(h1_idx + 1, "")
                changed = True

        # Ensure there is a HR after H1 (after the first blank line following H1)
        # Find first non-empty after the blank line following H1
        k = h1_idx + 2 if h1_idx + 2 <= len(lines) else len(lines)
        if k <= len(lines):
            # skip additional blank lines
            while k < len(lines) and lines[k].strip() == "":
                k += 1
            if not (k < len(lines) and HR_RE.match(lines[k])):
                # Insert HR at position k
                lines[k:k] = ["---", ""]
                changed = True

    # Footer framing: find the last Previous/Next line
    footer_idx = None
    for i in range(len(lines) - 1, -1, -1):
        if FOOTER_RE.match(lines[i] or ""):
            footer_idx = i
            break

    if footer_idx is not None:
        # Ensure HR above footer
        j = footer_idx - 1
        while j >= 0 and lines[j].strip() == "":
            j -= 1
        if not (j >= 0 and HR_RE.match(lines[j])):
            # Insert HR with a blank line above footer
            lines[footer_idx:footer_idx] = ["", "---"]
            changed = True
            footer_idx += 2
        # Ensure HR below footer
        k = footer_idx + 1
        while k < len(lines) and lines[k].strip() == "":
            k += 1
        if not (k < len(lines) and HR_RE.match(lines[k])):
            # Insert HR with preceding blank line
            insert_pos = footer_idx + 1
            lines[insert_pos:insert_pos] = ["", "---"]
            changed = True

    if changed and lines != original:
        path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return changed


def main() -> int:
    changed_any = False
    for md in PAGES_DIR.rglob("*.md"):
        if normalize_file(md):
            changed_any = True
    print("changed" if changed_any else "nochanges")
    return 0


if __name__ == "__main__":
    sys.exit(main())
