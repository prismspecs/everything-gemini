#!/usr/bin/env node
const { readStdin, runExistingHook, transformToGemini } = require('./adapter');
readStdin().then(raw => {
  try {
    const input = JSON.parse(raw);
    const geminiInput = transformToGemini(input, {
      tool_input: { file_path: input.path || input.file || '' }
    });
    const geminiStr = JSON.stringify(geminiInput);

    // Run format, typecheck, and console.log warning sequentially
    runExistingHook('post-edit-format.js', geminiStr);
    runExistingHook('post-edit-typecheck.js', geminiStr);
    runExistingHook('post-edit-console-warn.js', geminiStr);
  } catch {}
  process.stdout.write(raw);
}).catch(() => process.exit(0));
