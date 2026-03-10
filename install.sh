#!/bin/bash

# Define paths
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_DIR="$HOME/.gemini"

# Create target directories
mkdir -p "$GEMINI_DIR/commands"
mkdir -p "$GEMINI_DIR/rules"

echo "Creating symlinks for commands..."
# Create symlinks for all toml files in commands/
for cmd_file in "$REPO_DIR/commands"/*.toml; do
    if [ -f "$cmd_file" ]; then
        ln -sf "$cmd_file" "$GEMINI_DIR/commands/$(basename "$cmd_file")"
    fi
done

echo "Creating symlinks for rules..."
# Create symlinks for rule directories
for rule_dir in "$REPO_DIR/rules"/*; do
    if [ -d "$rule_dir" ]; then
        ln -sFf "$rule_dir" "$GEMINI_DIR/rules/$(basename "$rule_dir")"
    fi
done

echo ""
echo "Installation complete!"
echo "Symlinks created successfully:"
echo "  - Commands: ~/.gemini/commands/"
echo "  - Rules:    ~/.gemini/rules/"
echo ""
echo "You can now update the repository and the changes will reflect automatically in your Gemini CLI."
