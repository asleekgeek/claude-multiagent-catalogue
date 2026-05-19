# python-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/python-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for building Model Context Protocol (MCP) servers in Python using the official SDK with FastMCP. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.

**Keywords:** `python`, `mcp`, `model-context-protocol`, `fastmcp`, `server-development`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/python-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistant for developing Model Context Protocol (MCP) servers in Python |

## Skills

- `skills/python-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh python-mcp-development --skills

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

# Python MCP Server Development Plugin

Complete toolkit for building Model Context Protocol (MCP) servers in Python using the official SDK with FastMCP. Includes instructions for best practices, a prompt for generating servers, and an expert chat mode for guidance.

## Installation

```bash
# Using Copilot CLI
copilot plugin install python-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/python-mcp-development:python-mcp-server-generator` | Generate a complete MCP server project in Python with tools, resources, and proper configuration |

### Agents

| Agent | Description |
|-------|-------------|
| `python-mcp-expert` | Expert assistant for developing Model Context Protocol (MCP) servers in Python |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
