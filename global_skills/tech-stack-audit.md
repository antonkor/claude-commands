---
description: Audit the technology stack, research upgrades (like Bun/pnpm), and update documentation.
---
# Tech Stack Audit & Upgrade Automation (Global)

This workflow automates the process of auditing any Javascript/Typescript project's technology stack.

## 1. Documentation Review & Updates
1.  **Identify Key Technologies**: List the core technologies in usage (e.g., Next.js, React, Node, Bun, etc.).
2.  **Fetch Latest Docs**: Use `read_url_content` or `search_web` to get the latest compatibility guides.
    *   *Focus areas:* React 19 / Next.js 15 Compatibility, Type Safety, Performance.
3.  **Synthesize Insights**:
    *   **Compatibility Status**: Does it work with the current stack?
    *   **Performance Benefits**: Is it faster/better?
    *   **Migration Path**: What steps are needed?
4.  **Update Internal Docs**: Create or Update `docs/tech-stack-audit.md` (or similar) with the findings.

## 2. Dependency & Configuration Audit
1.  **Review `package.json`**: Check current scripts, dependencies, and versions.
2.  **Check Configuration Files**: Review `tsconfig.json` (strict mode?), `next.config.js/ts`, `vite.config.ts`, etc.
3.  **Type Safety Check**:
    *   Is `strict: true` in `tsconfig.json`?
    *   Are there any `any` types that could be tightened?

## 3. Implementation / Migration (If Approved)
1.  **Switch Package Manager/Runtime**:
    *   **Bun**: `npm install -g bun` -> Update scripts -> Remove lockfile -> `bun install`.
    *   **pnpm**: `npm install -g pnpm` -> `pnpm import` -> `pnpm install`.
2.  **Verify**: Run the dev server (`bun run dev` or `pnpm dev`) and check for errors.

## 4. Usage
Run this workflow when starting a new project to pick the best stack, or periodically (e.g., quarterly) to audit existing projects for performance upgrades.
