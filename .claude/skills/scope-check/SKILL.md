---
name: scope-check
description: "Check whether the current work is still within the agreed scope for the sprint / spec / MVP, and surface creep."
argument-hint: "[what you're working on, or a story/spec path]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
model: haiku
---

## Phase 1: Establish the Baseline

Read, in order of relevance:
- the story or spec named in the argument
- the current sprint plan (`production/sprints/`)
- `docs/product/feature-index.md` (MVP boundary)
- `docs/product/product-pillars.md`

## Phase 2: Compare

List what the current work actually touches vs. what the baseline says it
should. Classify each item:

- **In scope** — covered by an existing requirement / story
- **Creep** — not in the baseline, added during work
- **Gap** — in the baseline but not being done

## Phase 3: Output

```
## Scope Check: [work]

Baseline: [sprint / spec / MVP + path]

### In scope
### Creep (not in baseline)
- [item] — recommend: [defer to backlog / new story / drop / escalate to product-director]
### Gap (in baseline, not covered)
### Verdict: ON TRACK / MINOR DRIFT / OUT OF SCOPE
```

## Phase 4: Route

If creep is real and worth doing, `AskUserQuestion`: create a follow-up story,
escalate to `product-director` for an MVP-scope decision, or drop it. Read-only.
