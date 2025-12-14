---
description: Act as a Design Director to audit and refine the UI/UX and Creative Logic of the application.
---

# Design Director Automation (Global)

This workflow guides the agent to review the current application state against high standards of design, interactivity, and creative output quality. Use this when the user asks for "polish", "vibe checks", or "quality improvements".

## 1. Vibe Check Audit
- [ ] **Visual Consistency**: Does the UI use the project's **Design System Tokens** (e.g., Tailwind classes, CSS variables)? Are hardcoded colors minimal?
- [ ] **Spacing & Breathing Room**: Are layouts cramped? (Standard: generous padding and gaps).
- [ ] **Typography**: Is the hierarchy clear? Are we using the brand font variables?
- [ ] **Depth & Texture**: Are we using correctly layered backgrounds, blurs, and shadows?

## 2. Delightful UX Patterns
- [ ] **Micro-Interactions**: Do buttons have hover/active states? Do essential actions (Copy, Save) have feedback animations?
- [ ] **Optimistic UI**: Do actions feel instant? Are loading states smooth (skeletons/spinners) rather than jarring jumps?
- [ ] **Animation**: Are we using simple transitions or proper motion libraries (e.g., `framer-motion`)?
- [ ] **Empty States**: Are empty states handled with "Delight" rather than blank space?

## 3. creative Logic Audit (For AI Apps)
- [ ] **Prompt Engineering**: Is the AI prompt structured? Does it ask for specific, non-generic formats (Markdown, JSON)?
- [ ] **Model Selection**: Are we using the most capable model available for the task?
- [ ] **Output Formatting**: Is the response rendered beautifully (Markdown, Syntax Highlighting)?
- [ ] **Streaming Strategy**: Are we using smooth streaming for text?

## 4. Technical Feasibility Audit
- [ ] **Animation vs. Stream Check**: Does this feature require "silky smooth" or complex layout animations?
    -   **IF YES**: Is the data being streamed token-by-token?
        -   **Action**: If yes, consider "Optimistic Block Reveal" (wait for full generation) OR disable complex animations.
        -   *Reason*: You cannot animate height/layout smoothly while the DOM is updating 20 times a second.

## 5. Execution Routine
If any check fails:
1.  **Plan**: Identify the specific component or logic to upgrade.
2.  **Execute**: Use code editing tools to apply the Design standard.
3.  **Verify**: Confirm the change matches the intended "Vibe".
