---
name: setup-design-system
description: "Stand up the design system foundation: token taxonomy, theming rules, primitives, and the initial component inventory."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion
model: sonnet
agent: design-systems-engineer
---

## Phase 1: Inputs

Read the concept + pillars, the UX specs that exist, and
`.claude/docs/technical-preferences.md` (styling approach, framework).

## Phase 2: Token Taxonomy

Propose the token layers:
- **Primitive** — the raw scales (color ramp, spacing scale, type scale, radii,
  shadows, durations)
- **Semantic** — role aliases (`bg.surface`, `text.muted`, `border.focus`,
  `action.primary`, `status.danger`) mapping to primitives
- **Component** — only where a component genuinely needs its own knob

Contrast: every text/background semantic pair meets WCAG AA. State the checks.

## Phase 3: Theming

Light + dark via semantic-token overrides only. Respect `prefers-color-scheme`
plus an explicit user override. No component reads a primitive directly.

## Phase 4: Primitives

List the base primitives to build first: visually-hidden, focus ring, portal,
layout stack/cluster/grid, and the typography component. These are the
foundation other components compose.

## Phase 5: Component Inventory

From the UX specs, list the components needed for the MVP, each tagged
`build now` / `later`, and note which are compositions of others (don't build
those as new components). `design-lead` confirms the "new component" calls.

## Phase 6: Write

Ask before writing:
- `design/design-system/tokens.md` (the taxonomy + values)
- `design/design-system/theming.md`
- `design/design-system/inventory.md`
Actual token code / component code is built via `/dev-story` stories.

## Next Steps

- `/ux-design <flow>` for core screens, using the inventory
- `/create-stories` for the "build now" components
