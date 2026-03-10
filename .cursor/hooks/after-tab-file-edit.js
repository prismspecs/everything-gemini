#!/usr/bin/env node
const { readStdin, runExistingHook, transformToGemini } = require('./adapter');
readStdin().then(raw => {
  try {
    const input = JSON.parse(raw);
    const geminiInput = transformToGemini(input, {
      tool_input: { file_path: input.path || input.file || '' }
    });
    runExistingHook('post-edit-format.js', JSON.stringify(geminiInput));
  } catch {}
  process.stdout.write(raw);
}).catch(() => process.exit(0));
