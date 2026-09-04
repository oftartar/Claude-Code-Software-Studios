# Security Policy

## Scope

This repository is a development framework (agent/skill/hook/rule definitions).
It ships no runtime service. The main security-relevant surfaces are:

- **Hooks** in `.claude/hooks/` — shell scripts that run automatically on Claude
  Code events.
- **Permissions** in `.claude/settings.json` — the allow/deny lists for the
  `Bash` tool.

## Reporting a vulnerability

If you find a problem in a hook, a permission rule, or a skill that could cause
data loss or execute something dangerous, open a private report to the
maintainers (or a GitHub security advisory if this repo is hosted there). Please
include:

- the file and line,
- the class of problem,
- a minimal description of how it misbehaves — **not** a working exploit.

## Hardening notes for users of this framework

- Review `.claude/settings.json` before first use; tighten the `allow` list to
  match your workflow.
- The `deny` list blocks force-push, hard reset, recursive delete, `sudo`,
  `chmod 777`, publishing, and reading/writing `.env*`. Keep it.
- Hooks are advisory by design; only the git-safety `PreToolUse` hooks ever
  block a tool call.
- The framework never reads `.env*` files. Keep real secrets out of the repo and
  out of prompts.
