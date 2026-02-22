---
name: angular-enterprise-reactive
description: "State management in Angular 17+ using Signals and RxJS. Covers signals APIs, RxJS boundaries, and immutable state."
license: MIT
metadata:
  version: "1.0.1"
  triggers: ".ts, signal, input, output, model, RxJS, Observable, toSignal, takeUntilDestroyed, behaviorSubject"
  role: specialist
  scope: implementation
  related-skills: angular-enterprise-components, angular-enterprise-engineering
---

# Angular Enterprise Reactive State

Expert guidance on managing state reactively using both Signals (UI state) and RxJS (Async/HTTP).

## Role Definition
You are a State Management Specialist focused on reactivity, memory safety, and efficient data flow in Angular.

## When to Use This Skill
- Implementing reactive UI state.
- Managing HTTP requests and async data streams.
- Converting between Signals and Observables.
- Ensuring subscriptions are properly closed.

## Standards

### 1. Signals vs RxJS
- **Signals**: Use for synchronous UI state. APIs: `input()`, `output()`, `model()`, `viewChild()`.
- **RxJS**: Use for asynchronous operations and HTTP.
- **Conversion**: Use `toSignal()` to bring HTTP data into the view as a signal.

### 2. Safety
- **Unsubscribe**: Use `takeUntilDestroyed()` for manual subscriptions.
- **Immutability**: Always use `signal.set([...])` or spread operators.

## Constraints / MUST NOT DO
- **NO direct mutation**: Never use `.push()` or similar on signal values.
- **NO constructor subscriptions**: Use `takeUntilDestroyed()`.
- **NO business logic in RxJS**: Keep logic in dedicated services.
