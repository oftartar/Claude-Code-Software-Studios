---
name: ux-design
description: "Author a UX spec for a screen or flow: user flow, all states, wireframes, interaction detail, and accessibility notes."
argument-hint: "[flow or screen name, e.g. 'guest checkout']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Task, AskUserQuestion
model: sonnet
agent: ux-designer
---

## Phase 1: Inputs

Read the owning feature spec, `design/ux/principles.md` (if present),
`design/design-system/inventory.md`, and
`.claude/docs/technical-preferences.md` (target devices, rendering).

If the feature spec is missing, stop and point to `/write-spec`.

## Phase 2: Flow

Map the flow end to end: entry points → each step → exit/success. Include the
unhappy paths (validation failure, permission denied, not found, network
failure, timeout, back-button, re-entry).

## Phase 3: States

For every screen in the flow, specify: **empty**, **loading**, **partial**,
**error**, **success**, and any **permission-gated** variant. None may be
undefined.

## Phase 4: Wireframes

Describe each screen's layout precisely (regions, hierarchy, primary action,
what's above the fold) or provide a simple diagram. Use components from the
inventory by name; flag anything not in it for `design-lead`.

## Phase 5: Interaction Detail

What is optimistic vs. blocking; what is undoable; what needs confirmation; focus
placement on load and after actions; keyboard path; what announces to a screen
reader. Copy needs → flag for `technical-writer`.

## Phase 6: Accessibility Notes

Focus order, labelling, error association, target sizes, reduced-motion
behavior, contrast reliance.

## Phase 7: Review

`full` mode: spawn `accessibility-specialist` (Task) for an early check.

## Phase 8: Write

Use `.claude/docs/templates/ux-spec.md`. Ask before writing
`design/ux/<slug>.md`. Map each screen/interaction to the spec's requirement ids.

## Next Steps

- `/ux-review` — heuristic + a11y review
- `/create-stories` — stories for this flow
