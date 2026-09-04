# Quick Start

## New product, from scratch

1. `/start` — answer where you are; it sets `production/stage.txt` and
   `production/review-mode.txt` and routes you.
2. `/brainstorm` — explore the idea (skip if you already have a clear concept).
3. `/define-product` — write the product concept + pillars.
4. `/setup-stack` — pick frontend / backend / database; this pins the
   framework specialists.
5. `/map-features` — turn the concept into a prioritized feature index.
6. `/write-spec <feature>` — one spec per MVP feature.
7. `/review-specs` — cross-feature consistency pass.
8. `/gate-check` — confirm you are ready to design architecture.
9. `/create-architecture` — master blueprint + required-ADR list.
10. `/architecture-decision` ×N — record each key decision.
11. `/design-data-model` — schema for the MVP.
12. `/setup-design-system` + `/ux-design <flow>` — design foundation & core screens.
13. `/create-epics` → `/create-stories` → `/sprint-plan`.
14. `/dev-story <story>` → `/code-review` → `/story-done`, repeat.
15. `/qa-plan`, `/release-checklist`, `/team-release` when shipping.

## Existing codebase

1. `/setup-stack` if the stack is not yet recorded.
2. `/project-stage-detect` — inventory what exists and what is missing.
3. Backfill: `/define-product`, `/write-spec` for undocumented features,
   `/architecture-decision` for undocumented decisions.
4. Join the normal loop at step 13 above.

## Day-to-day

- Pick up work with `/dev-story` or just describe the task and let the right
  agent take it.
- Keep `production/session-state/active.md` pointed at your current focus.
- Use `/team-feature` when a change needs product, design, frontend, backend,
  and QA in one coordinated pass.
