# /todo - Advanced Todo Management

Advanced todo list management with project organization, priority levels, and time tracking.

## Usage
```
/todo [action] [options]
```

## Actions

### List todos
```
/todo
/todo list
/todo list --proj ps-lang
/todo list --prio high
/todo list --status pending
```

### Add todo
```
/todo add "Implement user authentication"
/todo add "Fix deployment errors" --prio high --proj ps-lang
/todo add "Write documentation" --due tomorrow --estimate 2h
```

### Update todo
```
/todo update 1 --status in_progress
/todo update 2 --prio medium
/todo update 3 --estimate 4h
```

### Complete todo
```
/todo done 1
/todo complete 2
```

### Delete todo
```
/todo delete 1
/todo remove 2
```

### Project management
```
/todo project ps-lang
/todo project create "new-feature"
/todo project list
```

## Options

- `--project <name>` or `--proj <name>` - Assign to project
- `--priority <high|medium|low>` or `--prio <high|medium|low>` - Set priority level
- `--status <pending|in_progress|completed|blocked>` - Set status
- `--due <date>` - Set due date (today, tomorrow, 2025-01-20)
- `--estimate <time>` - Time estimate (1h, 30m, 2d)
- `--tags <tag1,tag2>` - Add tags
- `--assignee <name>` - Assign to person

## File Structure

Todos are stored in `/todos/` directory:
```
/todos/
├── active.json          # Current todos
├── completed.json       # Completed todos
├── projects/
│   ├── ps-lang.json    # Project-specific todos
│   └── general.json    # General todos
└── archive/
    └── 2025-01.json    # Monthly archives
```

## Todo Schema

```json
{
  "id": "unique-id",
  "title": "Todo title",
  "description": "Optional description",
  "status": "pending|in_progress|completed|blocked",
  "priority": "high|medium|low",
  "project": "project-name",
  "tags": ["tag1", "tag2"],
  "assignee": "person-name",
  "estimate": "2h",
  "actualTime": "1.5h",
  "dueDate": "2025-01-20",
  "createdAt": "2025-01-20T10:00:00Z",
  "updatedAt": "2025-01-20T10:00:00Z",
  "completedAt": "2025-01-20T12:00:00Z"
}
```

## Features

### Priority Levels
- **High**: 🔴 Urgent tasks requiring immediate attention
- **Medium**: 🟡 Important tasks to complete soon
- **Low**: 🟢 Nice-to-have tasks when time permits

### Status Tracking
- **Pending**: ⏳ Not started
- **In Progress**: 🔄 Currently working on
- **Completed**: ✅ Finished
- **Blocked**: 🚫 Waiting on dependencies

### Time Tracking
- Estimates vs actual time
- Productivity metrics
- Project velocity calculations

### Project Organization
- Group todos by project
- Project-specific views
- Cross-project dependencies

## Integration

### With TodoWrite Tool
The slash command integrates with the existing TodoWrite tool:
```
/todo sync    # Sync with TodoWrite tool
/todo export  # Export to TodoWrite format
/todo import  # Import from TodoWrite
```

### With Git Commits
```
/todo commit 1  # Mark todo as done and create git commit
/todo branch 2  # Create git branch for todo
```

### With Time Tracking
```
/todo start 1   # Start time tracking
/todo stop 1    # Stop time tracking
/todo log 1 2h  # Log time manually
```

## Analytics

### Productivity Metrics
- Completion rate by project
- Average time per todo
- Priority distribution
- Velocity trends

### Reports
```
/todo report daily
/todo report weekly --proj ps-lang
/todo report productivity
```

## Examples

### Daily Workflow
```bash
# Morning standup
/todo list --status in_progress
/todo list --prio high --due today

# Add new tasks
/todo add "Fix React version conflicts" --proj ps-lang --prio high
/todo add "Update documentation" --proj ps-lang --estimate 1h

# Work on tasks
/todo start 1
/todo update 1 --status in_progress
# ... work ...
/todo stop 1
/todo done 1

# End of day review
/todo report daily
/todo list --status completed --date today
```

### Project Setup
```bash
# Create new project
/todo project create "mobile-app"

# Add project todos
/todo add "Setup React Native" --proj mobile-app --prio high
/todo add "Design wireframes" --proj mobile-app --estimate 4h
/todo add "API integration" --proj mobile-app --tags backend,api

# View project status
/todo project mobile-app
```

## Advanced Features

