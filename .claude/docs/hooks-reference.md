# Hooks Reference

Hooks are wired in `.claude/settings.json`. All are bash scripts in
`.claude/hooks/` and are designed to be advisory — they inform, they do not hard-block
except where a dangerous git operation is detected.

| Hook | Event | Purpose |
|------|-------|---------|
| `session-start.sh` | SessionStart | Prints branch, recent commits, active sprint/milestone, open bug count, TODO/FIXME tally, and recovers `session-state/active.md` |
| `detect-gaps.sh` | SessionStart | Flags missing foundational docs for the detected phase (no concept, no stack, no specs, etc.) |
| `validate-commit.sh` | PreToolUse(Bash) | On `git commit`, checks message shape and warns about committing `.env`, large files, or `node_modules` |
| `validate-push.sh` | PreToolUse(Bash) | Warns on push to a protected branch and blocks `--force` pushes |
| `validate-artifacts.sh` | PostToolUse(Write\|Edit) | On writes under `docs/specs/`, `docs/adr/`, `docs/product/`, checks required sections & naming |
| `validate-skill-change.sh` | PostToolUse(Write\|Edit) | Advisory when a `.claude/skills/**` or `.claude/agents/**` file is modified |
| `pre-compact.sh` | PreCompact | Writes a short open-work summary so nothing is lost across compaction |
| `post-compact.sh` | PostCompact | Restores the pointer to `session-state/active.md` |
| `notify.sh` | Notification | Desktop notification passthrough |
| `session-stop.sh` | Stop | Appends a session summary to `production/session-logs/` |
| `log-agent.sh` | SubagentStart | Starts an audit-trail entry for a spawned subagent |
| `log-agent-stop.sh` | SubagentStop | Closes the audit-trail entry |

## Input Schemas

See `.claude/docs/hooks-reference/hook-input-schemas.md` for the JSON each hook
receives on stdin.
