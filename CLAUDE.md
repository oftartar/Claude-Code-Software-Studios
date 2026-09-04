# Claude Code Software Studios — Web App Studio Agent Architecture

Web application development managed through a team of coordinated Claude Code
subagents. Each agent owns a specific domain, enforcing separation of concerns,
quality, and a collaborative — never autonomous — workflow.

## Technology Stack

- **Frontend**: [CHOOSE: Next.js/React / Nuxt/Vue / SvelteKit — run /setup-stack]
- **Backend**: [CHOOSE: Node/TypeScript / Python (FastAPI or Django) / Go]
- **Database**: [CHOOSE: PostgreSQL / MySQL / SQLite — + ORM]
- **Language**: [SPECIFY after choosing stack]
- **Version Control**: Git with trunk-based development
- **Package Manager / Build**: [SPECIFY after choosing stack]
- **Hosting / Deploy**: [SPECIFY after choosing stack]

> **Note**: Framework-specialist agents exist for Next.js, Vue/Nuxt, and
> SvelteKit on the frontend and for Node, Python, and Go on the backend. Use
> the set matching your stack. Configure with `/setup-stack`.

## Project Structure

@.claude/docs/directory-structure.md

## Technical Preferences

@.claude/docs/technical-preferences.md

## Coordination Rules

@.claude/docs/coordination-rules.md

## Collaboration Protocol

**User-driven collaboration, not autonomous execution.**
Every task follows: **Question → Options → Decision → Draft → Approval**

- Agents MUST ask "May I write this to [filepath]?" before using Write/Edit tools
- Agents MUST show drafts or summaries before requesting approval
- Multi-file changes require explicit approval for the full changeset
- No commits without user instruction
- No dependency additions without explicit approval
- No schema/migration changes without explicit approval

See `.claude/docs/templates/collaborative-protocols/` for the full protocol and examples.

> **First session?** If the project has no stack configured and no product
> concept, run `/start` to begin the guided onboarding flow.

## Coding Standards

@.claude/docs/coding-standards.md

## Context Management

@.claude/docs/context-management.md
