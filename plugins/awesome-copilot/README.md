# awesome-copilot — Claude Code Port

> Ported from `awesome-copilot/plugins/awesome-copilot` v1.1.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Meta prompts that help you discover and generate curated GitHub Copilot agents, instructions, prompts, and skills.

**Keywords:** `github-copilot`, `discovery`, `meta`, `prompt-engineering`, `agents`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/meta-agentic-project-scaffold.md` | `claude-sonnet-4-6` | Meta agentic project creation assistant to help users create and manage project workflows effectively. |

## Skills

- `skills/suggest-awesome-github-copilot-agents/SKILL.md`
- `skills/suggest-awesome-github-copilot-instructions/SKILL.md`
- `skills/suggest-awesome-github-copilot-skills/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh awesome-copilot --skills

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

# Awesome Copilot Plugin

Meta prompts that help you discover and generate curated GitHub Copilot agents, collections, instructions, prompts, and skills.

## Installation

```bash
# Using Copilot CLI
copilot plugin install awesome-copilot@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/awesome-copilot:suggest-awesome-github-copilot-collections` | Suggest relevant GitHub Copilot collections from the awesome-copilot repository based on current repository context and chat history, providing automatic download and installation of collection assets, and identifying outdated collection assets that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-instructions` | Suggest relevant GitHub Copilot instruction files from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing instructions in this repository, and identifying outdated instructions that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-agents` | Suggest relevant GitHub Copilot Custom Agents files from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing custom agents in this repository, and identifying outdated agents that need updates. |
| `/awesome-copilot:suggest-awesome-github-copilot-skills` | Suggest relevant GitHub Copilot skills from the awesome-copilot repository based on current repository context and chat history, avoiding duplicates with existing skills in this repository, and identifying outdated skills that need updates. |

### Agents

| Agent | Description |
|-------|-------------|
| `meta-agentic-project-scaffold` | Meta agentic project creation assistant to help users create and manage project workflows effectively. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
