---
name: hotfix
description: "Coordinate an expedited fix to production: reproduce, minimal diff, fast review, targeted deploy, and reconcile with main."
argument-hint: "[incident/bug description or BUG-id]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion, TodoWrite
model: sonnet
agent: release-manager
---

## Phase 1: Assess

Confirm severity with `qa-lead` criteria. A hotfix is justified only for P0/P1:
data loss, security hole, or a core flow broken in production. Otherwise route to
the normal backlog.

## Phase 2: Reproduce

Establish a reliable repro and capture it as a failing test. If it can't be
reproduced, say so — do not ship a speculative fix to production.

## Phase 3: Minimal Fix

Delegate to the owning specialist (Task) for the **smallest** change that
addresses the root cause (or a safe mitigation + a follow-up story for the root
cause). No refactoring, no unrelated changes. Follow the path rules.

Get explicit approval before writing. Migrations in a hotfix are a last resort
and need their own approval and rollback note.

## Phase 4: Fast Review

Spawn `lead-engineer` + `security-engineer` (Task, parallel) for a focused
review of the diff only. The failing test must now pass; the full suite must
still pass.

## Phase 5: Ship

`AskUserQuestion` to authorize. Branch from the production tag, apply the fix,
tag a patch version, deploy, and verify with the repro and the key metrics.

## Phase 6: Reconcile

Merge the hotfix branch back to main (or cherry-pick), confirm it isn't lost in
the next release. File the follow-up story if a mitigation was shipped instead of
a full fix. Add a note to `docs/runbooks/` if operational steps were involved.

## Output

A short incident record: what broke, root cause, the fix, the version, and
follow-ups. Offer to write it to `docs/runbooks/incidents/<date>-<slug>.md`.
