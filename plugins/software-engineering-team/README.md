# Software Engineering Team — Claude Code Port

> Ported from GitHub Copilot plugin `software-engineering-team`
> Original: Awesome Copilot Community | License: MIT
> Converted: 2026-05-19

## What it does

Seven SDLC specialist reviewers — not a pipeline, but a pool. Invoke individual agents
for targeted review passes: architecture decisions, security audits, CI/CD debugging,
UX critique, responsible AI checks, technical writing, product management advisory.

Use these per-PR or before major decisions. Each agent is standalone — invoke the ones
relevant to your current task.

## Agent Roster

| Agent | File | Model | Specialty |
|-------|------|-------|-----------|
| **Architect** | `agents/se-architect.md` | `claude-opus-4-6` | Well-Architected review, ADRs, database/deployment decisions |
| **Security** | `agents/se-security.md` | `claude-opus-4-6` | OWASP Top 10, LLM Top 10, Zero Trust, code security review |
| **DevOps/CI** | `agents/se-devops-ci.md` | `claude-sonnet-4-6` | GitHub Actions, Kubernetes, deployment debugging, GitOps |
| **Product Manager** | `agents/se-product-manager.md` | `claude-sonnet-4-6` | GitHub Issues, epics, user stories, feature prioritisation |
| **Technical Writer** | `agents/se-technical-writer.md` | `claude-haiku-4-5-20251001` | Docs, READMEs, ADRs, blog posts, API references |
| **UX Designer** | `agents/se-ux-designer.md` | `claude-sonnet-4-6` | JTBD analysis, user journeys, Figma-ready flow specs |
| **Responsible AI** | `agents/se-responsible-ai.md` | `claude-opus-4-6` | Bias testing, WCAG accessibility, privacy, RAI-ADRs |

## Installation

```bash
install.sh software-engineering-team
```

## Usage Examples

```
# Pre-PR architecture review
@se-architect — review the data layer design in src/db/

# Security audit before release
@se-security — review the auth implementation in src/auth/

# CI debugging
@se-devops-ci — the GitHub Actions deploy workflow is timing out, investigate

# Feature request → GitHub Issues
@se-product-manager — turn this brief into a GitHub Issue with acceptance criteria

# Write a README
@se-technical-writer — write a README for the payments module

# UX research before design work
@se-ux-designer — map the user journey for the onboarding flow

# AI feature check
@se-responsible-ai — review the recommendation engine for bias
```

## Model Rationale

Heavy tier (`claude-opus-4-6`) for high-stakes review (architecture decisions,
security vulnerabilities, responsible AI compliance). Balanced tier (`claude-sonnet-4-6`)
for coordination and design work. Light tier (`claude-haiku-4-5-20251001`) for
documentation, which needs quality writing but not deep reasoning.

## Claude Code Notes

All bodies were 95%+ Claude Code compatible. Adaptations were surgical:
- `tools` frontmatter dropped from all 7 agents
- `model: GPT-5` → Claude model per tier mapping
- `githubRepo` / `create_issue` tools → `gh issue create` CLI (used in se-product-manager)
- `problems` tool → bash lint/type-check commands (used in se-security)
- `terminalCommand` → bash (was already using bash commands in body)
- `codebase` → bash (grep, find, rg — no body changes needed)
