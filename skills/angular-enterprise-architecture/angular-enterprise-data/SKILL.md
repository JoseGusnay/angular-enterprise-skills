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

### 1. Signals vs RxJS (Stable Approach)
- **Signals**: Use for synchronous application and component state. APIs: `signal()`, `computed()`, `input()`, `output()`, `model()`, `viewChild()`.
- **RxJS**: Use for asynchronous operations and event streams.
- **Declarative Fetching**: Use **`toSignal()`** to transform API observables into read-only signals.
- **State Updates**: Store methods should return `Observable<T>`. This allows the **Component** to subscribe and trigger the action, while the Store uses `tap()` to update its internal signals.
- **NO manual `.subscribe()` in Services/Stores**: Never use manual `.subscribe()` inside a service or store method. Return the `Observable` and let the **Component** handle the subscription (using `takeUntilDestroyed()`).

### 2. Functional HTTP Interceptors & API Strategy
- **Modern API**: Use `HttpInterceptorFn` (no class-based interceptors).
- **Endpoint Centralization**: All API URLs must be constructed using `environment.apiUrl` combined with centralized constants (e.g., `API_ENDPOINTS.USERS`). Hardcoded strings in services are forbidden.
- **Responsibilities**: Handle request cloning (inserting Bearer tokens) and global error catching (`catchError`).
- **Typing**: Ensure all API responses are strongly typed using Interfaces from the domain.

### 3. Error Handling Hierarchy
- **Global Errors**: Handle generic HTTP status (401, 403, 500) and generic user notifications in **Interceptors**.
- **Feature Errors**: Use `catchError` in services ONLY for local recovery logic or domain-specific error mapping.
- **Strict Typing**: You MUST explicitly type the error parameter (e.g., `catchError((error: HttpErrorResponse | unknown) => ...)`). Implicit `any` is forbidden.

## Constraints / MUST NOT DO
- **NO State in API Services**: Service files that perform HTTP calls must not hold Signals or loading flags. State belongs to Stores/State Services.
- **NO manual `.subscribe()` inside methods (Service/Store)**: This is ABSOLUTELY PROHIBITED. Do not use `.subscribe()` to update signal state inside a class method. Return the `Observable` instead.
- **Mandatory Subscription Protection**: All subscriptions in **Components** must be protected with `takeUntilDestroyed()` or the `async` pipe.
- **NO `takeUntilDestroyed()` inside `ngOnInit`**: Calling `takeUntilDestroyed()` without passing a `DestroyRef` outside of an injection context throws a runtime error (NG0203).
- **NO `constructor()`**: Use `inject()` for all dependency injection. Empty constructors are forbidden.
- **NO direct mutation**: Never use `.push()` or similar mutating methods on signal values.
- **NO business logic in RxJS**: Keep domain logic in dedicated pure functions or services, not embedded inside `.pipe()`.
- **NO classic interceptors**: Use `HttpInterceptorFn`.
- **NO `any` on responses**: The `.get<T>()` or `.post<T>()` generic must always mapping to a defined interface.
