# context-engineering — Claude Code Port

> Ported from `awesome-copilot/plugins/context-engineering` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Tools and techniques for maximizing GitHub Copilot effectiveness through better context management. Includes guidelines for structuring code, an agent for planning multi-file changes, and prompts for context-aware development.

**Keywords:** `context`, `productivity`, `refactoring`, `best-practices`, `architecture`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/context-architect.md` | `claude-opus-4-6` | An agent that helps plan and execute multi-file changes by identifying relevant context and dependencies |

## Skills

- `skills/context-map/SKILL.md`
- `skills/refactor-plan/SKILL.md`
- `skills/what-context-needed/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh context-engineering --skills

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

# Context Engineering Plugin

Tools and techniques for maximizing GitHub Copilot effectiveness through better context management. Includes guidelines for structuring code, an agent for planning multi-file changes, and prompts for context-aware development.

## Installation

```bash
# Using Copilot CLI
copilot plugin install context-engineering@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/context-engineering:context-map` | Generate a map of all files relevant to a task before making changes |
| `/context-engineering:what-context-needed` | Ask Copilot what files it needs to see before answering a question |
| `/context-engineering:refactor-plan` | Plan a multi-file refactor with proper sequencing and rollback steps |

### Agents

| Agent | Description |
|-------|-------------|
| `context-architect` | An agent that helps plan and execute multi-file changes by identifying relevant context and dependencies |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
