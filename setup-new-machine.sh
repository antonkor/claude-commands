#!/bin/bash
# Set up Claude commands on a new machine

echo "Setting up Claude commands on new machine..."

# Backup existing .claude directory if it exists
if [ -d ~/.claude ]; then
    echo "Backing up existing .claude directory..."
    mv ~/.claude ~/.claude.backup.$(date +%Y%m%d_%H%M%S)
fi

# Clone the repository
git clone https://github.com/antonkor/claude-commands.git ~/.claude

# Make sync scripts executable
chmod +x ~/.claude/sync-*.sh

echo "✅ Claude commands setup complete!"
echo ""
echo "Available commands:"
echo "  ~/.claude/sync-push.sh  - Push your changes to GitHub"
echo "  ~/.claude/sync-pull.sh  - Pull latest changes from GitHub"
echo ""
echo "Your /journal command is now ready to use!"