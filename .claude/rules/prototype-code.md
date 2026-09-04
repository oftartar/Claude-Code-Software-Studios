---
paths:
  - "prototypes/**"
---

# Prototype Code Rules

Prototypes are throwaway. The normal standards are relaxed here **in exchange for
explicit containment**.

- Every prototype directory has a `README.md` with: the question it answers, the
  date, the owner, and the line **"Throwaway — not production code, unowned,
  do not import from `src/`."**
- Nothing in `src/` may import from `prototypes/`. Nothing in `prototypes/` is
  wired into the build or deploy.
- Relaxed: test coverage, doc comments, error handling, accessibility,
  performance budgets, naming conventions.
- Still required: no real secrets, no writes to shared/production data stores, no
  new dependencies added to the root manifest (use a local manifest inside the
  prototype folder if needed).
- When a prototype's question is answered, record the finding in a
  `prototype-report.md` (template in `.claude/docs/templates/`) and delete or
  archive the code. Prototypes do not live indefinitely.

## Example header

```ts
/*
 * prototypes/streaming-diff/  — Throwaway, unowned. Do not import from src/.
 * Question: can we render a 10k-row diff at 60fps with virtualization?
 * Owner: @you   Started: 2026-09-04
 */
```
