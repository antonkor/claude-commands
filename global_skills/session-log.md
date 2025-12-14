---
description: Generate a Power AI Engineer's Session Log with an immediate preview summary.
---

# Power AI Engineer's Session Log (Global)

This workflow is designed to capture high-value context from a development session. It works with both Claude and Gemini agent systems.

## Phase 1: The Preview Summary (Immediate)

**Goal:** Give the user a quick "What just happened?" summary while the heavy lifting is done in the background.

**Action:** Create a markdown artifact (or chat response) with:
*   **Session Objective:** 1 sentence on the main goal.
*   **Key Decisions:** Bullet points of the 2-3 most critical choices made (e.g., "Refactored Component X", "Updated State Management").
*   **Artifacts Created:** List of new files/designs.
*   **Next Steps:** Immediate actionable items.

## Phase 2: The Full Journal Log (Deep Dive)

**Goal:** Create a permanent record for RLHF, future context, and knowledge base building.

**File Location:** `journal/MM-DD-YY-HH-MM-AM|PM-short-title.md` (Relative to project root).

**Content Requirements:**

### 1. Metadata Block (YAML Frontmatter style)
*   **Date/Time**
*   **Git Hash** (run `git rev-parse --short HEAD` if in a git repo)
*   **Context Health** (Estimated token usage / Buffer filling)
*   **Tags** (e.g., `#Refactor`, `#Bugfix`, `#Feature`)
*   **Model Citations** (e.g., "Gemini 2.0 Flash", "GPT-5")

### 2. The Narrative
*   **Context Window Summary:** A paragraph summarizing the "vibe" and flow of the session.
*   **Artifact Fragments:**
    *   *Highlight* specific code blocks or design decisions that were "clever" or "novel".
    *   Include "Why this matters" commentary.
*   **Debug Log:** Note any tricky errors encountered and how they were solved.

### 3. Insight & RLHF Notes
*   **Agent Behavioral Observations:** Did the agent hesitate? Did it need correction? (Self-reflection).
*   **Process Improvements:** What could make the next session faster?

### 4. Vector DB Readiness (Structured Data)
*   **File Context:** List of files modified/read with their relative paths and short summary of changes.
*   **Artifact Summaries:** concise summary of every artifact created.
*   **Transcript Interaction:**
    *   Include full prompts and responses where relevant.
    *   Decorate with metadata: `type: "user_request" | "agent_plan" | "tool_call"`.

## Execution Instructions

1.  **Gather Context:**
    *   Run `git rev-parse --short HEAD` (if applicable).
    *   Run `git status --porcelain` (if applicable).
    *   Review conversation history.
2.  **Draft Preview:** Send the "Preview Summary" to the user.
3.  **Write Journal:** Create the full `.md` file in the `journal/` directory. If `journal/` does not exist, create it.
