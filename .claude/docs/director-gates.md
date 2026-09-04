# Director Gates

Director gates are review checkpoints where a Tier 1 agent (or a Tier 2 lead in
`lean` mode) signs off before work proceeds. Skills spawn them via `Task`.

## Gate Types

| Code | Owner | Fires at |
|------|-------|----------|
| `PD-GATE` | `product-director` | Product concept, pillar changes, scope expansion |
| `PD-PHASE-GATE` | `product-director` | Concept → Feature Design transition |
| `TD-GATE` | `technical-director` | Architecture decisions, stack changes, new external dependency |
| `TD-PHASE-GATE` | `technical-director` | Feature Design → Technical Setup, Technical Setup → Pre-Production |
| `DL-GATE` | `delivery-lead` | Sprint commitment, milestone sign-off, scope re-plan |
| `QA-PHASE-GATE` | `qa-lead` | Build → Hardening, Hardening → Release |
| `RM-GATE` | `release-manager` | Every production deploy, every rollback |

## Behavior by Review Mode

- **`full`**: every `*-GATE` and every `*-PHASE-GATE` is spawned.
- **`lean`**: only `*-PHASE-GATE` gates are spawned; other `*-GATE`s are skipped
  and noted in the skill output.
- **`solo`**: no gates are spawned at all.

## Gate Output Contract

A gate returns one of: `APPROVED`, `APPROVED WITH CONDITIONS` (conditions
listed), or `BLOCKED` (blocking reasons listed). A `BLOCKED` gate halts the
skill; the orchestrator surfaces it to the user with options.
