#!/bin/bash
# PostToolUse(Write|Edit): advisory when skill/agent definitions change.
payload=$(cat)
fp=$(echo "$payload" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
case "$fp" in
  *.claude/skills/*/SKILL.md)
    echo "NOTE: skill definition changed ($fp). Re-check frontmatter (name, description, allowed-tools, model) and keep .claude/docs/skills-reference.md in sync."
    ;;
  *.claude/agents/*.md)
    echo "NOTE: agent definition changed ($fp). Keep .claude/docs/agent-roster.md in sync."
    ;;
esac
exit 0
