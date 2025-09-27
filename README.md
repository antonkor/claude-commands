# Claude Code Commands & Configuration

This repository contains my personal Claude Code commands and configuration files that sync across machines.

## Commands

- `/journal` - Create intelligent journal entries with automatic section labeling

## Setup on New Machine

```bash
# Clone this repo to your Claude config directory
git clone <your-repo-url> ~/.claude-config
cd ~/.claude-config

# Create symlinks to actual Claude directory
ln -sf ~/.claude-config/commands ~/.claude/commands
ln -sf ~/.claude-config/settings.json ~/.claude/settings.json
```

## Updating Commands

```bash
cd ~/.claude
git add .
git commit -m "Update Claude commands"
git push
```