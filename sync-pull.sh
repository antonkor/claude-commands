#!/bin/bash
# Pull latest Claude commands from GitHub

cd ~/.claude

echo "Pulling latest Claude commands from GitHub..."

# Pull latest changes
git pull origin master

echo "✅ Commands updated from GitHub!"

# Optional: restart Claude Code if running
# pkill -f "claude-code" 2>/dev/null && echo "Claude Code restarted to pick up new commands"