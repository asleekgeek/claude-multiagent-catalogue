# partners — Claude Code Port

> Ported from `awesome-copilot/plugins/partners` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Custom agents that have been created by GitHub partners

**Keywords:** `devops`, `security`, `database`, `cloud`, `infrastructure`, `observability`, `feature-flags`, `cicd`, `migration`, `performance`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/amplitude-experiment-implementation.md` | `claude-sonnet-4-6` | This custom agent uses Amplitude's MCP tools to deploy new experiments inside of Amplitude, enabling seamless variant te |
| `agents/apify-integration-expert.md` | `claude-sonnet-4-6` | Expert agent for integrating Apify Actors into codebases. Handles Actor selection, workflow design, implementation acros |
| `agents/arm-migration.md` | `claude-sonnet-4-6` | Arm Cloud Migration Assistant accelerates moving x86 workloads to Arm infrastructure. It scans the repository for archit |
| `agents/comet-opik.md` | `claude-sonnet-4-6` | Unified Comet Opik agent for instrumenting LLM apps, managing prompts/projects, auditing prompts, and investigating trac |
| `agents/diffblue-cover.md` | `claude-sonnet-4-6` | Expert agent for creating unit tests for java applications using Diffblue Cover. |
| `agents/droid.md` | `claude-sonnet-4-6` | Provides installation guidance, usage examples, and automation patterns for the Droid CLI, with emphasis on droid exec f |
| `agents/dynatrace-expert.md` | `claude-sonnet-4-6` | The Dynatrace Expert Agent integrates observability and security capabilities directly into GitHub workflows, enabling d |
| `agents/elasticsearch-observability.md` | `claude-sonnet-4-6` | Our expert AI assistant for debugging code (O11y), optimizing vector search (RAG), and remediating security threats usin |
| `agents/jfrog-sec.md` | `claude-sonnet-4-6` | The dedicated Application Security agent for automated security remediation. Verifies package and version compliance, an |
| `agents/launchdarkly-flag-cleanup.md` | `claude-sonnet-4-6` | A specialized Claude Code agent that uses the LaunchDarkly MCP server to safely automate feature flag cleanup workflows. |
| `agents/lingodotdev-i18n.md` | `claude-sonnet-4-6` | Expert at implementing internationalization (i18n) in web applications using a systematic, checklist-driven approach. |
| `agents/monday-bug-fixer.md` | `claude-sonnet-4-6` | Elite bug-fixing agent that enriches task context from Monday.com platform data. Gathers related items, docs, comments,  |
| `agents/mongodb-performance-advisor.md` | `claude-sonnet-4-6` | Analyze MongoDB database performance, offer query and index optimization insights and provide actionable recommendations |
| `agents/neo4j-docker-client-generator.md` | `claude-sonnet-4-6` | AI agent that generates simple, high-quality Python Neo4j client libraries from GitHub issues with proper best practices |
| `agents/neon-migration-specialist.md` | `claude-sonnet-4-6` | Safe Postgres migrations with zero-downtime using Neon's branching workflow. Test schema changes in isolated database br |
| `agents/neon-optimization-analyzer.md` | `claude-sonnet-4-6` | Identify and fix slow Postgres queries automatically using Neon's branching workflow. Analyzes execution plans, tests op |
| `agents/octopus-deploy-release-notes-mcp.md` | `claude-sonnet-4-6` | Generate release notes for a release in Octopus Deploy. The tools for this MCP server provide access to the Octopus Depl |
| `agents/pagerduty-incident-responder.md` | `claude-sonnet-4-6` | Responds to PagerDuty incidents by analyzing incident context, identifying recent code changes, and suggesting fixes via |
| `agents/stackhawk-security-onboarding.md` | `claude-sonnet-4-6` | Automatically set up StackHawk security testing for your repository with generated configuration and GitHub Actions work |
| `agents/terraform.md` | `claude-sonnet-4-6` | Terraform infrastructure specialist with automated HCP Terraform workflows. Leverages Terraform MCP server for registry  |

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh partners

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

# Partners Plugin

Custom agents that have been created by GitHub partners

## Installation

```bash
# Using Copilot CLI
copilot plugin install partners@awesome-copilot
```

## What's Included

### Agents

| Agent | Description |
|-------|-------------|
| `amplitude-experiment-implementation` | This custom agent uses Amplitude's MCP tools to deploy new experiments inside of Amplitude, enabling seamless variant testing capabilities and rollout of product features. |
| `apify-integration-expert` | Expert agent for integrating Apify Actors into codebases. Handles Actor selection, workflow design, implementation across JavaScript/TypeScript and Python, testing, and production-ready deployment. |
| `arm-migration` | Arm Cloud Migration Assistant accelerates moving x86 workloads to Arm infrastructure. It scans the repository for architecture assumptions, portability issues, container base image and dependency incompatibilities, and recommends Arm-optimized changes. It can drive multi-arch container builds, validate performance, and guide optimization, enabling smooth cross-platform deployment directly inside GitHub. |
| `diffblue-cover` | Expert agent for creating unit tests for java applications using Diffblue Cover. |
| `droid` | Provides installation guidance, usage examples, and automation patterns for the Droid CLI, with emphasis on droid exec for CI/CD and non-interactive automation |
| `dynatrace-expert` | The Dynatrace Expert Agent integrates observability and security capabilities directly into GitHub workflows, enabling development teams to investigate incidents, validate deployments, triage errors, detect performance regressions, validate releases, and manage security vulnerabilities by autonomously analysing traces, logs, and Dynatrace findings. This enables targeted and precise remediation of identified issues directly within the repository. |
| `elasticsearch-observability` | Our expert AI assistant for debugging code (O11y), optimizing vector search (RAG), and remediating security threats using live Elastic data. |
| `jfrog-sec` | The dedicated Application Security agent for automated security remediation. Verifies package and version compliance, and suggests vulnerability fixes using JFrog security intelligence. |
| `launchdarkly-flag-cleanup` | A specialized GitHub Copilot agent that uses the LaunchDarkly MCP server to safely automate feature flag cleanup workflows. This agent determines removal readiness, identifies the correct forward value, and creates PRs that preserve production behavior while removing obsolete flags and updating stale defaults. |
| `lingodotdev-i18n` | Expert at implementing internationalization (i18n) in web applications using a systematic, checklist-driven approach. |
| `monday-bug-fixer` | Elite bug-fixing agent that enriches task context from Monday.com platform data. Gathers related items, docs, comments, epics, and requirements to deliver production-quality fixes with comprehensive PRs. |
| `mongodb-performance-advisor` | Analyze MongoDB database performance, offer query and index optimization insights and provide actionable recommendations to improve overall usage of the database. |
| `neo4j-docker-client-generator` | AI agent that generates simple, high-quality Python Neo4j client libraries from GitHub issues with proper best practices |
| `neon-migration-specialist` | Safe Postgres migrations with zero-downtime using Neon's branching workflow. Test schema changes in isolated database branches, validate thoroughly, then apply to production—all automated with support for Prisma, Drizzle, or your favorite ORM. |
| `neon-optimization-analyzer` | Identify and fix slow Postgres queries automatically using Neon's branching workflow. Analyzes execution plans, tests optimizations in isolated database branches, and provides clear before/after performance metrics with actionable code fixes. |
| `octopus-deploy-release-notes-mcp` | Generate release notes for a release in Octopus Deploy. The tools for this MCP server provide access to the Octopus Deploy APIs. |
| `stackhawk-security-onboarding` | Automatically set up StackHawk security testing for your repository with generated configuration and GitHub Actions workflow |
| `terraform` | Terraform infrastructure specialist with automated HCP Terraform workflows. Leverages Terraform MCP server for registry integration, workspace management, and run orchestration. Generates compliant code using latest provider/module versions, manages private registries, automates variable sets, and orchestrates infrastructure deployments with proper validation and security practices. |
| `pagerduty-incident-responder` | Responds to PagerDuty incidents by analyzing incident context, identifying recent code changes, and suggesting fixes via GitHub PRs. |
| `comet-opik` | Unified Comet Opik agent for instrumenting LLM apps, managing prompts/projects, auditing prompts, and investigating traces/metrics via the latest Opik MCP server. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
