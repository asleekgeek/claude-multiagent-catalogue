# technical-spike — Claude Code Port

> Ported from `awesome-copilot/plugins/technical-spike` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Tools for creation, management and research of technical spikes to reduce unknowns and assumptions before proceeding to specification and implementation of solutions.

**Keywords:** `technical-spike`, `assumption-testing`, `validation`, `research`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/research-technical-spike.md` | `claude-sonnet-4-6` | Systematically research and validate technical spike documents through exhaustive investigation and controlled experimen |

## Skills

- `skills/create-technical-spike/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh technical-spike --skills

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

# Technical Spike Plugin

Tools for creation, management and research of technical spikes to reduce unknowns and assumptions before proceeding to specification and implementation of solutions.

## Installation

```bash
# Using Copilot CLI
copilot plugin install technical-spike@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/technical-spike:create-technical-spike` | Create time-boxed technical spike documents for researching and resolving critical development decisions before implementation. |

### Agents

| Agent | Description |
|-------|-------------|
| `research-technical-spike` | Systematically research and validate technical spike documents through exhaustive investigation and controlled experimentation. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
