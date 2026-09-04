---
name: code-review
description: "Architectural and quality review of a file, directory, or story's changes: standards, patterns, SOLID, security, testability, and ADR compliance."
argument-hint: "[path(s)]  [optional: story file path as last arg]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: lead-engineer
---

## Phase 1: Load Targets

Read the target file(s) in full (or `git diff` for the story's changes). Read
`.claude/docs/coding-standards.md` and the path-scoped rules for the touched
areas.

## Phase 2: Identify Stack Specialists

From `.claude/docs/technical-preferences.md` → Stack Specialists + File Path
Routing, note which specialist applies to each touched path.

## Phase 3: ADR Compliance

If a story path is given, read it for the governing ADR. Otherwise search file
headers and `git log` for `ADR-NNN` references. For each referenced ADR, read
Decision + Consequences and classify deviations:
- **VIOLATION** (blocking) — uses a pattern the ADR rejects
- **DRIFT** (warning) — diverges without a forbidden pattern
- **MINOR** (info)

If none found: note "No ADR references — compliance check skipped."

## Phase 4: Standards & Rules

- [ ] Typed public boundaries; no implicit `any`
- [ ] Functions ≤ ~40 lines; complexity < 10
- [ ] Pure core; framework/I/O at edges
- [ ] Config over constants; no secrets in code
- [ ] Handlers thin; DB access only via the data layer
- [ ] Path-scoped rule compliance for each touched area

## Phase 5: Architecture & SOLID

Dependency direction, layer separation, no cycles, consistent patterns; SRP /
OCP / LSP / ISP / DIP violations with line refs.

## Phase 6: Web-Specific

- [ ] Boundary validation on every endpoint
- [ ] Server-side authz on mutating/sensitive routes; no trusted client input
- [ ] No N+1; result sets bounded; indexes present for new queries
- [ ] i18n for user-facing copy; keyboard operable; no layout shift
- [ ] No secrets/PII in logs; consistent error shape

## Phase 7: Specialist Reviews (parallel)

Spawn, simultaneously via Task: the applicable framework/database specialist(s),
`security-engineer` for auth-sensitive paths, and — for Logic/Integration
stories — `qa-tester` to check the `## QA Test Cases` map to testable code and
no acceptance criterion is untestable as built.

## Phase 8: Output

```
## Code Review: [target]

### Specialist findings: [N/A / CLEAN / ISSUES]
### Testability: [N/A / TESTABLE / GAPS / BLOCKING]
### ADR compliance: [NONE FOUND / COMPLIANT / DRIFT / VIOLATION]
### Standards & rules: [X/ passing]
### Architecture & SOLID: [CLEAN / ISSUES / VIOLATIONS]
### Web-specific concerns
### Positive observations
### Required changes
### Suggestions
### Verdict: APPROVED / APPROVED WITH SUGGESTIONS / CHANGES REQUIRED
```

Read-only.

## Phase 9: Next

`AskUserQuestion`: if APPROVED → `/story-done` or stop. If CHANGES REQUIRED →
fix and re-run, or `/story-done` with noted exceptions, or stop. For an
ARCHITECTURAL VIOLATION against an existing ADR, fix to comply; if the design
genuinely changed, `/architecture-decision revise`.
