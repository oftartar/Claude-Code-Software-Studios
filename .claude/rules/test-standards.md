---
paths:
  - "tests/**"
  - "**/*.test.ts"
  - "**/*.test.tsx"
  - "**/*.spec.ts"
  - "**/*.spec.tsx"
  - "**/*_test.py"
  - "**/*_test.go"
  - "e2e/**"
---

# Test Standards

- Test names state behavior and condition: `it("returns 409 when the email is already registered")`.
- Arrange–Act–Assert structure; one logical behavior per test.
- Unit tests do no real I/O — no network, no real database, no clock. Use fakes,
  in-memory adapters, or a dedicated ephemeral test DB for integration tests.
- Every requirement id (`R1`, `R2`, …) in a spec maps to at least one test; note
  the id in the test name or a comment.
- Business logic, API contract conformance, auth flows, and data migrations have
  tests before the owning story is `done`.
- E2E specs cover the critical happy path and the top failure paths for a flow —
  not every permutation. Keep them deterministic (seeded data, no arbitrary
  sleeps).
- No assertions on implementation details (private methods, call counts) when an
  observable outcome is available.
- A skipped or `todo` test carries a comment with the reason and a tracking
  reference.

## Examples

**Correct**

```ts
it("R4: locks the account for 15 minutes after 5 failed logins", async () => {
  const auth = makeAuth({ clock: fakeClock });
  for (let i = 0; i < 5; i++) await auth.login("a@b.co", "wrong");
  await expect(auth.login("a@b.co", "correct")).rejects.toThrow(AccountLocked);
});
```

**Incorrect**

```ts
it("works", async () => {                       // VIOLATION: name says nothing
  await new Promise(r => setTimeout(r, 3000));  // VIOLATION: arbitrary sleep
  expect(service._cache.size).toBe(1);          // VIOLATION: asserts internals
});
```
