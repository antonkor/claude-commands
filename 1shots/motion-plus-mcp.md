# Motion Plus MCP Setup - 1shot Prompts

Copy-paste these prompts to quickly enable Motion Plus MCP on any project.

---

## Fresh Install on New Machine

```
Setup Motion Plus MCP [keywords: fresh-install] [scope: global]

I need Motion Plus MCP installed on this machine. Steps:
1. Install motion-studio-mcp globally via WSL
2. Configure Claude Code to use it
3. Verify connection

My Motion+ token is in .env.local as MOTION_PLUS_TOKEN
```

---

## Enable on Existing Project

```
Setup Motion Plus MCP [keywords: enable-project] [scope: project]

Enable Motion Plus MCP on this project. Motion is already installed globally via WSL.
Create .mcp.json with the motion server config and verify connection.
```

---

## Reconnect After Disconnect

```
Setup Motion Plus MCP [keywords: reconnect/troubleshoot] [scope: project]

Motion MCP shows disconnected. Remove and re-add the server config.
```

---

## Token Expired

```
Setup Motion Plus MCP [keywords: token-expired/reinstall] [scope: global]

My Motion+ token expired. I have a new token ready. Reinstall the package globally with the new token and reconnect.
```

---

## Full Audit & Fix

```
Setup Motion Plus MCP [keywords: audit/full-check] [scope: project]

Audit my Motion Plus MCP setup:
1. Check if globally installed in WSL
2. Check .mcp.json config
3. Verify connection status
4. Test with visualise-spring tool
5. Report any issues and fix them
```

---

## Keyword Reference

| Keyword | Meaning |
|---------|---------|
| `fresh-install` | First time setup on machine |
| `enable-project` | Add to existing project |
| `reconnect` | Fix disconnected server |
| `token-expired` | Reinstall with new token |
| `troubleshoot` | Diagnose connection issues |
| `audit` | Full health check |

## Scope Reference

| Scope | Location | When to Use |
|-------|----------|-------------|
| `global` | WSL npm global | Machine-wide install |
| `user` | ~/.claude settings | User preferences |
| `project` | .mcp.json | Per-project config |
