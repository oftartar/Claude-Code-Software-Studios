#!/bin/bash
# SessionStart hook: load project context at session start.
echo "=== Claude Code Software Studios — Session Context ==="

BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
  echo "Branch: $BRANCH"
  echo ""
  echo "Recent commits:"
  git log --oneline -5 2>/dev/null | while read -r line; do echo "  $line"; done
fi

LATEST_SPRINT=$(ls -t production/sprints/sprint-*.md 2>/dev/null | head -1)
[ -n "$LATEST_SPRINT" ] && echo "" && echo "Active sprint: $(basename "$LATEST_SPRINT" .md)"

LATEST_MILESTONE=$(ls -t production/milestones/*.md 2>/dev/null | head -1)
[ -n "$LATEST_MILESTONE" ] && echo "Active milestone: $(basename "$LATEST_MILESTONE" .md)"

BUG_COUNT=0
for dir in docs/runbooks production tests; do
  if [ -d "$dir" ]; then
    c=$(find "$dir" -name "BUG-*.md" 2>/dev/null | wc -l)
    BUG_COUNT=$((BUG_COUNT + c))
  fi
done
[ "$BUG_COUNT" -gt 0 ] && echo "Open bug files: $BUG_COUNT"

if [ -d "src" ]; then
  TODO=$(grep -rIn "TODO" src/ 2>/dev/null | wc -l)
  FIXME=$(grep -rIn "FIXME" src/ 2>/dev/null | wc -l)
  if [ "$TODO" -gt 0 ] || [ "$FIXME" -gt 0 ]; then
    echo ""
    echo "Code health: ${TODO} TODOs, ${FIXME} FIXMEs in src/"
  fi
fi

STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
  echo ""
  echo "=== ACTIVE SESSION STATE DETECTED ==="
  echo "A previous session left state at: $STATE_FILE"
  echo "Read it to recover context and continue."
  echo ""
  echo "Last 20 lines:"
  tail -20 "$STATE_FILE" 2>/dev/null
  echo "=== END SESSION STATE PREVIEW ==="
fi

echo "==================================="
exit 0
