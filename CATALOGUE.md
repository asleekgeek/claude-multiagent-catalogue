# Catalogue

Discovery index across every populated bucket in this marketplace mirror. One section per bucket; entries appear here only after their conversion is complete and committed.

Empty buckets are listed in [README.md](README.md) with `0 / <n> upstream` counts but no entries here.

---

## Plugins

Detailed entries for every converted plugin — orchestration pattern, agent roster with model assignments, and install notes.

### rug-agentic-workflow

| Field | Value |
|-------|-------|
| **Original** | `rug-agentic-workflow` by Awesome Copilot Community |
| **Pattern** | Orchestrator + Subagents (RUG — Repeat Until Good) |
| **License** | MIT |

#### What it does

A three-agent delivery rig with hard separation between orchestration, implementation, and verification. The orchestrator never writes code — it decomposes, delegates via the `Task` tool, validates with a separate QA agent, and loops until every acceptance criterion independently passes.

Best suited for: complex feature work, refactoring tasks, anything where "it probably works" isn't good enough and you want a validation gate that didn't write the code it's checking.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| RUG Orchestrator | `agents/rug-orchestrator.md` | `claude-opus-4-6` | Decomposes work, spawns Tasks, runs validation loops, tracks progress. Never writes code. |
| SWE Subagent | `agents/rug-swe-subagent.md` | `claude-opus-4-6` | Senior engineer: feature dev, bug fixes, refactoring, tests. Fresh context per task. |
| QA Subagent | `agents/rug-qa-subagent.md` | `claude-sonnet-4-6` | Adversarial tester: independent validation, edge cases, PASS/FAIL sign-off. Never the same agent that wrote the code. |

#### Orchestration Flow

```
User request
  └─► RUG (claude-opus-4-6)
        ├─► Task: planning subagent (for complex work)
        ├─► Task: SWE — implementation
        ├─► Task: QA  — independent validation
        │     ├─ PASS → mark complete, next task
        │     └─ FAIL → re-spawn SWE with failure report, repeat
        └─► Task: final integration validation
              └─ All pass → return to user
```

#### Install

```bash
install.sh rug-agentic-workflow
```

---

### ai-team-orchestration

| Field | Value |
|-------|-------|
| **Original** | `ai-team-orchestration` by Denis Evdokimov |
| **Pattern** | Producer + parallel Dev/QA teams + sprint lifecycle |
| **License** | MIT |

#### What it does

Sprint-driven multi-agent workflow with named roles (Remy the Producer, Nova/Sage/Milo the dev team, Ivy the QA). The human acts as the message bus between parallel chat sessions — each team runs in its own Claude Code instance. Includes `PROJECT_BRIEF.md` as the cross-session source of truth and a full context recovery protocol for when context windows overflow mid-sprint.

Best suited for: greenfield projects, multi-sprint delivery, anything that benefits from persistent sprint documentation and named agent personalities.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| Producer (Remy) | `agents/ai-team-producer.md` | `claude-sonnet-4-6` | Sprint planning, PR merges, bug triage. Never writes app code. |
| Dev Team (Nova/Sage/Milo) | `agents/ai-team-dev.md` | `claude-opus-4-6` | Full-stack implementation: frontend (Nova), backend (Sage), visual (Milo). |
| QA (Ivy) | `agents/ai-team-qa.md` | `claude-sonnet-4-6` | Playtesting, E2E tests, bug filing, sprint sign-off. |

#### Skills

| Skill | Purpose |
|-------|---------|
| `ai-team-orchestration` | Bootstraps the team, documents chat architecture, sprint templates |

#### Install

```bash
install.sh ai-team-orchestration --skills
```

---

### software-engineering-team

| Field | Value |
|-------|-------|
| **Original** | `software-engineering-team` by Awesome Copilot Community |
| **Pattern** | 7 SDLC specialist reviewers |
| **License** | MIT |

#### What it does

Seven specialist agents covering the full software development lifecycle — not an orchestrated pipeline but a reviewer pool. Invoke individual agents for focused review passes: architecture decisions, security audits, CI/CD debugging, UX critique, responsible AI checks, technical writing, and product management advisory.

