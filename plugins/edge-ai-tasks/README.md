# edge-ai-tasks — Claude Code Port

> Ported from `awesome-copilot/plugins/edge-ai-tasks` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Task Researcher and Task Planner for intermediate to expert users and large codebases - Brought to you by microsoft/edge-ai

**Keywords:** `architecture`, `planning`, `research`, `tasks`, `implementation`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/task-planner.md` | `claude-sonnet-4-6` | Task planner for creating actionable implementation plans - Brought to you by microsoft/edge-ai |
| `agents/task-researcher.md` | `claude-sonnet-4-6` | Task research specialist for comprehensive project analysis - Brought to you by microsoft/edge-ai |

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh edge-ai-tasks

# verify
ls .claude/agents/
```

## Claude Code Notes

Plugin frontmatter normalised per `copilot-to-claude-multiagent/SKILL.md` §12:

- Each agent's `tools:` and `agents:` keys dropped — Claude Code agents have full tool access by default.
- Each agent's `model:` mapped to a Claude tier (see `references/model-mapping.md`).
- Body-level Copilot tool references (where present) rewritten under §3/§5; agents that needed body changes carry their own `## Claude Code Notes` section.
- Skills bundled verbatim from upstream — see the top-level `skills/STATUS.md` for the catalogue-wide audit.

---

## Original upstream README

# Tasks by microsoft/edge-ai Plugin

Task Researcher and Task Planner for intermediate to expert users and large codebases - Brought to you by microsoft/edge-ai

## Installation

```bash
# Using Copilot CLI
copilot plugin install edge-ai-tasks@awesome-copilot
```

## What's Included

### Agents

| Agent | Description |
|-------|-------------|
| `task-researcher` | Task research specialist for comprehensive project analysis - Brought to you by microsoft/edge-ai |
| `task-planner` | Task planner for creating actionable implementation plans - Brought to you by microsoft/edge-ai |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