### Dependencies
```
/todo add "Deploy to production" --depends-on 1,2,3
/todo depends 4 on 5  # Add dependency
```

### Recurring Todos
```
/todo add "Weekly team sync" --recurring weekly
/todo add "Deploy updates" --recurring "every friday"
```

### Templates
```
/todo template create "feature-development" [
  "Write tests",
  "Implement feature",
  "Update documentation",
  "Code review"
]
/todo template use feature-development --proj ps-lang
```

## Smart Defaults & Auto-Complete

The command includes intelligent defaults when parameters are missing:

### Auto-Detection Logic
```bash
# If no --proj specified, auto-detect from current directory
/todo add "Fix navigation bug"
# → Automatically assigns --proj ps-lang (detected from git repo)

# If no --prio specified, infer from keywords
/todo add "URGENT: Fix production error"
# → Automatically assigns --prio high (detected "URGENT")

/todo add "Maybe refactor later"
# → Automatically assigns --prio low (detected "maybe", "later")

# If no --estimate specified, suggest based on keywords
/todo add "Write unit tests"
# → Prompts: "Detected testing task. Suggested estimate: 2h. Accept? (y/n)"

# If no --due specified for urgent tasks
/todo add "Fix critical bug" --prio high
# → Prompts: "High priority task detected. Set due date? (today/tomorrow/custom/skip)"
```

### Smart Keyword Detection
- **Priority detection:** "urgent", "critical", "asap" → high priority
- **Priority detection:** "maybe", "nice-to-have", "later" → low priority
- **Project detection:** Scans current git repo name, package.json, or working directory
- **Estimate detection:** "quick", "small" → 30m; "complex", "refactor" → 4h+
- **Due date detection:** "today", "tomorrow", "this week" → auto-converts to dates

### Interactive Prompts
When critical information is missing, the command will prompt:
```bash
/todo add "Important feature"

# Interactive prompt appears:
┌─ Missing Information ─┐
│ Project: ps-lang ✓    │
│ Priority: ? [h/m/l]   │
│ Estimate: ? [skip]    │
│ Due date: ? [skip]    │
└───────────────────────┘
> Priority (h/m/l): h
> Estimate (e.g., 2h): 3h
> Due date (skip): tomorrow

✅ Todo added: "Important feature" --proj ps-lang --prio high --estimate 3h --due tomorrow
```

This slash command provides comprehensive todo management while integrating with your existing workflow and maintaining compatibility with the TodoWrite tool.

## 💡 Dynamic Pro Tips

**Tips are contextually generated based on your current command usage and workflow patterns.**

### Smart Tip Generation Logic
The command analyzes your usage patterns and suggests relevant improvements:

#### Based on Command Frequency
```bash
# If you use /todo add frequently without estimates
→ Tip: "Enable auto-estimation by adding common task patterns to your profile"

# If you have many high-priority todos
→ Tip: "Consider using /todo template for recurring urgent workflows"

# If you rarely use --proj parameter
→ Tip: "Set default project in settings: /todo config default-project ps-lang"
```

#### Based on Project Context
```bash
# In a Next.js project (detected from package.json)
→ Tip: "Add template for Next.js development: /todo template create nextjs-feature"

# In a documentation project
→ Tip: "Link todos to specific docs sections with --docs parameter"

# Near deployment time (detected from git tags/branches)
→ Tip: "Create deployment checklist: /todo checklist deploy"
```

#### Based on Time Patterns
```bash
# During morning hours
→ Tip: "Set daily standup todos: /todo recurring daily-standup"

# During EOD (end of day)
→ Tip: "Archive completed todos automatically: /todo config auto-archive true"

# During weekend
→ Tip: "Separate work/personal todos: /todo workspace create personal"
```

#### Based on Workflow Integration
```bash
# If using git frequently
→ Tip: "Auto-create branch from todo: /todo branch 3 creates feature/todo-3-description"

# If using multiple projects
→ Tip: "Cross-project dependencies: /todo add 'Deploy' --depends-on project1:5,project2:8"

# If using time tracking
→ Tip: "Set productivity goals: /todo goal daily-hours 6"
```

#### Contextual Command Suggestions
The tips adapt to your current development session and detected patterns:

- **During debugging sessions** → Suggests bug tracking templates
- **During feature development** → Suggests feature branch workflow
- **During code reviews** → Suggests review checklist templates
- **During deployment** → Suggests deployment verification todos
- **During refactoring** → Suggests technical debt tracking