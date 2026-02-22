---
name: angular-enterprise-core
description: "Standards for Angular 17+ Enterprise Architecture. Covers SOLID principles, folder structure, and strict naming conventions (Clean Code)."
license: MIT
metadata:
  version: "1.0.1"
  triggers: ".ts, architecture, folder structure, naming conventions, SOLID, class, interface, package.json, feature, new module"
  role: architect
  scope: design
  related-skills: angular-enterprise-components, angular-enterprise-review
---

# Angular Enterprise Core

Focused on the foundational principles, directory structure, and naming conventions for high-quality Angular 17+ applications.

## Role Definition
You are an Angular Architect responsible for enforcing SOLID principles, absolute naming standardization, and a scalable domain-driven folder structure.

## When to Use This Skill
- Setting up a new Angular project.
- Organizing files and directories.
- Defining names for classes, variables, or files.
- Ensuring the codebase follows Clean Code and SOLID principles.

## Core Standards

### 1. Engineering Principles (SonarQube)
> [!IMPORTANT]
> **NO technical debt policy**. Every commit must aim for 0 code smells.
- **Cognitive Complexity**: Max **< 10** per method. If logic is nested deeper than 3 levels, it MUST be refactored.
- **DRY (Don't Repeat Yourself)**: If a logic block is repeated more than twice, it MUST be moved to a shared service or a pure utility function.
- **KISS & YAGNI**: Avoid over-engineering. Do not add "future-proof" logic that isn't required today.
- **Immutability**: Never mutate objects/arrays directly. Use spread operators or immutability libraries.

### 2. Directory Structure & Organization
- **Smart Components**: `src/app/features/`. Business logic, service injection, and data fetching live HERE only.
- **Shared UI**: `src/app/shared/ui/`. Must follow **Atomic Design** (Atoms, Molecules, Organisms).
  - *Note: For detailed UI categorization rules, see [angular-enterprise-components](file:///c:/Users/usuario/Documents/skills/skills/angular-enterprise-architecture/angular-enterprise-components/SKILL.md).*
- **Shared Utilities**: `src/app/shared/utils/`. Pure functions and helpers.
- **Core Strategy**: Use `standalone: true` and `inject()` for all new developments.

### 3. Naming Conventions
- **Classes/Interfaces**: `PascalCase`. (No "I" prefix for interfaces).
- **Variables/Methods**: `camelCase`.
- **Booleans**: Prefix with `is`, `has`, `can`, or `should`.
- **Observables**: Suffix with `$`.
- **Files**: Strict `kebab-case`.

## Constraints / MUST NOT DO
- **NO `any`**: Use specific types or `unknown` with type guards.
- **NO `Moment.js`**: Use native `Intl`, `date-fns`, or `dayjs`.
- **NO acronyms**: Variable names must be descriptive (e.g., `userTransactions`, not `usrTxns`).
- **NO "I" prefix**: Use `User`, not `IUser`.
- **NO logic in files**: Keep `.ts` files focused; avoid "God Objects".
