/**
 * Everything Gemini Code (ECC) Plugins for OpenCode
 *
 * This module exports all ECC plugins for OpenCode integration.
 * Plugins provide hook-based automation that mirrors Gemini Code's hook system
 * while taking advantage of OpenCode's more sophisticated 20+ event types.
 */

export { ECCHooksPlugin, default } from "./ecc-hooks.js"

// Re-export for named imports
export * from "./ecc-hooks.js"
