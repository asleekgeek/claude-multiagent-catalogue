# azure-cloud-development — Claude Code Port

> Ported from `awesome-copilot/plugins/azure-cloud-development` v1.0.1
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive Azure cloud development tools including Infrastructure as Code, serverless functions, architecture patterns, and cost optimization for building scalable cloud applications.

**Keywords:** `azure`, `cloud`, `infrastructure`, `bicep`, `terraform`, `serverless`, `architecture`, `devops`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/azure-logic-apps-expert.md` | `claude-sonnet-4-6` | Expert guidance for Azure Logic Apps development focusing on workflow design, integration patterns, and JSON-based Workf |
| `agents/azure-principal-architect.md` | `claude-sonnet-4-6` | Provide expert Azure Principal Architect guidance using Azure Well-Architected Framework principles and Microsoft best p |
| `agents/azure-saas-architect.md` | `claude-sonnet-4-6` | Provide expert Azure SaaS Architect guidance focusing on multitenant applications using Azure Well-Architected SaaS prin |
| `agents/azure-verified-modules-bicep.md` | `claude-sonnet-4-6` | Create, update, or review Azure IaC in Bicep using Azure Verified Modules (AVM). |
| `agents/azure-verified-modules-terraform.md` | `claude-sonnet-4-6` | Create, update, or review Azure IaC in Terraform using Azure Verified Modules (AVM). |
| `agents/terraform-azure-implement.md` | `claude-sonnet-4-6` | Act as an Azure Terraform Infrastructure as Code coding specialist that creates and reviews Terraform for Azure resource |
| `agents/terraform-azure-planning.md` | `claude-sonnet-4-6` | Act as implementation planner for your Azure Terraform Infrastructure as Code task. |

## Skills

- `skills/az-cost-optimize/SKILL.md`
- `skills/azure-pricing/SKILL.md`
- `skills/azure-resource-health-diagnose/SKILL.md`
- `skills/import-infrastructure-as-code/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh azure-cloud-development --skills

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

# Azure & Cloud Development Plugin

Comprehensive Azure cloud development tools including Infrastructure as Code, serverless functions, architecture patterns, and cost optimization for building scalable cloud applications.

## Installation

```bash
# Using Copilot CLI
copilot plugin install azure-cloud-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/azure-cloud-development:azure-resource-health-diagnose` | Analyze Azure resource health, diagnose issues from logs and telemetry, and create a remediation plan for identified problems. |
| `/azure-cloud-development:az-cost-optimize` | Analyze Azure resources used in the app (IaC files and/or resources in a target rg) and optimize costs - creating GitHub issues for identified optimizations. |

### Agents

| Agent | Description |
|-------|-------------|
| `azure-principal-architect` | Provide expert Azure Principal Architect guidance using Azure Well-Architected Framework principles and Microsoft best practices. |
| `azure-saas-architect` | Provide expert Azure SaaS Architect guidance focusing on multitenant applications using Azure Well-Architected SaaS principles and Microsoft best practices. |
| `azure-logic-apps-expert` | Expert guidance for Azure Logic Apps development focusing on workflow design, integration patterns, and JSON-based Workflow Definition Language. |
| `azure-verified-modules-bicep` | Create, update, or review Azure IaC in Bicep using Azure Verified Modules (AVM). |
| `azure-verified-modules-terraform` | Create, update, or review Azure IaC in Terraform using Azure Verified Modules (AVM). |
| `terraform-azure-planning` | Act as implementation planner for your Azure Terraform Infrastructure as Code task. |
| `terraform-azure-implement` | Act as an Azure Terraform Infrastructure as Code coding specialist that creates and reviews Terraform for Azure resources. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
