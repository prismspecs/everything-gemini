#!/bin/bash

# Define paths
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_DIR="$HOME/.gemini"
MODE="global"
PACK="all"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --local) MODE="local"; GEMINI_DIR="./.gemini"; shift ;;
        --core) PACK="core"; shift ;;
        --minimal) PACK="minimal"; shift ;;
        --python) PACK="python"; shift ;;
        --golang) PACK="golang"; shift ;;
        --node) PACK="node"; shift ;;
        --db) PACK="db"; shift ;;
        --security) PACK="security"; shift ;;
        --all) PACK="all"; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
done

# Use gemini-plugin-source/ as the source of truth
SRC_DIR="$REPO_DIR/gemini-plugin-source"

# Create target directories
mkdir -p "$GEMINI_DIR/commands"
mkdir -p "$GEMINI_DIR/rules"
mkdir -p "$GEMINI_DIR/agents"
mkdir -p "$GEMINI_DIR/skills"

# Record the source of truth for dynamic discovery
echo "$REPO_DIR" > "$HOME/.gemini/.twinengine_source"

echo "Installing in $MODE mode (Target: $GEMINI_DIR) with pack: $PACK"

# Function to create symlink
link_file() {
    local src=$1
    local dest=$2
    ln -snf "$src" "$dest"
}

echo "Creating links for commands..."
for cmd_file in "$SRC_DIR/commands"/*.toml.src; do
    if [ -f "$cmd_file" ]; then
        DEST_NAME=$(basename "$cmd_file" .src)
        DEST="$GEMINI_DIR/commands/$DEST_NAME"
        
        # Filtering logic for packs
        case $PACK in
            minimal)
                [[ "$DEST_NAME" =~ ^(planner|tdd|code-review|bootstrap|gemini-minimal|everything-helper|update-docs|configure-twinengine|commit)\.toml$ ]] || continue
                ;;
            core)
                [[ "$DEST_NAME" =~ ^(planner|tdd|code-review|build-fix|verify|bootstrap|gemini-minimal|security-scan|skill-stocktake|course-create|everything-helper|update-docs|configure-twinengine|commit)\.toml$ ]] || continue
                ;;
            python)
                [[ "$DEST_NAME" =~ ^(python|django)\-.*\.toml$ ]] || continue
                ;;
            golang)
                [[ "$DEST_NAME" =~ ^(go|golang)\-.*\.toml$ ]] || continue
                ;;
            node)
                [[ "$DEST_NAME" =~ ^(multi|setup-pm)\.toml$ ]] || continue
                ;;
            db)
                [[ "$DEST_NAME" =~ ^(postgres|clickhouse|database)\-.*\.toml$ ]] || continue
                ;;
            security)
                [[ "$DEST_NAME" =~ ^(security|agentshield|security-scan)\-.*\.toml$ ]] || continue
                ;;
        esac
        
        link_file "$cmd_file" "$DEST"
    fi
done

echo "Creating links for agents..."
for agent_file in "$SRC_DIR/agents"/*.md; do
    if [ -f "$agent_file" ]; then
        DEST_NAME=$(basename "$agent_file")
        DEST="$GEMINI_DIR/agents/$DEST_NAME"

        case $PACK in
            minimal)
                [[ "$DEST_NAME" =~ ^(planner|tdd-guide|code-reviewer|project-scouter|everything-helper|doc-updater)\.md$ ]] || continue
                ;;
            core)
                [[ "$DEST_NAME" =~ ^(planner|architect|tdd-guide|code-reviewer|project-scouter|security-reviewer|course-designer|everything-helper|doc-updater)\.md$ ]] || continue
                ;;
            python)
                [[ "$DEST_NAME" =~ ^(python-reviewer|planner|code-reviewer)\.md$ ]] || continue
                ;;
            golang)
                [[ "$DEST_NAME" =~ ^(go-reviewer|go-build-resolver|planner|code-reviewer)\.md$ ]] || continue
                ;;
            security)
                [[ "$DEST_NAME" =~ ^(security-reviewer|code-reviewer)\.md$ ]] || continue
                ;;
        esac

        link_file "$agent_file" "$DEST"
    fi
done

echo "Creating links for rules..."
for rule_dir in "$SRC_DIR/rules"/*; do
    if [ -d "$rule_dir" ]; then
        DEST_NAME=$(basename "$rule_dir")
        DEST="$GEMINI_DIR/rules/$DEST_NAME"

        case $PACK in
            minimal) [ "$DEST_NAME" == "common" ] || continue ;;
            core) [ "$DEST_NAME" == "common" ] || continue ;;
            python) [ "$DEST_NAME" == "python" ] || [ "$DEST_NAME" == "common" ] || continue ;;
            golang) [ "$DEST_NAME" == "golang" ] || [ "$DEST_NAME" == "common" ] || continue ;;
            node) [ "$DEST_NAME" == "typescript" ] || [ "$DEST_NAME" == "common" ] || continue ;;
            security) [ "$DEST_NAME" == "common" ] || continue ;;
        esac

        link_file "$rule_dir" "$DEST"
    fi
done

echo "Creating links for skills..."
for skill_dir in "$SRC_DIR/skills"/*; do
    if [ -d "$skill_dir" ]; then
        DEST_NAME=$(basename "$skill_dir")
        DEST="$GEMINI_DIR/skills/$DEST_NAME"

        case $PACK in
            minimal)
                [[ "$DEST_NAME" =~ ^(tdd-workflow|coding-standards)$ ]] || continue
                ;;
            core)
                [[ "$DEST_NAME" =~ ^(tdd-workflow|e2e-testing|eval-harness|verification-loop|strategic-compact|coding-standards|frontend-patterns)$ ]] || continue
                ;;
            python)
                [[ "$DEST_NAME" =~ ^(python-patterns|python-testing|django-patterns|django-security|django-tdd|django-verification)$ ]] || continue
                ;;
            golang)
                [[ "$DEST_NAME" =~ ^(golang-patterns|golang-testing)$ ]] || continue
                ;;
            security)
                [[ "$DEST_NAME" =~ ^(security-review|eval-harness)$ ]] || continue
                ;;
        esac

        link_file "$skill_dir" "$DEST"
    fi
done

# Always install management skills if installing globally
if [ "$MODE" == "global" ]; then
    link_file "$SRC_DIR/skills/skill-stocktake" "$GEMINI_DIR/skills/skill-stocktake"
fi

echo ""
echo "Installation complete!"
echo "You can now edit files in gemini-plugin-source/ and changes will reflect automatically."
