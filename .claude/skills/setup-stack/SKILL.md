---
name: setup-stack
description: "Configure the project's frontend, backend, database, and tooling, and pin the framework specialists. Writes technical-preferences.md."
argument-hint: "[optional: a stack hint, e.g. 'nextjs + postgres']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion, Task
model: sonnet
agent: technical-director
---

## Phase 1: Read Inputs

Read `docs/product/product-concept.md` and `docs/product/product-pillars.md` if
they exist, plus `.claude/docs/technical-preferences.md`. Note constraints the
product implies (real-time? SEO? offline? heavy data? AI features?).

## Phase 2: Detect Existing Stack

If code exists, inspect `package.json`, `pyproject.toml`, `go.mod`, lockfiles,
and framework config files. Propose the detected stack for confirmation rather
than asking from scratch.

## Phase 3: Decide (batch with AskUserQuestion)

Explain the trade-offs in prose first, then capture:

1. **Frontend** — Next.js/React · Nuxt/Vue · SvelteKit · other
2. **Backend** — same runtime as frontend (fullstack framework) · separate
   Node/TypeScript · Python (FastAPI/Django) · Go · other
3. **Database** — PostgreSQL · MySQL · SQLite · other; **ORM/data layer**
4. **Rendering** — SSR · SSG/ISR · SPA · hybrid
5. **Styling** and **package manager**
6. **Hosting/deploy target**

For anything hard to reverse, note it will get an ADR via
`/architecture-decision`.

## Phase 4: Write technical-preferences.md

Show the filled-in file, then ask "May I write this to
`.claude/docs/technical-preferences.md`?" Fill:
- Stack & Language, Runtime & Platform, Naming Conventions (propose sensible
  defaults for the chosen stack), Performance Budgets (propose CWV defaults),
  Testing (framework per stack).
- **Stack Specialists** section and the **File Path Routing** table:
  - Frontend Specialist → `nextjs-specialist` / `vue-nuxt-specialist` / `sveltekit-specialist`
  - Backend Specialist → `node-api-specialist` / `python-api-specialist` (or note "add a go-api-specialist")
  - Database Specialist → `database-specialist`

## Phase 5: Scaffold Note

List (do not create yet) the `src/` layout that matches the choice, referencing
`.claude/docs/directory-structure.md`. Offer to create empty folders with READMEs
if the user wants.

## Phase 6: Update Stage

If `production/stage.txt` is `Feature Design` or earlier and specs exist, offer
to advance it to `Technical Setup`.

## Next Steps

- `/create-architecture` — master blueprint + required-ADR list
- `/architecture-decision` — record the one-way-door choices made here
