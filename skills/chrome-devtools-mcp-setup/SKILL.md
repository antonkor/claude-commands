---
name: chrome-devtools-mcp-setup
description: Complete Chrome DevTools MCP server setup for browser automation, debugging, and testing. Installs chrome-devtools-mcp with 26 tools for input automation, navigation, performance analysis, network inspection, and emulation.
---

# Chrome DevTools MCP Setup Skill

Automates the complete setup of Chrome DevTools MCP server for browser automation, debugging, and testing in any project.

## What This Does

1. **Chrome DevTools MCP Server** - Adds 26 browser automation tools to Claude Code
2. **WSL Configuration** - Sets up reliable Windows configuration using WSL
3. **Global Availability** - Configures once, available in all projects

## Prerequisites

- Claude Code installed
- **Windows:** WSL installed and configured
- **Mac/Linux:** Node.js/npm installed
- Chrome browser installed (any channel: stable, canary, beta, dev)

## Installation Steps

### Step 1: Check if Already Installed

```bash
# Check current MCP status
claude mcp list

# Should show either not installed or connection status
```

### Step 2: Install Chrome DevTools MCP

**Windows with WSL (Recommended):**
```bash
# Install chrome-devtools-mcp globally in WSL
wsl npm install -g chrome-devtools-mcp@latest

# Verify installation
wsl which chrome-devtools-mcp
# Should output: /usr/bin/chrome-devtools-mcp

# Add to Claude Code MCP configuration
claude mcp add-json chrome-devtools '{"command": "wsl", "args": ["chrome-devtools-mcp"]}'

# Move to global config by editing C:\Users\<username>\.claude.json
# Copy the "chrome-devtools" entry from project mcpServers to global mcpServers section
```

**Mac/Linux:**
```bash
# Install globally
npm install -g chrome-devtools-mcp@latest

# Add to Claude Code
claude mcp add chrome-devtools npx chrome-devtools-mcp@latest

# Or use the direct path
claude mcp add chrome-devtools chrome-devtools-mcp
```

### Step 3: Verify Connection

```bash
# Restart Claude Code
exit
claude

# Check connection status
claude mcp list

# Should show:
# chrome-devtools: wsl chrome-devtools-mcp - ✓ Connected
```

## Configuration Options

Chrome DevTools MCP supports various runtime options:

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "wsl",
      "args": [
        "chrome-devtools-mcp",
        "--headless",           // Run without UI
        "--isolated",           // Use temporary profile
        "--channel=canary",     // Use Chrome Canary
        "--autoConnect"         // Auto-connect to running Chrome (145+)
      ]
    }
  }
}
```

### Available Options
- `--browser-url <url>` - Connect to existing Chrome instance at debugging URL
- `--headless` - Run without user interface
- `--isolated` - Use temporary profile (auto-clears after closing)
- `--channel <name>` - Specify Chrome version: stable, canary, beta, dev
- `--executable-path <path>` - Point to custom Chrome installation
- `--autoConnect` - Auto-connect to running Chrome (requires Chrome 145+)
- `--user-data-dir <path>` - Specify Chrome profile directory

## Available Tools (26 Total)

### Input Automation (8 tools)
- `click` - Click elements
- `drag` - Drag and drop
- `fill` - Fill form fields
- `fill_form` - Fill entire forms
- `handle_dialog` - Handle alerts/confirms/prompts
- `hover` - Hover over elements
- `press_key` - Simulate keyboard input
- `upload_file` - Upload files to input fields

### Navigation (6 tools)
- Manage pages
- Navigate URLs
- Wait for conditions
- Select active page
- Reload pages (with optional cache bypass)
- Page lifecycle management

### Performance (3 tools)
- Record performance traces
- Analyze performance metrics
- Optimization insights

### Network Analysis (2 tools)
- `list_network_requests` - Inspect network activity
- Retrieve request/response details
- Reference selected requests from Network panel

### Debugging (5 tools)
- `execute_script` - Run JavaScript in page context
- `take_screenshot` - Capture page screenshots
- `list_console_messages` - Examine console output (includes Issues panel)
- Take accessibility tree snapshots
- Save snapshots to disk

### Emulation (2 tools)
- Simulate different devices
- Resize viewports
- Mobile/tablet emulation

## Chrome 143+ Enhancements

### Element and Network Selection
When prompting in Claude Code, you can reference:
- Elements selected in the Elements panel
- Network requests selected in the Network panel

### Enhanced Console Insights
The `list_console_messages` tool now includes:
- Console messages
- Issues from the Issues panel

### Keyboard Event Debugging
The `press_key` tool enables debugging of keyboard interactions outside form elements.

## Usage Examples

### Basic Browser Automation
```
"Open https://example.com and take a screenshot"
"Click the login button and fill the form with test credentials"
"Navigate to the pricing page and extract all prices"
```

### Performance Testing
```
"Record a performance trace of the homepage load"
"Analyze the performance metrics and suggest optimizations"
```

### Network Debugging
```
"List all API requests made when loading the dashboard"
"Show me the failed network requests"
```

### Console Debugging
```
"Show me all console errors and warnings"
"List all issues from the Issues panel"
```

### Mobile Testing
```
"Emulate iPhone 12 and test the mobile navigation"
"Resize viewport to 375x667 and take a screenshot"
```

## Verification

### 1. Check MCP Connection
```bash
claude mcp list

