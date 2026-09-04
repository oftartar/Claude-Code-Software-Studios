# Release Checklist: v<version>

> Release manager: <you> | Target date: <date> | Type: major|minor|patch

## Included Changes
<From git log since v<previous>. Link stories/PRs. Flag breaking changes.>

## Checklist
| # | Item | Status | Evidence |
|---|------|--------|----------|
| 1 | CI green on release commit | | |
| 2 | Unit + integration + E2E pass | | |
| 3 | Migrations reviewed, reversible / rationale | | |
| 4 | Migrate/deploy order decided | | |
| 5 | Incomplete-work flags default OFF | | |
| 6 | Rollback plan written | | |
| 7 | Observability: logs, metrics, alerts updated | | |
| 8 | Performance budgets checked | | |
| 9 | Security audit clean or accepted | | |
| 10 | Accessibility: no blocker/serious | | |
| 11 | Changelog + release notes drafted | | |
| 12 | Target-env config/secrets present | | |
| 13 | Docs/support updated for user-visible changes | | |

## Gate Verdicts
- QA (QA-PHASE-GATE): <PASS / BLOCKED>
- Product (ship/no-ship, full mode): <>

## Accepted Risks
| Risk | Owner | Rationale |

## Verdict: READY | NOT READY
