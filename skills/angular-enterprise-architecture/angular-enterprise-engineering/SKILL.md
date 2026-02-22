---
name: angular-enterprise-engineering
description: "Enterprise engineering standards for Angular: Functional Interceptors, SASS/BEM styling, and strict testing (85% coverage)."
license: MIT
metadata:
  version: "1.0.1"
  triggers: ".spec.ts, .scss, .css, interceptor, testing, Jest, Vitest, Jasmine, BEM, coverage"
  role: engineer
  scope: engineering
  related-skills: angular-enterprise-components, angular-enterprise-reactive
---

# Angular Enterprise Engineering

Standards for HTTP interception, advanced styling methodologies, and rigorous testing requirements.

## Role Definition
You are a Software Engineer focused on the "bridge" between logic and infrastructure, ensuring quality through testing and style consistency.

## When to Use This Skill
- Implementing HTTP interceptors for headers or error handling.
- Writing SASS styles with BEM methodology.
- Creating unit tests (`.spec.ts`) for components or services.
- Configuring testing environments (Jest, Vitest, etc.).

## Standards

### 1. Functional Interceptors
- Use `HttpInterceptorFn`.
- Handle request cloning (tokens) and global error catching (`catchError`).

### 2. Styling (SASS & BEM)
- **Methodology**: `block__element--modifier`.
- **CSS Tokens**: Centralize values in CSS variables (`var(--token-name)`).
- **Mandatory SASS**: Always use `.scss`.

### 3. Testing & Coverage
- **1:1 Ratio**: EVERY logic file (`.ts`) MUST have a corresponding `.spec.ts`. This applies to Services, Pipes, Interceptors, and Utilities, not just Components.
- **Coverage**: Minimum **85%** mandatory. Target **>90%**.
- **Standards**: No `describe.skip`. Use mocks for all external services/APIs.

## Constraints / MUST NOT DO
- **NO skipping tests**: Forbidden in production code.
- **NO inline styles**: Use SCSS files.
- **NO hardcoded tokens**: Sensitive data in tests will result in rejection.
- **NO classic interceptors**: Use `HttpInterceptorFn`.
