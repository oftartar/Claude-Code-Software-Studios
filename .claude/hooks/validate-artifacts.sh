#!/bin/bash
# PostToolUse(Write|Edit): advisory checks on product/spec/adr artifacts.
payload=$(cat)
fp=$(echo "$payload" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"$//')
[ -z "$fp" ] && exit 0
[ ! -f "$fp" ] && exit 0

case "$fp" in
  *docs/specs/*.md)
    for h in "## Problem" "## Goals" "## Non-Goals" "## Acceptance Criteria"; do
      grep -qF "$h" "$fp" || echo "NOTE: $fp is missing section '$h'."
    done
    ;;
  *docs/adr/*.md)
    case "$(basename "$fp")" in
      adr-[0-9][0-9][0-9]-*.md) : ;;
      *) echo "NOTE: ADR filename should match adr-NNN-slug.md - got $(basename "$fp")." ;;
    esac
    for h in "## Status" "## Context" "## Decision" "## Consequences"; do
      grep -qF "$h" "$fp" || echo "NOTE: $fp is missing section '$h'."
    done
    ;;
  *docs/product/product-concept.md)
    for h in "## Vision" "## Target Users" "## Non-Goals"; do
      grep -qF "$h" "$fp" || echo "NOTE: $fp is missing section '$h'."
    done
    ;;
esac
exit 0
