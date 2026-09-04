---
name: review-specs
description: "Cross-feature consistency review of all feature specs: contradictions, gaps, overlapping ownership, untestable criteria, and unaddressed shared concerns."
argument-hint: "[optional: subset of spec paths]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Task, AskUserQuestion
model: opus
agent: product-manager
---

## Phase 1: Load

Read every `docs/specs/*.md` (or the subset given), plus the concept, pillars,
and feature index.

## Phase 2: Parallel Analysis

Spawn these as independent `Task` subagents simultaneously:

1. **Consistency** (`product-manager`): contradictory requirements, terms used
   differently across specs, features that assume behavior another spec doesn't
   provide, duplicated ownership of the same surface.
2. **Design theory** (`design-lead`): interaction patterns that diverge between
   features, navigation model conflicts, inconsistent state/empty/error handling.
3. **Technical impact** (`lead-engineer`): shared concerns no spec owns (auth,
   permissions, notifications, search, audit, rate limiting), data-model
   collisions, API-shape conflicts.
4. **Testability** (`qa-lead`): acceptance criteria that are not observable,
   requirements with no acceptance criterion, missing negative cases.

Collect all before proceeding.

## Phase 3: Synthesize

```
## Spec Review — [N specs]

### Blocking contradictions
- [spec A] R? vs [spec B] R? — [conflict] — [proposed resolution]

### Unowned shared concerns
- [concern] — assumed by [specs] — needs an owner / its own spec

### Consistency issues
### Testability gaps
### Recommendations (ranked)
### Verdict: CONSISTENT / ISSUES / BLOCKING ISSUES
```

## Phase 4: Next

`AskUserQuestion`: fix specs now (list which), accept issues with noted
exceptions, or stop. Read-only — spec edits happen via `/write-spec`.

## Next Steps

- `/gate-check` — Feature Design → Technical Setup
