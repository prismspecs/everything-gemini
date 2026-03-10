#!/usr/bin/env node
const { readStdin, runExistingHook, transformToGemini, hookEnabled } = require('./adapter');
readStdin().then(raw => {
  const input = JSON.parse(raw || '{}');
  const geminiInput = transformToGemini(input);
  if (hookEnabled('session:end:marker', ['minimal', 'standard', 'strict'])) {
    runExistingHook('session-end-marker.js', geminiInput);
  }
  process.stdout.write(raw);
}).catch(() => process.exit(0));
