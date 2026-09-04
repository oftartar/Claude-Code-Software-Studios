---
name: ux-review
description: "Heuristic and accessibility review of a UX spec or a built screen: usability heuristics, consistency with the design system, and WCAG 2.2 AA."
argument-hint: "[ux spec path or route/screen name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: design-lead
---

## Phase 1: Load

Read the target UX spec (or, for a built screen, the component/route files and
the owning UX spec). Read `design/ux/principles.md` and
`design/design-system/inventory.md`.

## Phase 2: Heuristic Pass

Evaluate against Nielsen's 10 plus:
- Visibility of system status (loading, saved, errors)
- Match to the user's real vocabulary
- User control (undo, cancel, back)
- Consistency with other flows and with the design system
- Error prevention, then clear recovery
- Recognition over recall
- Minimalist: is anything on screen not earning its place?

## Phase 3: Consistency Pass

Components used off-inventory; interaction patterns that differ from sibling
flows; navigation placement; state handling that diverges from the norm.

## Phase 4: Accessibility Pass

Spawn `accessibility-specialist` (Task): semantics, keyboard, focus, screen
reader, contrast, target size, reduced motion. For a built screen, run available
automated checks via Bash and add keyboard/SR reasoning.

## Phase 5: Output

```
## UX Review: [target]

### Heuristic findings   [severity: blocker / serious / minor]
### Consistency findings
### Accessibility findings   (WCAG criterion each)
### What works well
### Required before sign-off
### Verdict: APPROVED / APPROVED WITH CONDITIONS / BLOCKED
```

Read-only. Fixes go through `/ux-design` or `/dev-story`.
