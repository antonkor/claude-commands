---
description: Setup Motion Plus MCP server on any Claude Code project. Portable skill for enabling Motion animation tools.
---

# Motion Plus MCP Setup (Portable)

Drop this skill into any project to enable Motion Studio MCP tools for premium animations.

## 1shot Prompt

```
Setup Motion Plus MCP [keywords: fresh-install/reconnect/troubleshoot] [scope: project/user/global]
```

## Quick Setup Commands

### Fresh Install (One-Time per Machine)

```bash
# 1. Get your token from https://plus.motion.dev/personal-token
# 2. Install globally via WSL (handles Windows URL escaping)
wsl bash -c 'npm install -g "https://api.motion.dev/registry.tgz?package=motion-studio-mcp&version=latest&token=YOUR_TOKEN_HERE"'
```

### Enable on New Project

Create `.mcp.json` in project root:

```json
{
  "mcpServers": {
    "motion": {
      "command": "wsl",
      "args": ["motion-studio-mcp"]
    }
  }
}
```

Then restart Claude Code in that project.

### Alternative: Add via CLI

```bash
claude mcp add-json motion '{"command":"wsl","args":["motion-studio-mcp"]}'
```

## Verification

```bash
claude mcp list
# Expected: motion: wsl motion-studio-mcp - ✓ Connected
```

## Available MCP Tools After Setup

- `mcp__motion__visualise-spring` - Generate spring animation curves
- `mcp__motion__visualise-cubic-bezier` - Generate easing curves
- `mcp__motion__search-motion-codex` - Search Motion patterns library

## Troubleshooting Keywords

| Issue | Command |
|-------|---------|
| `reconnect` | `claude mcp remove motion && claude mcp add-json motion '{"command":"wsl","args":["motion-studio-mcp"]}'` |
| `token-expired` | Get new token at https://plus.motion.dev/personal-token, reinstall |
| `wsl-not-running` | `wsl --status` then `wsl` to start |
| `not-found` | Reinstall globally: `wsl npm install -g ...` |

## Token Storage

Store token in `.env.local` (gitignored):

```
MOTION_PLUS_TOKEN=your-token-here
```

## Project Checklist

- [ ] `.mcp.json` exists with motion config
- [ ] `.claude/skills/motion-plus.md` has animation patterns (optional)
- [ ] Token stored in `.env.local` for reference
- [ ] Verified connection with `/mcp` command

## Integration with motion-plus Skill

This MCP setup skill enables the tools. Pair with the `motion-plus.md` patterns skill:
- MCP Setup = "how to connect"
- Motion Plus = "how to animate"
