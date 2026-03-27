#!/bin/bash

# Define paths
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_DIR="$HOME/.gemini"

# Use gemini-plugin-source/ as the source of truth
# This is NOT named .gemini/ to prevent Workspace-tier auto-discovery
SRC_DIR="$REPO_DIR/gemini-plugin-source"

# Create target directories
mkdir -p "$GEMINI_DIR/commands"
mkdir -p "$GEMINI_DIR/rules"
mkdir -p "$GEMINI_DIR/agents"
mkdir -p "$GEMINI_DIR/skills"

echo "Creating links for commands..."
# Create symlinks for all .toml.src files in gemini-plugin-source/commands/
# Mapping them back to .toml in the global tier
for cmd_file in "$SRC_DIR/commands"/*.toml.src; do
    if [ -f "$cmd_file" ]; then
        # Strip .src extension for the destination
        DEST_NAME=$(basename "$cmd_file" .src)
        DEST="$GEMINI_DIR/commands/$DEST_NAME"
        
        # We use symlinks so changes in the repo reflect globally immediately
        ln -sf "$cmd_file" "$DEST"
    fi
done

echo "Creating links for agents..."
# Create symlinks for all md files in gemini-plugin-source/agents/
for agent_file in "$SRC_DIR/agents"/*.md; do
    if [ -f "$agent_file" ]; then
        DEST="$GEMINI_DIR/agents/$(basename "$agent_file")"
        ln -sf "$agent_file" "$DEST"
    fi
done

echo "Creating links for rules..."
# Create symlinks for rule directories
for rule_dir in "$SRC_DIR/rules"/*; do
    if [ -d "$rule_dir" ]; then
        DEST="$GEMINI_DIR/rules/$(basename "$rule_dir")"
        ln -sFf "$rule_dir" "$DEST"
    fi
done

echo "Creating links for skills..."
# Create symlinks for skill directories
for skill_dir in "$SRC_DIR/skills"/*; do
    if [ -d "$skill_dir" ]; then
        DEST="$GEMINI_DIR/skills/$(basename "$skill_dir")"
        ln -sFf "$skill_dir" "$DEST"
    fi
done

echo ""
echo "Installation complete!"
echo "Links created successfully (from gemini-plugin-source/):"
echo "  - Commands: ~/.gemini/commands/ (mapped from .toml.src)"
echo "  - Agents:   ~/.gemini/agents/"
echo "  - Rules:    ~/.gemini/rules/"
echo "  - Skills:   ~/.gemini/skills/"
echo ""
echo "You can now edit files in gemini-plugin-source/ and changes will reflect automatically in your Gemini CLI."
echo "Conflicts are resolved by removing the .gemini/ directory from the repository root."
