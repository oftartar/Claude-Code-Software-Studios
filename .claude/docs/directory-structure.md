# Directory Structure

```text
/
├── CLAUDE.md                    # Master configuration
├── .claude/                     # Agent definitions, skills, hooks, rules, docs
├── src/                         # Application source code
│   ├── app/ (or pages/)         # Routes / screens
│   ├── components/              # UI components
│   ├── server/ (or api/)        # Backend handlers, services, jobs
│   ├── db/                      # Schema, queries, migrations glue
│   └── lib/                     # Shared utilities, clients, types
├── docs/                        # Documentation
│   ├── product/                 # Product concept, pillars, feature index
│   ├── specs/                   # Per-feature specifications (PRD-level)
│   ├── architecture/            # Master architecture blueprint, diagrams
│   ├── adr/                     # Architecture Decision Records (adr-NNN-*.md)
│   ├── api/                     # API contracts (OpenAPI / GraphQL schema)
│   └── runbooks/                # Operational runbooks, incident playbooks
├── design/                      # Design artifacts
│   ├── design-system/           # Tokens, component inventory, theming
│   ├── ux/                      # UX specs, user flows, IA
│   └── wireframes/              # Low-fi layouts
├── tests/                       # Test suites
│   ├── unit/                    # Unit tests
│   ├── integration/             # Integration / API tests
│   └── e2e/                     # End-to-end (Playwright/Cypress) specs
├── infra/                       # Infrastructure as code
│   ├── ci/                      # Pipeline definitions
│   ├── iac/                     # Terraform / Pulumi / CDK
│   └── docker/                  # Dockerfiles, compose
├── prototypes/                  # Throwaway spikes (isolated from src/)
└── production/                  # Delivery management
    ├── sprints/                 # Sprint plans
    ├── milestones/              # Milestone definitions
    ├── epics/                   # Epics and their stories
    ├── session-state/           # Ephemeral session state (active.md — gitignored)
    └── session-logs/            # Session audit trail (gitignored)
```

## Ownership

| Directory | Owning agent(s) |
|-----------|-----------------|
| `docs/product/**` | `product-manager`, `product-director` |
| `docs/specs/**` | `product-manager` |
| `docs/architecture/**`, `docs/adr/**` | `technical-director`, `lead-engineer` |
| `docs/api/**` | `backend-engineer`, `lead-engineer` |
| `src/app/**`, `src/components/**` | `frontend-engineer`, `ui-engineer` |
| `src/server/**`, `src/api/**` | `backend-engineer` |
| `src/db/**`, `prisma/**`, `migrations/**` | `data-modeler` |
| `design/**` | `design-lead`, `ux-designer`, `design-systems-engineer` |
| `tests/**` | `qa-lead`, `qa-tester` |
| `infra/**`, `.github/workflows/**` | `devops-engineer`, `platform-lead` |
| `production/**` | `delivery-lead` |
