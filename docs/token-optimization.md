# Token Optimization Guide

Practical settings and habits to reduce token consumption, extend session quality, and get more work done within daily limits.

> See also: `rules/common/performance.md` for model selection strategy, `skills/strategic-compact/` for automated compaction suggestions.

---

## Recommended Settings

These are recommended defaults for most users. Power users can tune values further based on their workload — for example, setting `MAX_THINKING_TOKENS` lower for simple tasks or higher for complex architectural work.

Add to your `~/.gemini/settings.json`:

```json
{
  "model": "gemini-3-flash",
  "env": {
    "GEMINI_AUTOCOMPACT_PCT_OVERRIDE": "70",
    "GEMINI_CODE_SUBAGENT_MODEL": "gemini-3-flash"
  }
}
```

### What each setting does

| Setting | Default | Recommended | Effect |
|---------|---------|-------------|--------|
| `model` | gemini-3-flash | **gemini-3-flash** | Flash is extremely fast and capable for most coding tasks. Use Pro for complex reasoning. |
| `GEMINI_AUTOCOMPACT_PCT_OVERRIDE` | 95 | **70** | Auto-compaction triggers when context reaches this % of capacity. 70% keeps sessions responsive. |
| `GEMINI_CODE_SUBAGENT_MODEL` | _(inherits main)_ | **gemini-3-flash** | Subagents run on this model. Flash is cost-effective and sufficient for exploration. |

### Toggling extended thinking

- **Alt+T** (Windows/Linux) or **Option+T** (macOS) — toggle on/off
- **Ctrl+O** — see thinking output (verbose mode)

---

## Model Selection

Use the right model for the task:

| Model | Best for | Cost |
|-------|----------|------|
| **gemini-3-flash** | Day-to-day coding, exploration, file reading, simple lookups | Lowest |
| **gemini-3-pro** | Complex architecture, multi-step reasoning, debugging subtle issues | Medium |
| **gemini-1.5-pro** | Large context tasks requiring deep reasoning | Medium |

Switch models mid-session:

```
/model gemini-3-flash     # default for most work
/model gemini-3-pro       # complex reasoning
```

---

## Context Management

### Commands

| Command | When to use |
|---------|-------------|
| `/clear` | Between unrelated tasks. Stale context wastes tokens on every subsequent message. |
| `/compact` | At logical task breakpoints (after planning, after debugging, before switching focus). |
| `/cost` | Check token spending for the current session. |

### Strategic compaction

The `strategic-compact` skill (in `skills/strategic-compact/`) suggests `/compact` at logical intervals rather than relying on auto-compaction, which can trigger mid-task. See the skill's README for hook setup instructions.

**When to compact:**
- After exploration, before implementation
- After completing a milestone
- After debugging, before continuing with new work
- Before a major context shift

**When NOT to compact:**
- Mid-implementation of related changes
- While debugging an active issue
- During multi-file refactoring

### Subagents protect your context

Use subagents (Task tool) for exploration instead of reading many files in your main session. The subagent reads 20 files but only returns a summary — your main context stays clean.

---

## MCP Server Management

Each enabled MCP server adds tool definitions to your context window. The README warns: **keep under 10 enabled per project**.

Tips:
- Run `/mcp` to see active servers and their context cost
- Prefer CLI tools when available (`gh` instead of GitHub MCP, `aws` instead of AWS MCP)
- Use `disabledMcpServers` in project config to disable servers per-project
- The `memory` MCP server is configured by default but not used by any skill, agent, or hook — consider disabling it

---

## Agent Teams Cost Warning

[Agent Teams](https://code.gemini.com/docs/en/agent-teams) (experimental) spawns multiple independent context windows. Each teammate consumes tokens separately.

- Only use for tasks where parallelism adds clear value (multi-module work, parallel reviews)
- For simple sequential tasks, subagents (Task tool) are more token-efficient
- Enable with: `GEMINI_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in settings

---

## Future: configure-ecc Integration

The `configure-ecc` install wizard could offer to set these environment variables during setup, with explanations of the cost tradeoffs. This would help new users optimize from day one rather than discovering these settings after hitting limits.

---

## Quick Reference

```bash
# Daily workflow
/model gemini-3-flash    # Start here
/model gemini-3-pro      # Only for complex reasoning
/clear                     # Between unrelated tasks
/compact                   # At logical breakpoints
/cost                      # Check spending

# Environment variables (add to ~/.gemini/settings.json "env" block)
GEMINI_AUTOCOMPACT_PCT_OVERRIDE=70
GEMINI_CODE_SUBAGENT_MODEL=gemini-3-flash
```
