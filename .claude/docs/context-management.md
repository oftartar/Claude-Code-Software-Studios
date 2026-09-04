# Context Management

How this project keeps work continuous across sessions and compaction.

## Session State

- `production/session-state/active.md` — the live scratchpad for the current
  piece of work. Gitignored. Contains a `<!-- STATUS -->` block the status line
  reads:

  ```
  <!-- STATUS -->
  Epic: checkout
  Feature: guest-checkout
  Story: story-004-address-form
  <!-- /STATUS -->
  ```

- Update it as you change focus. The `session-start` hook surfaces it on the
  next session; the `pre-compact` hook preserves it before compaction.

## Session Logs

- `production/session-logs/` — append-only audit trail written by the
  `session-stop` and `log-agent` hooks. Gitignored. Useful for reconstructing
  what happened, not for planning.

## What to Persist Where

| Kind of information | Home |
|---------------------|------|
| Current focus / next step | `production/session-state/active.md` |
| Decisions with lasting effect | an ADR in `docs/adr/` |
| Product intent | `docs/product/` and `docs/specs/` |
| Sprint scope | `production/sprints/` |
| Throwaway exploration | `prototypes/` |

## Compaction Behavior

Before compaction the `pre-compact` hook writes a short summary of open work.
After compaction the `post-compact` hook restores the pointer to
`active.md` so the next turn knows where to resume. Do not wrap up work early
because compaction is near — it is designed to be seamless.
