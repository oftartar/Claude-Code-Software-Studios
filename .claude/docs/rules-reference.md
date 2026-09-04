# Rules Reference

Path-scoped rules in `.claude/rules/` are automatically applied by Claude Code
when a file matching their `paths:` frontmatter is read or edited. They add
domain requirements on top of `coding-standards.md`.

| Rule file | Applies to | Enforces |
|-----------|-----------|----------|
| `frontend-code.md` | `src/app/**`, `src/pages/**`, `src/components/**`, `*.tsx`, `*.vue`, `*.svelte` | State separation, data-fetching boundaries, no layout shift, i18n |
| `ui-code.md` | `src/components/**`, `design/design-system/**` | Component API design, accessibility, theming via tokens |
| `backend-code.md` | `src/server/**`, `src/api/**`, `src/routes/**` | Boundary validation, data-layer isolation, explicit auth, no long work on request path |
| `api-contract.md` | `docs/api/**`, `openapi/**`, `**/*.openapi.yaml` | Versioning, backward compatibility, error schema, documented pagination |
| `data-code.md` | `src/db/**`, `prisma/**`, `migrations/**`, `drizzle/**` | Reversible migrations, deliberate indexes, no destructive change without a plan |
| `auth-security.md` | `src/**/auth/**`, `middleware.*`, `src/**/*permission*` | Server-side authz, session/token handling, CSRF, rate limiting |
| `design-docs.md` | `docs/product/**`, `docs/specs/**` | Required sections, testable acceptance criteria, explicit non-goals |
| `test-standards.md` | `tests/**`, `**/*.test.*`, `**/*.spec.*`, `e2e/**` | Behavior-named tests, no real network in unit tests, coverage of logic & contracts |
| `infra-code.md` | `infra/**`, `.github/workflows/**`, `Dockerfile*`, `docker-compose*` | Pinned versions, least privilege, no plaintext secrets, reproducible builds |
| `prototype-code.md` | `prototypes/**` | Relaxed standards; must carry a header noting it is throwaway and unowned |

## Adding a Rule

Create `.claude/rules/<name>.md` with frontmatter:

```markdown
---
paths:
  - "src/some/path/**"
---

# <Name> Rules

- Rule one
- Rule two

## Examples
...
```
