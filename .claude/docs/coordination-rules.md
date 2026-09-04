# Agent Coordination Rules

1. **Vertical Delegation**: Directors delegate to department leads, who delegate
   to specialists. Never skip a tier for complex decisions.
2. **Horizontal Consultation**: Agents at the same tier may consult each other
   but must not make binding decisions outside their domain.
3. **Conflict Resolution**: When two agents disagree, escalate to the shared
   parent. If no shared parent, escalate to `product-director` for product
   conflicts or `technical-director` for technical conflicts.
4. **Change Propagation**: When a change affects multiple domains, the
   `delivery-lead` agent coordinates the propagation.
5. **No Unilateral Cross-Domain Changes**: An agent must never modify files
   outside its designated directories without explicit delegation.
6. **Schema & dependency gates**: Database migrations and new dependencies
   always require explicit user approval, regardless of which agent proposes them.

## Model Tier Assignment

| Tier | Model | When to use |
|------|-------|-------------|
| **Haiku** | `claude-haiku-4-5-20251001` | Read-only status checks, formatting, simple lookups — no creative judgment needed |
| **Sonnet** | `claude-sonnet-5` | Implementation, spec authoring, analysis of individual systems — default for most work |
| **Opus** | `claude-opus-5` | Multi-document synthesis, high-stakes phase-gate verdicts, cross-system holistic review |

Skills with `model: haiku`: `/help`, `/project-stage-detect`, `/changelog`
Skills with `model: opus`: `/review-specs`, `/create-architecture`, `/gate-check`

All other skills default to Sonnet. When creating new skills, assign Haiku if the
skill only reads and formats; assign Opus if it must synthesize 5+ documents with
high-stakes output; otherwise leave unset (Sonnet).

## Subagents vs Agent Teams

### Subagents (current, always active)
Spawned via `Task` within a single Claude Code session. Used by all `team-*`
skills and orchestration skills. Subagents share the session's permission
context, run sequentially or in parallel within the session, and return results
to the parent.

**When to spawn in parallel**: If two subagents' inputs are independent (neither
needs the other's output to begin), spawn both Task calls simultaneously.
Example: in `/team-feature`, the frontend and backend implementation agents can
run at the same time once the API contract is agreed.

### Agent Teams (experimental — opt-in)
Multiple independent Claude Code *sessions* running simultaneously, coordinated
via a shared task list. Requires `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`.

**Use when**: work spans subsystems that will not touch the same files, each
workstream is >30 minutes, and a senior agent needs to coordinate 3+ specialist
sessions on different epics.

**Do not use when**: one session's output is required as input for another; the
task fits one session's context; or cost is a concern.

## Parallel Task Protocol

1. Issue all independent Task calls before waiting for any result
2. Collect all results before proceeding to dependent phases
3. If any agent is BLOCKED, surface it immediately — do not silently skip
4. Always produce a partial report if some agents complete and others block
