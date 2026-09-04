---
name: architecture-decision
description: "Record a new Architecture Decision Record, or revise an existing one. Captures context, options, decision, and consequences."
argument-hint: "[decision title]  |  revise [adr-path]  |  retrofit [adr-path]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion
model: sonnet
agent: technical-director
---

## Phase 0: Mode

- `[title]` → new ADR. Next number = highest `docs/adr/adr-NNN-*.md` + 1.
- `revise [path]` → supersede/amend an existing ADR. Never create a competing
  ADR for the same decision — revise the original and mark the old state in its
  history.
- `retrofit [path]` → add missing template sections to an ADR that already
  exists in prose.

## Phase 1: Frame

Read the Required ADR row (in `docs/adr/README.md`), the relevant specs, and
`.claude/docs/technical-preferences.md`. State precisely what is being decided
and whether it is a one-way or two-way door.

## Phase 2: Options

Lay out 2–4 real options. For each: how it works, pros, cons, cost
(operational + cognitive), lock-in, and how it performs against the requirements
and the current scale. Recommend one and say why.

## Phase 3: Specialist Input

If the decision is stack-specific, spawn the pinned framework/database
specialist (from `technical-preferences.md`) via `Task` for an idiom check.

## Phase 4: Decide

`AskUserQuestion` to capture the choice.

## Phase 5: Write

Use `.claude/docs/templates/architecture-decision-record.md`:
`## Status` (Proposed/Accepted/Superseded + date) · `## Context` ·
`## Options Considered` · `## Decision` · `## Consequences` (positive, negative,
follow-up work) · `## History`.

Ask before writing `docs/adr/adr-NNN-<slug>.md`. Then update:
- `docs/adr/README.md` status table
- `.claude/docs/technical-preferences.md` — Architecture Decisions Log entry,
  and Forbidden Patterns / Allowed Libraries if the decision implies them

## Note

An ADR with `Status: Proposed` is not a license to build on it. Implementation
waits for `Accepted`.

## Next Steps

- Next Required ADR, or `/architecture-review`-equivalent via `/gate-check`
