---
name: qa-plan
description: "Author a test plan for a feature or a release: what to test, at which level, the risks it covers, and what it deliberately does not cover."
argument-hint: "[feature slug | release version]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: qa-lead
---

## Phase 1: Scope

- Feature plan → read the spec, UX spec, and the stories' `## QA Test Cases`.
- Release plan → read the changelog / included stories and the prior release
  plan.

## Phase 2: Risk Model

List what could go wrong, ranked by impact × likelihood: data integrity, auth
bypass, money/billing errors, migration failure, broken core flow, regression in
an untouched area, performance cliff, accessibility regression.

## Phase 3: Coverage Matrix

For each requirement id and each risk, choose the level:
- **Unit** — pure logic, formulas, validation
- **Integration** — API contract, DB interaction, auth flow
- **E2E** — the critical happy path + top failure paths for the flow
- **Manual / exploratory** — visual, feel, cross-browser, cross-device
- **Non-functional** — perf budget check, a11y check, security check

State explicitly what is **not** covered and why.

## Phase 4: Entry / Exit Criteria

Entry: story done, build deployed to a test env, test data seeded.
Exit: all planned cases run, no open P0/P1, coverage threshold met, non-functional
gates green.

## Phase 5: Write

Use `.claude/docs/templates/test-plan.md`. Ask before writing
`tests/plans/<slug>.md`.

## Phase 6: Delegate Authoring

Offer to spawn `qa-tester` (Task) to write the concrete cases from this plan.

## Next Steps

- `/test-setup` if the harness isn't ready
- `/perf-profile`, `/security-audit`, accessibility review for the non-functional
  gates
