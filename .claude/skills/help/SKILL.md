---
name: help
description: "List available skills grouped by lifecycle phase, with the recommended order and what to run next."
argument-hint: "[optional: phase name or skill name]"
user-invocable: true
allowed-tools: Read, Glob, Grep
model: haiku
---

## Phase 1: Determine Context

- Read `production/stage.txt` if present (the current lifecycle stage).
- Read `production/review-mode.txt` if present.
- Glob `.claude/skills/*/SKILL.md` and read each frontmatter `name` +
  `description`.

## Phase 2: Output

If an argument names a phase or skill, show just that section / that skill's
description and argument hint.

Otherwise print all skills grouped exactly as in
`.claude/docs/skills-reference.md` (Onboarding, Product & Requirements,
Architecture, Design, Planning, Build, QA, Release & Ops, Team Orchestration),
each line as `` `/name` — description ``.

Then print:

```
You are at stage: [stage from stage.txt, or "not set — run /start"]
Review mode: [mode, or "not set — run /start"]

Recommended next: [pick from workflow-catalog.yaml based on stage]
```

## Phase 3: Pointers

End with:
- "Full workflow: `.claude/docs/quick-start.md`"
- "Phase definitions: `.claude/docs/workflow-catalog.yaml`"
- "Agent roster: `.claude/docs/agent-roster.md`"

Read-only — writes nothing.
