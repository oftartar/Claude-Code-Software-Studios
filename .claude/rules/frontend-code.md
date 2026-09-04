---
paths:
  - "src/app/**"
  - "src/pages/**"
  - "src/routes/**"
  - "src/components/**"
  - "**/*.tsx"
  - "**/*.jsx"
  - "**/*.vue"
  - "**/*.svelte"
---

# Frontend Code Rules

- Data fetching lives in route loaders / server components / query hooks — never
  inline in a presentational component's body.
- Server state and view state are separate. Do not copy server data into local
  state except to make it editable, and reconcile on save.
- Every user-facing string goes through the i18n layer (or the single strings
  module if i18n is deferred). No hardcoded copy in JSX/templates.
- Reserve layout space for async content — no cumulative layout shift.
- Every interactive element is reachable and operable by keyboard and has an
  accessible name.
- No `useEffect` (or framework equivalent) for data derivation that can be
  computed during render.
- Environment-varying values come from a typed config module, not `process.env`
  reads scattered through components.
- Document which spec (`docs/specs/<feature>.md`) a screen implements in a header
  comment.

## Examples

**Correct**

```tsx
// Implements docs/specs/checkout.md — Address step
export async function loader() {
  return { countries: await api.countries.list() };
}
```

**Incorrect**

```tsx
function AddressForm() {
  const [countries, setCountries] = useState([]);
  useEffect(() => { fetch("/api/countries").then(r => r.json()).then(setCountries); }, []); // VIOLATION: fetch in component body
  return <select>{/* ... */}</select>; // VIOLATION: no labelling, hardcoded copy below
}
```
