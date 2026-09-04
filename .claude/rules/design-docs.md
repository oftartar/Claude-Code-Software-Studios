---
paths:
  - "docs/product/**"
  - "docs/specs/**"
  - "design/ux/**"
---

# Design & Spec Document Rules

- Feature specs (`docs/specs/*.md`) must contain, in order: `## Problem`,
  `## Goals`, `## Non-Goals`, `## Users & Scenarios`, `## Requirements`,
  `## UX Notes`, `## Data & API Impact`, `## Acceptance Criteria`,
  `## Open Questions`, `## Rollout`.
- Acceptance criteria are observable and testable. "Fast", "intuitive", "clean"
  are not acceptance criteria — give a number, a state, or a user-visible outcome.
- Every spec has explicit non-goals. A spec with no non-goals is incomplete.
- Requirements are numbered (`R1`, `R2`, …) so stories and tests can reference
  them.
- Open questions are listed, not silently resolved. If a question is answered,
  move the answer into the body and date it.
- Metrics: state the success metric and how it will be measured before build,
  not after.
- Cross-references use relative links to other specs / ADRs, not prose
  descriptions.

## Examples

**Correct**

```markdown
## Acceptance Criteria
- AC1 (R2): A guest who abandons checkout can resume from an emailed link within 24h; after 24h the link shows an expiry page.
- AC2 (R4): p95 time from "Place order" click to confirmation screen < 1.5s on a mid-tier mobile device.
```

**Incorrect**

```markdown
## Acceptance Criteria
- Checkout should feel fast and be easy to use.   <!-- VIOLATION: not observable or testable -->
```
