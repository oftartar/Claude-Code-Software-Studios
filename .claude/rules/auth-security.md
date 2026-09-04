---
paths:
  - "src/**/auth/**"
  - "src/**/*auth*"
  - "src/**/*permission*"
  - "src/**/*session*"
  - "middleware.ts"
  - "middleware.js"
  - "src/middleware.*"
---

# Auth & Security-Sensitive Code Rules

- Authorization decisions are made server-side, every time, from trusted state
  (the session/token subject), never from a request body or query param.
- Session tokens: HttpOnly, Secure, `SameSite=Lax` or stricter, short-lived,
  rotated on privilege change. JWTs are verified (signature + `exp` + `aud` +
  `iss`) on every request; no `alg: none`.
- Passwords hashed with a memory-hard algorithm (argon2id / bcrypt cost ≥ 12).
  Never logged, never returned, never compared without constant-time.
- Every state-changing request is CSRF-protected (token or double-submit) unless
  it is a pure bearer-token API with no ambient credentials.
- Rate-limit authentication, password reset, and token endpoints. Lock-out or
  backoff on repeated failure.
- Redirect targets, file paths, and SQL identifiers are validated against an
  allowlist — no reflected user input into redirects, `fs`, or query structure.
- Secrets come from the environment / secret manager. This code never reads or
  writes `.env*` and never hardcodes keys.
- Authorization checks are centralized (a `can(user, action, resource)` function)
  — not re-implemented ad hoc per handler.

## Examples

**Correct**

```ts
const session = await getSession(req);            // trusted state
if (!can(session.user, "delete", await loadOrder(params.id))) {
  return forbidden();
}
```

**Incorrect**

```ts
if (req.body.role === "admin") { /* ... */ }      // VIOLATION: trusting client input
const user = jwt.decode(token);                   // VIOLATION: decode without verify
```
