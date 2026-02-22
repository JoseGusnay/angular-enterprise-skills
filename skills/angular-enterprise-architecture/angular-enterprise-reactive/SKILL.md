---
name: angular-enterprise-reactive
description: State management in Angular 17+ using Signals and RxJS. Covers signals APIs, RxJS boundaries, and immutable state.
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

### 2. Memory & Safety
- **Unsubscribe**: Use `takeUntilDestroyed()` for any manual `.subscribe()`.
- **Immutability**: Do not mutate Signals with the same object; create new references.

## Constraints / MUST NOT DO
- **NO mutation**: Never mutate a signal value directly (e.g., `signal().push()`). Use `signal.set([...])`.
- **NO manual subscribe**: Avoid `.subscribe()` in components. Use `toSignal()` or the `async` pipe. If mandatory, use `takeUntilDestroyed()`.
- **NO classic decorators**: `@Input`, `@Output` are forbidden.
- **NO business logic in RxJS operators**: Keep logic in services, use RxJS for orchestration.
