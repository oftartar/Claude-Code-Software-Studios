# Architecture: <product>

> Status: Draft | Owner: technical-director | Last updated: <date>

## Context
<The system, its users, and the external services it depends on. Diagram or prose.>

## Module Boundaries
| Module | Owns | Depends on | Must not depend on |

## Runtime Shape
<Processes/services, sync vs async, queues and jobs, scheduled work.>

## Rendering & Data Flow
<SSR/SSG/hybrid per area. Where data is fetched. Cache layers and how each is invalidated.>

## Data Architecture
<Stores in use. Source of truth per entity. Details in docs/architecture/data-model.md.>

## Trust Boundaries
<Where auth happens. What is public. Tenant/user isolation.>

## Cross-Cutting Concerns
| Concern | Approach | Owner |
| Auth | | |
| Authorization | | |
| Config & secrets | | |
| Logging & tracing | | |
| Error handling | | |
| Feature flags | | |
| i18n | | |

## Non-Functional Targets
- Performance budgets: <link to technical-preferences.md>
- Availability target: <e.g. 99.9%>
- Scale assumptions (current, not hypothetical): <users, RPS, data size>

## Key Risks
| Risk | Why it might be wrong | Cheap way to de-risk |

## Required ADRs
<Moved to docs/adr/README.md — keep the pointer here.>
