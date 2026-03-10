#!/usr/bin/env node
const { readStdin, runExistingHook, transformToGemini, hookEnabled } = require('./adapter');
readStdin().then(raw => {
  const input = JSON.parse(raw || '{}');
  const geminiInput = transformToGemini(input);
  if (hookEnabled('session:start', ['minimal', 'standard', 'strict'])) {
    runExistingHook('session-start.js', geminiInput);
  }
  process.stdout.write(raw);
}).catch(() => process.exit(0));
