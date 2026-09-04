# Agent Roster

Each agent has a dedicated definition file in `.claude/agents/`. Use the agent
best suited to the task. When a task spans multiple domains, the coordinating
agent (usually `delivery-lead` or the domain lead) delegates to specialists.

## Tier 1 — Directors (Opus)

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `product-director` | Product vision | Major product decisions, pillar conflicts, scope direction, positioning |
| `technical-director` | Technical vision | Architecture decisions, stack choices, performance & scalability strategy |
| `delivery-lead` | Delivery management | Sprint planning, milestone tracking, risk management, cross-team coordination |

## Tier 2 — Department Leads (Sonnet)

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `product-manager` | Product design | Requirements, feature specs, user stories, acceptance criteria, prioritization |
| `lead-engineer` | Code architecture | System design, code review, API design, refactoring strategy |
| `design-lead` | Design direction | UX direction, design system governance, visual & interaction standards |
| `qa-lead` | Quality assurance | Test strategy, bug triage, release readiness, regression planning |
| `release-manager` | Release pipeline | Versioning, changelogs, deployment, rollback, release gating |
| `platform-lead` | Platform & infra | CI/CD direction, observability, environments, infrastructure strategy |

## Tier 3 — Specialists (Sonnet or Haiku)

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `frontend-engineer` | Frontend code | Sonnet | Routes, screens, client state, data fetching, rendering |
| `ui-engineer` | UI components | Sonnet | Reusable components, layout, responsive behavior, component APIs |
| `backend-engineer` | Backend code | Sonnet | Services, handlers, business logic, API implementation, jobs |
| `data-modeler` | Data & schema | Sonnet | Schema design, migrations, indexes, query performance |
| `ai-engineer` | AI features | Sonnet | LLM-backed features, prompt design, retrieval, evals, guardrails |
| `ux-designer` | UX flows | Sonnet | User flows, wireframes, information architecture, interaction specs |
| `design-systems-engineer` | Design system | Sonnet | Tokens, theming, component library, accessibility primitives |
| `devops-engineer` | Build & deploy | Haiku | CI/CD pipelines, IaC, Docker, environment config |
| `performance-engineer` | Performance | Sonnet | Core Web Vitals, profiling, bundle analysis, load testing |
| `security-engineer` | Security | Sonnet | AuthN/AuthZ, OWASP Top 10, secrets, dependency & supply-chain audit |
| `accessibility-specialist` | Accessibility | Haiku | WCAG 2.2 compliance, ARIA, keyboard nav, screen-reader testing |
| `analytics-engineer` | Analytics | Sonnet | Event tracking plans, funnels, dashboards, experiment design |
| `qa-tester` | Test execution | Haiku | Test case authoring, bug reports, exploratory test checklists |
| `prototyper` | Rapid prototyping | Sonnet | Throwaway spikes, feasibility validation, technical risk burn-down |
| `technical-writer` | Documentation | Haiku | User docs, API reference, release notes prose, in-app copy review |

## Framework Specialists (use the set matching your stack)

### Frontend

| Agent | Framework | Model | When to Use |
|-------|-----------|-------|-------------|
| `nextjs-specialist` | Next.js / React | Sonnet | App Router vs Pages, RSC, server actions, caching, React patterns |
| `vue-nuxt-specialist` | Vue 3 / Nuxt | Sonnet | Composition API, Nuxt server routes, Pinia, hydration |
| `sveltekit-specialist` | Svelte / SvelteKit | Sonnet | Runes, load functions, form actions, adapters |

### Backend

| Agent | Framework | Model | When to Use |
|-------|-----------|-------|-------------|
| `node-api-specialist` | Node / TypeScript | Sonnet | Express/Fastify/NestJS, middleware, validation, async patterns |
| `python-api-specialist` | Python | Sonnet | FastAPI/Django, Pydantic, ASGI, ORM patterns, background tasks |

### Data

| Agent | Domain | Model | When to Use |
|-------|--------|-------|-------------|
| `database-specialist` | RDBMS + ORM | Sonnet | Postgres tuning, index strategy, migration safety, ORM query patterns |

> Add `go-api-specialist`, `graphql-specialist`, or others as your stack grows.
> Copy an existing specialist file as the template.
