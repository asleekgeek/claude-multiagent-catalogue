# java-mcp-development — Claude Code Port

> Ported from `awesome-copilot/plugins/java-mcp-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for building Model Context Protocol servers in Java using the official MCP Java SDK with reactive streams and Spring Boot integration.

**Keywords:** `java`, `mcp`, `model-context-protocol`, `server-development`, `sdk`, `reactive-streams`, `spring-boot`, `reactor`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/java-mcp-expert.md` | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Java using reactive streams, the official MCP Java SDK, |

## Skills

- `skills/java-mcp-server-generator/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh java-mcp-development --skills

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

# Java MCP Server Development Plugin

Complete toolkit for building Model Context Protocol servers in Java using the official MCP Java SDK with reactive streams and Spring Boot integration.

## Installation

```bash
# Using Copilot CLI
copilot plugin install java-mcp-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/java-mcp-development:java-mcp-server-generator` | Generate a complete Model Context Protocol server project in Java using the official MCP Java SDK with reactive streams and optional Spring Boot integration. |

### Agents

| Agent | Description |
|-------|-------------|
| `java-mcp-expert` | Expert assistance for building Model Context Protocol servers in Java using reactive streams, the official MCP Java SDK, and Spring Boot integration. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
