# cast-imaging — Claude Code Port

> Ported from `awesome-copilot/plugins/cast-imaging` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

A comprehensive collection of specialized agents for software analysis, impact assessment, structural quality advisories, and architectural review using CAST Imaging.

**Keywords:** `cast-imaging`, `software-analysis`, `architecture`, `quality`, `impact-analysis`, `devops`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/cast-imaging-impact-analysis.md` | `claude-sonnet-4-6` | Specialized agent for comprehensive change impact assessment and risk analysis in software systems using CAST Imaging |
| `agents/cast-imaging-software-discovery.md` | `claude-sonnet-4-6` | Specialized agent for comprehensive software application discovery and architectural mapping through static code analysi |
| `agents/cast-imaging-structural-quality-advisor.md` | `claude-sonnet-4-6` | Specialized agent for identifying, analyzing, and providing remediation guidance for code quality issues using CAST Imag |

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh cast-imaging

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

# CAST Imaging Agents Plugin

A comprehensive collection of specialized agents for software analysis, impact assessment, structural quality advisories, and architectural review using CAST Imaging.

## Installation

```bash
# Using Copilot CLI
copilot plugin install cast-imaging@awesome-copilot
```

## What's Included

### Agents

| Agent | Description |
|-------|-------------|
| `cast-imaging-software-discovery` | Specialized agent for comprehensive software application discovery and architectural mapping through static code analysis using CAST Imaging |
| `cast-imaging-impact-analysis` | Specialized agent for comprehensive change impact assessment and risk analysis in software systems using CAST Imaging |
| `cast-imaging-structural-quality-advisor` | Specialized agent for identifying, analyzing, and providing remediation guidance for code quality issues using CAST Imaging |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
