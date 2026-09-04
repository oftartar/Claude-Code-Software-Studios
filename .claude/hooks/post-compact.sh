#!/bin/bash
# PostCompact: point the next turn back at the session state.
STATE="production/session-state/active.md"
if [ -f "$STATE" ]; then
  echo "Context was compacted. Resume from: $STATE"
  echo "--- STATUS block ---"
  sed -n '/<!-- STATUS -->/,/<!-- \/STATUS -->/p' "$STATE"
fi
exit 0
