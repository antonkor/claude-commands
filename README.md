# Claude Code Commands & Configuration

This repository contains my personal Claude Code commands and configuration files that sync across machines.

## Commands

- `/journal` - Create intelligent journal entries with automatic section labeling

## Setup on New Machine

```bash
# Automated setup (recommended)
curl -sSL https://raw.githubusercontent.com/antonkor/claude-commands/master/setup-new-machine.sh | bash

# Or manual setup
git clone https://github.com/antonkor/claude-commands.git ~/.claude
chmod +x ~/.claude/*.sh
```

## Syncing Commands

```bash
# Push your changes
~/.claude/sync-push.sh

# Pull latest changes
~/.claude/sync-pull.sh
```

## Repository

🔗 **GitHub**: https://github.com/antonkor/claude-commands