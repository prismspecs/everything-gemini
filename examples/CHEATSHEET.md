# Gemini CLI Cheatsheet

This cheatsheet provides a quick reference to all agents, commands, and skills available in this repository.

## 🤖 Agents

Agents are specialized personas with their own tools and reasoning capabilities. Invoke them using `/agent [name]`.

| Agent | Description |
|-------|-------------|
| `architect` | System design and high-level architectural decisions. |
| `build-error-resolver` | Fixes build errors and compilation issues. |
| `chief-of-staff` | Orchestrates complex tasks across multiple agents. |
| `code-reviewer` | Performs quality, style, and security reviews. |
| `database-reviewer` | Reviews database schemas and migrations. |
| `doc-updater` | Maintains codemaps and synchronizes documentation. |
| `e2e-runner` | Generates and executes end-to-end tests. |
| `go-build-resolver` | Specialized in fixing Go build issues. |
| `go-reviewer` | Specialized Go code reviewer. |
| `harness-optimizer` | Optimizes agentic workflows and loop efficiency. |
| `impeccable-designer` | High-end UI/UX design specialist. |
| `loop-operator` | Manages continuous autonomous development loops. |
| `planner` | Creates detailed feature implementation plans. |
| `python-reviewer` | Specialized Python code reviewer. |
| `refactor-cleaner` | Identifies and removes dead code or technical debt. |
| `security-reviewer` | Dedicated security vulnerability analysis. |
| `tdd-guide` | Enforces test-driven development (Red-Green-Refactor). |

## 🛠️ Core Commands

Standard slash commands for everyday development.

| Command | Description |
|---------|-------------|
| `/planner` | Create an implementation plan (custom agent). |
| `/tdd` | Run the TDD workflow loop. |
| `/verify` | Run full project verification (Build, Types, Lint, Tests). |
| `/e2e` | Generate or run Playwright E2E tests. |
| `/code-review` | Get a quality review of your changes. |
| `/build-fix` | Automatically attempt to fix build errors. |
| `/update-docs` | Sync READMEs and guides with the codebase. |
| `/update-codemaps` | Re-generate architectural codemaps. |
| `/search-first` | Force research phase before any implementation. |
| `/checkpoint` | Save current state as a restore point. |
| `/commit` | Generate and execute a git commit with logic-first messages. |

## 🧠 Skills (Automatic Commands)

These skills from `.agents/skills/` are automatically available as slash commands.

| Command | Category |
|---------|----------|
| `/api-design` | REST/GraphQL API patterns and naming. |
| `/article-writing` | Long-form technical content and documentation. |
| `/backend-patterns` | Server-side architecture and performance. |
| `/coding-standards` | Universal TypeScript/JavaScript best practices. |
| `/content-engine` | Multi-platform content creation and repurposing. |
| `/e2e-testing` | Playwright and E2E automation patterns. |
| `/eval-harness` | Formal evaluation of agent performance. |
| `/frontend-patterns` | React, Next.js, and state management patterns. |
| `/frontend-slides` | HTML-based animated presentation generation. |
| `/impeccable-frontend` | Impeccable UI/UX domain knowledge. |
| `/investor-materials` | Pitch decks, models, and fundraising docs. |
| `/investor-outreach` | Personalized investor communications. |
| `/market-research` | Industry and competitor intelligence. |
| `/security-review` | Secure coding checklist and patterns. |
| `/strategic-compact` | Suggests context compaction to save tokens. |
| `/tdd-workflow` | Deep TDD methodology and examples. |
| `/verification-loop` | Comprehensive verification cycle instructions. |

## 📁 Examples

Standardized example files for project configuration:

- `examples/gemini-project-config.md`: Standard project-level `GEMINI.md`.
- `examples/gemini-user-config.md`: Global user-level `user-GEMINI.md`.
- `examples/gemini-saas-nextjs.md`: Config for a Next.js/Tailwind SaaS.
- `examples/gemini-django-api.md`: Config for a Python/Django API.
- `examples/gemini-go-microservice.md`: Config for a Go microservice.
- `examples/gemini-rust-api.md`: Config for a Rust backend.
