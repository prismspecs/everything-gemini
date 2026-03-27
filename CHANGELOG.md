# Changelog

## 1.9.1 - 2026-03-26

### Architecture

- **The NUCLEAR Conflict Fix**: Completely removed the `.gemini/` folder from the repository root.
- All source files are now in **`gemini-plugin-source/`**.
- Because Gemini CLI (v0.35.1) scans any folder named `.gemini/` for Workspace commands, the only way to prevent it from finding these files twice (once in the repo and once in your user-global tier) was to remove the `.gemini/` trigger folder entirely.
- This results in a guaranteed **single-tier load** from the User Tier (`~/.gemini/commands/`).
- **This definitively eliminates all "Conflicts detected" warnings and prefix-renaming.**

### Core

- Updated `install.sh` to link from `gemini-plugin-source/`.
- Commands in the repo are named `.toml.src` to avoid accidental discovery by other tools.

## 1.9.0 - 2026-03-23

### Core

- Renamed `commands/plan.toml` to `commands/planner.toml` to avoid conflict with the built-in `/plan` command.
- Removed 16 redundant `.toml` files in `commands/` that were duplicates of skills in `.agents/skills/`.
- Removed 58 empty directories from the `skills/` folder.

### Documentation

- Updated `README.md`, `GEMINI.md`, and all `examples/*.md` files to use `/planner` instead of `/plan`.

### Infrastructure

- Cleaned up broken symlinks in `~/.gemini/commands/`.
- Refreshed symlinks by running `install.sh`.

## 1.8.0 - 2026-03-04

### Highlights

- Harness-first release focused on reliability, eval discipline, and autonomous loop operations.
- Hook runtime now supports profile-based control and targeted hook disabling.
- NanoClaw v2 adds model routing, skill hot-load, branching, search, compaction, export, and metrics.

### Core

- Added new commands: `/harness-audit`, `/loop-start`, `/loop-status`, `/quality-gate`, `/model-route`.
- Added new skills:
  - `agent-harness-construction`
  - `agentic-engineering`
  - `ralphinho-rfc-pipeline`
  - `ai-first-engineering`
  - `enterprise-agent-ops`
  - `nanoclaw-repl`
  - `continuous-agent-loop`
- Added new agents:
  - `harness-optimizer`
  - `loop-operator`

### Hook Reliability

- Fixed SessionStart root resolution with robust fallback search.
- Moved session summary persistence to `Stop` where transcript payload is available.
- Added quality-gate and cost-tracker hooks.
- Replaced fragile inline hook one-liners with dedicated script files.
- Added `ECC_HOOK_PROFILE` and `ECC_DISABLED_HOOKS` controls.

### Cross-Platform

- Improved Windows-safe path handling in doc warning logic.
- Hardened observer loop behavior to avoid non-interactive hangs.

### Notes

- `autonomous-loops` is kept as a compatibility alias for one release; `continuous-agent-loop` is the canonical name.

### Credits

- inspired by [zarazhangrui](https://github.com/zarazhangrui)
- homunculus-inspired by [humanplane](https://github.com/humanplane)
