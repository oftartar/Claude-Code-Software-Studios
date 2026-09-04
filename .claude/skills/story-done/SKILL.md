---
name: story-done
description: "Verify a story's acceptance criteria, check for spec/ADR deviations, confirm tests and review, and mark the story complete."
argument-hint: "[story file path]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Edit, AskUserQuestion
model: sonnet
agent: lead-engineer
---

## Phase 1: Load

Read the story, the linked spec + UX spec, and the governing ADR. Run
`git diff` (or against the story's branch base) to see what changed.

## Phase 2: Acceptance Criteria

For each criterion: state MET / NOT MET / PARTIAL with concrete evidence (a
test name, a code path, a manual check result). Any NOT MET blocks completion
unless the user explicitly accepts it as a noted exception.

## Phase 3: Deviation Check

- **Spec**: does the implementation differ from what the spec describes? List
  each deviation; is it an improvement to fold back into the spec, or a problem?
- **ADR**: any pattern used that a governing ADR forbids? If so → stop, fix or
  `/architecture-decision revise`.
- **Scope**: anything built beyond the story's ACs? Note it; large creep →
  `/scope-check`.

## Phase 4: Quality Bars

Run via Bash: typecheck, lint, unit tests, and the story's e2e if any. All green,
or the failures are explicitly accepted. Confirm `/code-review` ran and its
required changes are done.

## Phase 5: Output

```
## Story Done Check: [id]
### Acceptance criteria: [n/n MET]
### Deviations: [none / list — spec update needed?]
### Quality: tests [pass/fail], lint [clean/n], review [done/needed]
### Verdict: DONE / NOT DONE ([blocking items])
```

## Phase 6: Close

If DONE (or the user accepts exceptions): `AskUserQuestion` to confirm, then edit
the story file's status to `Done` with the date and the review verdict. If spec
deviations should be folded back, note which spec needs a `/write-spec retrofit`.
Clear the story from `production/session-state/active.md`'s STATUS block.

## Next Steps

- Next story via `/dev-story`, or `/sprint-status`-equivalent by reading the
  sprint plan, or `/gate-check` if the sprint/phase is complete.
