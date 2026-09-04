#!/bin/bash
# PreCompact: preserve a pointer to open work.
mkdir -p production/session-state
STATE="production/session-state/active.md"
STAMP=$(date -u +%Y-%m-%dT%H:%MZ)
if [ ! -f "$STATE" ]; then
  {
    echo "# Active Session State"
    echo ""
    echo "<!-- STATUS -->"
    echo "Epic:"
    echo "Feature:"
    echo "Story:"
    echo "<!-- /STATUS -->"
    echo ""
    echo "## Open work (auto-noted before compaction $STAMP)"
    echo "- Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    echo "- Uncommitted files:"
    git status --porcelain 2>/dev/null | sed 's/^/  /'
  } > "$STATE"
else
  {
    echo ""
    echo "## Compaction checkpoint $STAMP"
    echo "- Branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    git status --porcelain 2>/dev/null | sed 's/^/  /'
  } >> "$STATE"
fi
echo "Preserved open-work summary to $STATE"
exit 0
