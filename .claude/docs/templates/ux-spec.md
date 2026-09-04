# UX Spec: <flow>

> Owner: ux-designer | Feature spec: <link> | Last updated: <date>

## Flow Overview
<Entry points → steps → success/exit. Include a simple flow diagram if helpful.>

## Screens & States
### <Screen>
- **Purpose**:
- **Layout**: <regions, hierarchy, primary action, above-the-fold>
- **States**:
  - Empty: <what the user sees, what they can do>
  - Loading: <skeleton / spinner / reserved space>
  - Partial:
  - Error: <message, recovery>
  - Success:
  - Permission-gated: <if applicable>
- **Components** (from design system inventory): <names; flag any not in inventory>

## Interaction Detail
| Action | Optimistic? | Blocking? | Undoable? | Confirmation? | Focus after |

## Unhappy Paths
- Validation failure: …
- Permission denied: …
- Not found / network failure / timeout: …
- Back button / re-entry / double submit: …

## Accessibility Notes
- Focus order:
- Labelling & error association:
- Target sizes / contrast reliance:
- Reduced-motion behavior:

## Copy Needs (for technical-writer)
- <location> — <intent>

## Requirement Traceability
| Screen / interaction | Spec requirement id |
