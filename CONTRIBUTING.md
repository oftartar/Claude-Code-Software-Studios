# Contributing

This repository is a **framework** — agent definitions, skills, hooks, rules, and
templates that shape how Claude Code builds a web app. Contributions usually mean
improving that framework, not the app built with it.

## Ground rules

- Keep the collaborative protocol intact: every implementation/authoring agent
  asks before writing; leadership agents decide and review, they don't implement.
- Keep agents single-domain. If an agent is doing two jobs, split it.
- Skills are phase-structured and end with **Next Steps**.
- Rules are path-scoped and carry a correct/incorrect example.

## Adding or changing an agent

1. Copy the nearest existing file in `.claude/agents/`.
2. Frontmatter `name` **must** equal the filename (minus `.md`).
3. Set `model` by tier: haiku (read/format), sonnet (default), opus (synthesis
   / high-stakes gates).
4. Include: Collaboration Protocol, Key Responsibilities, "Must NOT", Delegation Map.
5. Update `.claude/docs/agent-roster.md`.

## Adding or changing a skill

1. `.claude/skills/<name>/SKILL.md` with frontmatter: `name`, `description`,
   `argument-hint`, `user-invocable: true`, `allowed-tools`, optional `model`,
   optional `agent`.
2. Structure as numbered Phases. Read-only skills say so. Writing skills use the
   "May I write to …?" gate.
3. Update `.claude/docs/skills-reference.md`.

## Adding a rule

`.claude/rules/<name>.md` with:

```markdown
---
paths:
  - "glob/**"
---
# <Name> Rules
- ...
## Examples
**Correct** / **Incorrect**
```

Then add a row to `.claude/docs/rules-reference.md`.

## Hooks

Bash, POSIX-portable, fast (respect the `timeout` in `settings.json`), advisory
by default. Exit non-zero from a `PreToolUse` hook only to block a genuinely
dangerous action. Document new hooks in `.claude/docs/hooks-reference.md`.

## Testing your change

- `bash -n` every shell script you touch.
- Run the affected skill end to end in a scratch copy.
- Confirm `settings.json` is valid JSON.

## Commit messages

Conventional-ish: `type(scope): summary`. One logical change per commit.
