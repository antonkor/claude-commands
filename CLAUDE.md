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
- NEVER run dev servers in background mode unless explicitly requested
- If a dev server is needed for testing, inform user and ask them to start it manually
- Only check server status with commands like `netstat` or `ps`, never auto-start servers
- ALWAYS ask before starting any long-running processes

## Forbidden Commands (unless explicitly requested)
- npm run dev
- yarn dev
- npm start
- Any background server processes
- Any commands that start long-running services

## Commit Rules
- NEVER include Co-Authored-By: Claude <noreply@anthropic.com> in commit messages
- Do NOT add any AI attribution or co-authorship to commits
- Remove ALL mentions of "Claude", "Generated with Claude Code", or any AI agent branding from commits
- Keep commits clean without AI attribution

## Agent Delegation Rules
- `/log` commands: Handle directly (main Claude), do NOT delegate to content curator agent
- `/blog` commands: Delegate to content curator agent for market research, SEO optimization, and polished content creation
- Content curator agent should ONLY be used for public-facing content creation, not internal logging or documentation