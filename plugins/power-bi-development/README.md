# power-bi-development — Claude Code Port

> Ported from `awesome-copilot/plugins/power-bi-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive Power BI development resources including data modeling, DAX optimization, performance tuning, visualization design, security best practices, and DevOps/ALM guidance for building enterprise-grade Power BI solutions.

**Keywords:** `power-bi`, `dax`, `data-modeling`, `performance`, `visualization`, `security`, `devops`, `business-intelligence`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/power-bi-data-modeling-expert.md` | `claude-sonnet-4-6` | Expert Power BI data modeling guidance using star schema principles, relationship design, and Microsoft best practices f |
| `agents/power-bi-dax-expert.md` | `claude-sonnet-4-6` | Expert Power BI DAX guidance using Microsoft best practices for performance, readability, and maintainability of DAX for |
| `agents/power-bi-performance-expert.md` | `claude-sonnet-4-6` | Expert Power BI performance optimization guidance for troubleshooting, monitoring, and improving the performance of Powe |
| `agents/power-bi-visualization-expert.md` | `claude-sonnet-4-6` | Expert Power BI report design and visualization guidance using Microsoft best practices for creating effective, performa |

## Skills

- `skills/power-bi-dax-optimization/SKILL.md`
- `skills/power-bi-model-design-review/SKILL.md`
- `skills/power-bi-performance-troubleshooting/SKILL.md`
- `skills/power-bi-report-design-consultation/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh power-bi-development --skills

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

# Power BI Development Plugin

Comprehensive Power BI development resources including data modeling, DAX optimization, performance tuning, visualization design, security best practices, and DevOps/ALM guidance for building enterprise-grade Power BI solutions.

## Installation

```bash
# Using Copilot CLI
copilot plugin install power-bi-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/power-bi-development:power-bi-dax-optimization` | Comprehensive Power BI DAX formula optimization prompt for improving performance, readability, and maintainability of DAX calculations. |
| `/power-bi-development:power-bi-model-design-review` | Comprehensive Power BI data model design review prompt for evaluating model architecture, relationships, and optimization opportunities. |
| `/power-bi-development:power-bi-performance-troubleshooting` | Systematic Power BI performance troubleshooting prompt for identifying, diagnosing, and resolving performance issues in Power BI models, reports, and queries. |
| `/power-bi-development:power-bi-report-design-consultation` | Power BI report visualization design prompt for creating effective, user-friendly, and accessible reports with optimal chart selection and layout design. |

### Agents

| Agent | Description |
|-------|-------------|
| `power-bi-data-modeling-expert` | Expert Power BI data modeling guidance using star schema principles, relationship design, and Microsoft best practices for optimal model performance and usability. |
| `power-bi-dax-expert` | Expert Power BI DAX guidance using Microsoft best practices for performance, readability, and maintainability of DAX formulas and calculations. |
| `power-bi-performance-expert` | Expert Power BI performance optimization guidance for troubleshooting, monitoring, and improving the performance of Power BI models, reports, and queries. |
| `power-bi-visualization-expert` | Expert Power BI report design and visualization guidance using Microsoft best practices for creating effective, performant, and user-friendly reports and dashboards. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
