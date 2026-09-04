---
name: create-epics
description: "Map the feature index to epics — coarse deliverable chunks with a goal, scope boundary, dependencies, and definition of done."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion
model: sonnet
agent: delivery-lead
---

## Phase 1: Inputs

Read `docs/product/feature-index.md`, the MVP specs, the architecture doc, and
the data model.

## Phase 2: Form Epics

Group MVP features (and the shared infrastructure they need) into epics. A good
epic:
- delivers something coherent and demoable
- is 1–3 sprints of work
- has one clear owner area
- can be stated as "done when …"

Include enabling epics for shared infrastructure (auth, notifications, design
system foundation, CI) even though they aren't user features.

## Phase 3: Sequence

Order epics by dependency and risk. Mark the critical path. Note which epics can
run in parallel.

## Phase 4: Write

For each epic, use `.claude/docs/templates/epic.md`:
`## Goal` · `## In Scope` · `## Out of Scope` · `## Specs` (links) ·
`## Dependencies` · `## Definition of Done` · `## Risks`.

Ask before writing `production/epics/<slug>/epic.md` (one folder per epic;
stories will live alongside).

Also write/update `production/epics/README.md` with the ordered epic list and the
critical path.

## Next Steps

- `/create-stories <epic>` — break the first epic down
- `/sprint-plan` — once enough stories are ready
