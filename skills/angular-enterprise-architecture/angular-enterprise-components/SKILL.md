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
- **Molecules (The "Simple Groups")**: 
    - MUST consist of at least one Atom.
    - MUST represent a single visual pattern.
- **Organisms (The "Complex Sections")**: 
    - CAN contain Atoms, Molecules, and other Organisms.
    - Represents a distinct, reusable section of the interface.

## Constraints / MUST NOT DO
- **NO Logic in UI**: Business logic or Service injection in `shared/ui/` is a CRITICAL violation.
- **NO Flat structure**: Placing a component directly in `shared/ui/` without Atomic categorization is PROHIBITED.
- **NO classic decorators**: Do not use `@Input`, `@Output`, or `@ViewChild`. Use signals.
- **NO Default detection**: Using `ChangeDetectionStrategy.Default` is prohibited.
