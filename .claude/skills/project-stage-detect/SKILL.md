---
name: project-stage-detect
description: "Detect the current lifecycle phase from the artifacts present and produce a gap inventory of what is missing to advance."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
model: haiku
---

## Phase 1: Inventory

Check for and count:

| Signal | Path |
|--------|------|
| Stack configured | `.claude/docs/technical-preferences.md` (`**Frontend**` not `[TO BE CONFIGURED]`) |
| Product concept | `docs/product/product-concept.md` |
| Product pillars | `docs/product/product-pillars.md` |
| Feature index | `docs/product/feature-index.md` |
| Feature specs | `docs/specs/*.md` (count) |
| Master architecture | `docs/architecture/architecture.md` |
| ADRs | `docs/adr/adr-*.md` (count) |
| Data model | `docs/architecture/data-model.md` |
| Design system | `design/design-system/*` |
| UX specs | `design/ux/*.md` (count) |
| Epics / stories | `production/epics/**` |
| Sprint plan | `production/sprints/sprint-*.md` |
| Source files | `src/**` (count by extension) |
| Tests | `tests/**` (count) |

## Phase 2: Determine Stage

Match against `.claude/docs/workflow-catalog.yaml` phases, from most advanced
backward: Release → Hardening → Build → Pre-Production → Technical Setup →
Feature Design → Concept.

## Phase 3: Output

```
## Project Stage: [STAGE]
(stage.txt says: [value or "unset"] — [matches / differs, recommend updating])

### Present
- [artifact] — [path, count]

### Gaps to exit [STAGE]
- [ ] [missing artifact] — run [skill]

### Recommended next action
[single skill]
```

## Phase 4: Offer

Offer to write the detected stage to `production/stage.txt` if it is unset or
differs. Read-only otherwise.
