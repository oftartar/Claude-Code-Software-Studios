---
name: start
description: "First-time onboarding — asks where you are, then routes you to the right workflow. No assumptions."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion
model: sonnet
---

# Guided Onboarding

Entry point for a new user. It does NOT assume you have a product idea, a stack
preference, or prior experience. It asks first, then routes.

This skill writes at most two files: `production/stage.txt` and
`production/review-mode.txt`.

## Phase 1: Detect Project State (silent)

Gather context to tailor guidance — do not show it unprompted:

- **Stack configured?** Read `.claude/docs/technical-preferences.md`. If
  `**Frontend**:` contains `[TO BE CONFIGURED]`, the stack is not set.
- **Product concept?** Check `docs/product/product-concept.md`.
- **Specs?** Count `docs/specs/*.md`.
- **Source code?** Glob `src/` for `*.ts`, `*.tsx`, `*.js`, `*.vue`, `*.svelte`,
  `*.py`, `*.go`.
- **Architecture?** Check `docs/architecture/architecture.md` and `docs/adr/adr-*.md`.

## Phase 2: Ask Where the User Is

`AskUserQuestion`:

- **Prompt**: "Welcome to Claude Code Software Studios. Before I suggest
  anything — where are you with this web app right now?"
- **Options**:
  - `A) No idea yet` — I want to explore what to build.
  - `B) Vague idea` — a rough problem or audience in mind, nothing concrete.
  - `C) Clear concept` — I know the product and core features, not yet written down.
  - `D) Existing work` — I have code, specs, or planning already and want to organize or continue.

## Phase 3: Route

**A / B**: Recommend `/brainstorm` (open, or with their hint), then the standard
path: `/define-product` → `/setup-stack` → `/map-features` → `/write-spec` ×N →
`/review-specs` → `/gate-check` → `/create-architecture` → `/architecture-decision` ×N
→ `/design-data-model` → `/setup-design-system` → `/ux-design` ×N →
`/create-epics` → `/create-stories` → `/sprint-plan` → build loop.

**C**: Ask for the one-sentence pitch (plain text). Offer: formalize with
`/define-product`, or jump to `/setup-stack`. Then the same path.

**D**: Report what Phase 1 found. Recommend `/setup-stack` if unconfigured, then
`/project-stage-detect` for a gap inventory, then backfill missing specs/ADRs,
then join the build loop.

## Phase 3b: Write stage.txt

Map to a stage and write `production/stage.txt` (create `production/` if needed),
silently:
- A/B/C or D-with-no-architecture → `Concept`
- D with specs but no architecture → `Feature Design`
- D with architecture (ADRs + architecture doc) → `Technical Setup`

Say: "Set `production/stage.txt` to `[stage]`."

## Phase 3c: Set Review Mode

If `production/review-mode.txt` exists, report it and move on. Otherwise
`AskUserQuestion`:
- `Full` — directors review at each key step. Teams, or learning the workflow.
- `Lean (recommended)` — directors only at phase gates. Solo devs / small teams.
- `Solo` — no director reviews. Spikes and hackathons.

Write `full` / `lean` / `solo` immediately on selection.

## Phase 4: Confirm & Hand Off

`AskUserQuestion` to confirm the first step. Never auto-run the next skill —
respond with a single line: "Type `[skill]` to begin."

## Collaborative Protocol

Ask first · present options · user decides · no auto-execution · adapt when the
user doesn't fit a template.
