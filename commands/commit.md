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

**Create log in `/logs/` directory with format `mm-dd-short-feature-name.md`**

- Use current date (mm-dd format)
- Include short, descriptive feature name (e.g., `09-29-posthog-subscriptions.md`)
- Include prompt timeline, detailed prompts, code changes, design decisions

**IMPORTANT: Also create AI meta tags JSON file:**
- Filename: `mm-dd-short-feature-name.meta.json`
- Use schema from `/logs/LOG-META-SCHEMA.md`
- Include all metrics from session

**Log AI Meta Tags Schema** (`{feature-name}.meta.json`):
```json
{
  "session": {
    "date": "2025-09-29",
    "duration_minutes": 120,
    "agent": "Claude Sonnet 4.5",
    "feature_slug": "feature-name"
  },
  "work_classification": {
    "type": "feature|bug_fix|refactor|docs|optimization",
    "complexity": "trivial|simple|moderate|complex|very_complex",
    "scope": "component|feature|system|architecture"
  },
  "development_metrics": {
    "estimated_time_without_ai_hours": 12.0,
    "actual_time_with_ai_hours": 3.0,
    "productivity_multiplier": 4.0,
    "files_created": 5,
    "files_modified": 3,
    "lines_added": 250,
    "lines_removed": 50
  },
  "technical_stack": {
    "primary_technologies": ["Next.js", "PostHog"],
    "libraries_added": ["resend"],
    "apis_integrated": ["PostHog", "Resend"]
  },
  "content_potential": {
    "blog_worthy": true,
    "blog_topics": ["AI-Assisted Development", "PostHog Integration"],
    "tutorial_potential": "high",
    "documentation_quality": "excellent"
  },
  "ai_assistance": {
    "prompts_count": 15,
    "context_switches": 3,
    "key_insights": [
      "Used Schema.org for SEO",
      "Dual-file approach for FAQs"
    ]
  }
}
```

**FAQ Generation**: Based on user prompts in this session, create 2-3 FAQ items in `/faqs/` directory:
- Each FAQ gets two files:
  - `{slug}.md` - Human-readable markdown with question, answer, code examples, related links
  - `{slug}.meta.json` - AI meta tags with Schema.org FAQPage format
- AI meta tags should include:
  - persona_relevance (developer, designer, founder, marketer scores 0-1)
  - difficulty (beginner, intermediate, advanced)
  - implementation_time
  - tags, seo_keywords, search_intent
  - agentic_usecase, conversion_goal, business_value
- Update `/faqs/index.json` with new FAQ entries

**Update INDEX.md**: Add new log entry to `/logs/INDEX.md`

### 2. Dev Estimate Calculation

Extract from meta.json and include in commit message:
```markdown
📊 Dev Estimate (Since Last Commit):
   • Actual work time: [X hours from actual_time_with_ai_hours]
   • Traditional estimate: [Y hours from estimated_time_without_ai_hours]
   • Time savings: [productivity_multiplier]x multiplier
   • AI agent: [agent from meta.json]
   • Files modified: [files_created + files_modified]
   • Lines changed: [+lines_added/-lines_removed]
```

### 3. Blog Post Ideation
Generate from meta.json `content_potential.blog_topics`:

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

**IMPORTANT: Do NOT include AI attribution**
- ❌ Do NOT add "Co-Authored-By: Claude"
- ❌ Do NOT add "Generated with Claude Code" footer
- ✅ Keep commits clean without AI branding

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