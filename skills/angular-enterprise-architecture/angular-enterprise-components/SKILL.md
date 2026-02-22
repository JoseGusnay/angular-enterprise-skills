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

### 1. Smart vs. Dumb Pattern (Atomic Design)
- **Smart Components** (`features/`): Manage logic, inject services, orchestrate state. They represent the "Pages" or complex "Organisms" that are data-aware.
- **Dumb Components** (`shared/ui/`): Pure UI. Data in via `input()`, events out via `output()`.
    - **Atoms**: Single responsibility components (e.g., `app-button`). No dependencies.
    - **Molecules**: Complex UI patterns (e.g., `app-search-input`). May depend on atoms.
    - **Organisms**: High-level UI fragments (e.g., `app-user-card-list`). May depend on atoms and molecules.

### 2. Component Structure
- **Standalone**: All components must be `standalone: true`.
- **4 Files**: Every component must have `.ts`, `.html`, `.scss`, and `.spec.ts`.
- **Functional Injection**: Always use `inject()` instead of constructors.

### 3. Optimization
- **OnPush Always**: Use `ChangeDetectionStrategy.OnPush` in ALL components.
- **Modern Flow**: Use `@if`, `@for` (with `track` obligatorio), and `@switch`.
- **Lazy Loading**: Use `@defer` for heavy components.

## Constraints / MUST NOT DO
- **NO classic decorators**: Do not use `@Input`, `@Output`, or `@ViewChild`. Use signals.
- **NO Default detection**: Using `ChangeDetectionStrategy.Default` is prohibited.
- **NO logic in Dumb components**: Business logic in `shared/ui/` is a breaking architectural error.
- **NO inline HTML/CSS**: Keep files separated for clean versioning.
- **NO `trackBy` function**: Use the new `@for (...) { }` syntax with a direct property path.
