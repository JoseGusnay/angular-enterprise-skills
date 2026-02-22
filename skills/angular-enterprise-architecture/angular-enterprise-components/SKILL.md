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
- **Atoms (Building Blocks)**: 
    - MUST NOT depend on any other component.
    - MUST NOT have internal domain logic.
    - MUST be keyboard-navigable and have ARIA labels if icon-only.
- **Molecules (Functional Groups)**: 
    - MUST consist of at least one Atom.
    - Represents a single UI pattern (e.g., a search bar = input atom + button atom).
- **Organisms (Complex Sections)**: 
    - CAN contain Atoms, Molecules, and other Organisms.
    - Distinct reusable section (e.g., Header, Data Grid).
    - Template size MUST NOT exceed **200 lines**.

### 2. UI Quality & A11y
> [!IMPORTANT]
> **Accessibility is NOT optional**. Components must be keyboard-focusable and use semantic HTML.
- **Semantic HTML**: Prioritize `<button>`, `<nav>`, `<main>`.
- **Strict Separation**: Every component MUST have its own `.ts`, `.html`, `.scss`, and `.spec.ts` files. NO inline templates or styles.
- **Change Detection**: `ChangeDetectionStrategy.OnPush` is mandatory for all UI components.

## Constraints / MUST NOT DO
- **NO Business Logic**: Service injection or domain state in `shared/ui/` is a CRITICAL violation.
- **NO Default detection**: Prohibited.
- **NO Signal Decorators**: Use `input()`, `output()`, and `model()` signals ONLY.
