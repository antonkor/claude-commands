---
name: motion-full-setup
description: Complete Motion and Motion Plus setup for new projects. Installs Motion MCP server, motion/motion-plus packages, configures API token, and copies skill documentation. Use when starting a new project that needs Motion animations.
---

# Motion Full Setup Skill

Automates the complete setup of Motion (motion.dev) and Motion Plus for new Next.js/React projects.

## What This Does

1. **Motion MCP Server** - Adds documentation tools to Claude Code
2. **Motion Packages** - Installs `motion` and `motion-plus` npm packages
3. **API Token** - Copies your Motion Plus token to `.env.local`
4. **Skill Documentation** - Copies motion-plus patterns to project

## Prerequisites

- Claude Code installed
- Node.js/npm or bun installed
- Motion Plus token in your 1shot.chat project

## Installation Steps

### Step 1: Check/Install Motion MCP (User-Scope)

```bash
# Check if already installed
claude mcp list
```

**Windows with WSL (Recommended):**
```bash
# First, ensure motion-studio-mcp is installed in WSL
wsl which motion-studio-mcp

# If not found, install it in WSL first:
# wsl npm install -g motion-studio-mcp

# Add Motion MCP using WSL (most reliable on Windows)
claude mcp add-json motion '{"command": "wsl", "args": ["motion-studio-mcp"]}'

# Then manually edit C:\Users\<username>\.claude.json
# Move the "motion" config from any project-level "mcpServers" to the global "mcpServers" section
# The global section is near the bottom of the file, outside the "projects" object
```

**Mac/Linux:**
```bash
# Use npx directly
claude mcp add --scope user --transport stdio motion -- npx -y @modelcontextprotocol/server-motion
```

**Note:** User-scope means this will be available in ALL your projects automatically. You only need to do this once per machine.

**Windows Alternative (cmd /c method):**
If you don't have WSL, you can try the cmd method, but it requires manual config verification:
```bash
claude mcp add --scope user --transport stdio motion -- cmd /c npx -y @modelcontextprotocol/server-motion
```
After installation, verify `C:\Users\<username>\.claude.json` has `"/c"` not `"C:/"` in the args array. If incorrect, manually edit and restart Claude Code.

### Step 2: Install Motion Packages

```bash
# Using npm
npm install motion motion-plus

# Or using bun
bun add motion motion-plus
```

### Step 3: Configure Motion Plus Token

```bash
# Copy token from 1shot.chat project
$TOKEN = (Get-Content C:\vummo\1shot.chat\.env.local | Select-String "MOTION_PLUS_TOKEN").ToString().Split("=")[1]

# Add to current project's .env.local
Add-Content -Path .env.local -Value "`nMOTION_PLUS_TOKEN=$TOKEN"
```

**Your Motion Plus Token:**
```
MOTION_PLUS_TOKEN=1627a3eb7fd1432895eddc7b3a4613c594e8b06f88e4e2cba3914f14dbbb1b9a
```

### Step 4: Copy Motion Plus Skill Documentation

```bash
# Create skills directory if needed
New-Item -ItemType Directory -Force -Path .claude\skills\motion-plus

# Copy skill documentation
Copy-Item C:\vummo\1shot.chat\.claude\skills\motion-plus.md .claude\skills\motion-plus.md
```

## Verification

### 1. Check MCP Tools Available

```bash
# In Claude Code
/mcp
```

You should see:
- `mcp__motion__search-motion-codex`
- `mcp__motion__visualise-spring`
- `mcp__motion__visualise-cubic-bezier`

### 2. Test Import in Code

```tsx
import { motion, AnimatePresence } from "motion/react"
import { Typewriter } from "motion-plus/react"

export default function TestComponent() {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      <Typewriter>Hello Motion Plus!</Typewriter>
    </motion.div>
  )
}
```

### 3. Verify Token Loaded

```bash
# Check .env.local contains token
Get-Content .env.local | Select-String "MOTION_PLUS_TOKEN"
```

## Quick Setup Command (Copy-Paste)

For new projects, run this single PowerShell command:

```powershell
# Complete Motion setup in one command
$TOKEN = (Get-Content C:\vummo\1shot.chat\.env.local | Select-String "MOTION_PLUS_TOKEN").ToString().Split("=")[1]; `
bun add motion motion-plus; `
Add-Content -Path .env.local -Value "`nMOTION_PLUS_TOKEN=$TOKEN"; `
New-Item -ItemType Directory -Force -Path .claude\skills\motion-plus; `
Copy-Item C:\vummo\1shot.chat\.claude\skills\motion-plus.md .claude\skills\motion-plus.md; `
Write-Host "Motion setup complete! Token: $TOKEN"
```

