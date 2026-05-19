# swift-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/swift-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive collection for building Model Context Protocol servers in Swift using the official MCP Swift SDK with modern concurrency features.

**Keywords:** `swift`, `mcp`, `model-context-protocol`, `server-development`, `sdk`, `ios`, `macos`, `concurrency`, `actor`, `async-await`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/swift-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Swift using modern concurrency features and the officia |

## Skills

- `skills/swift-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh swift-mcp-development --skills

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

# Swift MCP Server Development Plugin

Comprehensive collection for building Model Context Protocol servers in Swift using the official MCP Swift SDK with modern concurrency features.

## Installation

```bash
# Using Copilot CLI
copilot plugin install swift-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/swift-mcp-development:swift-mcp-server-generator` | Generate a complete Model Context Protocol server project in Swift using the official MCP Swift SDK package. |

### Agents

| Agent | Description |
|-------|-------------|
| `swift-mcp-expert` | Expert assistance for building Model Context Protocol servers in Swift using modern concurrency features and the official MCP Swift SDK. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
