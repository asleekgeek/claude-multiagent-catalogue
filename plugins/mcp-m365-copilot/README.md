# mcp-m365-copilot — Claude Code Port

> Ported from `awesome-copilot/plugins/mcp-m365-copilot` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive collection for building declarative agents with Model Context Protocol integration for Microsoft 365 Copilot

**Keywords:** `mcp`, `m365-copilot`, `declarative-agents`, `api-plugins`, `model-context-protocol`, `adaptive-cards`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/mcp-m365-agent-expert.md` | `claude-sonnet-4-6` | Expert assistant for building MCP-based declarative agents for Microsoft 365 Copilot with Model Context Protocol integra |

## Skills

- `skills/mcp-create-adaptive-cards/SKILL.md`
- `skills/mcp-create-declarative-agent/SKILL.md`
- `skills/mcp-deploy-manage-agents/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh mcp-m365-copilot --skills

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

# MCP-based M365 Agents Plugin

Comprehensive collection for building declarative agents with Model Context Protocol integration for Microsoft 365 Copilot

## Installation

```bash
# Using Copilot CLI
copilot plugin install mcp-m365-copilot@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/mcp-m365-copilot:mcp-create-declarative-agent` | mcp-create-declarative-agent |
| `/mcp-m365-copilot:mcp-create-adaptive-cards` | mcp-create-adaptive-cards |
| `/mcp-m365-copilot:mcp-deploy-manage-agents` | mcp-deploy-manage-agents |

### Agents

| Agent | Description |
|-------|-------------|
| `mcp-m365-agent-expert` | Expert assistant for building MCP-based declarative agents for Microsoft 365 Copilot with Model Context Protocol integration |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
