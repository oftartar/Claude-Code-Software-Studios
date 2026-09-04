# Setup Requirements

## Required

- **Claude Code** (latest). This project relies on subagents, skills, hooks, and
  path-scoped rules.
- **Git** with a configured user. Trunk-based development is assumed.
- **Bash** available on PATH (Git Bash on Windows) — hooks and the status line
  are bash scripts.

## Recommended

- **jq** — the status line and some hooks use it, with a grep fallback if absent.
- A Node package manager (`pnpm`/`npm`/`yarn`) and/or Python/`uv` depending on the
  stack you choose in `/setup-stack`.

## First run

1. Open this directory in Claude Code.
2. The `session-start` hook prints project context; `detect-gaps` lists what is
   missing.
3. Run `/start`.

## Local overrides (not committed)

- `CLAUDE.local.md` — personal notes / machine-specific context. Template:
  `.claude/docs/CLAUDE-local-template.md`.
- `.claude/settings.local.json` — personal permission tweaks. Template:
  `.claude/docs/settings-local-template.md`.

Both are gitignored.
