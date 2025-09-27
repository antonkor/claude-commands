# Log Command

Create a log entry in /logs/<mm-dd-yy>.md with:

1. Extract the last 3-5 user prompts from this conversation
2. For each prompt, include:
   - User message with light corrections (fix obvious spelling errors and minor grammar issues only - preserve original meaning and tone)
   - Brief summary of Claude's response (1-2 sentences)
   - Any key actions taken (files created/edited, commands run, etc.)
   - Model name under each prompt

3. Format as markdown with clear sections:
   ```markdown
   # Chat Log - [Date]

   ## Prompt Timeline (Fast Scanning)
   - User: [brief prompt summary]
   - User: [brief prompt summary]
   - User: [brief prompt summary]

   ## Detailed Prompts

   ## Prompt 1
   **User:** [prompt text with light spelling/grammar corrections]
   **Model:** [claude model name and version]
   **Claude Response:** [brief summary]
   **Actions:** [key actions taken]

   ## Prompt 2
   ...
   ```

4. **Design Recipes Gallery**: When user makes design choices they like, extract them into reusable code snippets:
   ```markdown
   ## Design Recipes 🎨

   ### [Recipe Name] - [Brief Description]
   **Pattern:** [UI pattern type - e.g., "Progress Animation", "Loading State", "Micro-interaction"]
   **Use Case:** [When to use this pattern]
   **Code:**
   ```[language]
   [Clean, reusable code snippet]
   ```
   **Key Features:**
   - [Feature 1: timing, easing, etc.]
   - [Feature 2: visual effect]
   - [Feature 3: performance consideration]

   **Playground URL:** `[file-path]:[line-numbers]`
   ```

## Example Design Recipes to Extract:

### Animation Patterns:
- **Gentle Bottom-Up Slide**: `y: [20, 0]` with `easeOut` for skeleton loading
- **Progress Line Growth**: Starting with 4px rounded line, growing with cubic-bezier easing
- **Fade-in-Place**: Simple opacity transition without layout movement
- **Anti-Flicker Pattern**: Using `hasShownHero` state to prevent re-animation

### Motion+ Integration:
- **AnimateNumber Duration Control**: `transition={{ duration: 0.4 }}` for smooth counting
- **Sequence API Usage**: Timeline-like animation coordination
- **AnimatePresence Patterns**: `mode="wait"` for smooth state transitions

### Performance Optimizations:
- **Transform over Layout**: Using `translateY` instead of changing layout properties
- **Single Animation Trigger**: State management to prevent re-triggering expensive animations
- **Hardware Acceleration**: Strategic use of `will-change: transform`

5. Append to existing log file if it exists for today, otherwise create new file
6. Ensure logs directory exists in current project root
7. Use current date automatically (format: mm-dd-yy based on today's date)

## Correction Guidelines:
- Fix obvious spelling errors (e.g., "buiness" → "business", "sectin" → "section")
- Correct basic grammar mistakes (missing articles, verb tense consistency)
- Preserve original tone, style, and technical terminology
- Do NOT rewrite or restructure sentences
- Do NOT change slang, casual language, or personal voice
- Keep corrections minimal and obvious only