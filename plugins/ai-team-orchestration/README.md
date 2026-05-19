# AI Team Orchestration — Claude Code Port

> Ported from GitHub Copilot plugin `ai-team-orchestration` v1.0.0
> Original author: Denis Evdokimov | License: MIT
> Converted: 2026-05-19

## What it does

Sprint-driven multi-agent team with named roles. Based on a template that shipped a
30-game app in 5 days with zero human-written code. The human acts as the message bus
between parallel Claude Code sessions — Producer plans and coordinates, Dev builds,
QA tests and signs off.

## Architecture

This is NOT a Task-based orchestration pattern. Each agent runs in its own **dedicated
Claude Code session**. You open multiple terminal windows / tmux panes, each pointing
at its own repo clone, and carry messages between them yourself.

```
Session 1: @ai-team-producer  (plans, coordinates, merges)
Session 2: @ai-team-dev       (Nova / Sage / Milo — builds features)
Session 3: @ai-team-qa        (Ivy — tests, files bugs, signs off)
Session N: DevOps              (on demand only)
```

## Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| **Remy** (Producer) | `agents/ai-team-producer.md` | `claude-sonnet-4-6` | Sprint planning, PR merges, bug triage. NEVER writes code. |
| **Nova/Sage/Milo** (Dev) | `agents/ai-team-dev.md` | `claude-opus-4-6` | Full-stack implementation. Frontend, backend, visual. |
| **Ivy** (QA) | `agents/ai-team-qa.md` | `claude-sonnet-4-6` | Playtesting, E2E tests, bug filing, sprint sign-off. |

## Skills

| Skill | Purpose |
|-------|---------|
| `ai-team-orchestration` | Bootstrap docs, brainstorm templates, sprint templates, anti-patterns reference |

## Installation

```bash
install.sh ai-team-orchestration --skills
```

## Setup

```bash
# Clone separate repos for each team
git clone <repo> ~/projects/my-project-dev     # Dev session
git clone <repo> ~/projects/my-project-qa      # QA session

# Start Claude Code in each
cd ~/projects/my-project-dev && claude
cd ~/projects/my-project-qa  && claude

# Create PROJECT_BRIEF.md (single source of truth across all sessions)
# See skills/ai-team-orchestration/references/project-brief-template.md
```

## Usage

**Start a sprint** (say this in the Producer session):
```
Read PROJECT_BRIEF.md. Plan Sprint 1. Create docs/sprint-1/plan.md.
```

**Execute sprint** (say this in the Dev session):
```
Read PROJECT_BRIEF.md, then docs/sprint-1/plan.md. Execute Sprint 1.
First: git pull origin main && git checkout -b feature/sprint-1
```

**QA sign-off** (say this in the QA session after dev merges):
```
Read PROJECT_BRIEF.md. You are Ivy (QA). Sprint 1 is merged to main.
Do full playthrough. File bugs as GitHub Issues.
Write docs/qa/sprint-1-signoff.md.
```

## Reference Files (in skill)

- `references/project-brief-template.md` — required PROJECT_BRIEF.md structure
- `references/brainstorm-format.md` — multi-agent brainstorm prompts
- `references/sprint-plan-template.md` — sprint plan format
- `references/anti-patterns.md` — what not to do

## Claude Code Notes

**Key difference from Copilot version:** "VS Code window" → "Claude Code session". The
multi-session, parallel-team architecture is identical — each agent gets its own context
and repo clone; the human carries messages between them. The tool changes but the pattern
doesn't.
