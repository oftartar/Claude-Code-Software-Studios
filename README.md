# Claude Code Software Studios

**Web application development managed through a team of coordinated Claude Code
subagents.** Each agent owns a domain. Every task follows a collaborative
protocol — *Question → Options → Decision → Draft → Approval* — never autonomous
execution.

Modeled on the structure of
[claude-code-game-studios](https://github.com/donchitos/claude-code-game-studios),
adapted for building web apps: product specs instead of game design documents,
framework specialists instead of engine specialists, Core Web Vitals instead of
frame budgets.

---

## What's in here

```
CLAUDE.md              Master configuration (loaded every session)
.claude/
  settings.json        Hooks, permissions, status line
  agents/              30 agent definitions
  skills/              34 slash-command workflows
  hooks/               12 automation scripts
  rules/               10 path-scoped coding standards
  docs/                Reference docs + 21 document templates
  statusline.sh        ctx% | model | delivery stage | breadcrumb
docs/                  product / specs / architecture / adr / api / runbooks
design/                design-system / ux / wireframes
src/                   application source
tests/                 unit / integration / e2e
infra/                 ci / iac / docker
prototypes/            throwaway spikes (fenced off from src/)
production/            sprints / milestones / epics / session state
```

## The team

**Directors (3)** — `product-director`, `technical-director`, `delivery-lead`
**Leads (6)** — `product-manager`, `lead-engineer`, `design-lead`, `qa-lead`,
`release-manager`, `platform-lead`
**Specialists (15)** — frontend, ui, backend, data-modeler, ai, ux, design-systems,
devops, performance, security, accessibility, analytics, qa-tester, prototyper,
technical-writer
**Framework specialists (6)** — `nextjs`, `vue-nuxt`, `sveltekit`, `node-api`,
`python-api`, `database` (use the set matching your stack)

Full roster: [`.claude/docs/agent-roster.md`](.claude/docs/agent-roster.md).

## Lifecycle

`Concept → Feature Design → Technical Setup → Pre-Production → Build → Hardening → Release`

Each transition is checked by `/gate-check`. Phases and exit criteria:
[`.claude/docs/workflow-catalog.yaml`](.claude/docs/workflow-catalog.yaml).

## Getting started

1. Open this directory in Claude Code.
2. Run **`/start`** — it asks where you are and routes you.
3. Follow the recommended path (see
   [`.claude/docs/quick-start.md`](.claude/docs/quick-start.md)).

Typical first pass:

```
/start → /brainstorm → /define-product → /setup-stack → /map-features
→ /write-spec ×N → /review-specs → /gate-check
→ /create-architecture → /architecture-decision ×N → /design-data-model
→ /setup-design-system → /ux-design ×N
→ /create-epics → /create-stories → /sprint-plan
→ /dev-story → /code-review → /story-done   (repeat)
→ /qa-plan → /release-checklist → /team-release
```

## Review modes

Set by `/start`, stored in `production/review-mode.txt`, overridable per
`team-*` skill with `--review`:

| Mode | Director gates |
|------|----------------|
| `full` | at every key step |
| `lean` (default) | only at phase transitions |
| `solo` | none |

## Conventions

- Agents ask **"May I write this to `<path>`?"** before every Write/Edit.
- New dependencies and database migrations always need explicit approval.
- Commits and deploys happen only on your instruction.
- Path-scoped rules in `.claude/rules/` are enforced automatically on matching files.

## Customizing

- Add an agent: copy the closest file in `.claude/agents/`, update the roster.
- Add a skill: `mkdir .claude/skills/<name>` + `SKILL.md`, update
  `.claude/docs/skills-reference.md`.
- Add a rule: `.claude/rules/<name>.md` with a `paths:` frontmatter.
- Local, uncommitted overrides: `CLAUDE.local.md` and
  `.claude/settings.local.json` (templates in `.claude/docs/`).

## License

MIT — see [LICENSE](LICENSE).
