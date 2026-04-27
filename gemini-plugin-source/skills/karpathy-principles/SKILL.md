---
name: karpathy-principles
description: Core principles for high-quality, efficient AI engineering based on Andrej Karpathy's philosophy. Emphasizes thinking before coding, simplicity, surgical changes, and goal-driven execution.
origin: Karpathy/TwinEngine
---

# Karpathy First Principles

These principles are designed to mitigate common LLM coding pitfalls such as over-engineering, making assumptions, and "drive-by" refactoring.

## Core Principles

### 1. Think Before Coding
**"Stop. Think. Verify."**

Before writing a single line of code, you must explicitly state your understanding of the problem and your proposed approach.

- **Explicit Reasoning:** Outline the logic, potential edge cases, and architectural impact.
- **Surface Trade-offs:** If multiple solutions exist, explain why the chosen one is best.
- **Clarify Ambiguity:** If the request is unclear, ASK. Never guess.
- **Success Criteria:** Define exactly how we will know the task is finished and successful.

### 2. Simplicity First
**"Minimal Viable Code."**

The best code is the code you didn't have to write. Focus on the simplest possible solution that solves the immediate problem.

- **No Speculative Engineering:** Do not add "flexibility" for future use cases that haven't been requested.
- **Avoid Abstractions:** Prefer concrete, readable logic over complex patterns or wrappers unless they are already established in the codebase.
- **Minimize Dependencies:** Use existing tools and libraries before adding new ones.
- **Delete with Prejudice:** If a change makes old code redundant, remove it.

### 3. Surgical Changes
**"Code with Precision."**

Edits should be as narrow and focused as possible. Avoid "fixing" things that aren't broken or part of the task.

- **Targeted Edits:** Only modify the files and lines necessary to achieve the goal.
- **Match Existing Style:** Follow the local patterns, naming conventions, and formatting of the file you are editing.
- **No Drive-by Refactoring:** Do not clean up unrelated comments, fix unrelated lint errors, or "improve" code that is outside the scope of the current task.
- **Surgical Verification:** Verify only the changes you made, ensuring zero side effects on unrelated systems.

### 4. Goal-Driven Execution
**"Declarative over Imperative."**

Focus on the *outcome* (Success Criteria) rather than just the *steps*.

- **Success-First Framing:** Start by defining what "Done" looks like (e.g., "The user can search by email and see results in <100ms").
- **Empirical Verification:** Every change must be verified by a test or a verifiable side effect.
- **TDD Loop:** Define the test/verification, watch it fail, implement, watch it pass.
- **Finality via Evidence:** A task is not complete until you can prove it works through output (logs, test results, UI screenshots).

## When to Use

- **New Features:** Use "Simplicity First" to avoid over-complicating the initial implementation.
- **Bug Fixes:** Use "Surgical Changes" to ensure the fix doesn't introduce regressions.
- **Refactoring:** Use "Think Before Coding" to justify why the refactor is necessary and how success will be measured.
- **Planning:** Use "Goal-Driven Execution" to break down complex requests into verifiable milestones.

## Examples

### [FAIL] Over-Engineering (Violates Simplicity)
"I noticed you asked for a simple search, so I implemented a generic SearchProvider interface with support for Elasticsearch, Algolia, and Postgres, even though we only use Postgres."

### [SUCCESS] Minimal Code (Simplicity First)
"I implemented the search using a simple SQL `LIKE` query on the existing Postgres database. This satisfies the current requirement with zero new dependencies."

### [FAIL] Drive-by Refactoring (Violates Surgical Changes)
"While I was fixing the login bug, I also renamed 15 variables in the unrelated `Dashboard.tsx` file to be more descriptive and updated the copyright year in the header."

### [SUCCESS] Surgical Precision (Surgical Changes)
"I fixed the login bug by updating exactly two lines in `auth.service.ts`. I verified that the fix works and that no other part of the authentication flow was affected."

## Success Metrics

- **Zero Unrequested Changes:** No files or lines modified outside the scope of the task.
- **Minimal Token Usage:** Efficient implementation that avoids unnecessary code.
- **Empirical Proof:** All changes are backed by passing tests or clear evidence.
- **Architectural Alignment:** Changes feel native to the existing codebase.
