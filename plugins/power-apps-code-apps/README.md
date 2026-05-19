# power-apps-code-apps — Claude Code Port

> Ported from `awesome-copilot/plugins/power-apps-code-apps` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Complete toolkit for Power Apps Code Apps development including project scaffolding, development standards, and expert guidance for building code-first applications with Power Platform integration.

**Keywords:** `power-apps`, `power-platform`, `typescript`, `react`, `code-apps`, `dataverse`, `connectors`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/power-platform-expert.md` | `claude-sonnet-4-6` | Power Platform expert providing guidance on Code Apps, canvas apps, Dataverse, connectors, and Power Platform best pract |

## Skills

- `skills/power-apps-code-app-scaffold/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh power-apps-code-apps --skills

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

# Power Apps Code Apps Development Plugin

Complete toolkit for Power Apps Code Apps development including project scaffolding, development standards, and expert guidance for building code-first applications with Power Platform integration.

## Installation

```bash
# Using Copilot CLI
copilot plugin install power-apps-code-apps@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/power-apps-code-apps:power-apps-code-app-scaffold` | Scaffold a complete Power Apps Code App project with PAC CLI setup, SDK integration, and connector configuration |

### Agents

| Agent | Description |
|-------|-------------|
| `power-platform-expert` | Power Platform expert providing guidance on Code Apps, canvas apps, Dataverse, connectors, and Power Platform best practices |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
