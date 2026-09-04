---
name: design-data-model
description: "Design the data model / schema for the app or a feature: entities, relationships, constraints, indexes, and the migration sequence."
argument-hint: "[feature slug for a feature-scoped model, or nothing for the whole app]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion
model: sonnet
agent: data-modeler
---

## Phase 1: Inputs

Read the relevant spec(s), `docs/architecture/architecture.md`, any ADR about
multi-tenancy / storage, and `.claude/docs/technical-preferences.md` (database +
ORM).

## Phase 2: Model

For each entity: purpose, key attributes with types (`timestamptz`, integer
minor units for money, opaque string ids, enums as lookup/DB enum), ownership,
lifecycle, and retention.

Relationships: cardinality, the FK direction, cascade vs restrict, and any
join/link tables.

Constraints in the schema: uniqueness, checks, not-null, referential integrity.

Access patterns: list the top reads and writes per entity (from the specs) and
the index that serves each. Note expected row counts and growth.

Tenancy / access: how rows are scoped to a tenant/user and where that filter is
enforced.

## Phase 3: Specialist Check

Spawn `database-specialist` (Task) to review types, index strategy, and
migration safety for the pinned database.

## Phase 4: Migration Sequence

Order the migrations so each is reversible and non-locking on large tables.
Anything destructive gets the add → backfill → switch → stop-writes → drop
sequence across deploys. Follow `.claude/rules/data-code.md`.

## Phase 5: Write

Use `.claude/docs/templates/data-model.md`. Ask before writing
`docs/architecture/data-model.md` (or `docs/architecture/data-model-<feature>.md`).
Do NOT write migration files here — that happens in `/dev-story` with approval.

## Next Steps

- `/create-stories` — stories that include the migration steps
- `/dev-story` — implement, migrations gated on explicit approval
