---
name: sprint-plan
description: "Plan a sprint from ready stories: check readiness, set the goal, select scope to fit capacity, and record the plan."
argument-hint: "[sprint number]  [--capacity <points/days>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Task, AskUserQuestion
model: sonnet
agent: delivery-lead
---

## Phase 1: Inputs

Read `production/epics/README.md`, all story files, the previous sprint plan (for
velocity), and `production/risks.md` if present.

## Phase 2: Readiness Filter

A story is **ready** when: acceptance criteria reference requirement ids, the UX
spec (for UI stories) exists, the governing ADR is `Accepted`, dependencies are
done or also in this sprint, and it has an estimate. List not-ready stories with
the one thing each needs.

## Phase 3: Goal + Scope

`AskUserQuestion` for the sprint goal (one sentence). Then select ready stories
that:
- advance the goal and the critical path
- fit capacity (from `--capacity`, else prior velocity, else ask)
- leave ~15–20% slack for review, bugs, and the unexpected

## Phase 4: Risk Pass

For the selected scope, list the top 3 risks and a mitigation or trigger for
each. Spawn `lead-engineer` (Task) to flag technical risk in the selection.

## Phase 5: Write

Use `.claude/docs/templates/sprint-plan.md`:
`## Sprint N` · `## Goal` · `## Committed Stories` (id, title, estimate, owner
area) · `## Stretch` · `## Risks & Mitigations` · `## Out of Scope` ·
`## Capacity`.

Ask before writing `production/sprints/sprint-NN.md`.

## Phase 6: Gate

`full`/`lean`: spawn `delivery-lead` `DL-GATE` sign-off (self, effectively — or
`product-director` if scope trades against the MVP boundary).

## Next Steps

- `/dev-story <story>` — start the first committed story
- `/retrospective` at sprint end
