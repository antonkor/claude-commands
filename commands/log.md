---
description: "Comprehensive commit workflow with automatic logging, dev estimates, and blog ideation"
---

# AI Engineer Session Log

**Unified logging system** that creates enriched session logs with AI engineering insights.

---

## Step 1: Detect Journal Location

Analyze the current working context to determine the appropriate journal folder:

```
Working Directory Analysis:
- If working primarily in a sub-project (e.g., teamvault/marketing-site, teamvault/plugin)
  → Save to: [sub-project]/journal/
- If working across a project (e.g., teamvault/)
  → Save to: [project]/journal/
- If working across multiple projects or root-level
  → Save to: [root]/journal/
```

**Detection Logic:**
1. Check which files were modified in this session
2. Find the common parent directory
3. Use that as the journal location

Run: `git status --porcelain` to see modified files and determine scope.

---

## Step 2: Gather Session Metadata

```bash
# Timestamps
powershell.exe -Command "Get-Date -Format 'MM-dd-yy-hh-mm-tt'"    # Filename
powershell.exe -Command "Get-Date -Format 'yyyy-MM-ddTHH:mm:ss'"  # ISO

# Git context
git rev-parse --short HEAD           # Session ID
git rev-parse --abbrev-ref HEAD      # Branch
git status --porcelain               # Changed files
git diff --stat HEAD | tail -1       # Lines changed
```

---

## Step 3: Generate Log File

**Location**: `[detected-path]/journal/MM-DD-YY-HH-MM-AM|PM-short-title.md`

**Short Title**: 3-5 words describing the main topic (lowercase, hyphenated)

---

## LOG TEMPLATE

