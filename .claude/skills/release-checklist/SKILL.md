---
name: release-checklist
description: "Run the pre-release checklist: tests, migrations, flags, rollback plan, observability, changelog, and version bump."
argument-hint: "[version, e.g. 1.4.0]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: release-manager
---

## Phase 1: Determine the Release

List merged changes since the last tag (`git log`). Classify against
`.claude/rules/api-contract.md` → major / minor / patch. Confirm the version.

## Phase 2: Checklist

Report each item PASS / FAIL / N/A with evidence:

- [ ] All CI checks green on the release commit
- [ ] Unit + integration + E2E suites pass
- [ ] Migrations reviewed, reversible (or forward-only rationale documented),
      and safe on production data volume
- [ ] Migration + deploy order decided (migrate-then-deploy vs. expand/contract)
- [ ] Feature flags for incomplete work default OFF
- [ ] Rollback plan written (roll-back vs roll-forward, data implications)
- [ ] Observability: new endpoints/jobs have logs + metrics; alerts updated
- [ ] Performance budgets checked (`/perf-profile` if risky changes)
- [ ] Security: `/security-audit` clean or findings accepted
- [ ] Accessibility: no open blocker/serious issues
- [ ] Changelog + user-facing release notes drafted
- [ ] Config/secrets for the new version present in the target environment
- [ ] Support/docs updated for user-visible changes

## Phase 3: Gate

Spawn `qa-lead` (`QA-PHASE-GATE`) via Task for readiness. In `full`, also
`product-director` for ship/no-ship.

## Phase 4: Output

```
## Release Checklist: v[version]
| Item | Status | Evidence |
### Blocking failures
### Accepted risks (user-approved)
### Verdict: READY / NOT READY
```

Read-only. If READY, point to `/changelog` then `/team-release`.
