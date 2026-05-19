# power-platform-mcp-connector-development — Claude Code Port

> Ported from `awesome-copilot/plugins/power-platform-mcp-connector-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for developing Power Platform custom connectors with Model Context Protocol integration for Microsoft Copilot Studio

**Keywords:** `power-platform`, `mcp`, `copilot-studio`, `custom-connector`, `json-rpc`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/power-platform-mcp-integration-expert.md` | `claude-sonnet-4-6` | Expert in Power Platform custom connector development with MCP integration for Copilot Studio - comprehensive knowledge  |

## Skills

- `skills/mcp-copilot-studio-server-generator/SKILL.md`
- `skills/power-platform-mcp-connector-suite/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh power-platform-mcp-connector-development --skills

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

# Power Platform MCP Connector Development Plugin

Complete toolkit for developing Power Platform custom connectors with Model Context Protocol integration for Microsoft Copilot Studio

## Installation

```bash
# Using Copilot CLI
copilot plugin install power-platform-mcp-connector-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/power-platform-mcp-connector-development:power-platform-mcp-connector-suite` | Generate complete Power Platform custom connector with MCP integration for Copilot Studio - includes schema generation, troubleshooting, and validation |
| `/power-platform-mcp-connector-development:mcp-copilot-studio-server-generator` | Generate a complete MCP server implementation optimized for Copilot Studio integration with proper schema constraints and streamable HTTP support |

### Agents

| Agent | Description |
|-------|-------------|
| `power-platform-mcp-integration-expert` | Expert in Power Platform custom connector development with MCP integration for Copilot Studio - comprehensive knowledge of schemas, protocols, and integration patterns |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
