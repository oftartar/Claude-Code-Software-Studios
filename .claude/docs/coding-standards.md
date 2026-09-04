# Coding Standards

Baseline standards for all code in this project. Path-scoped rules in
`.claude/rules/` add domain-specific requirements on top of these.

## Universal

- **Typed boundaries**: every public function/module has explicit input and
  output types. No implicit `any`.
- **Small units**: no function longer than ~40 lines (excluding data/config
  literals); cyclomatic complexity under 10.
- **Pure core, thin edges**: business logic is pure and unit-testable; framework
  and I/O concerns live at the edges (route handlers, adapters).
- **No secrets in code**: all secrets via environment/secret manager. `.env*`
  files are never read or committed.
- **Config over constants**: environment-varying values come from config, not
  literals in source.
- **Errors are values or typed exceptions**: no silent `catch {}`. Every failure
  path is either handled or propagated with context.
- **Comments explain WHY**: reference the spec or ADR a non-obvious decision
  implements.

## Frontend

- Presentational components hold no server state; data fetching lives in
  loaders/hooks/route modules.
- Every interactive element is keyboard reachable and has an accessible name.
- User-facing strings go through the i18n layer (or a single strings module if
  i18n is deferred).
- No layout shift from late-loading content — reserve space.

## Backend

- Handlers validate input at the boundary (schema validation) before touching
  business logic.
- All DB access goes through the data layer — no ORM/query calls in route
  handlers.
- Idempotency and auth checks are explicit, not implied by routing.
- Long work goes to a job/queue, not the request path.

## Data

- Every migration is reversible or has a documented forward-only rationale.
- No destructive migration without an explicit approved plan.
- Indexes are added deliberately with the query they serve noted in the migration.

## Tests

- Test names describe behavior: `it("rejects checkout when cart is empty")`.
- Business logic and API contracts have tests before a story is `done`.
- No network or real DB in unit tests; use fakes or a dedicated test database.
