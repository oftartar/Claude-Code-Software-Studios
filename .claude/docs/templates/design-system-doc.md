# Design System: <product>

> Owner: design-lead / design-systems-engineer | Last updated: <date>

## Token Layers
### Primitive
| Group | Tokens | Values |
| color | color.gray.50 … 900, brand.* | |
| space | space.1 … space.16 | 4px scale |
| type | font.size.xs … 2xl, font.weight.* | |
| radius | radius.sm/md/lg/full | |
| shadow | shadow.sm/md/lg | |
| motion | duration.fast/base/slow, ease.* | |

### Semantic (role aliases → primitive)
| Token | Light | Dark | Use |
| bg.surface | color.white | color.gray.900 | page/card background |
| text.default | color.gray.900 | color.gray.50 | body text |
| text.muted | | | secondary text |
| border.default | | | dividers |
| action.primary | | | primary buttons |
| status.danger | | | errors, destructive |

<Every text/bg semantic pair meets WCAG AA — record the ratios.>

## Theming
Light + dark via semantic overrides only. Respect `prefers-color-scheme` + an
explicit override. Components never read primitives directly.

## Primitives
- visually-hidden, focus-ring, portal, layout (stack/cluster/grid), typography

## Component Inventory
| Component | Status | Composes | A11y notes | Story |
|-----------|--------|----------|-----------|-------|

## Contribution Rules
New component only when composition can't express it — `design-lead` approves.
