# php-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/php-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive resources for building Model Context Protocol servers using the official PHP SDK with attribute-based discovery, including best practices, project generation, and expert assistance

**Keywords:** `php`, `mcp`, `model-context-protocol`, `server-development`, `sdk`, `attributes`, `composer`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/php-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistant for PHP MCP server development using the official PHP SDK with attribute-based discovery |

## Skills

- `skills/php-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh php-mcp-development --skills

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

# PHP MCP Server Development Plugin

Comprehensive resources for building Model Context Protocol servers using the official PHP SDK with attribute-based discovery, including best practices, project generation, and expert assistance

## Installation

```bash
# Using Copilot CLI
copilot plugin install php-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/php-mcp-development:php-mcp-server-generator` | Generate a complete PHP Model Context Protocol server project with tools, resources, prompts, and tests using the official PHP SDK |

### Agents

| Agent | Description |
|-------|-------------|
| `php-mcp-expert` | Expert assistant for PHP MCP server development using the official PHP SDK with attribute-based discovery |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
