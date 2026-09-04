# Technical Preferences

<!-- Populated by /setup-stack. Updated as the user makes decisions throughout development. -->
<!-- All agents reference this file for project-specific standards and conventions. -->

## Stack & Language

- **Frontend**: [TO BE CONFIGURED — run /setup-stack]
- **Backend**: [TO BE CONFIGURED]
- **Database**: [TO BE CONFIGURED]
- **ORM / Data access**: [TO BE CONFIGURED]
- **Language(s)**: [TO BE CONFIGURED]
- **Styling**: [TO BE CONFIGURED — e.g., Tailwind, CSS Modules, vanilla-extract]
- **State management**: [TO BE CONFIGURED]

## Runtime & Platform

- **Target browsers**: [TO BE CONFIGURED — e.g., evergreen, last 2 versions]
- **Rendering strategy**: [TO BE CONFIGURED — SSR / SSG / ISR / SPA / hybrid]
- **Hosting / deploy target**: [TO BE CONFIGURED]
- **Node / runtime version**: [TO BE CONFIGURED]
- **Auth approach**: [TO BE CONFIGURED — sessions / JWT / provider]

## Naming Conventions

- **Components**: [TO BE CONFIGURED — e.g., PascalCase files]
- **Variables / functions**: [TO BE CONFIGURED]
- **Files / directories**: [TO BE CONFIGURED — e.g., kebab-case]
- **Routes**: [TO BE CONFIGURED]
- **Database tables / columns**: [TO BE CONFIGURED — e.g., snake_case]
- **Environment variables**: [TO BE CONFIGURED — e.g., SCREAMING_SNAKE_CASE]

## Performance Budgets

- **LCP**: [TO BE CONFIGURED — target < 2.5s]
- **INP**: [TO BE CONFIGURED — target < 200ms]
- **CLS**: [TO BE CONFIGURED — target < 0.1]
- **JS bundle (initial route)**: [TO BE CONFIGURED — e.g., < 170KB gzip]
- **API p95 latency**: [TO BE CONFIGURED]

## Testing

- **Unit framework**: [TO BE CONFIGURED — e.g., Vitest / Jest / pytest]
- **E2E framework**: [TO BE CONFIGURED — e.g., Playwright]
- **Minimum coverage**: [TO BE CONFIGURED]
- **Required tests**: Business logic, API contracts, auth flows, data migrations

## Forbidden Patterns

<!-- Add patterns that should never appear in this project's codebase -->
- [None configured yet — add as architectural decisions are made]

## Allowed Libraries / Dependencies

<!-- Add approved third-party dependencies here. New deps require explicit approval. -->
- [None configured yet — add as dependencies are approved]

## Architecture Decisions Log

<!-- Quick reference linking to full ADRs in docs/adr/ -->
- [No ADRs yet — use /architecture-decision to create one]

## Stack Specialists

<!-- Written by /setup-stack when the stack is configured. -->
<!-- Read by /code-review, /architecture-decision, /create-architecture, and team-* skills -->
<!-- to know which specialist to spawn for stack-specific validation. -->

- **Frontend Specialist**: [TO BE CONFIGURED — run /setup-stack]
- **Backend Specialist**: [TO BE CONFIGURED]
- **Database Specialist**: [TO BE CONFIGURED]
- **Additional Specialists**: [TO BE CONFIGURED]
- **Routing Notes**: [TO BE CONFIGURED]

### File Path Routing

<!-- Skills use this table to select the right specialist per file type. -->
<!-- If a row says [TO BE CONFIGURED], fall back to lead-engineer for that path. -->

| Path / Type | Specialist to Spawn |
|-------------|---------------------|
| `src/app/**`, `src/components/**`, `*.tsx/.vue/.svelte` | [TO BE CONFIGURED — Frontend Specialist] |
| `src/server/**`, `src/api/**` | [TO BE CONFIGURED — Backend Specialist] |
| `src/db/**`, `prisma/**`, `migrations/**` | [TO BE CONFIGURED — Database Specialist] |
| `infra/**`, `.github/workflows/**` | `devops-engineer` |
| General architecture review | `lead-engineer` |
