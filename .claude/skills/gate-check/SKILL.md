---
name: gate-check
description: "Verify the exit criteria of the current lifecycle phase are met before advancing to the next phase."
argument-hint: "[optional: target phase]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: opus
---

## Phase 1: Locate the Gate

Read `production/stage.txt` and `.claude/docs/workflow-catalog.yaml`. Identify
the current phase, the next phase, the `exit_gate` code, and the
`exit_criteria`. The argument may override the target phase.

## Phase 2: Evaluate Each Criterion

For every exit criterion, gather objective evidence (file existence, counts,
test output via Bash, review verdicts already recorded). Mark each:
`MET` / `PARTIAL` / `NOT MET`, with the evidence.

## Phase 3: Director Gate

Per `.claude/docs/director-gates.md` and the review mode:
- `full` / `lean` → spawn the gate owner (`product-director` /
  `technical-director` / `qa-lead` / `delivery-lead`) via `Task` for a verdict.
- `solo` → skip; note it.

## Phase 4: Output

```
## Gate Check: [current] -> [next]   (gate: [CODE])

| Criterion | Status | Evidence |

### Director verdict: [APPROVED / APPROVED WITH CONDITIONS / BLOCKED]
### Blocking items
### Conditions (if approved with conditions)
### Overall: PASS / PASS WITH CONDITIONS / BLOCKED
```

## Phase 5: Advance

If PASS (or the user accepts the conditions), `AskUserQuestion` to confirm, then
write the next phase to `production/stage.txt`. If BLOCKED, list the skills that
close each gap. Nothing else is written.
