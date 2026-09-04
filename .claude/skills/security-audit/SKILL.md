---
name: security-audit
description: "OWASP-oriented security review of the app or a feature: auth, access control, input handling, secrets, dependencies, and data protection."
argument-hint: "[feature slug, path, or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Task, AskUserQuestion
model: sonnet
agent: security-engineer
---

## Phase 1: Scope & Threat Model

Define the surface (a feature's routes + data, or the whole app). Identify the
assets (user data, money, credentials, tenant isolation) and who would want to
abuse them.

## Phase 2: Review Against OWASP Top 10 + Rules

- **Access control**: server-side authz on every mutating/sensitive route; IDOR;
  centralized `can()`; tenant scoping enforced in queries
- **Auth**: session/token handling, password storage, reset & rotation, MFA
  hooks, rate limiting on auth endpoints
- **Injection**: SQL/command/template/XSS; parameterized queries only; output
  encoding; `dangerouslySetInnerHTML`/`v-html` usage; prompt injection for AI
  features
- **SSRF & path**: outbound requests from user input, file path handling,
  redirect targets
- **Crypto & data**: TLS everywhere, at-rest encryption for sensitive fields,
  PII minimization, log hygiene, retention
- **Secrets**: none in repo/CI/images; least privilege for tokens and roles
- **Dependencies**: `npm audit` / `pip-audit` / equivalent; pinned CI actions;
  lockfile integrity
- **Config**: security headers (CSP, HSTS), cookie flags, CORS, error verbosity
- **Logging/monitoring**: auth failures, authz denials, and anomalies are
  observable

Run available scanners via Bash. Grep for risky patterns (`eval`, raw query
concatenation, `jwt.decode` without verify, `SECRET`/`KEY` literals).

## Phase 3: Output

```
## Security Audit: [scope]
### Findings   [Critical / High / Medium / Low]
- [id] [severity] [OWASP category]
  Where: [file:line]
  Abuse scenario: [what an attacker does — no working exploit]
  Fix: [minimal remediation]
### Dependency vulnerabilities
### Accepted risks (user-approved, with rationale)
### Verdict: CLEAN / FINDINGS / BLOCKING FINDINGS
```

Read-only. Remediation via `/dev-story` or `/hotfix` for a live Critical/High.
