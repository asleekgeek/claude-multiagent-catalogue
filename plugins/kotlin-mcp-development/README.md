# kotlin-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/kotlin-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for building Model Context Protocol (MCP) servers in Kotlin using the official io.modelcontextprotocol:kotlin-sdk library. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.

**Keywords:** `kotlin`, `mcp`, `model-context-protocol`, `kotlin-multiplatform`, `server-development`, `ktor`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/kotlin-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistant for building Model Context Protocol (MCP) servers in Kotlin using the official SDK. |

## Skills

- `skills/kotlin-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh kotlin-mcp-development --skills

# verify
ls .claude/agents/
ls .claude/skills/
```

## Claude Code Notes

Plugin frontmatter normalised per `copilot-to-claude-multiagent/SKILL.md` §12:

- Each agent's `tools:` and `agents:` keys dropped — Claude Code agents have full tool access by default.
- Each agent's `model:` mapped to a Claude tier (see `references/model-mapping.md`).
- Body-level Copilot tool references (where present) rewritten under §3/§5; agents that needed body changes carry their own `## Claude Code Notes` section.
- Skills bundled verbatim from upstream — see the top-level `skills/STATUS.md` for the catalogue-wide audit.

---

## Original upstream README

# Kotlin MCP Server Development Plugin

Complete toolkit for building Model Context Protocol (MCP) servers in Kotlin using the official io.modelcontextprotocol:kotlin-sdk library. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.

## Installation

```bash
# Using Copilot CLI
copilot plugin install kotlin-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/kotlin-mcp-development:kotlin-mcp-server-generator` | Generate a complete Kotlin MCP server project with proper structure, dependencies, and implementation using the official io.modelcontextprotocol:kotlin-sdk library. |

### Agents

| Agent | Description |
|-------|-------------|
| `kotlin-mcp-expert` | Expert assistant for building Model Context Protocol (MCP) servers in Kotlin using the official SDK. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
