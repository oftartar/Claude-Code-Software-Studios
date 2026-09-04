---
name: retrospective
description: "Facilitate a sprint or milestone retrospective and turn findings into concrete, owned changes."
argument-hint: "[sprint number or milestone name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
model: sonnet
agent: delivery-lead
---

## Phase 1: Assemble the Facts

Read the sprint plan and the story files. From git and the session logs, compile:
- committed vs. completed vs. carried over
- estimate accuracy (estimated vs. actual where knowable)
- bugs opened during the sprint, and how many escaped
- review verdicts (how many stories needed rework)
- any gate that blocked

Present this as a neutral summary before opinions.

## Phase 2: Reflect

Walk the user through:
- **Kept us on track**: what worked, worth keeping
- **Slowed us down**: process friction, unclear specs, missing tooling,
  rework causes
- **Surprised us**: what we didn't see coming, and why

Use `AskUserQuestion` to prioritize the friction items.

## Phase 3: Actions

For the top 2–3 items, define a concrete change: what will be different, who owns
it, and how we'll know it worked. Vague resolutions ("communicate better") are
rejected — make it a checklist item, a template change, a new rule, or a skill
tweak.

## Phase 4: Write

Ask before writing `production/retros/sprint-NN.md`: the facts summary, the
discussion, and the owned actions. Carry unfinished actions into the next retro.

## Next Steps

- Apply any action that changes `.claude/` (a rule, a template, a skill) now
- `/sprint-plan` for the next sprint, with the actions folded in
