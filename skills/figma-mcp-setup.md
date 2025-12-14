# Figma MCP Setup for Claude Code (Windows)

Quick reference for setting up Figma MCP server on Windows machines.

## Option 1: Remote MCP (Recommended - Easiest)

No desktop app required. Connects directly to Figma's hosted endpoint.

```bash
claude mcp add figma --transport http https://mcp.figma.com/mcp
```

Then authenticate:
1. Run `/mcp` in Claude Code
2. Select `figma`
3. Click "Authenticate"
4. Allow access in browser
5. Confirm connection with `/mcp`

## Option 2: Desktop MCP (Local Server)

Requires Figma Desktop app running.

### Step 1: Enable in Figma Desktop
1. Open Figma Desktop app (update to latest version)
2. Open any design file
3. Press `Shift+D` to enter Dev Mode
4. In the inspect panel, click **"Enable desktop MCP server"**
5. Server runs at `http://127.0.0.1:3845/mcp`

### Step 2: Add to Claude Code
```bash
claude mcp add figma-desktop --transport http http://127.0.0.1:3845/mcp
```

## Troubleshooting

### Remove broken MCP config
```bash
claude mcp remove figma-desktop
```

### Check MCP status
```bash
claude mcp list
```

### Common Windows Issues
- **Don't use npx with `-y` flag** - Windows CMD misinterprets it as a claude flag
- **The `@anthropic-sdks/figma-desktop-mcp` package doesn't exist** - Use official Figma endpoints instead
- **Wrap npx commands in quotes** if you must use them: `cmd /c "npx ..."`

## Verify Connection

In Claude Code:
```
/mcp
```

Should show: `figma-desktop: http://127.0.0.1:3845/mcp (HTTP) - Connected`

## Available Tools After Setup

Once connected, Claude Code can:
- `get_design_context` - Pull variables, components, layout data from Figma
- `get_screenshot` - Capture visual screenshots of designs
- Generate code from selected Figma frames
- Extract design system tokens

## Pre-approved Permissions

Add these to your settings for auto-approval:
```json
"allow": [
  "mcp__figma-desktop__get_design_context",
  "mcp__figma-desktop__get_screenshot"
]
```

## Sources
- [Figma Desktop Server Docs](https://developers.figma.com/docs/figma-mcp-server/local-server-installation/)
- [Figma MCP Server Guide](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server)
- [Claude Code + Figma Setup](https://www.builder.io/blog/claude-code-figma-mcp-server)
