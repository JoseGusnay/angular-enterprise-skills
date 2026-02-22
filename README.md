# Enterprise AI Skills Repository 🚀

Este repositorio contiene una colección de habilidades (skills) para agentes de IA siguiendo el estándar internacional de [Agent Skills](https://agentskills.io/). Está diseñado para ser utilizado por herramientas como Antigravity, Claude Code, Cursor y otros editores compatibles.

## 📦 Contenido

### Angular Enterprise Architecture
Una suite completa de estándares para aplicaciones Angular 17+ de nivel profesional:

- **[Core](skills/angular-enterprise-architecture/angular-enterprise-core/SKILL.md)**: Arquitectura de carpetas, principios SOLID y Clean Code.
- **[Components](skills/angular-enterprise-architecture/angular-enterprise-components/SKILL.md)**: Patrón Smart/Dumb, Standalone y OnPush.
- **[Reactive](skills/angular-enterprise-architecture/angular-enterprise-reactive/SKILL.md)**: Gestión de estado moderno con Signals y RxJS.
- **[Engineering](skills/angular-enterprise-architecture/angular-enterprise-engineering/SKILL.md)**: Estándares de testing (85% coverage) y SASS/BEM.
- **[Reviewer](skills/angular-enterprise-architecture/angular-enterprise-review/SKILL.md)**: Auditor automático para asegurar la calidad del código.

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

## ❓ Preguntas Frecuentes

### ¿Por qué se crean las carpetas `.agent` y `.agents`?
La herramienta `npx skills` instala los archivos en ambas rutas para garantizar compatibilidad:
- **`.agent`**: Estándar para Antigravity y Claude Code.
- **`.agents`**: Usada por otros editores como Cursor o Windsurf.

**Recomendación:** Si solo usas Antigravity, puedes borrar la carpeta `.agents` (con la 's' al final) para mantener tu proyecto limpio.

---
Desarrollado con ❤️ para maximizar la productividad con IA.
