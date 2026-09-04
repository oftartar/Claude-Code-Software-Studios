# tests/

```
unit/          Pure logic. No network, no real DB, no real clock.
integration/   API contract + DB + auth flows. Ephemeral test database.
e2e/           Critical happy path + top failure paths per flow. Deterministic.
plans/         Test plans (/qa-plan)
strategy.md    The test-level mix for this product (qa-lead)
```

Standards: `.claude/rules/test-standards.md`. Harness scaffolding: `/test-setup`.

## Running

<Filled in by /test-setup for the configured stack.>
