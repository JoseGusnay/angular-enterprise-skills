---
name: angular-enterprise-core
description: "Standards for Angular 17+ Enterprise Architecture. Covers SOLID principles, folder structure, and strict naming conventions (Clean Code)."
license: MIT
metadata:
  version: "1.0.1"
  triggers: ".ts, architecture, folder structure, naming conventions, SOLID, class, interface, package.json"
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

### 1. Engineering Principles
- **SOLID Always**: SRP, OCP, and DIP are non-negotiable.
- **Pure Functions**: Maximize usage for predictability.
- **Immutability**: Never mutate objects/arrays; use the spread operator (`...`).

### 2. Directory Structure (Atomic Design)
- `src/app/core/`: Global logic (Singleton), Functional Guards, and Interceptors.
- `src/app/shared/ui/`: Dumb components following Atomic Design:
    - `atoms/`: Basic building blocks (buttons, inputs, icons).
    - `molecules/`: Groups of atoms (search bars, form fields).
    - `organisms/`: Complex groups (headers, card lists, nav bars).
    - `templates/`: Page layouts (layout-containers).
- `src/app/features/`: Business domains. Contains "Smart" components and Pages.
- `src/assets/styles/`: Global SASS (Tokens, Base, Mixins).

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
