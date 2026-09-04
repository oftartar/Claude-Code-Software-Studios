# Skills Reference

Slash commands live in `.claude/skills/<name>/SKILL.md`. Run `/help` for the
in-session version.

## Onboarding
| Skill | Purpose |
|-------|---------|
| `/start` | Guided first-time onboarding — asks where you are, routes you to the right workflow |
| `/help` | List available skills and the recommended workflow order |
| `/setup-stack` | Configure frontend/backend/database and pin the stack specialists |
| `/project-stage-detect` | Detect the current lifecycle phase and inventory gaps |

## Product & Requirements
| Skill | Purpose |
|-------|---------|
| `/brainstorm` | Guided product ideation (JTBD, user psychology, opportunity framing) |
| `/define-product` | Author the product concept doc and product pillars |
| `/map-features` | Decompose the concept into a feature index with priorities |
| `/write-spec` | Author a feature specification (PRD-level) for one feature |
| `/review-specs` | Cross-feature consistency review of all specs |
| `/scope-check` | Check whether current work is still within the agreed scope |

## Architecture
| Skill | Purpose |
|-------|---------|
| `/create-architecture` | Produce the master architecture blueprint + required-ADR list |
| `/architecture-decision` | Record (or revise) an ADR |
| `/design-data-model` | Design the data model / schema for a feature or the whole app |

## Design
| Skill | Purpose |
|-------|---------|
| `/setup-design-system` | Stand up design tokens, component inventory, theming rules |
| `/ux-design` | Author a UX spec (flows, states, wireframes) for a screen or flow |
| `/ux-review` | Heuristic + accessibility review of a UX spec or built screen |

## Planning
| Skill | Purpose |
|-------|---------|
| `/create-epics` | Map features to epics |
| `/create-stories` | Break an epic into implementable, estimated stories |
| `/sprint-plan` | Plan a sprint from ready stories |

## Build
| Skill | Purpose |
|-------|---------|
| `/dev-story` | Implement one story end-to-end with the collaborative protocol |
| `/code-review` | Architectural & quality review of code |
| `/story-done` | Verify acceptance criteria, check deviations, close a story |

## QA
| Skill | Purpose |
|-------|---------|
| `/qa-plan` | Author a test plan for a feature or release |
| `/test-setup` | Scaffold the test harness / helpers for the configured stack |

## Release & Ops
| Skill | Purpose |
|-------|---------|
| `/release-checklist` | Run the pre-release checklist |
| `/changelog` | Generate a changelog / release notes from merged work |
| `/hotfix` | Coordinate an expedited fix to production |
| `/perf-profile` | Core Web Vitals + backend latency review with recommendations |
| `/security-audit` | OWASP-oriented security review |
| `/bug-triage` | Triage open bugs into severity + owner + action |
| `/retrospective` | Facilitate a sprint or milestone retrospective |
| `/gate-check` | Verify phase exit criteria before advancing |

## Team Orchestration
| Skill | Purpose |
|-------|---------|
| `/team-feature` | Product → UX → data → frontend + backend → QA for one feature |
| `/team-release` | Release-manager-led cut, verify, deploy, and announce a release |