# Expected output:
# chrome-devtools: wsl chrome-devtools-mcp - ✓ Connected
```

### 2. Test Basic Functionality
In Claude Code, try:
```
"Open https://example.com and take a screenshot"
```

Claude should use the chrome-devtools MCP tools to automate this.

## Troubleshooting

### "Failed to connect" on Windows
- Verify WSL is running: `wsl echo "WSL is working"`
- Check installation: `wsl which chrome-devtools-mcp`
- Reinstall if needed: `wsl npm install -g chrome-devtools-mcp@latest`
- Verify config in `C:\Users\<username>\.claude.json`:
  ```json
  "mcpServers": {
    "chrome-devtools": {
      "command": "wsl",
      "args": ["chrome-devtools-mcp"]
    }
  }
  ```

### Chrome not launching
- Check Chrome is installed: `chrome://version/`
- Specify Chrome path: `--executable-path=/path/to/chrome`
- Try different channel: `--channel=stable`

### "Cannot find Chrome" on Linux
- Install Chrome/Chromium
- Set executable path in args: `["chrome-devtools-mcp", "--executable-path=/usr/bin/chromium"]`

### MCP tools not available in Claude
- Restart Claude Code: `exit` then `claude`
- Check global config placement (not project-level)
- Run `/doctor` to diagnose issues

### Permission errors
- Ensure Chrome can create profile directory
- Use `--user-data-dir` to specify custom location
- Try `--isolated` for temporary profiles

## Project Structure After Setup

```
C:\Users\<username>\.claude.json
  └── mcpServers (global level)
      ├── motion (if installed)
      └── chrome-devtools
          ├── command: "wsl"
          └── args: ["chrome-devtools-mcp"]
```

No project-level configuration needed - available globally!

## When to Use This Skill

- Setting up a new development machine
- Adding browser automation to any project
- E2E testing and debugging workflows
- Performance analysis and optimization
- Visual regression testing
- Scraping and data extraction
- Mobile/responsive testing
- Accessibility testing

## Best Practices

### 1. Use Isolated Mode for Testing
```json
"args": ["chrome-devtools-mcp", "--isolated"]
```
Ensures clean state for each test run.

### 2. Headless for CI/CD
```json
"args": ["chrome-devtools-mcp", "--headless"]
```
Faster execution in automated pipelines.

### 3. Specific Chrome Version
```json
"args": ["chrome-devtools-mcp", "--channel=canary"]
```
Test with latest features or specific Chrome versions.

### 4. Connect to Existing Browser
```json
"args": ["chrome-devtools-mcp", "--autoConnect"]
```
Debug existing sessions without launching new browser.

## Related Resources

