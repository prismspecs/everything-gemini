# Everything Gemini Code

[![Stars](https://img.shields.io/github/stars/affaan-m/everything-gemini-code?style=flat)](https://github.com/affaan-m/everything-gemini-code/stargazers)
[![Forks](https://img.shields.io/github/forks/affaan-m/everything-gemini-code?style=flat)](https://github.com/affaan-m/everything-gemini-code/network/members)
[![Contributors](https://img.shields.io/github/contributors/affaan-m/everything-gemini-code?style=flat)](https://github.com/affaan-m/everything-gemini-code/graphs/contributors)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Shell](https://img.shields.io/badge/-Shell-4EAA25?logo=gnu-bash&logoColor=white)
![TypeScript](https://img.shields.io/badge/-TypeScript-3178C6?logo=typescript&logoColor=white)
![Python](https://img.shields.io/badge/-Python-3776AB?logo=python&logoColor=white)
![Go](https://img.shields.io/badge/-Go-00ADD8?logo=go&logoColor=white)

> **50K+ stars** | **6K+ forks** | **30 contributors** | **Google Hackathon Winner (Adapted for Gemini)**

---

**The performance optimization system for AI agent harnesses, officially adapted for the Gemini CLI.**

Not just configs. A complete system: commands, rules, instincts, memory optimization, continuous learning, and research-first development. Production-ready agents and MCP configurations evolved over 10+ months of intensive daily use building real products.

Works across **Gemini CLI** natively, with compatibility for other AI agent harnesses.

---

## Quick Start

Get up and running in under 2 minutes:

### Step 1: Install Commands & Rules (Symlink)

The `install.sh` script will create symlinks from this repository directly into your `~/.gemini/` folder. This means whenever you `git pull` updates for this repository, your Gemini CLI commands and rules will update automatically!

```bash
# Clone the repository
git clone https://github.com/affaan-m/everything-gemini-code.git
cd everything-gemini-code

# Run the install script to symlink everything
./install.sh
```

### Step 2: Configure Project (`GEMINI.md`)

```markdown
# Project Context: [Project Name]

## Global Standards
@~/.gemini/rules/security.md @~/.gemini/rules/coding-style.md

## Project Specifics
- Use Tailwind for all styling.
- Ensure all components are exported from the index.
```

### Step 3: Start Using

Start your Gemini CLI with standard tooling flags or yolo mode to embrace agentic workflows:

```bash
gemini --yolo
```

Try a newly installed command:

```bash
/planner "Add user authentication"
```

That's it! You now have access to specialized agents, specialized skills (as commands), and rule enforcement.

---

## [Plugin] ReAct Loop vs. Hooks

If you are coming from other AI coding tools, you may be familiar with "Hooks" (scripts that run before/after tasks). The Gemini CLI approach to this is different:

- **Built-in Tools & ReAct:** Gemini CLI relies heavily on its **ReAct loop** and built-in tools rather than static pre/post hook execution.
- **Tool Authorization:** Instead of complex hook validation, use the `--yolo` flag with the Gemini CLI to mimic the autonomous execution capability, allowing Gemini to freely loop through its reasoning and tool executions.
- **Sandbox Mode:** For safe execution of unknown code or tests, use the `--sandbox` flag.

_Note: The `hooks/` directory and related shell scripts have been deprecated in favor of Gemini's native agentic flow._

---

## [Package] What's Inside

```
everything-gemini-code/
|-- agents/           # Specialized subagents for delegation
|   |-- planner.md           # Feature implementation planning
|   |-- architect.md         # System design decisions
|   |-- tdd-guide.md         # Test-driven development
|   |-- code-reviewer.md     # Quality and security review
|
|-- commands/         # Slash commands for quick execution (.toml format)
|   |-- tdd.toml              # /tdd - Test-driven development
|   |-- planner.toml          # /planner - Custom implementation planning
|   |-- e2e.toml              # /e2e - E2E test generation
|   |-- code-review.toml      # /code-review - Quality review
|   |-- search-first.toml     # /search-first - Research before coding
|   |-- ...and 100+ more compiled skills!
|
|-- rules/            # Always-follow guidelines (copy to ~/.gemini/rules/)
|   |-- README.md            # Structure overview and installation guide
|   |-- common/              # Language-agnostic principles
|   |   |-- coding-style.md    # Immutability, file organization
|   |   |-- git-workflow.md    # Commit format, PR process
|   |   |-- security.md        # Mandatory security checks
|   |-- typescript/          # TypeScript/JavaScript specific
|   |-- python/              # Python specific
|   |-- golang/              # Go specific
|
|-- examples/         # Example configurations and sessions
|   |-- GEMINI.md             # Example project-level config
|
|-- mcp-configs/      # MCP server configurations
|   |-- mcp-servers.json    # GitHub, Supabase, Vercel, Railway, etc.
```

---

## [Config] MCP Configuration

Both tools support Model Context Protocol (MCP), but they are configured within `~/.gemini/settings.json`.

Copy desired MCP servers from `mcp-configs/mcp-servers.json` to your `~/.gemini/settings.json` under the `mcpServers` block.

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_GITHUB_PAT_HERE"
      }
    }
  }
}
```

---

## [Map] Which Agent Should I Use?

Not sure where to start? Use this quick reference:

| I want to... | Use this command |
|--------------|-----------------|
| Plan a new feature | `/planner "Add auth"` |
| Design system architecture | `/planner` + architect agent |
| Create high-quality UI/UX | `/impeccable` + designer agent |
| Write code with tests first | `/tdd` |
| Review code I just wrote | `/code-review` |
| Fix a failing build | `/build-fix` |
| Run end-to-end tests | `/e2e` |
| Find security vulnerabilities | `/security-scan` |
| Remove dead code | `/refactor-clean` |

### Common Workflows

**Starting a new feature:**
```
/planner "Add user authentication with OAuth"    → creates implementation blueprint
/tdd                                          → enforces write-tests-first
/code-review                                  → checks your work
```

**Fixing a bug:**
```
/tdd                                          → write a failing test that reproduces it
                                              → implement the fix, verify test passes
/code-review                                  → catch regressions
```

---

## [WARN] Context Window Management

The Gemini CLI benefits from a **1,000,000+ token context window**, meaning you can import large, comprehensive documentation sets directly into your `GEMINI.md` context without hitting immediate performance constraints.

However, having too many MCP servers enabled can still crowd your context window. Keep your MCP count reasonable based on your current project needs.

---

## [Doc] License

MIT - Use freely, modify as needed, contribute back if you can.

---

**Star this repo if it helps. Read the guides. Build something great.**
