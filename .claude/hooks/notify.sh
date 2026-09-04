#!/bin/bash
# Notification: best-effort desktop notification.
payload=$(cat)
msg=$(echo "$payload" | grep -oE '"message"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
[ -z "$msg" ] && msg="Claude Code needs your attention"
title="Claude Code Software Studios"
if command -v notify-send >/dev/null 2>&1; then
  notify-send "$title" "$msg"
elif command -v osascript >/dev/null 2>&1; then
  osascript -e "display notification \"$msg\" with title \"$title\"" >/dev/null 2>&1
elif command -v powershell.exe >/dev/null 2>&1; then
  powershell.exe -NoProfile -Command "New-BurntToastNotification -Text '$title','$msg'" >/dev/null 2>&1 || true
fi
exit 0
