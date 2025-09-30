- look at the files we have right now and see if there are any issues or any additional optimizations that might help out in the future. do this before each commit
- remember to check status on wsl when starting up claude code. if its not running, start it up always. we are on windows pc and need wsl to do anything in cli apparently.
- if wsl is running and we never installed spec-kit yet in this folder, then install spec-kit from github with this command: wsl uvx --from git+https://github.com/github/spec-kit.git specify init --here --ai claude
- i dont want you to create specs without specify  installed.
- always create a jounal entry that gets saved into journal folder at the end of the day. each commit update the log for the day.
- lets install github cli when starting a new project. check if it's installed
- when working on ideas or tasks or random stufftuff, dont just comcheckoutt branches in the middle of working. before a commit unstage everything and stage whats important to each branch before we PR ait into master and asunset the branch. whats this approach commonly referred to?
- each day i start, make a journal entry for today and keep my important chat log infos in there for todays date.
- i would like to try a new code agent platform to see if it can do any improvments. i want you to be aware of their changes. i will alsays commit work done with what ai agent i used. for future benchmarking and reasoning
- can you make a new journal entry per day based on the time we are chatting. do not put journal entries into whatever file. make sure we're on the right day.
- each time you give me a well formated response i might want to read later. save it into my journal and add reasoning why.
- if i say make a journal entry, make a new one with todays data and time. dont write in a previous jounal unless you think its a good idea to add to it some extra context and link to the new journal. later we're gonna use these jounal logs as ideas for blog content.
- for journal entries, include keywords to look at on google and trends for topics related to the journal entry. include google ai phrases to search for to get a good snapshot of ai summaries so we can crate better content includeing faqs and how-to's something even i can read and learn from. hashtags on twitter and instagram too witth urls for quick references
- for journal entries make sure to document a chat log history buy summarizing my inputs an your responses in a easy to digest manner so we can later utilize the logs for how this thing got built
- create a log of all prompts i give you. put them into /prompts/mm-dd-yy-<agent-name-version>.md
- dont just start npm run dev whenever you feel like it. first check if another terminal is running it or if it crashed. if so let me know to ge reset it
- whenever using specifiy, plan, and tasks suggest when to use claude opus or sonnet, which one for which tasks and remind me if im in opus and need to switch back to sonnet.

## Development Server Rules - STRICT ENFORCEMENT
- NEVER run `npm run dev`, `yarn dev`, or any development servers without explicit user permission
- NEVER run `npm run build`, `yarn build`, or any build commands without explicit user permission
- NEVER run dev servers in background mode unless explicitly requested
- If a dev server is needed for testing, inform user and ask them to start it manually
- If build verification is needed, inform user and ask them to run build manually
- Only check server status with commands like `netstat` or `ps`, never auto-start servers
- ALWAYS ask before starting any long-running processes

## Forbidden Commands (unless explicitly requested)
- npm run dev
- yarn dev
- npm start
- npm run build
- yarn build
- Any build or compilation commands
- Any background server processes
- Any commands that start long-running services

## Commit Rules
- NEVER include Co-Authored-By: Claude <noreply@anthropic.com> in commit messages
- Do NOT add any AI attribution or co-authorship to commits
- Remove ALL mentions of "Claude", "Generated with Claude Code", or any AI agent branding from commits
- Keep commits clean without AI attribution

## Version Management Workflow
- BEFORE every commit, ask user if they want to increment version number
- When user says yes to version increment, automatically update ALL version references:
  * Current displayed version (UI components)
  * Analytics tracking version parameters
  * Feedback form version references
  * Thank you messages (use NEXT version, e.g., if current is v0.5, thank you shows v0.5.1)
  * API version tracking
  * data-vibe component version attributes
- Version increment pattern: v0.5 → v0.5.1 → v0.5.2 OR v0.5 → v0.6 (user chooses)
- Always ask "Should we increment version to [next version]?" before each commit
- Update version in these locations:
  * components/hero-video.tsx (display version, analytics, feedback forms)
  * Any data-vibe attributes that reference version
  * API endpoints that track version
  * Documentation that mentions current version

## Agent Delegation Rules
- `/log` commands: Handle directly (main Claude), do NOT delegate to content curator agent
- `/blog` commands: Delegate to content curator agent for market research, SEO optimization, and polished content creation
- Content curator agent should ONLY be used for public-facing content creation, not internal logging or documentation

## Custom Slash Commands - Scope Guidance
When creating new slash commands, always start by determining the appropriate scope:

**User-Level Commands** (stored in `C:\Users\anton\.claude\commands.json`):
- Generic/reusable across all projects
- Research and analysis workflows
- General documentation patterns
- Universal development workflows
- Examples: `/research`, generic logging patterns

**Project-Level Commands** (stored in `<project>/.claude/commands.json`):
- Project-specific workflows
- Custom commit processes with project conventions
- Domain-specific documentation
- Project tooling integration
- Examples: `/commit` (with FAQ generation), project-specific tests

**Decision Matrix:**
- Is it useful across ALL projects? → User-level
- Does it depend on project structure? → Project-level
- Does it use project-specific conventions? → Project-level
- Is it a generic pattern that adapts to context? → User-level

**Always state the scope recommendation FIRST** when creating or discussing custom commands.