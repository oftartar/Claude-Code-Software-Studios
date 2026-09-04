---
name: bug-triage
description: "Triage open bugs into severity, owner, and required action; identify duplicates, regressions, and anything that warrants a hotfix."
argument-hint: "[optional: path to a bug dir or a single BUG-id]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, AskUserQuestion
model: sonnet
agent: qa-lead
---

## Phase 1: Collect

Find open bug files (`BUG-*.md` under `production/`, `tests/`, `docs/runbooks/`)
and any the user pastes in. For each, confirm it has: repro steps, expected vs.
actual, environment.

## Phase 2: Classify Each

- **Severity** (P0–P3 per `qa-lead` definitions)
- **Type**: regression / long-standing / new / cannot-reproduce / works-as-designed
- **Owner area**: which agent/domain
- **Duplicate of**: [id] if applicable
- **Action**: hotfix now / next sprint / backlog / needs-info / close

P0/P1 in production → flag for `/hotfix` immediately.
"needs-info" → list the exact question blocking triage.

## Phase 3: Output

```
## Bug Triage — [N open]

### P0/P1 — act now
| id | summary | area | action |

### P2/P3 — schedule
### Needs info
### Duplicates / close
### Regression trend: [note if several trace to one recent change]
```

## Phase 4: Route

`AskUserQuestion`: create stories for the scheduled bugs, kick off `/hotfix` for
P0/P1, or just save the triage. Offer to update each bug file's status line.
