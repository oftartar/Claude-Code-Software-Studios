---
name: create-stories
description: "Break an epic into vertically-sliced, independently shippable stories with acceptance criteria, test notes, and estimates."
argument-hint: "[epic slug]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Task, AskUserQuestion
model: sonnet
agent: product-manager
---

## Phase 1: Inputs

Read `production/epics/<slug>/epic.md`, the linked specs, the relevant UX specs,
the data model, and governing ADRs.

## Phase 2: Slice

Cut the epic into stories that are:
- **vertical** — each delivers a usable increment (UI + API + data as needed),
  not "the backend for X" then "the frontend for X" unless there's a real reason
- **small** — ideally ≤ ~2 days; split anything bigger
- **independent** — minimal ordering constraints; note the ones that remain
- **testable** — clear acceptance criteria referencing spec requirement ids

Classify each story: **Logic**, **UI**, **Integration**, **Data/Migration**,
**Infra**, or **Spike**.

## Phase 3: Per-Story Detail

For each, use `.claude/docs/templates/user-story.md`:
`## As a / I want / So that` · `## Acceptance Criteria` (ref requirement ids) ·
`## Out of Scope` · `## Technical Notes` (files likely touched, migration steps,
new-dependency needs — flagged) · `## QA Test Cases` (drafted from the ACs) ·
`## Estimate`.

## Phase 4: Estimate

Relative sizing (S/M/L or points). Spawn `lead-engineer` (Task) for a sanity
check on the technical stories and to flag hidden work.

## Phase 5: Write

Ask before writing each `production/epics/<slug>/story-NNN-<slug>.md`. Update the
epic's story list.

## Next Steps

- `/story-readiness` equivalent is folded into `/sprint-plan`
- `/sprint-plan` — pull ready stories into a sprint
