---
name: team-release
description: "Release-manager-led pipeline to cut, verify, deploy, and announce a release: checklist -> changelog -> gate -> deploy -> post-deploy verify."
argument-hint: "[version]  [--review full|lean|solo]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion, TodoWrite
model: sonnet
---

**Argument check:** No version → print `Usage: /team-release [version]` and stop.

## Phase 0: Review Mode

`--review` → `production/review-mode.txt` → `lean`.

## Team

`release-manager` (lead) · `qa-lead` · `devops-engineer` · `technical-writer` ·
`technical-director` (rollback strategy) · `product-director` (ship/no-ship in
`full`).

## Pipeline

### Phase 1: Checklist
Run `/release-checklist [version]` (delegate to `release-manager`). If NOT READY,
stop with the blocking list.

### Phase 2: Notes
Delegate to `release-manager` + `technical-writer`: `/changelog [version]` →
`CHANGELOG.md` + `docs/releases/v<version>.md`. Approve before writing.

### Phase 3: Readiness Gate
Spawn `qa-lead` for the `QA-PHASE-GATE` verdict. In `full`, also
`product-director` for ship/no-ship. A BLOCKED gate halts the pipeline.

### Phase 4: Deploy Plan
Delegate to `release-manager` + `devops-engineer`: confirm migrate/deploy order,
the rollback procedure (with `technical-director`), target-env config/secrets,
and the post-deploy checks (health, error rate, latency, a key business metric).
Present the plan.

### Phase 5: Authorize & Execute
`AskUserQuestion` for explicit deploy authorization. On yes: tag the version,
run migrations, deploy, and run the post-deploy checks. Report each stage.

### Phase 6: Verify or Roll Back
If the post-deploy checks fail their thresholds: surface it, recommend
roll-back vs roll-forward, and `AskUserQuestion` before acting.

### Phase 7: Announce & Record
Publish the release notes (where the user directs). Write a short release record
to `docs/releases/` — version, contents, deploy time, anomalies, follow-ups.

## Error Recovery

Any BLOCKED gate or failed stage stops the pipeline with a partial report and
options. Never deploy or roll back without explicit authorization.

## Next Steps

- `/retrospective` if this closes a milestone · monitor the dashboards through
  the bake period.
