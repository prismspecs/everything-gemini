# GEMINI.md

This file provides guidance to Gemini Code (gemini.ai/code) when working with code in this repository.

## Project Overview

This is a **Gemini Code plugin** - a collection of production-ready agents, skills, hooks, commands, rules, and MCP configurations. The project provides battle-tested workflows for software development using Gemini Code.

## Architecture

The project is organized into several core components within the **.gemini/** directory:

- **.gemini/agents/** - Specialized subagents (planner, code-reviewer, tdd-guide, etc.)
- **.gemini/skills/** - Workflow definitions and domain knowledge
- **.gemini/commands/** - Custom slash commands
- **.gemini/rules/** - Language-specific and common coding standards
- **.gemini/contexts/** - Specialized session contexts
- **.agents** - Symlink to .gemini for CLI compatibility

Other top-level directories:
- **docs/** - Project documentation and guides
- **examples/** - Usage examples and configurations
- **mcp-configs/** - MCP server configurations

## Key Commands

- `/tdd` - Test-driven development workflow
- `/planner` - Implementation planning
- `/e2e` - Generate and run E2E tests
- `/code-review` - Quality review
- `/build-fix` - Fix build errors
- `/learn` - Extract patterns from sessions
- `/skill-create` - Generate skills from git history

## Development Notes

- Package manager detection: npm, pnpm, yarn, bun (configurable via `GEMINI_PACKAGE_MANAGER` env var or project config)
- Cross-platform: Windows, macOS, Linux support via Node.js scripts
- Agent format: Markdown with YAML frontmatter (name, description, tools, model)
- Skill format: Markdown with clear sections for when to use, how it works, examples
- Hook format: JSON with matcher conditions and command/notification hooks

## Contributing

Follow the formats in CONTRIBUTING.md:
- Agents: Markdown with frontmatter (name, description, tools, model)
- Skills: Clear sections (When to Use, How It Works, Examples)
- Commands: Markdown with description frontmatter
- Hooks: JSON with matcher and hooks array

File naming: lowercase with hyphens (e.g., `python-reviewer.md`, `tdd-workflow.md`)
