#!/bin/bash
# Push Claude commands to GitHub

cd ~/.claude

echo "Syncing Claude commands to GitHub..."

# Add any new or modified commands/agents
git add commands/ agents/ README.md CLAUDE.md .gitignore

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "No changes to sync."
else
    echo "Changes detected, committing..."
    git commit -m "Update Claude commands - $(date)"
    git push origin master
    echo "✅ Commands synced to GitHub successfully!"
fi