- [Chrome DevTools MCP GitHub](https://github.com/ChromeDevTools/chrome-devtools-mcp)
- [Chrome DevTools Protocol](https://chromedevtools.github.io/devtools-protocol/)
- [Chrome 143 Release Notes](https://developer.chrome.com/blog/new-in-devtools-143/)
- [MCP Documentation](https://code.claude.com/docs/en/mcp)

## Advanced Configuration

### Multiple Profiles
You can configure multiple DevTools MCP instances with different settings:

```json
"mcpServers": {
  "chrome-devtools": {
    "command": "wsl",
    "args": ["chrome-devtools-mcp"]
  },
  "chrome-headless": {
    "command": "wsl",
    "args": ["chrome-devtools-mcp", "--headless", "--isolated"]
  },
  "chrome-mobile": {
    "command": "wsl",
    "args": ["chrome-devtools-mcp", "--isolated"]
  }
}
```

### Connect to Remote Chrome
```json
"args": [
  "chrome-devtools-mcp",
  "--browser-url=http://remote-machine:9222"
]
```

## Security Considerations

- **Isolated mode** prevents persistence of browsing data
- **Custom profiles** keep test data separate from personal browsing
- **Headless mode** reduces attack surface in automated environments
- Always validate user input when automating forms
- Use `--user-data-dir` for controlled profile locations

## Performance Tips

1. **Reuse browser instances** - Use `--autoConnect` instead of launching new browsers
2. **Disable unnecessary features** - Use headless mode when UI isn't needed
3. **Clean profiles** - Use `--isolated` to prevent profile bloat
4. **Selective network recording** - Only record when analyzing performance

## Integration with Testing Frameworks

Chrome DevTools MCP works alongside:
- Playwright (use for complex scenarios)
- Puppeteer (use for programmatic control)
- Selenium (use for cross-browser testing)
- Cypress (use for E2E testing)

Use DevTools MCP for:
- Ad-hoc testing and debugging
- Quick automation tasks
- Performance profiling
- Console debugging
- Visual inspection

## Changelog Notes

### v0.11.0 (Chrome 143)
- Element and Network panel selection support
- Enhanced console messages with Issues panel
- New `press_key` tool for keyboard debugging
- Accessibility tree snapshot export
- Page reload with cache bypass
- Chrome profile configuration via `--user-data-dir`

## Examples

### Example 1: Visual Regression Testing
```
User: "Open staging.example.com and production example.com side by side, take screenshots of the homepage"
Claude: Uses chrome-devtools MCP to:
1. Launch Chrome with isolated profile
2. Open both URLs in separate tabs
3. Take screenshots of each
4. Present both images for comparison
```

### Example 2: Performance Audit
```
User: "Analyze the performance of our dashboard page"
Claude: Uses chrome-devtools MCP to:
1. Navigate to dashboard
2. Record performance trace
3. Analyze metrics (LCP, FID, CLS)
4. Identify bottlenecks
5. Provide optimization recommendations
```

### Example 3: Network Debugging
```
User: "Why is the API call failing on the login page?"
Claude: Uses chrome-devtools MCP to:
1. Open login page
2. Monitor network requests
3. List failed requests
4. Show request/response details
5. Identify CORS or authentication issues
```

### Example 4: Mobile Testing
```
User: "Test the checkout flow on iPhone 12"
Claude: Uses chrome-devtools MCP to:
1. Launch Chrome with device emulation
2. Set viewport to iPhone 12 dimensions
3. Navigate through checkout steps
4. Take screenshots at each step
5. Report any layout or interaction issues
```

## Notes

- **Global installation** - Once installed, available in all projects
- **WSL recommended for Windows** - More reliable than cmd /c npx approach
- **26 powerful tools** - Covers input, navigation, performance, network, debugging, and emulation
- **Chrome 143+ features** - Element/network selection, enhanced console, keyboard debugging
- **Multiple configuration options** - Customize for different use cases (headless, isolated, channels)
- **No project-level setup needed** - Global configuration works everywhere

---
**Status:** Production Ready - Tested on Windows with WSL
**Version:** chrome-devtools-mcp@latest (v0.11.0+)
**Last Updated:** December 16, 2025
