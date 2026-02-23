# Enterprise AI Skills Repository 🚀

Este repositorio contiene una colección de habilidades (skills) para agentes de IA siguiendo el estándar internacional de [Agent Skills](https://agentskills.io/). Está diseñado para ser utilizado por herramientas como Antigravity, Claude Code, Cursor y otros editores compatibles.

## 📦 Contenido

### Angular Enterprise Architecture
Una suite completa de estándares para aplicaciones Angular 17+ de nivel profesional:

- **[Core](skills/angular-enterprise-architecture/angular-enterprise-core/SKILL.md)**: Arquitectura base, principios SOLID, inmutabilidad y convenciones de nombrado (Clean Code).
- **[UI](skills/angular-enterprise-architecture/angular-enterprise-ui/SKILL.md)**: Interfaces gráficas con Atomic Design, patrón Smart/Dumb, SASS BEM estricto y Accesibilidad.
- **[Data & State](skills/angular-enterprise-architecture/angular-enterprise-data/SKILL.md)**: Gestión de estado con Signals, arquitectura de red (Interceptors) y flujos RxJS (Async).
- **[Testing](skills/angular-enterprise-architecture/angular-enterprise-testing/SKILL.md)**: Estándares de calidad, mocking y cobertura obligatoria >85% (1 archivo spec por cada ts).
- **[Reviewer](skills/angular-enterprise-architecture/angular-enterprise-review/SKILL.md)**: Auditor automático configurado como Quality Gate de SonarQube para revisar Pull Requests.

## 🛠️ Herramientas Locales

He incluido dos scripts para ayudarte a crear tus propios skills rápidamente:

- `install_skill.ps1`: Script de PowerShell para Windows.
- `skill.sh`: Script de Bash para entornos Linux/WSL/Git Bash.

**Uso:**
```bash
./skill.sh mi-nuevo-skill path/to/content.md
```

## 🚀 Instalación en Proyectos

Para usar estos skills en cualquier proyecto de Angular, ejecuta el siguiente comando:

```bash
npx skills add JoseGusnay/angular-enterprise-skills
```

Este comando descargará e instalará automáticamente los estándares en tu proyecto actual (generalmente en la carpeta `.agent/skills/` o similar).

## 🤖 Uso con el Agente

Solo menciona el skill o deja que el agente lo active por contexto:
- *"Revisa mi código usando el skill de auditoría."*
- *"Crea un componente siguiendo nuestras reglas enterprise."*

---
Desarrollado con ❤️ para maximizar la productividad con IA.
