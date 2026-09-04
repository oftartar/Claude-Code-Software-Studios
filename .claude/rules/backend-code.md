---
paths:
  - "src/server/**"
  - "src/api/**"
  - "src/routes/**"
  - "src/handlers/**"
  - "src/services/**"
  - "app/api/**"
---

# Backend Code Rules

- Validate every request at the boundary with a schema before any business logic
  runs. Reject with a typed error shape, never a raw stack trace.
- Route handlers are thin: parse → authorize → call a service → serialize. No
  business rules or ORM queries in the handler.
- All database access goes through the data layer (`src/db/**` / repository /
  ORM module). No ad-hoc queries in services scattered across the codebase.
- Authorization is explicit and server-side on every mutating and every
  sensitive-read endpoint. Never trust a client-supplied role or ownership flag.
- Anything slower than ~100ms of CPU or dependent on a third party goes to a
  job/queue, not the request path.
- Every endpoint is idempotent where the HTTP method implies it (PUT, DELETE) and
  documents its idempotency for POST where relevant.
- Log with structured fields (request id, user id, route) — never log secrets,
  tokens, or full request bodies containing PII.
- Reference the spec (`docs/specs/<feature>.md`) and any governing ADR in a
  header comment.

## Examples

**Correct**

```ts
export async function POST(req: Request) {
  const body = CreateOrderSchema.parse(await req.json());     // boundary validation
  const user = await requireUser(req);                        // explicit authz
  const order = await orderService.create(user.id, body);     // logic in service
  return json(OrderView.from(order), { status: 201 });
}
```

**Incorrect**

```ts
export async function POST(req: Request) {
  const body = await req.json();                              // VIOLATION: no validation
  const order = await db.query(`insert into orders ...`);     // VIOLATION: query in handler
  return json(order);                                         // VIOLATION: leaks raw row, no authz
}
```
