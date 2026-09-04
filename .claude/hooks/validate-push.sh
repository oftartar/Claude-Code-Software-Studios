#!/bin/bash
# PreToolUse(Bash): guard pushes.
payload=$(cat)
cmd=$(echo "$payload" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
case "$cmd" in
  *"git push"*)
    if echo "$cmd" | grep -qE -- '(--force|-f)( |$)'; then
      echo "BLOCKED: force push. Use --force-with-lease and push manually if truly needed." >&2
      exit 2
    fi
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    case "$branch" in
      main|master|production|release)
        echo "WARNING: pushing directly to protected branch '$branch'." >&2
        ;;
    esac
    ;;
esac
exit 0
