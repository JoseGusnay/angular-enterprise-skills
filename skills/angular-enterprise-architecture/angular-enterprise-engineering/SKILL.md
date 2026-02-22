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

### 3. Testing (Strict 1-to-1)
- **Coverage**: Minimum 85% (Target >90%).
- **Files**: Every `.ts` file must have a corresponding `.spec.ts`.
- **Engine**: Adapt to Jest, Vitest, or Jasmine based on `package.json`.

## Constraints / MUST NOT DO
- **NO skipping tests**: `describe.skip` or `it.skip` are forbidden in production code.
- **NO inline styles**: `style="..."` or `styles: [...]` in TS is prohibited.
- **NO low coverage**: Pull requests with <85% coverage must be rejected.
- **NO classic interceptors**: Classes implementing `HttpInterceptor` are deprecated for this architecture.
- **NO global CSS without tokens**: Avoid hardcoded hex colors or pixels; use CSS variables.