**Note:** Make sure Motion MCP is installed user-scope first (Step 1).

## Usage After Setup

### Using Motion MCP Tools

Ask Claude to generate animations:
```
"Create a stagger grid animation with spring physics"
"Visualize a spring with bounce: 0.4, stiffness: 300"
"Search Motion docs for scroll animations"
```

### Using Motion Plus Components

Import premium components directly:
```tsx
import { Typewriter } from "motion-plus/react"
import { Marquee } from "motion-plus/react"
```

See `.claude/skills/motion-plus.md` for all available patterns.

## Troubleshooting

### "Module not found: motion-plus"
- Run `npm install motion-plus` or `bun add motion-plus`
- Check package.json has motion-plus listed

### "Invalid Motion Plus token"
- Verify token in .env.local matches source project
- Check no extra spaces or quotes around token

### Motion MCP tools not showing
- Restart Claude Code: `exit` then `claude`
- Check user-scope MCP: `claude mcp list` (look for "Connected" status)
- **Windows users (WSL method - Recommended):** Check if `C:\Users\<username>\.claude.json` has the global config:
  ```json
  "mcpServers": {
    "motion": {
      "command": "wsl",
      "args": [
        "motion-studio-mcp"
      ]
    }
  }
  ```
  This should be at the **global level** (near the bottom of the file), NOT inside a project's "mcpServers".

- **Windows users (cmd method - Alternative):** If using cmd /c approach, check the config:
  ```json
  "mcpServers": {
    "motion": {
      "type": "stdio",
      "command": "cmd",
      "args": [
        "/c",  // ← Should be "/c", NOT "C:/"
        "npx",
        "-y",
        "@modelcontextprotocol/server-motion"
      ]
    }
  }
  ```
  If the args show `"C:/"` instead of `"/c"`, manually edit the file to fix it, save, and restart Claude Code.

### Skill not appearing in Claude
- Check file exists at `.claude/skills/motion-plus.md`
- Restart Claude Code to reload skills

## Project Structure After Setup

```
your-project/
├── .claude/
│   └── skills/
│       └── motion-plus.md          # Premium patterns reference
├── .env.local                       # Contains MOTION_PLUS_TOKEN
├── package.json                     # motion + motion-plus installed
└── node_modules/
    ├── motion/
    └── motion-plus/
```

## When to Use This Skill

- Starting a new Next.js/React project with animations
- Adding Motion to an existing project
- Setting up a design system with motion
- Building interactive landing pages
- Creating animated UI components

## Related Resources

- [Motion Documentation](https://motion.dev)
- [Motion Plus Portal](https://plus.motion.dev)
- [Claude Code MCP Docs](https://code.claude.com/docs/en/mcp.md)
- Motion Plus Skill: `.claude/skills/motion-plus.md`

## Examples

**Example 1: New Landing Page Project**
```
User: "I'm starting a new landing page project and need Motion setup"
Claude: "I'll set up Motion for you using the motion-full-setup skill:
1. Checking Motion MCP... [already installed user-scope ✓]
2. Installing motion packages... [running bun add]
3. Copying Motion Plus token to .env.local... [done ✓]
4. Copying motion-plus skill docs... [done ✓]

You're all set! You can now use Motion animations and premium components like Typewriter."
```

**Example 2: Existing Project Needs Animations**
```
User: "Add Motion to this project so I can animate the hero section"
Claude: "I'll use the motion-full-setup skill to add Motion:
[runs installation steps]
Now you have access to all Motion animations. Want me to create an animated hero section?"
```

## Notes

- **Motion MCP** is user-scope (once per machine) - all projects get it
- **Motion packages** are project-scope (per project) - need to install each time
- **Motion Plus token** is project-scope - needs to be in each project's .env.local
- **Motion Plus skill** can be user-scope OR project-scope depending on team needs
