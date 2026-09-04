# prototypes/

Throwaway spikes that answer one question fast. Rules:
`.claude/rules/prototype-code.md`.

- One folder per prototype, each with its own `README.md` carrying the
  throwaway header (question, date, owner, "not production code").
- `src/` must not import from here; nothing here is wired into build or deploy.
- No new root dependencies, no real secrets, no shared/production data.
- When the question is answered: write a `prototype-report.md`
  (`.claude/docs/templates/prototype-report.md`) and delete or archive the code.

Driven by the `prototyper` agent.
