# Accessibility Requirements: <feature / screen>

> Target: WCAG 2.2 AA | Owner: accessibility-specialist

## Semantics
- [ ] Native elements used; ARIA only where semantics can't be expressed otherwise
- [ ] Headings form a logical outline
- [ ] Landmarks present (header, nav, main, footer)

## Keyboard
- [ ] Every interactive element reachable and operable
- [ ] Visible focus indicator (contrast ≥ 3:1)
- [ ] Logical focus order; no traps; skip link to main

## Screen Reader
- [ ] All controls have an accessible name
- [ ] State changes announced (aria-live where needed)
- [ ] Form errors programmatically associated with fields

## Visual
- [ ] Text contrast ≥ 4.5:1 (≥ 3:1 large); non-text ≥ 3:1
- [ ] Usable at 200% zoom / 320px reflow
- [ ] Target size ≥ 24×24 CSS px (or spacing exception)
- [ ] Information not conveyed by color alone

## Motion
- [ ] Honors prefers-reduced-motion
- [ ] No content flashes > 3×/second

## Forms
- [ ] Labels visible and associated
- [ ] Instructions and format hints before the field
- [ ] Errors identify the field and suggest a fix

## Verification
- Automated: <tool + result>
- Manual keyboard walkthrough: <result>
- Screen reader pass (<NVDA/VoiceOver>): <result>
