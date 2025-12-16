# Claude Code Skill Library Architecture

A portable skill system for solo devs to drop capabilities into any project.

## Directory Structure

```
C:\Users\anton\.claude\
├── CLAUDE.md                    # Global user instructions
├── skill-architecture.md        # This file (how skills work)
├── global_skills/               # Portable skills (user-level)
│   ├── motion-plus-mcp.md       # MCP setup procedures
│   ├── figma-mcp-setup.md       # Figma MCP setup
│   ├── session-log.md           # Journal/logging workflow
│   ├── tech-stack-audit.md      # Audit project tech
│   ├── design-director.md       # Design guidance
│   └── model-selector.md        # Claude model guidance
├── skills/                      # User-level reference skills
│   └── figma-mcp-setup.md
├── 1shots/                      # Ready-to-paste prompts
│   └── motion-plus-mcp.md       # Motion MCP prompts
├── commands/                    # Global slash commands
│   ├── commit.md
│   ├── log.md
│   └── journal.md
└── agents/                      # Custom agent configs
    └── content-curator.md

<project>/.claude/
├── skills/                      # Project-specific skills
│   ├── motion-plus.md           # Animation patterns (usage)
│   ├── convex-guardian.md       # Convex patterns
│   └── frontend-design.md       # UI patterns
├── commands/                    # Project slash commands
└── settings.json
```

## Skill Categories

### 1. Setup Skills (User-Level → global_skills/)
**Purpose:** How to install/configure tools across projects

| Skill | File | When to Use |
|-------|------|-------------|
| Motion Plus MCP | `motion-plus-mcp.md` | Enable animation tools |
| Figma MCP | `figma-mcp-setup.md` | Enable design extraction |

**Characteristics:**
- Machine/account configuration
- Token management
- CLI commands for setup
- Portable to any project

### 2. Usage Skills (Project-Level → .claude/skills/)
**Purpose:** How to use tools within a specific project context

| Skill | File | When to Use |
|-------|------|-------------|
| Motion Plus Patterns | `motion-plus.md` | Write animations |
| Convex Guardian | `convex-guardian.md` | Database patterns |
| Frontend Design | `frontend-design.md` | UI components |

**Characteristics:**
- Project-specific conventions
- Code patterns and examples
- Integration with project structure

### 3. Workflow Skills (User-Level → global_skills/)
**Purpose:** Procedures that work across all projects

| Skill | File | When to Use |
|-------|------|-------------|
| Session Log | `session-log.md` | End of session journaling |
| Tech Stack Audit | `tech-stack-audit.md` | Evaluate project tech |
| Model Selector | `model-selector.md` | Choose Claude model |

## 1shot Prompt Convention

Format: `[keywords: option1/option2/option3]`

```
Action description [keywords: mode/variant] [scope: project/user/global]
```

### Keyword Types

| Type | Examples | Purpose |
|------|----------|---------|
| Mode | `fresh-install`, `reconnect`, `troubleshoot` | What operation |
| Scope | `project`, `user`, `global` | Where it applies |
| Variant | `minimal`, `full`, `verbose` | How much detail |
| Stack | `react`, `vue`, `vanilla` | Tech context |

### 1shot Library Location

```
~/.claude/1shots/
├── motion-plus-mcp.md    # MCP setup prompts
├── figma-mcp.md          # Figma prompts
├── project-init.md       # New project prompts
└── debug-workflow.md     # Debugging prompts
```

## Quick Reference: Adding Skills to New Project

### 1. MCP Setup (One Command)

```bash
# Create .mcp.json from template
echo '{"mcpServers":{"motion":{"command":"wsl","args":["motion-studio-mcp"]}}}' > .mcp.json
```

### 2. Copy Pattern Skills

```bash
# Copy motion patterns skill to new project
cp ~/.claude/templates/motion-plus.md .claude/skills/
```

### 3. Verify

```bash
claude mcp list
# Should show motion connected
```

## Decision Matrix: User vs Project Skills

| Question | User-Level | Project-Level |
|----------|------------|---------------|
| Reusable across all projects? | ✓ | |
| Depends on project structure? | | ✓ |
| Contains auth/tokens? | ✓ | |
| Has project-specific patterns? | | ✓ |
| Is a setup procedure? | ✓ | |
| Is a usage guide? | | ✓ |

## MCP Configuration Layers

```
1. Global (Claude Desktop)     # ~/.config/claude/claude_desktop_config.json
   └── Default for all Claude

2. User (Claude Code)          # ~/.claude/settings.json
   └── Default for CLI

3. Project                     # <project>/.mcp.json
   └── Per-project overrides
```

Project `.mcp.json` takes precedence for Claude Code projects.

## Maintenance

### Adding New Skill

1. Determine scope (user vs project)
2. Create skill file in appropriate location
3. Add 1shot prompts to `~/.claude/1shots/`
4. Update this architecture doc if needed

### Updating Skills Across Projects

User-level skills update once, apply everywhere.
Project-level skills need manual updates per project.
