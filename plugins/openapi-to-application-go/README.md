# openapi-to-application-go — Claude Code Port

> Ported from `awesome-copilot/plugins/openapi-to-application-go` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Generate production-ready Go applications from OpenAPI specifications. Includes project scaffolding, handler generation, middleware setup, and Go best practices for REST APIs.

**Keywords:** `openapi`, `code-generation`, `api`, `go`, `golang`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/openapi-to-application.md` | `claude-sonnet-4-6` | Expert assistant for generating working applications from OpenAPI specifications |

## Skills

- `skills/openapi-to-application-code/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh openapi-to-application-go --skills

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

# OpenAPI to Application - Go Plugin

Generate production-ready Go applications from OpenAPI specifications. Includes project scaffolding, handler generation, middleware setup, and Go best practices for REST APIs.

## Installation

```bash
# Using Copilot CLI
copilot plugin install openapi-to-application-go@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/openapi-to-application-go:openapi-to-application-code` | Generate a complete, production-ready application from an OpenAPI specification |

### Agents

| Agent | Description |
|-------|-------------|
| `openapi-to-application` | Expert assistant for generating working applications from OpenAPI specifications |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
