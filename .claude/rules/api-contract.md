---
paths:
  - "docs/api/**"
  - "openapi/**"
  - "**/*.openapi.yaml"
  - "**/*.graphql"
  - "schema.graphql"
---

# API Contract Rules

- The contract is the source of truth. Handlers conform to it; it is not
  reverse-generated from ad-hoc handler behavior.
- Versioning is explicit (`/v1/…` or a version header). A breaking change means a
  new version, never a silent change to an existing one.
- Backward compatibility within a version: fields may be added, never removed or
  retyped; enums may gain values only if clients are documented to tolerate
  unknowns.
- Every endpoint documents: auth requirement, request schema, success schema,
  the shared error schema, pagination style, and rate-limit behavior.
- Errors use one consistent shape across the whole API (e.g. `{ error: { code,
  message, details? } }`) with stable machine-readable `code` values.
- List endpoints are paginated by default with a documented maximum page size.
- Timestamps are ISO-8601 UTC; money is integer minor units with an explicit
  currency; ids are opaque strings.

## Examples

**Correct** — additive change

```yaml
# v1 GET /orders/{id} response gains an optional field
properties:
  id: { type: string }
  total_cents: { type: integer }
  coupon_code: { type: string, nullable: true }   # NEW, optional — non-breaking
```

**Incorrect**

```yaml
properties:
  id: { type: integer }        # VIOLATION: retyped from string
  total: { type: number }      # VIOLATION: renamed + retyped, no new version
```
