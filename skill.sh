#!/bin/bash

# Simple Skill Installer for Antigravity (skills.sh style)
# Usage: ./skill.sh <skill-name> [path-to-markdown]

if [ -z "$1" ]; then
    echo "Usage: ./skill.sh <skill-name> [path-to-markdown]"
    exit 1
fi

SKILL_NAME=$1
MD_FILE=$2
SKILLS_DIR="./skills"
TARGET_DIR="$SKILLS_DIR/$SKILL_NAME"

# Create directory
mkdir -p "$TARGET_DIR"

if [ -f "$MD_FILE" ]; then
    # Start with frontmatter if not already present
    if ! grep -q "---" "$MD_FILE"; then
        echo "---" > "$TARGET_DIR/SKILL.md"
        echo "name: $SKILL_NAME" >> "$TARGET_DIR/SKILL.md"
        echo "description: Auto-generated skill from $MD_FILE" >> "$TARGET_DIR/SKILL.md"
        echo "license: MIT" >> "$TARGET_DIR/SKILL.md"
        echo "metadata:" >> "$TARGET_DIR/SKILL.md"
        echo "  version: \"1.0.0\"" >> "$TARGET_DIR/SKILL.md"
        echo "  triggers: $SKILL_NAME" >> "$TARGET_DIR/SKILL.md"
        echo "---" >> "$TARGET_DIR/SKILL.md"
        echo "" >> "$TARGET_DIR/SKILL.md"
    fi
    cat "$MD_FILE" >> "$TARGET_DIR/SKILL.md"
else
    # Create template
    cat <<EOT > "$TARGET_DIR/SKILL.md"
---
name: $SKILL_NAME
description: Enter a short description here
license: MIT
metadata:
  version: "1.0.0"
  triggers: trigger1, trigger2
---

# $SKILL_NAME

## Role Definition
Define the role of the agent when this skill is active.

## When to Use This Skill
Describe scenarios where this skill applies.

## Reference Guide
List of references or sub-tasks.
EOT
fi

echo "✅ Skill '$SKILL_NAME' created successfully in $TARGET_DIR"
