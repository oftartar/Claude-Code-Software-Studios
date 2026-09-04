# API Contract: <area>

> Version: v1 | Style: REST|GraphQL|RPC | Owner: lead-engineer
> Machine contract: <openapi/schema file path>

## Conventions
- Auth: <bearer token / session cookie>
- Errors: `{ "error": { "code": "<stable_slug>", "message": "<human>", "details"?: {} } }`
- Pagination: <cursor | page> — default size <n>, max <n>
- Timestamps: ISO-8601 UTC. Money: integer minor units + `currency`.
- Idempotency: <key header for POST where relevant>

## Endpoints
### <METHOD> /v1/<path>
- **Purpose**:
- **Auth**: <required scope/role>
- **Request**: <schema ref or inline>
- **Success**: `<status>` <schema ref>
- **Errors**: `400` validation, `401`, `403`, `404`, `409` <when>, `429`
- **Rate limit**: <n/min>
- **Example**:
  ```
  <request>
  ---
  <response>
  ```

## Compatibility Rules
Within v1: fields may be added, never removed or retyped. Breaking change → v2.
