# Review Workflow

The studio supports three review intensities. The active mode lives in
`production/review-mode.txt` (set by `/start`), and any `team-*` skill accepts a
`--review full|lean|solo` override.

| Mode | Director gates | Lead gates | Best for |
|------|----------------|------------|----------|
| `full` | All directors review at each key step | All lead reviews run | Teams, learning the workflow, high-stakes products |
| `lean` (default) | Directors only at phase-gate transitions (`/gate-check`) | Lead reviews run | Solo devs, small teams |
| `solo` | None | None | Spikes, hackathons, throwaway work |

## Phase Gates

`/gate-check` is the checkpoint between lifecycle phases. It verifies the exit
criteria of the current phase are met before the next phase begins.

| From → To | Gate verifies |
|-----------|---------------|
| Concept → Feature Design | Product concept approved, pillars defined, scope bounded |
| Feature Design → Technical Setup | Feature specs reviewed (`/review-specs`), no open cross-feature contradictions |
| Technical Setup → Pre-Production | Master architecture done, required ADRs recorded, stack configured |
| Pre-Production → Build | UX specs for core screens exist, epics & stories created, sprint planned |
| Build → Hardening | All committed stories `done`, coverage threshold met, no open P0/P1 bugs |
| Hardening → Release | Release checklist passes, perf budgets met, security audit clean |

## Standard Review Skills

- `/code-review` — architectural & quality review of code (per file/story)
- `/review-specs` — cross-feature consistency review of all specs
- `/ux-review` — heuristic & accessibility review of UX specs / screens
- `/security-audit` — OWASP-oriented review
- `/perf-profile` — Core Web Vitals & backend latency review
- `/scope-check` — is the current work still within the agreed scope?
