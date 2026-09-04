# src/

Application source code. The exact layout depends on the stack chosen in
`/setup-stack`; the intended shape is:

```
src/
  app/ (or pages/, or routes/)   Routes / screens
  components/                    UI components (shared + feature)
  server/ (or api/)              Backend handlers, services, jobs
  db/                            Schema, queries, migrations glue
  lib/                           Shared utilities, clients, types
```

Path-scoped rules apply automatically:
- `src/app/**`, `src/components/**` → `.claude/rules/frontend-code.md`, `ui-code.md`
- `src/server/**`, `src/api/**` → `.claude/rules/backend-code.md`
- `src/db/**` → `.claude/rules/data-code.md`
- `src/**/auth/**` → `.claude/rules/auth-security.md`

Nothing here may import from `prototypes/`.
