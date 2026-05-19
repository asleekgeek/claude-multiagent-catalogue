# ruby-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/ruby-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for building Model Context Protocol servers in Ruby using the official MCP Ruby SDK gem with Rails integration support.

**Keywords:** `ruby`, `mcp`, `model-context-protocol`, `server-development`, `sdk`, `rails`, `gem`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/ruby-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Ruby using the official MCP Ruby SDK gem with Rails int |

## Skills

- `skills/ruby-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh ruby-mcp-development --skills

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

# Ruby MCP Server Development Plugin

Complete toolkit for building Model Context Protocol servers in Ruby using the official MCP Ruby SDK gem with Rails integration support.

## Installation

```bash
# Using Copilot CLI
copilot plugin install ruby-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/ruby-mcp-development:ruby-mcp-server-generator` | Generate a complete Model Context Protocol server project in Ruby using the official MCP Ruby SDK gem. |

### Agents

| Agent | Description |
|-------|-------------|
| `ruby-mcp-expert` | Expert assistance for building Model Context Protocol servers in Ruby using the official MCP Ruby SDK gem with Rails integration. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
