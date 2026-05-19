# rust-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/rust-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Build high-performance Model Context Protocol servers in Rust using the official rmcp SDK with async/await, procedural macros, and type-safe implementations.

**Keywords:** `rust`, `mcp`, `model-context-protocol`, `server-development`, `sdk`, `tokio`, `async`, `macros`, `rmcp`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/rust-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistant for Rust MCP server development using the rmcp SDK with tokio async runtime |

## Skills

- `skills/rust-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh rust-mcp-development --skills

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

# Rust MCP Server Development Plugin

Build high-performance Model Context Protocol servers in Rust using the official rmcp SDK with async/await, procedural macros, and type-safe implementations.

## Installation

```bash
# Using Copilot CLI
copilot plugin install rust-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/rust-mcp-development:rust-mcp-server-generator` | Generate a complete Rust Model Context Protocol server project with tools, prompts, resources, and tests using the official rmcp SDK |

### Agents

| Agent | Description |
|-------|-------------|
| `rust-mcp-expert` | Expert assistant for Rust MCP server development using the rmcp SDK with tokio async runtime |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
