# First Principles (Karpathy)

Standard principles for high-quality, efficient AI engineering based on the [karpathy-principles](../../skills/karpathy-principles/SKILL.md) skill.

## Core Mandates

1. **Think Before Coding**: State assumptions, trade-offs, and success criteria BEFORE editing.
2. **Simplicity First**: Implement the minimal code required. No speculative features.
3. **Surgical Changes**: Only modify what is strictly necessary. Match local style perfectly.
4. **Goal-Driven Execution**: Verify success empirically with tests or logs.

## Surgical Integrity Checklist

- [ ] Does this change modify files or lines outside the requested scope?
- [ ] Does the new code match the naming, indentation, and patterns of the surrounding file?
- [ ] Have I avoided "fixing" unrelated lint errors or comments?
- [ ] Can I justify every line added as strictly necessary for the goal?

## Simplicity Checklist

- [ ] Is there a simpler way to achieve this using existing codebase utilities?
- [ ] Have I avoided creating new abstractions (classes, interfaces, wrappers) that weren't requested?
- [ ] Did I resist the urge to add "future-proofing" or "flexibility"?
- [ ] Is the logic readable by a human without needing complex documentation?

## Verification Standards

- **Evidence-Based Finality**: Do not say "I have finished" until you provide proof (test results, CLI output, logs).
- **Regression Check**: Verify that your surgical changes did not break adjacent functionality.
- **Fail Early**: If success criteria cannot be met, stop and report immediately.

> **Note**: These principles take precedence over "standard" AI behavior which often trends toward over-explanation and over-engineering.
