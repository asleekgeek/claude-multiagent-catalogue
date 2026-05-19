# devops-oncall — Claude Code Port

> Ported from `awesome-copilot/plugins/devops-oncall` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

A focused set of prompts, instructions, and a chat mode to help triage incidents and respond quickly with DevOps tools and Azure resources.

**Keywords:** `devops`, `incident-response`, `oncall`, `azure`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/azure-principal-architect.md` | `claude-sonnet-4-6` | Provide expert Azure Principal Architect guidance using Azure Well-Architected Framework principles and Microsoft best p |

## Skills

- `skills/azure-resource-health-diagnose/SKILL.md`
- `skills/multi-stage-dockerfile/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh devops-oncall --skills

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

# DevOps On-Call Plugin

A focused set of prompts, instructions, and a chat mode to help triage incidents and respond quickly with DevOps tools and Azure resources.

## Installation

```bash
# Using Copilot CLI
copilot plugin install devops-oncall@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/devops-oncall:azure-resource-health-diagnose` | Analyze Azure resource health, diagnose issues from logs and telemetry, and create a remediation plan for identified problems. |
| `/devops-oncall:multi-stage-dockerfile` | Create optimized multi-stage Dockerfiles for any language or framework |

### Agents

| Agent | Description |
|-------|-------------|
| `azure-principal-architect` | Provide expert Azure Principal Architect guidance using Azure Well-Architected Framework principles and Microsoft best practices. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
