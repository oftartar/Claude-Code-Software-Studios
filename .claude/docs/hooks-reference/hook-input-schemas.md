# Hook Input Schemas

What each hook receives on stdin (JSON) when Claude Code invokes it. Fields shown
are the ones these scripts rely on; the payload may contain more.

## SessionStart (`session-start.sh`, `detect-gaps.sh`)
No stdin payload. Scripts read the working tree directly.

## PreToolUse (`validate-commit.sh`, `validate-push.sh`)
```json
{
  "tool_name": "Bash",
  "tool_input": { "command": "git commit -m \"...\"" }
}
```
Exit non-zero to block the tool call; print to stderr to surface a reason.

## PostToolUse (`validate-artifacts.sh`, `validate-skill-change.sh`)
```json
{
  "tool_name": "Write",
  "tool_input": { "file_path": "docs/specs/checkout.md", "content": "..." },
  "tool_response": { "success": true }
}
```
Advisory only — print notes to stdout; do not exit non-zero.

## PreCompact / PostCompact (`pre-compact.sh`, `post-compact.sh`)
```json
{ "trigger": "auto" | "manual" }
```

## Notification (`notify.sh`)
```json
{ "message": "Claude needs your input" }
```

## Stop (`session-stop.sh`)
```json
{ "stop_hook_active": true }
```

## SubagentStart / SubagentStop (`log-agent.sh`, `log-agent-stop.sh`)
```json
{ "subagent_type": "frontend-engineer" }
```
