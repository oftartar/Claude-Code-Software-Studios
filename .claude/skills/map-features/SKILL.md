---
name: map-features
description: "Decompose the product concept into a prioritized feature index with dependencies and MVP boundary."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, AskUserQuestion, Task
model: sonnet
agent: product-manager
---

## Phase 1: Read

`docs/product/product-concept.md` and `docs/product/product-pillars.md`.
If either is missing, stop and point to `/define-product`.

## Phase 2: Enumerate Features

From the core use cases, list candidate features. For each: a short name,
one-line purpose, the use case(s) it serves, and rough size (S/M/L).

Group into areas (e.g. Onboarding, Core Workflow, Collaboration, Admin,
Billing).

## Phase 3: Prioritize

`AskUserQuestion` to set the MVP boundary. For each feature classify as:
- **MVP** — the concept doesn't deliver its core value without it
- **Fast-follow** — needed soon, not for first usable release
- **Later** — real, but not now
- **Out** — explicitly not doing (goes to the concept's Non-Goals)

Every MVP feature must trace to a pillar. Flag any that doesn't.

## Phase 4: Dependencies

Note hard dependencies between features (A can't ship before B) and shared
infrastructure (auth, notifications, search) that several features assume.

## Phase 5: Write

Show the table, then ask to write `docs/product/feature-index.md`:

```
| Feature | Area | Priority | Size | Pillar | Depends on | Spec |
```

The `Spec` column links to `docs/specs/<slug>.md` once written.

## Next Steps

- `/write-spec <feature>` — one per MVP feature
- `/review-specs` — once the MVP specs exist
