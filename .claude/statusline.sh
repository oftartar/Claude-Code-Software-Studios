#!/usr/bin/env bash
# Claude Code Software Studios — Status Line
# Receives JSON on stdin, outputs a single-line status.
#
# Segments: ctx% | model | delivery stage [| Epic > Feature > Story]

input=$(cat)

# --- Parse JSON (jq with grep fallback) ---
if command -v jq &>/dev/null; then
  model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
  used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
  cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
else
  model=$(echo "$input" | grep -oE '"display_name"\s*:\s*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  used_pct=$(echo "$input" | grep -oE '"used_percentage"\s*:\s*[0-9]+' | head -1 | sed 's/.*: *//')
  cwd=$(echo "$input" | grep -oE '"current_dir"\s*:\s*"[^"]*"' | head -1 | sed 's/.*: *"//;s/"//')
  [ -z "$model" ] && model="Unknown"
fi

cwd=$(echo "$cwd" | sed 's|\\|/|g')
[ -z "$cwd" ] && cwd="."

if [ -n "$used_pct" ]; then
  ctx_label="ctx: ${used_pct}%"
else
  ctx_label="ctx: --"
fi

# --- Delivery stage ---
stage_file="$cwd/production/stage.txt"
stage=""
if [ -f "$stage_file" ]; then
  stage=$(head -1 "$stage_file" | tr -d '\r\n')
fi

if [ -z "$stage" ]; then
  concept_file="$cwd/docs/product/product-concept.md"
  features_file="$cwd/docs/product/feature-index.md"
  tech_prefs="$cwd/.claude/docs/technical-preferences.md"

  has_concept=false
  has_features=false
  stack_configured=false
  src_count=0

  [ -f "$concept_file" ] && has_concept=true
  [ -f "$features_file" ] && has_features=true

  if [ -f "$tech_prefs" ]; then
    fe_line=$(grep -m1 '^\- \*\*Frontend\*\*:' "$tech_prefs" 2>/dev/null || true)
    if [ -n "$fe_line" ] && ! echo "$fe_line" | grep -q "TO BE CONFIGURED"; then
      stack_configured=true
    fi
  fi

  if [ -d "$cwd/src" ]; then
    src_count=$(find "$cwd/src" -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" -o -name "*.vue" -o -name "*.svelte" -o -name "*.py" -o -name "*.go" \) 2>/dev/null | wc -l | tr -d ' ')
  fi

  has_adrs=false
  if ls "$cwd/docs/adr/"adr-*.md 2>/dev/null | head -1 | grep -q .; then
    has_adrs=true
  fi

  if [ "$src_count" -ge 10 ] 2>/dev/null; then
    stage="Build"
  elif [ "$has_adrs" = true ]; then
    stage="Pre-Production"
  elif [ "$stack_configured" = true ]; then
    stage="Technical Setup"
  elif [ "$has_features" = true ]; then
    stage="Feature Design"
  elif [ "$has_concept" = true ]; then
    stage="Concept"
  else
    stage="Concept"
  fi
fi

# --- Epic/Feature/Story breadcrumb (Build+ only) ---
breadcrumb=""
if [ "$stage" = "Build" ] || [ "$stage" = "Hardening" ] || [ "$stage" = "Release" ]; then
  state_file="$cwd/production/session-state/active.md"
  if [ -f "$state_file" ]; then
    in_block=false
    epic="" feature="" story=""
    while IFS= read -r line; do
      case "$line" in
        *"<!-- STATUS -->"*) in_block=true; continue ;;
        *"<!-- /STATUS -->"*) break ;;
      esac
      if [ "$in_block" = true ]; then
        case "$line" in
          Epic:*) epic=$(echo "$line" | sed 's/^Epic: *//') ;;
          Feature:*) feature=$(echo "$line" | sed 's/^Feature: *//') ;;
          Story:*) story=$(echo "$line" | sed 's/^Story: *//') ;;
        esac
      fi
    done < "$state_file"

    parts=""
    [ -n "$epic" ] && parts="$epic"
    [ -n "$feature" ] && parts="${parts:+$parts > }$feature"
    [ -n "$story" ] && parts="${parts:+$parts > }$story"
    [ -n "$parts" ] && breadcrumb=" | $parts"
  fi
fi

printf "%s" "${ctx_label} | ${model} | ${stage}${breadcrumb}"
