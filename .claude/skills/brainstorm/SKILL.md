---
name: brainstorm
description: "Guided product ideation using jobs-to-be-done, user psychology, and opportunity framing. Open mode or from a hint."
argument-hint: "[open | a theme/problem hint]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
model: sonnet
agent: product-manager
---

## Phase 0: Mode

- `open` → fully open exploration.
- a hint (e.g. "internal tools for clinics", "budgeting for couples") → explore
  within it.
- no argument → ask for a hint or confirm open mode.

## Phase 1: Diverge (do not converge yet)

Explore in writing across these lenses. Ask the user questions throughout — this
is a dialogue, not a lecture.

- **Job to be done**: who is trying to make what progress, in what circumstance,
  and what do they use today (including "nothing" and "a spreadsheet")?
- **Struggling moments**: where is the current approach slow, error-prone,
  anxious, or embarrassing?
- **Who feels it most**: the narrowest audience for whom this is a hair-on-fire
  problem.
- **Why now**: what changed (tech, cost, behavior, regulation) that makes this
  newly possible or newly needed?
- **Anti-personas**: who this is explicitly not for.

Offer 3–6 distinct directions, each as: one-line premise · primary user ·
the wedge · the riskiest assumption.

## Phase 2: Converge

`AskUserQuestion` to pick one direction (or merge two). Then pressure-test it:

- What is the smallest version that delivers the core value end to end?
- What must be true for this to work? (name the top 3 assumptions)
- What is the first thing to validate, and how (a prototype? a spec? a
  conversation)?

## Phase 3: Capture

Offer to write `docs/product/brainstorm-notes.md` (create `docs/product/` if
needed): the chosen direction, the alternatives considered, the assumptions, and
the open questions. Ask before writing.

## Next Steps

- `/define-product` — turn the chosen direction into a concept doc + pillars
- `/prototype` (via the `prototyper` agent) — if the riskiest assumption is technical
