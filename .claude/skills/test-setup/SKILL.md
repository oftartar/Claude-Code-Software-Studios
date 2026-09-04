---
name: test-setup
description: "Scaffold the test harness and helpers for the configured stack: unit runner, integration setup with a test database, E2E runner, fixtures, and CI wiring."
argument-hint: "[optional: unit | integration | e2e]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion
model: sonnet
agent: qa-lead
---

## Phase 1: Read the Stack

`.claude/docs/technical-preferences.md` → unit framework, E2E framework, database,
package manager. Detect what's already present in the repo.

## Phase 2: Propose the Harness

Per `.claude/rules/test-standards.md`:

- **Unit**: runner config, coverage reporting + threshold, a `test/` layout, and
  factory/fake helpers (no real I/O).
- **Integration**: an ephemeral test database (container or in-memory), migration
  run on setup, per-test transaction rollback or truncation, an API test client,
  auth helper to mint a session for a test user.
- **E2E**: runner config, a seeded fixture set, a base URL per environment,
  auth-state reuse, retry/trace-on-failure config, no arbitrary waits.
- **Shared**: a `makeX()` factory module, deterministic clock helper, and a
  seed script.

## Phase 3: CI Wiring

Add the test stages to the pipeline per `.claude/rules/infra-code.md`
(typecheck → lint → unit → integration → build; E2E on a schedule or pre-deploy).
Coordinate with `devops-engineer` (Task) if infra files change.

## Phase 4: Write

Show every file, then ask before writing. Add a `## Running tests` section to the
repo README or `tests/README.md`.

## Phase 5: Verify

Run each configured suite once via Bash (an example passing test per level) and
show the output.

## Next Steps

- `/qa-plan` — plan coverage for the first feature
- `qa-tester` agent — author cases
