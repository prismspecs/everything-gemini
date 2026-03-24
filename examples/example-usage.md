# Example Usage: Building a Bird Sighting Blockchain App

This guide demonstrates how to use the agents, commands, and skills in the **Everything Gemini Code (ECC)** harness to build a complete project from scratch.

## Project Idea
**The Bird Sighting App**: A website where bird watchers can upload photos and GPS coordinates of bird sightings, which are then minted as unique "Sighting NFTs" on the Polygon blockchain.

---

## Phase 1: Planning & Architecture
**Command:** `/planner "Create a bird sighting website with photo uploads, GPS coordinates, and NFT minting on Polygon."`

**Agent Invoked:** `planner` (with `architect` for deep reasoning)

### What the Agent Does:
1. **Analyzes Requirements**: Breaks the request into Frontend, Backend, and Smart Contract components.
2. **Identifies Risks**: Notes that storing high-res images on-chain is too expensive; suggests IPFS for storage and only storing the CID (hash) on Polygon.
3. **Generates Blueprint**: Creates a multi-phase implementation plan (e.g., `docs/bird-plan.md`).

---

## Phase 2: "Impeccable" Frontend Design
**Command:**
1. `/impeccable teach "Audience: Bird watchers and conservationists. Tone: Organic, scientific, and modern. Colors: Earthy greens (#2D5A27) and sky blues."`
2. `@impeccable-designer "Build the hero section and the sighting upload form. Use fluid typography and OKLCH colors. Avoid generic AI card layouts."`

**Agent Invoked:** `impeccable-designer`

### What the Agent Does:
1. **Sets Design Context**: Learns the brand personality so it doesn't produce "AI slop" (like overused Inter font or purple gradients).
2. **Implements UI**: Uses the `impeccable-frontend` skill to write React code with custom CSS, ensuring the site feels high-end and specifically built for "Birding."

---

## Phase 3: Test-Driven Development (TDD)
**Command:** `/tdd "Implement the minting function in 'lib/blockchain.ts'. It should take a sighting ID and an IPFS CID, and return a transaction hash."`

**Agent Invoked:** `tdd-guide`

### What the Agent Does:
1. **Writes Failing Test (Red)**: Creates a test that expects a transaction hash but currently fails.
2. **Implements Logic (Green)**: Writes the `ethers.js` code to call the smart contract.
3. **Refactors (Improve)**: Cleans up the code to be immutable and handles common Web3 errors (e.g., "User rejected transaction").

---

## Phase 4: Security Audit
**Command:** `/security-review "Audit the wallet connection logic and the environment variable handling for private keys."`

**Agent Invoked:** `security-reviewer`

### What the Agent Does:
1. **Scans for Secrets**: Ensures no private keys are hardcoded.
2. **Checks Boundaries**: Verifies that user input (like bird names or GPS coords) is sanitized before being sent to the smart contract to prevent injection attacks.

---

## Phase 5: Verification & Deployment
**Command:**
1. `/verify full`
2. `/commit "feat: add blockchain minting for bird sightings"`

**Workflow Invoked:** `commit` command

### What the Agent Does:
1. **Runs Health Check**: Ensures the whole app still builds and all 80%+ tests pass.
2. **Final Security Pass**: Scans for console logs or debuggers left in the code.
3. **Conventional Commit**: Stages all files and creates a professional commit message.
4. **Push**: Asks to push the code to the remote repository.

---

## Why Use This Workflow?
Instead of asking a single prompt to "build the app," you are **orchestrating a team of specialists**. The **Planner** manages the roadmap, the **Designer** ensures high-end UI, the **TDD Guide** guarantees reliability, and the **Security Reviewer** protects your users.

**The result is production-grade software that is unforgettable and secure.**
