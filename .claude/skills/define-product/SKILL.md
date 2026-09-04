---
name: define-product
description: "Author the product concept document and 3-5 product pillars from a chosen direction."
argument-hint: "[one-line product pitch, or nothing if brainstorm notes exist]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Task
model: sonnet
agent: product-manager
---

## Phase 1: Gather Input

Read `docs/product/brainstorm-notes.md` if present. Otherwise take the pitch from
the argument, or ask for it. Ask any clarifying questions needed to fill the
template — do not guess.

## Phase 2: Draft the Concept

Use `.claude/docs/templates/product-concept.md`. Sections:
`## Vision`, `## Problem`, `## Target Users` (primary + secondary, with the
job-to-be-done), `## Value Proposition`, `## Core Use Cases` (3–5, as
scenarios), `## Non-Goals`, `## Success Metrics` (leading + lagging),
`## Key Risks & Assumptions`, `## Competitive Landscape`.

Present the draft in full.

## Phase 3: Draft the Pillars

3–5 product pillars — short, memorable, and decision-useful. Each pillar:
a name, one sentence, and "this means we say no to …". Use
`.claude/docs/templates/product-pillars.md`.

Pillars must be able to adjudicate a real trade-off. If a pillar can't settle an
argument, rewrite it.

## Phase 4: Review Gate

If review mode is `full`, spawn `product-director` (Task) for a `PD-GATE`
verdict on concept + pillars. In `lean`/`solo`, skip and note it.

## Phase 5: Write

Ask before writing each file:
- `docs/product/product-concept.md`
- `docs/product/product-pillars.md`

## Phase 6: Stage

Offer to set `production/stage.txt` to `Feature Design`.

## Next Steps

- `/setup-stack` — configure the tech stack
- `/map-features` — decompose the concept into a prioritized feature index
