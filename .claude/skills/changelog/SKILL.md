---
name: changelog
description: "Generate the technical changelog and user-facing release notes from merged work since the last release."
argument-hint: "[version]  [--since <tag/date>]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash, Edit, AskUserQuestion
model: haiku
agent: release-manager
---

## Phase 1: Collect

`git log --oneline <last-tag>..HEAD` and, where available, the merged story files
for the version. Group commits/PRs by type: Added, Changed, Fixed, Deprecated,
Removed, Security.

## Phase 2: Technical Changelog

Keep-a-Changelog format. One entry per user-meaningful change, referencing the
PR/story id. Note breaking changes prominently with a migration note. Drop pure
chore/refactor noise unless it affects operators.

## Phase 3: User-Facing Release Notes

Rewrite for the reader who uses the product, not the one who builds it: what
changed, why it helps, anything they must do. No internal identifiers. Spawn or
consult `technical-writer` for polish if the notes are substantial.

## Phase 4: Write

Ask before:
- prepending the version section to `CHANGELOG.md`
- writing `docs/releases/v<version>.md` (user-facing notes)

## Next Steps

- `/release-checklist` if not already run
- `/team-release` to cut and ship
