---
name: create-architecture
description: "Produce the master architecture blueprint for the app and the list of Required ADRs that must be recorded before build."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion
model: opus
agent: technical-director
---

## Phase 1: Inputs

Read all `docs/specs/*.md`, the concept + pillars, and
`.claude/docs/technical-preferences.md`. If the stack is `[TO BE CONFIGURED]`,
stop and point to `/setup-stack`.

## Phase 2: Draft the Blueprint

Use `.claude/docs/templates/architecture-doc.md`. Cover:

- **Context diagram** — the system, its users, and external services (described
  or as a simple diagram)
- **Module boundaries** — the major parts, what each owns, the dependency
  direction between them
- **Runtime shape** — processes/services, sync vs async, queues/jobs,
  scheduled work
- **Rendering & data flow** — SSR/SSG/hybrid per area, where data is fetched,
  cache layers and invalidation
- **Data architecture** — the stores, what lives where, the source of truth for
  each entity (details in `/design-data-model`)
- **Trust boundaries** — where auth happens, what is public, tenant isolation
- **Cross-cutting** — auth, permissions, config, logging/tracing, error
  handling, feature flags, i18n
- **Non-functional targets** — the performance budgets, availability target,
  scale assumptions (be explicit about current scale, not hypothetical)
- **Key risks** — the parts most likely to be wrong, and the cheap way to
  de-risk each

## Phase 3: Required ADR List

Enumerate every decision that is significant and hard to reverse (auth model,
multi-tenancy approach, sync vs async boundary, state management, API style,
caching strategy, background-job system, file storage, etc.). Each becomes a row:
`ADR-NNN — [title] — [why it matters] — [status: needed]`.

## Phase 4: Review Gate

`full`/`lean`: spawn `lead-engineer` and `security-engineer` (Task, parallel) to
review the blueprint and the ADR list for gaps. Fold in findings.

## Phase 5: Write

Ask before writing:
- `docs/architecture/architecture.md`
- `docs/adr/README.md` containing the Required ADR list and status table

## Next Steps

- `/architecture-decision` — work the Required ADR list, highest-risk first
- `/design-data-model` — the schema
- `/architecture-decision` outputs feed `/gate-check` for Technical Setup exit
