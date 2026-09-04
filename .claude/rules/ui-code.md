---
paths:
  - "src/components/**"
  - "src/ui/**"
  - "design/design-system/**"
  - "packages/ui/**"
---

# UI Component Rules

- Components consume design tokens (colors, spacing, typography, radii) — never
  raw hex values or magic pixel numbers.
- A component's public props are minimal and typed. No "kitchen sink" props
  objects; no boolean flags that change more than one visual axis.
- Components are controlled by default; uncontrolled variants are opt-in and
  documented.
- No data fetching inside shared/library components — they receive data via props.
- Accessibility is part of the component contract: correct roles, `aria-*` only
  when a native element cannot express the semantics, visible focus, respects
  `prefers-reduced-motion`.
- Every component has at least one usage example (Storybook story or a
  `*.example.tsx`) and a unit test for its interactive behavior.
- Theming is done through the token layer / CSS custom properties, not
  conditional style props.

## Examples

**Correct**

```tsx
export function Badge({ tone = "neutral", children }: { tone?: BadgeTone; children: ReactNode }) {
  return <span className={styles[tone]}>{children}</span>; // styles map to tokens
}
```

**Incorrect**

```tsx
export function Badge(props: any) {
  return <span style={{ background: "#e11d48", padding: "3px 7px" }}>{props.text}</span>; // VIOLATION: raw color + magic numbers + untyped props
}
```
