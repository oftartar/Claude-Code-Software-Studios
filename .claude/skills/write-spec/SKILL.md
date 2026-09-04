---
name: write-spec
description: "Author a feature specification (PRD-level) for one feature: problem, requirements, UX notes, data/API impact, testable acceptance criteria."
argument-hint: "[feature name or slug]  |  retrofit [path]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Task
model: sonnet
agent: product-manager
---

## Phase 0: Mode

- `retrofit [path]` → read an existing doc and restructure it to the template,
  filling gaps by asking. Preserve the author's intent.
- `[feature]` → new spec. If no argument, list MVP features from
  `docs/product/feature-index.md` and ask which.

## Phase 1: Context

Read the concept, pillars, feature-index row for this feature, and any related
specs it depends on or overlaps. Read
`.claude/docs/technical-preferences.md` for platform constraints.

## Phase 2: Interview

Ask (don't assume): the precise user and trigger, the current workaround, what
"done well" looks like, the explicit non-goals, edge cases the user already
knows about, and the success metric.

## Phase 3: Draft

Use `.claude/docs/templates/feature-spec.md` and follow
`.claude/rules/design-docs.md`. Required sections in order:
`## Problem` · `## Goals` · `## Non-Goals` · `## Users & Scenarios` ·
`## Requirements` (numbered R1, R2, …) · `## UX Notes` · `## Data & API Impact` ·
`## Acceptance Criteria` (each references a requirement id; each observable and
testable) · `## Open Questions` · `## Rollout` (flag, phased, migration).

Present the full draft.

## Phase 4: Review Gate

`full` mode: spawn `product-manager` peer review is implicit (you are it); spawn
`lead-engineer` (Task) for a feasibility + data/API-impact sanity check. Fold in
findings.

## Phase 5: Write

Ask before writing `docs/specs/<slug>.md`. Update the `Spec` link in
`docs/product/feature-index.md`.

## Next Steps

- Repeat for the next MVP feature
- `/review-specs` when the MVP set is drafted
- `/ux-design <flow>` for this feature's screens
