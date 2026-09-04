# docs/api/

The API contract — the source of truth handlers conform to.

- Machine contract: `openapi.yaml` / `schema.graphql` (as the stack dictates)
- Human contract: one `<area>.md` per API area, from
  `.claude/docs/templates/api-contract.md`

Rules: `.claude/rules/api-contract.md` (versioning, backward compatibility,
one error shape, documented pagination and rate limits).
