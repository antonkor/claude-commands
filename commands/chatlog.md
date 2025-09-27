---
description: "Log recent prompts and responses to dated log file"
---

Create a log entry in /logs/<mm-dd-yy>-claude-sonnet-4.md with:

1. Extract the last 3-5 user prompts from this conversation
2. For each prompt, include:
   - Timestamp (if available)
   - Full user message
   - Brief summary of Claude's response (1-2 sentences)
   - Any key actions taken (files created/edited, commands run, etc.)

3. Format as markdown with clear sections:
   ```markdown
   # Chat Log - [Date]

   ## Prompt 1 - [Time]
   **User:** [prompt text]
   **Claude Response:** [brief summary]
   **Actions:** [key actions taken]

   ## Prompt 2 - [Time]
   ...
   ```

4. Append to existing log file if it exists for today, otherwise create new file
5. Ensure logs directory exists in current project root