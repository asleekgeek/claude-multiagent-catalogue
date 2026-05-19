# PR Visualization

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/pr-visualization.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Generate interactive PR age charts using the GitHub MCP server.

## Approach in Claude Code

Claude Code consumes MCP natively. Configure `@modelcontextprotocol/server-github` in `~/.claude/settings.json`, then prompt Claude to query the GitHub MCP for PR data and emit a chart (HTML/Mermaid). The `gh` CLI is also available via Bash and is often simpler for one-off queries.

## Where to look

https://docs.claude.com/en/docs/agents-and-tools/mcp and the GitHub MCP server docs.

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
