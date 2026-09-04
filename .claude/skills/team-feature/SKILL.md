---
name: team-feature
description: "Orchestrate a full feature end-to-end: product-manager -> ux-designer -> data-modeler -> frontend + backend (parallel) -> qa-tester, with gates at each transition."
argument-hint: "[feature description or spec path]  [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion, TodoWrite
model: sonnet
---

**Argument check:** If no feature is given, print:
> "Usage: `/team-feature [feature description or docs/specs/<slug>.md]`"
and stop without spawning anything.

## Phase 0: Resolve Review Mode

`--review` arg → else `production/review-mode.txt` → else `lean`.
- `full`: all gates. `lean`: phase-gates only. `solo`: no gates.

## Team

`product-manager` · `ux-designer` · `data-modeler` · `frontend-engineer` ·
`backend-engineer` · pinned framework specialist(s) · `qa-tester`.
Add `ai-engineer` if the feature is model-backed; `security-engineer` if it
touches auth, money, or PII.

## Decision Points

At every phase transition, write the subagent's full analysis to the
conversation, then use `AskUserQuestion` to capture the go/revise/stop decision.
Do not proceed without approval.

## Pipeline

### Phase 1: Spec
If a spec path was given, read it. Else delegate to `product-manager` to produce
`docs/specs/<slug>.md` (via the `/write-spec` structure). Gate: `PD-GATE` in
`full`.

### Phase 2: UX
Delegate to `ux-designer` → `design/ux/<slug>.md` with all states and a11y notes.
Spawn `accessibility-specialist` for an early check in `full`.

### Phase 3: Data & Contract
Delegate to `data-modeler` for the schema delta + migration sequence, and to
`lead-engineer` (or `backend-engineer`) for the API contract additions in
`docs/api/`. Spawn `database-specialist` to validate. **Gate:** `TD-GATE` —
migrations and contract changes need approval here.

### Phase 4: Implementation (parallel)
Once the contract is agreed, spawn simultaneously:
- `frontend-engineer` — screens + client wiring, to the UX spec
- `backend-engineer` — endpoints + services, to the contract
Each follows the collaborative protocol and asks before writing. Framework
specialists consulted as needed.

### Phase 5: Integration
Wire frontend to real endpoints; verify every acceptance criterion has a code
path; confirm flags/config.

### Phase 6: Validation
Delegate to `qa-tester`: author + run cases from the spec's acceptance criteria
and the stories' `## QA Test Cases`; file bugs. Run typecheck/lint/tests via Bash.

### Phase 7: Sign-off
Collect results. Report per member: COMPLETE / NEEDS WORK / BLOCKED, with open
items and owners.

## Error Recovery

If a spawned agent returns BLOCKED: surface it immediately, assess whether
downstream phases depend on it, offer (skip+note / retry narrower / stop) via
`AskUserQuestion`, and always produce a partial report.

## File Writes

All file writes are done by the spawned specialists under the "May I write to
[path]?" protocol. This orchestrator writes only `production/session-state/active.md`.

## Next Steps

- `/code-review` on the new code · `/story-done` for each story ·
  `/perf-profile` and `/security-audit` if the feature is risky.
