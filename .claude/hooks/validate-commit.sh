#!/bin/bash
# PreToolUse(Bash): sanity-check git commits.
payload=$(cat)
cmd=$(echo "$payload" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
case "$cmd" in
  *"git commit"*)
    staged=$(git diff --cached --name-only 2>/dev/null)
    if echo "$staged" | grep -qE '(^|/)\.env'; then
      echo "BLOCKED: a .env file is staged. Unstage it before committing." >&2
      exit 2
    fi
    if echo "$staged" | grep -q 'node_modules/'; then
      echo "BLOCKED: node_modules/ is staged." >&2
      exit 2
    fi
    big=$(git diff --cached --numstat 2>/dev/null | awk '$1 > 5000 {print $3}')
    [ -n "$big" ] && echo "WARNING: very large change in: $big" >&2
    ;;
esac
exit 0
