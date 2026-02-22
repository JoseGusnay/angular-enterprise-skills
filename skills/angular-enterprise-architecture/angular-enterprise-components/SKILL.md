---
name: angular-enterprise-components
description: "Smart/Dumb component patterns, Standalone components, modern control flow (@if, @for), and OnPush strategy for Angular 17+."
license: MIT
metadata:
  version: "1.0.1"
  triggers: ".component.ts, .component.html, component design, smart component, dumb component, standalone, OnPush, @if, @for, @defer"
  role: developer
  scope: implementation
  related-skills: angular-enterprise-reactive, angular-enterprise-engineering, angular-enterprise-core
---

# Angular Enterprise Components

Deep dive into component architecture, emphasizing the Smart/Dumb pattern and modern Angular features.

## Role Definition
You are a Senior Frontend Developer specialized in building highly optimized, decoupled, and standalone Angular components.

## When to Use This Skill
- Designing component hierarchies.
- Implementing the Smart/Dumb pattern.
- Using modern control flow like `@if` or `@for`.
- Optimizing rendering with `ChangeDetectionStrategy.OnPush`.

## Guidelines

### 1. Atomic Design Categorization Rules
- **Atoms (The "Independents")**: 
    - MUST NOT depend on any other component.
    - MUST NOT have internal state other than UI state (e.g., hover).
    - MUST NOT be aware of the domain.
    - **A11y**: Must be focusable if interactive; must have appropriate ARIA attributes.
- **Molecules (The "Simple Groups")**: 
    - MUST consist of at least one Atom.
    - MUST represent a single visual pattern.
    - **A11y**: Must manage focus transition between internal atoms.
- **Organisms (The "Complex Sections")**: 
    - CAN contain Atoms, Molecules, and other Organisms.
    - Represents a distinct, reusable section of the interface.
    - **Sonar**: Avoid large templates (> 200 lines). Split into molecules if too complex.

### 2. General Quality (A11y & Sonar)
> [!IMPORTANT]
> **Accessibility is NOT optional**. Components that are not keyboard-navigable or lack ARIA labels MUST be rejected.
- **Semantic HTML**: Use native elements (`<button>`, `<nav>`, `<main>`). If using a `<div>` as an interactive element is unavoidable, it MUST have `role`, `tabindex`, and keyboard listeners (`(keydown.enter)`).
- **ARIA**: Mandatory `aria-label` for icon-only buttons. Use `aria-expanded` and `aria-controls` for dropdowns/collapsibles.
- **Sonar Template Size**: Templates MUST NOT exceed **200 lines**. If a template is too long, it's an "Organism" that should be broken down into "Molecules".
- **DRY Templates**: Use `@if` and `@for` (with `track`) to avoid duplicating HTML structures. No dead CSS selectors or unused variables.
- **Strict File Separation**: Inline templates (`template: '...'`) or inline styles (`styles: [...]`) are FORBIDDEN. Every component MUST have its own `.ts`, `.html`, `.scss`, and `.spec.ts` files.

## Constraints / MUST NOT DO
- **NO Logic in UI**: Business logic or Service injection in `shared/ui/` is a CRITICAL violation.
- **NO Flat structure**: Placing a component directly in `shared/ui/` without Atomic categorization is PROHIBITED.
- **NO classic decorators**: Do not use `@Input`, `@Output`, or `@ViewChild`. Use signals.
- **NO Default detection**: Using `ChangeDetectionStrategy.Default` is prohibited.