```markdown
# 🚀 AI Engineer Session Log - [Date]

> **🌌 Signature**: `CLAUDE-LOG-YYYYMMDD-HHMMSS-XXXX`
> **Session**: `[git-hash-short]` | **Branch**: `[branch]`
> **Model**: claude-opus-4-5-20251101
> **Agent**: Claude Code (Anthropic)

---

## 📑 Navigation

1. [Executive Summary](#-executive-summary)
2. [AI Engineer Insights](#-ai-engineer-insights)
3. [Time to Value](#-time-to-value)
4. [Mind's Eye Review](#-minds-eye-review)
5. [Artifact Bubbles](#-artifact-bubbles)
6. [Chat Transcript](#-chat-transcript)
7. [Metadata](#-metadata)

---

## 🎯 Executive Summary

**Topic**: [1-sentence description]
**Goal**: [Primary objective]
**Outcome**: ✅ Complete | 🔄 In Progress | ❌ Blocked

### What Got Done
- ✅ [Outcome 1]
- ✅ [Outcome 2]

### Key Decisions
- [Decision]: [Rationale]

---

## 🧠 AI Engineer Insights

### Prompt Engineering Observations
| Prompt Style | Effectiveness | Notes |
|--------------|---------------|-------|
| [Style used] | ⭐⭐⭐⭐⭐ | [What worked] |
| [Style used] | ⭐⭐⭐ | [What could improve] |

**What Worked Well:**
- [Effective prompt pattern]

**Friction Points:**
- [Where agent struggled or needed clarification]

### Tool Usage Analysis
| Tool | Times Used | Effectiveness |
|------|------------|---------------|
| [Tool name] | N | ✅ Effective |
| [Tool name] | N | ⚠️ Had issues |

**Most Valuable Tool This Session**: [Tool] - [Why]

### Agent Behavior Assessment
- **Autonomy Level**: `Guided` | `Collaborative` | `Autonomous`
- **Creativity Score**: [1-5] - [Examples of creative solutions]
- **Accuracy**: [1-5] - [Any corrections needed?]
- **Proactivity**: [1-5] - [Did agent anticipate needs?]

---

## ⚡ Time to Value

### Quick Wins (< 5 min each)
- 🏆 [Win 1] - [Time saved estimate]
- 🏆 [Win 2] - [Time saved estimate]

### Dev Time Estimates
| Task | With AI | Without AI | Savings |
|------|---------|------------|---------|
| [Task 1] | Xm | Xh | X% |
| [Task 2] | Xm | Xh | X% |
| **Total** | **Xm** | **Xh** | **X%** |

### Reusable Patterns
```[language]
// Pattern: [Name]
// Use case: [When to use]
[Code snippet]
```

---

## 👁️ Mind's Eye Review

### Collaboration Quality
- **Clarity**: ⭐⭐⭐⭐⭐ - [User prompts were clear/vague]
- **Iteration Speed**: ⭐⭐⭐⭐⭐ - [Quick feedback loops?]
- **Context Provided**: ⭐⭐⭐⭐⭐ - [Enough context given?]

### How We Can Improve Next Time
1. [Suggestion for better workflow]
2. [Automation opportunity identified]
3. [Pattern to establish]

### User Interaction Feedback
> [Honest feedback on the collaboration - what helped, what slowed things down]

---

## 🫧 Artifact Bubbles

| Type | Name | Purpose | Reusable? |
|------|------|---------|-----------|
| Component | [Name] | [Purpose] | ✅/❌ |
| Config | [Name] | [Purpose] | ✅/❌ |
| Pattern | [Name] | [Purpose] | ✅/❌ |

---

## 💬 Chat Transcript

### Exchange 1
**🧑 User:**
> [User message - verbatim with light spelling corrections]

**🤖 Claude:**
[Summary of response + key actions taken]

---

### Exchange N
[Continue for all significant exchanges...]

---

## 📁 Files Modified

| File | Action | Changes |
|------|--------|---------|
| `path/file.tsx` | Modified | +X / -Y |

---

## 🔮 Future Considerations

### Blog-Worthy Insights
- **Title Idea**: "[Potential blog title]"
- **Angle**: [What makes this interesting]
- **Keywords**: `keyword1`, `keyword2`, `keyword3`

### Next Session Prep
- [ ] [Thing to do next]
- [ ] [Follow-up task]

### Hashtags
#AI #ClaudeCode #WebDev #[relevant] #[tags]

---

## 🤖 Metadata

```yaml
signature: "CLAUDE-LOG-YYYYMMDD-HHMMSS-XXXX"
log_id: "[project]-YYYYMMDD-HHMMSS"
agent: "Claude Code"
agent_version: "claude-opus-4-5"
model: "claude-opus-4-5-20251101"
timestamp: "YYYY-MM-DDTHH:MM:SS"
session_id: "[git-hash]"
branch: "[branch]"
project: "[project-name]"
journal_scope: "root|project|sub-project"

# Session Metrics
exchanges: N
files_changed: N
lines_added: N
lines_removed: N

# AI Engineering Metrics
autonomy_level: "guided|collaborative|autonomous"
tools_used: ["tool1", "tool2"]
prompt_effectiveness: "1-5"
time_saved_estimate: "Xh"

# Cross-References
related_logs: []
parent_log: null
```

---

*Generated by `/log` • Signature: `CLAUDE-LOG-YYYYMMDD-HHMMSS-XXXX`*
```

---

## Execution Checklist

1. [ ] Run `git status --porcelain` to detect working scope
2. [ ] Determine journal folder (sub-project/project/root)
3. [ ] Gather timestamps and git metadata
4. [ ] Generate short title from session topic
5. [ ] Create journal directory if needed: `mkdir -p [path]/journal`
6. [ ] Extract full chat transcript with AI engineering analysis
7. [ ] Rate prompt effectiveness and tool usage
8. [ ] Calculate time-to-value estimates
9. [ ] Identify reusable patterns and blog-worthy insights
10. [ ] Write log file with all sections populated

---

## Journal Scope Examples

| Working On | Modified Files | Journal Location |
|------------|----------------|------------------|
| Marketing site footer | `teamvault/marketing-site/src/*` | `teamvault/marketing-site/journal/` |
| Plugin + marketing | `teamvault/plugin/*`, `teamvault/marketing-site/*` | `teamvault/journal/` |
| Multiple plugins | `teamvault/*`, `other-plugin/*` | `journal/` (root) |
| Root configs | `.claude/*`, `CLAUDE.md` | `journal/` (root) |
