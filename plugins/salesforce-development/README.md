# salesforce-development — Claude Code Port

> Ported from `awesome-copilot/plugins/salesforce-development` v1.1.0
> Original author: TemitayoAfolabi | License: MIT | Converted: 2026-05-19

Complete Salesforce agentic development environment covering Apex & Triggers, Flow automation, Lightning Web Components, Aura components, and Visualforce pages.

**Keywords:** `salesforce`, `apex`, `triggers`, `lwc`, `aura`, `flow`, `visualforce`, `crm`, `salesforce-dx`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/salesforce-apex-triggers.md` | `claude-sonnet-4-6` | Implement Salesforce business logic using Apex classes and triggers with production-quality code following Salesforce be |
| `agents/salesforce-aura-lwc.md` | `claude-sonnet-4-6` | Implement Salesforce UI components using Lightning Web Components and Aura components following Lightning framework best |
| `agents/salesforce-flow.md` | `claude-sonnet-4-6` | Implement business automation using Salesforce Flow following declarative automation best practices. |
| `agents/salesforce-visualforce.md` | `claude-sonnet-4-6` | Implement Visualforce pages and controllers following Salesforce MVC architecture and best practices. |

## Skills

- `skills/salesforce-apex-quality/SKILL.md`
- `skills/salesforce-component-standards/SKILL.md`
- `skills/salesforce-flow-design/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh salesforce-development --skills

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

# Salesforce Development Plugin

Complete Salesforce agentic development environment covering Apex & Triggers, Flow automation, Lightning Web Components (LWC), Aura components, and Visualforce pages.

## Installation

```bash
copilot plugin install salesforce-development@awesome-copilot
```

## What's Included

### Agents

| Agent | Description |
|-------|-------------|
| `salesforce-apex-triggers` | Implement Salesforce business logic using Apex classes and triggers with production-quality code following Salesforce best practices. |
| `salesforce-aura-lwc` | Implement Salesforce UI components using Lightning Web Components and Aura components following Lightning framework best practices. |
| `salesforce-flow` | Implement business automation using Salesforce Flow following declarative automation best practices. |
| `salesforce-visualforce` | Implement Visualforce pages and controllers following Salesforce MVC architecture and best practices. |

## Usage

Once installed, switch to any of the Salesforce agents in GitHub Copilot Chat depending on what you are building:

- Use **`salesforce-apex-triggers`** for backend business logic, trigger handlers, utility classes, and test coverage
- Use **`salesforce-aura-lwc`** for building Lightning Web Components or Aura component UI
- Use **`salesforce-flow`** for declarative automation including Record-Triggered, Screen, Autolaunched, and Scheduled flows
- Use **`salesforce-visualforce`** for Visualforce pages and their Apex controllers

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
