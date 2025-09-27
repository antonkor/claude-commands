---
description: "Comprehensive commit workflow with automatic logging, dev estimates, and blog ideation"
---

# Commit Command

Comprehensive commit workflow with automatic logging, dev estimates, and blog ideation.

## Command Usage
```
/commit [optional message context]
```

## Workflow Steps

### 1. Pre-Commit Log Generation
Create or update today's log with:
- Summary of all changes since last commit
- File-by-file breakdown of modifications
- Dev estimate for work done since last commit
- Key technical decisions made
- Problems solved and patterns discovered

### 2. Dev Estimate Calculation
Include in log:
```markdown
📊 Dev Estimate (Since Last Commit):
   • Actual work time: [X hours based on session duration]
   • Traditional estimate: [Y hours based on complexity]
   • Time savings: [Z.X]x multiplier
   • AI agent: [Agent name and version]
   • Files modified: [count]
   • Lines changed: [+added/-removed]
   • Test coverage: [if applicable]
```

### 3. Blog Post Ideation
Generate 3 blog post ideas from current work:

```markdown
## Blog Post Ideas 📝

### 1. [Title]
**Type:** Tutorial | Workshop | Guide | Case Study | Architecture
**Description:** [2-3 sentences about the post]
**Hook:** [Opening sentence to grab attention]
**Improvement Loop:** [How this helps developers iterate faster]
**Keywords:** [3-5 SEO keywords]
**Estimated Reading Time:** [X minutes]

### 2. [Title]
[Same structure]

### 3. [Title]
[Same structure]
```

### 4. Change Analysis
Analyze uncommitted changes:
- Group related files by feature/component
- Identify breaking changes
- Note dependencies updated
- Flag any security considerations
- Highlight performance improvements

### 5. Commit Message Draft
Generate structured commit message:

```
[type]: [concise description]

[Detailed explanation of changes - 2-3 lines]

Changes:
- [Major change 1]
- [Major change 2]
- [Major change 3]

[Any breaking changes or migration notes]

📊 Dev Estimate:
   • Actual work time: [X hours]
   • Traditional estimate: [Y hours]
   • Time savings: [Z.X]x multiplier
   • AI agent: [Agent name and version]

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### 6. Review Gate
Present the commit message for review:
- Show what will be committed
- Display commit message
- Ask for confirmation or edits
- Only proceed with actual commit after approval

## Implementation Steps

When `/commit` is invoked:

1. **Gather Git Information**:
   ```bash
   git status
   git diff HEAD
   git log -1 --format="%H %s"
   ```

2. **Create/Update Log**:
   - Add to `/logs/[MM-DD-YY].md`
   - Include session summary
   - Add dev estimates
   - Document technical decisions

3. **Generate Blog Ideas**:
   - Analyze code changes for educational value
   - Extract patterns worth sharing
   - Consider problems solved

4. **Draft Commit Message**:
   - Analyze changes for commit type (feat/fix/docs/refactor/test/chore)
   - Summarize impact
   - Include metrics

5. **Review & Confirm**:
   - Show staged files
   - Display commit message
   - Wait for user approval
   - Execute commit only after confirmation

## Commit Types

- **feat:** New feature
- **fix:** Bug fix
- **docs:** Documentation changes
- **style:** Code style changes (formatting, etc)
- **refactor:** Code refactoring without feature changes
- **test:** Adding or updating tests
- **chore:** Maintenance tasks
- **perf:** Performance improvements
- **build:** Build system changes
- **ci:** CI/CD changes

## Blog Post Types

### Tutorial
- Step-by-step implementation
- Code examples throughout
- Common pitfalls section
- Prerequisites listed

### Workshop
- Interactive exploration
- Multiple exercises
- Progressive difficulty
- Debug techniques

### Guide
- Comprehensive overview
- Best practices
- Decision matrices
- Architecture considerations

### Case Study
- Problem presentation
- Solution evolution
- Metrics and results
- Lessons learned

### Architecture
- System design
- Pattern analysis
- Trade-off discussions
- Scaling considerations

## Dev Estimate Factors

Calculate estimates based on:
- **Files touched:** Each file = 0.5-2 hours traditional
- **Complexity:** Simple/Medium/Complex = 1x/2x/4x multiplier
- **Tests written:** Each test file = 1 hour traditional
- **Documentation:** Each doc = 0.5 hours traditional
- **Debugging time:** Error fixes = 2x multiplier
- **Research required:** New libraries/patterns = 3x multiplier

## Example Usage

```
User: /commit