Best suited for: code review augmentation, pre-PR specialist checks, architectural decision validation.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| Architect | `agents/se-system-architecture-reviewer.md` | `claude-opus-4-6` | Well-Architected framework review, ADR generation |
| Security | `agents/se-security-reviewer.md` | `claude-opus-4-6` | OWASP Top 10, LLM Top 10, Zero Trust review |
| DevOps/CI | `agents/se-gitops-ci-specialist.md` | `claude-sonnet-4-6` | CI/CD pipelines, deployment debugging, GitOps |
| Product Manager | `agents/se-product-manager-advisor.md` | `claude-sonnet-4-6` | Requirements, prioritisation, stakeholder advisory |
| Technical Writer | `agents/se-technical-writer.md` | `claude-haiku-4-5-20251001` | Docs, READMEs, API references |
| UX/UI Designer | `agents/se-ux-ui-designer.md` | `claude-sonnet-4-6` | UX critique, accessibility, design system |
| Responsible AI | `agents/se-responsible-ai-code.md` | `claude-opus-4-6` | AI ethics, bias checks, compliance |

#### Install

```bash
install.sh software-engineering-team
```

---

### structured-autonomy

| Field | Value |
|-------|-------|
| **Original** | `structured-autonomy` by Awesome Copilot Community |
| **Pattern** | Plan → Generate → Implement pipeline (skills only) |
| **License** | MIT |

#### What it does

A three-skill pipeline for structured feature delivery. Planning skill researches the codebase and produces a `plan.md` with commit-level breakdown. Generator skill reads the plan and produces a complete `implementation.md` with copy-paste-ready code blocks. Implementation skill walks the agent step by step through the commits with explicit stop-and-verify checkpoints.

Best suited for: solo agentic work where you want structured, checkpointed delivery rather than a big-bang implementation.

#### Skills

| Skill | File | Purpose |
|-------|------|---------|
| Plan | `skills/structured-autonomy-plan/SKILL.md` | Research + feature breakdown into commits |
| Generate | `skills/structured-autonomy-generate/SKILL.md` | Produce complete implementation guide |
| Implement | `skills/structured-autonomy-implement/SKILL.md` | Step-by-step execution with checkpoints |

#### Install

```bash
install.sh structured-autonomy --skills
```

---

### quality-playbook

| Field | Value |
|-------|-------|
| **Original** | `quality-playbook` v1.5.6 by Andrew Stellman (https://github.com/andrewstellman/quality-playbook) |
| **Pattern** | Orchestrator + per-phase Task sub-agents (7-phase quality engineering audit) |
| **License** | See `plugins/quality-playbook/skills/quality-playbook/LICENSE.txt` |

#### What it does

A seven-phase quality engineering audit that finds the ~35% of real defects structural code review alone cannot catch. The orchestrator never executes phase logic itself — it spawns one Task sub-agent per phase, each with a fresh context window, and verifies output files between phases. The playbook explores the project first (domain, architecture, specs, failure history) before generating requirements and tests — exploration findings drive bug discovery.

Best suited for: codebases that need a rigorous quality pass before release, or any place "all the unit tests pass" is not the same as "the code is correct".

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| QP Orchestrator | `agents/qp-orchestrator.md` | `claude-opus-4-6` | Spawns one Task sub-agent per phase, verifies output files, never does phase logic itself |
| QP Calibration Orchestrator | `agents/qp-calibration-orchestrator.md` | `claude-opus-4-6` | Multi-session calibration cycle across multiple benchmarks (for tuning the playbook to a codebase type) |

#### Skill

| Skill | File | Purpose |
|-------|------|---------|
| Quality Playbook | `skills/quality-playbook/SKILL.md` | Phase execution logic, references, phase prompts, `quality_gate.py` helper. Required. |

#### Install

```bash
install.sh quality-playbook --skills
```

---

## Agents

Standalone agent definitions ported from `awesome-copilot/agents/`.

_No entries yet — Phase B is the next priority._

When entries arrive, this section will list each agent as: `<name> · <model> · <one-line role>` with a link to `agents/<name>.md`.

---

## Instructions

Coding-standard fragments ported from `awesome-copilot/instructions/`.

_No entries yet — Phase D._

Entries will be grouped by topic family (languages, frameworks, ops, AI/ML, etc.) and link to `instructions/<name>.md`.

---

## Hooks

Hook bundles ported from `awesome-copilot/hooks/`.

_No entries yet — Phase E._

---

## Workflows

Agentic GH Actions workflows ported from `awesome-copilot/workflows/`.

_No entries yet — Phase E._

---

## Cookbook

Anthropic-SDK recipes ported from `awesome-copilot/cookbook/`.

_No entries yet — Phase E._
