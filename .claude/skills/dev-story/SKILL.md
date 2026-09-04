---
name: dev-story
description: "Implement one story end-to-end with the collaborative protocol: read spec, propose architecture, implement, test, and prepare for review."
argument-hint: "[story file path]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion, TodoWrite
model: sonnet
agent: lead-engineer
---

## Phase 1: Load

Read the story, its epic, the linked spec + UX spec, the data model, and
governing ADRs. Read `.claude/docs/technical-preferences.md` and the path-scoped
rules for the areas the story touches.

**Stop if**: the ADR is `Proposed` (run `/architecture-decision`), the story
isn't ready (missing ACs / UX spec), or the story is clearly two stories (run
`/create-stories` to split).

## Phase 2: Update Session State

Write the story's Epic/Feature/Story into the `<!-- STATUS -->` block of
`production/session-state/active.md`.

## Phase 3: Propose Architecture

Identify the story type (Logic / UI / Integration / Data / Infra). Present:
- files to add/change, and the public API of any new unit
- where state lives, the error model, the data flow
- migration steps (if Data) — flagged for explicit approval
- any new dependency — flagged for explicit approval
- trade-offs of the approach

Batch constrained questions with `AskUserQuestion`. For stack-idiom questions,
spawn the pinned framework specialist (Task).

## Phase 4: Implement

Only after the approach is approved. Follow the rules for each path. If a rule or
hook flags something, fix it and say what was wrong. If a spec ambiguity
surfaces, stop and ask.

**Before any Write/Edit**: "May I write this to [files]?" — list them all.
Migrations and dependency changes get their own explicit approval.

## Phase 5: Tests

Write tests per `.claude/rules/test-standards.md` — one per acceptance
criterion, referencing requirement ids. Run them via Bash. Show results.

## Phase 6: Self-check

Run typecheck/lint/tests. Confirm each acceptance criterion is met, with
evidence.

## Next Steps

`AskUserQuestion`:
- `/code-review` this story (recommended)
- `/story-done` if review already happened
- pause here
