#!/bin/bash
# SessionStart hook: flag missing foundational artifacts for the current phase.
gaps=()

prefs=".claude/docs/technical-preferences.md"
if grep -q "Frontend\*\*: \[TO BE CONFIGURED" "$prefs" 2>/dev/null; then
  gaps+=("Stack not configured - run /setup-stack")
fi
[ ! -f "docs/product/product-concept.md" ] && gaps+=("No product concept - run /define-product (or /brainstorm first)")
[ ! -f "docs/product/product-pillars.md" ] && gaps+=("No product pillars - run /define-product")
[ ! -f "docs/product/feature-index.md" ] && gaps+=("No feature index - run /map-features")

spec_count=$(ls docs/specs/*.md 2>/dev/null | wc -l)
[ "$spec_count" -eq 0 ] && gaps+=("No feature specs - run /write-spec <feature>")

[ ! -f "docs/architecture/architecture.md" ] && gaps+=("No master architecture - run /create-architecture")
adr_count=$(ls docs/adr/adr-*.md 2>/dev/null | wc -l)
[ "$adr_count" -eq 0 ] && gaps+=("No ADRs recorded - run /architecture-decision")

[ ! -f "production/review-mode.txt" ] && gaps+=("Review mode unset - run /start")

if [ ${#gaps[@]} -gt 0 ]; then
  echo "--- Foundational gaps ---"
  for g in "${gaps[@]}"; do echo "  * $g"; done
  echo "Run /project-stage-detect for a full inventory."
fi
exit 0
