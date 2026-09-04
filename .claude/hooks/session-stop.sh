#!/bin/bash
# Stop: append a short session summary to the audit trail.
mkdir -p production/session-logs
LOG="production/session-logs/$(date -u +%Y-%m-%d).log"
{
  echo "--- session end $(date -u +%Y-%m-%dT%H:%M:%SZ) ---"
  echo "branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  echo "head: $(git rev-parse --short HEAD 2>/dev/null)"
  echo "dirty files: $(git status --porcelain 2>/dev/null | wc -l)"
  echo ""
} >> "$LOG"
exit 0
