---
name: angular-enterprise-data
description: "State management in Angular 17+ and HTTP architecture. Covers Signals (UI state), RxJS (Async/HTTP), and Functional Interceptors."
license: MIT
metadata:
  version: "1.1.0"
  triggers: ".ts, signal, input, output, model, RxJS, Observable, toSignal, takeUntilDestroyed, behaviorSubject, HTTP, Interceptor, HttpClient, request, backend"
  role: data-specialist
  scope: implementation
  related-skills: angular-enterprise-ui, angular-enterprise-core
---

# Angular Enterprise Data & State

Expert guidance on managing state reactively and coordinating external data flow using Signals (UI state) and RxJS (Async/HTTP).

## Role Definition
You are a State Management and Integration Specialist focused on reactivity, memory safety, efficient data flow, and secure API communication in Angular.

## When to Use This Skill
- Implementing reactive state in services.
- Managing HTTP requests, API calls, and async data streams.
- Creating HTTP interceptors (headers, error handling, auth).
- Converting between Observables and Signals.

## Standards

### 1. Signals vs RxJS (Declarative Approach)
- **Signals**: Use for synchronous application and component state. APIs: `signal()`, `computed()`, `input()`, `output()`, `model()`, `viewChild()`.
- **RxJS**: Use ALMOST EXCLUSIVELY for asynchronous operations, event streams, and HTTP calls.
- **Declarative State**: Never use manual `.subscribe()` inside methods to update state. Map RxJS directly to Signals using `toSignal()` or use `tap()` in a `.pipe()` chain if side effects are strictly necessary before `toSignal()`.

### 2. Functional HTTP Interceptors
- **Modern API**: Use `HttpInterceptorFn` (no class-based interceptors).
- **Responsibilities**: Handle request cloning (inserting Bearer tokens) and global error catching (`catchError`).
- **Typing**: Ensure all API responses are strongly typed using Interfaces from the domain.

### 3. Memory & Safety
- **Unsubscribe**: Use `takeUntilDestroyed()` for manual RxJS subscriptions.
- **Immutability**: Always use `signal.set(...)` or `signal.update(...)` with spread operators.
- **Error Handling**: Use `catchError` to properly format errors before they reach the component. You MUST explicitly type the error parameter (e.g., `catchError((error: HttpErrorResponse | unknown) => ...)`). Implicit `any` is forbidden.

## Constraints / MUST NOT DO
- **NO manual `.subscribe()` inside methods**: This is an anti-pattern. Expose the `Observable` and let the component handle it with `takeUntilDestroyed()`, `async` pipe, or convert it purely declaratively using `toSignal()`.
- **NO `takeUntilDestroyed()` inside `ngOnInit`**: Calling `takeUntilDestroyed()` without passing a `DestroyRef` outside of an injection context (like a constructor or field initializer) throws a runtime error (NG0203). Always prefer declarative `toSignal()` assignments over manual subscriptions in lifecycle hooks.
- **NO `constructor()`**: Use `inject()` for all dependency injection. Empty constructors are forbidden.
- **NO direct mutation**: Never use `.push()` or similar mutating methods on signal values.
- **NO business logic in RxJS**: Keep domain logic in dedicated pure functions or services, not embedded inside `.pipe()`.
- **NO classic interceptors**: Prohibited.
- **NO `any` on responses**: The `.get<T>()` or `.post<T>()` generic must always mapping to a defined interface.
