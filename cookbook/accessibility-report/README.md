# Accessibility Report

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/accessibility-report.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Generate WCAG accessibility reports for a web app using the Playwright MCP server.

## Approach in Claude Code

Configure `@playwright/mcp` in `~/.claude/settings.json`, then prompt Claude to navigate the app, run accessibility audits, and emit a WCAG report. The catalogue's `accessibility-runtime-tester` agent is purpose-built for this pattern — install it with `./install.sh install-agent accessibility-runtime-tester`.

## Where to look

https://docs.claude.com/en/docs/agents-and-tools/mcp and the Playwright MCP server docs.

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
