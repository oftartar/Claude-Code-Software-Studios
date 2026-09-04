# production/

Delivery management artifacts.

```
stage.txt                Current lifecycle stage (written by /start, /gate-check)
review-mode.txt          full | lean | solo (written by /start)
risks.md                 Risk register (delivery-lead)
epics/<slug>/            epic.md + story-NNN-*.md   (/create-epics, /create-stories)
sprints/sprint-NN.md     Sprint plans (/sprint-plan)
milestones/*.md          Milestone definitions
retros/sprint-NN.md      Retrospectives (/retrospective)
session-state/active.md  Live work pointer — gitignored (hooks + /dev-story)
session-logs/            Session & subagent audit trail — gitignored (hooks)
```

`stage.txt` and `review-mode.txt` drive the status line and phase gates.
