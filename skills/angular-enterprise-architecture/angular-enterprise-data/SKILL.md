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
- Implementing reactive state in Store/State services.
- Managing HTTP requests in stateless API services.
- Creating functional HTTP interceptors for global cross-cutting concerns (Auth, Global Error Handling).
- Converting between Observables and Signals using `toSignal()`.

## Standards

### 1. Signals vs RxJS (Declarative Approach)
- **Signals**: Use for synchronous application and component state. APIs: `signal()`, `computed()`, `input()`, `output()`, `model()`, `viewChild()`.
- **RxJS**: Use ALMOST EXCLUSIVELY for asynchronous operations and event streams.
- **Async State (Angular 19/20+)**: Prefer **`rxResource()`** for data fetching. 
    - **Note (Angular 20+)**: The property `loader` has been renamed to **`stream`** and `request` to **`params`**. Use the correct naming based on your project version.
    - **Typing**: Computed signals derived from a resource MUST have an explicit initial value or fallback (e.g., `this.resource.value() ?? []`) to avoid `any` or `{}` issues.
- **Trigger-based Signals**: To trigger actions (like a refresh or search), use a private `Subject` or `signal`, and pipe it to an observable that `toSignal()` consumes.
- **NO manual `.subscribe()`**: Never use manual `.subscribe()` inside methods to update state. Use `toSignal()`, `rxResource()`, or the `async` pipe. For side-effects, use `tap()` within a pipe *before* converting to a signal.

### 2. Functional HTTP Interceptors
- **Modern API**: Use `HttpInterceptorFn` (no class-based interceptors).
- **Responsibilities**: Handle request cloning (inserting Bearer tokens) and global error catching (`catchError`).
- **Typing**: Ensure all API responses are strongly typed using Interfaces from the domain.

### 3. Error Handling Hierarchy
- **Global Errors**: Handle generic HTTP status (401, 403, 500) and generic user notifications in **Interceptors**.
- **Feature Errors**: Use `catchError` in services ONLY for local recovery logic or domain-specific error mapping.
- **Strict Typing**: You MUST explicitly type the error parameter (e.g., `catchError((error: HttpErrorResponse | unknown) => ...)`). Implicit `any` is forbidden.

## Constraints / MUST NOT DO
- **NO State in API Services**: Service files that perform HTTP calls must not hold Signals or loading flags. State belongs to Stores/State Services.
- **NO manual `.subscribe()` inside methods (Service/Store)**: This is ABSOLUTELY PROHIBITED. Do not use `.subscribe()` to update signal state inside a class method.
    - **For Fetching (GET)**: Use `rxResource()` (preferred) or `toSignal()`.
    - **For Mutations (POST/PUT/DELETE)**: Use a declarative stream via `toSignal()` with a trigger signal, or return the `Observable` so the **Component** can handle the subscription (using `takeUntilDestroyed()`).
- **NO `takeUntilDestroyed()` inside `ngOnInit`**: Calling `takeUntilDestroyed()` without passing a `DestroyRef` outside of an injection context throws a runtime error (NG0203).
- **NO `constructor()`**: Use `inject()` for all dependency injection. Empty constructors are forbidden.
- **NO direct mutation**: Never use `.push()` or similar mutating methods on signal values.
- **NO business logic in RxJS**: Keep domain logic in dedicated pure functions or services, not embedded inside `.pipe()`.
- **NO classic interceptors**: Use `HttpInterceptorFn`.
- **NO `any` on responses**: The `.get<T>()` or `.post<T>()` generic must always mapping to a defined interface.
