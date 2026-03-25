# Performance Optimization

## Model Selection Strategy

**Gemini 3 Flash** (Fastest, 95% of Pro capability for coding):
- Day-to-day coding, exploration, file reading, simple lookups
- Lightweight agents with frequent invocation
- Pair programming and code generation
- Worker agents in multi-agent systems

**Gemini 3 Pro** (Best reasoning and complex coding):
- Main architectural development work
- Orchestrating multi-agent workflows
- Complex coding tasks and deep reasoning
- Maximum reasoning requirements
- Research and analysis tasks

## Context Window Management

Gemini's 1M+ token context window is a massive advantage. However, for peak performance:

Avoid last 20% of context window for:
- Large-scale refactoring
- Feature implementation spanning multiple files
- Debugging complex interactions

Lower context sensitivity tasks:
- Single-file edits
- Independent utility creation
- Documentation updates
- Simple bug fixes

## Extended Thinking + Plan Mode

Extended thinking reserves tokens for internal reasoning, crucial for complex coding.

Control thinking via:
- **Toggle**: Option+T (macOS) / Alt+T (Windows/Linux)
- **Config**: Set `alwaysThinkingEnabled` in `~/.gemini/settings.json`
- **Budget cap**: `export MAX_THINKING_TOKENS=32000`
- **Verbose mode**: Ctrl+O to see thinking output

For complex tasks requiring deep reasoning:
1. Ensure extended thinking is enabled (on by default)
2. Enable **Plan Mode** for structured approach
3. Use multiple critique rounds for thorough analysis
4. Use split role sub-agents for diverse perspectives

## Build Troubleshooting

If build fails:
1. Use **build-error-resolver** agent
2. Analyze error messages
3. Fix incrementally
4. Verify after each fix
