# settings.local.json Template

Copy the JSON below to `.claude/settings.local.json` (gitignored) to add
personal permission rules without touching the shared `settings.json`.

```json
{
  "$schema": "https://json.schemastore.org/claude-code-settings.json",
  "permissions": {
    "allow": [
      "Bash(pnpm dev*)",
      "Bash(pnpm build*)",
      "Bash(docker compose up*)",
      "Bash(docker compose down*)"
    ],
    "deny": []
  }
}
```

Rules here are merged with the shared settings. Keep anything the whole team
needs in the committed `settings.json`; keep only machine- or preference-specific
entries here.
