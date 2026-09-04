---
name: perf-profile
description: "Profile performance against the budgets: Core Web Vitals, bundle size, render cost, API latency, and query behavior — with ranked, measured recommendations."
argument-hint: "[route, endpoint, or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: performance-engineer
---

## Phase 1: Budgets

Read the Performance Budgets in `.claude/docs/technical-preferences.md`. If
unset, propose defaults (LCP < 2.5s, INP < 200ms, CLS < 0.1, initial route JS
< 170KB gzip, API p95 documented) and note they should be recorded.

## Phase 2: Measure

Use whatever the repo supports, via Bash:
- **Frontend**: production build + bundle analysis per route; Lighthouse / a
  CWV script if available; identify the largest chunks and third-party cost.
- **Backend**: time the target endpoint(s); log slow queries; `EXPLAIN ANALYZE`
  the suspicious ones; check for N+1 by counting queries per request.
- If tooling is missing, list exactly what to add and stop with a partial report.

## Phase 3: Diagnose

For each budget breach: the measurement, the dominant contributor, the root
cause, and the smallest fix with an expected delta.

## Phase 4: Specialist Input

Spawn the pinned framework specialist and/or `database-specialist` (Task) for
idiomatic fixes (caching semantics, query rewrites, index changes).

## Phase 5: Output

```
## Perf Profile: [target]
| Metric | Budget | Measured | Status |
### Findings (ranked by user impact)
1. [problem] — cause — fix — expected: [before -> after]
### Quick wins  |  ### Bigger bets
### Verdict: WITHIN BUDGET / REGRESSIONS / OVER BUDGET
```

Read-only. Fixes go through `/dev-story`.
