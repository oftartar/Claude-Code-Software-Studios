#!/bin/bash
# SubagentStop: close the audit-trail entry.
mkdir -p production/session-logs
payload=$(cat)
agent=$(echo "$payload" | grep -oE '"subagent_type"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
[ -z "$agent" ] && agent="unknown"
echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) STOP  subagent=$agent" >> "production/session-logs/agents-$(date -u +%Y-%m-%d).log"
exit 0
