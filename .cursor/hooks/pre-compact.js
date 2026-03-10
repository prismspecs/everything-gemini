#!/usr/bin/env node
const { readStdin, runExistingHook, transformToGemini } = require('./adapter');
readStdin().then(raw => {
  const geminiInput = JSON.parse(raw || '{}');
  runExistingHook('pre-compact.js', transformToGemini(geminiInput));
  process.stdout.write(raw);
}).catch(() => process.exit(0));
