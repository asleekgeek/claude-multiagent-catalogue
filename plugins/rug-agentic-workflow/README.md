# RUG Agentic Workflow — Claude Code Port

> Ported from GitHub Copilot plugin `rug-agentic-workflow` v1.0.0
> Original: Awesome Copilot Community | License: MIT
> Converted: 2026-05-19

## What This Is

A three-agent orchestration rig built around the **RUG protocol** (Repeat Until Good).
The core pattern: a pure orchestrator that never writes code, implementation and QA
sub-agents that each get a fresh context window, and a mandatory validation loop after
every work step.

This is the cleanest multi-agent separation-of-concerns model in the awesome-copilot
catalogue — the orchestrator's context window is fully dedicated to reasoning and
coordination, not polluted by implementation details.

## Agent Team

| Agent | File | Model | Role |
|---|---|---|---|
| **RUG** (Orchestrator) | `agents/rug-orchestrator.md` | `claude-opus-4-6` | Decomposes tasks, spawns sub-agents via Task, runs validation loops, tracks progress in TodoManager. Never writes code. |
| **SWE** | `agents/rug-swe-subagent.md` | `claude-opus-4-6` | Senior engineer: feature dev, bug fixes, refactoring, tests. Returns structured completion report. |
| **QA** | `agents/rug-qa-subagent.md` | `claude-sonnet-4-6` | Adversarial tester: independent validation, edge-case hunting, bug reports, PASS/FAIL sign-off. Never the same agent that did the implementation. |

## Orchestration Pattern

```
User Request
     │
     ▼
RUG (Orchestrator) — claude-opus-4-6
  │  Creates TodoManager task list
  │  Spawns planning Task first (for complex work)
  │
  ├─► Task: SWE sub-agent (implementation)
  │         Fresh context window, detailed prompt
  │         Returns structured completion report
  │
  ├─► Task: Validation sub-agent
  │         Reads files independently, checks criteria
  │         Returns PASS or FAIL with evidence
  │         
  │   [If FAIL: re-spawn SWE with failure context, repeat]
  │   [If PASS: mark todo complete, move to next task]
  │
  └─► Task: Final integration validation
            Confirms all tasks work together
            RUG returns to user only when this PASSES
```

## Installation

```bash
# Install agents to Claude Code
cp agents/*.md ~/.claude/agents/

# Verify installation
ls ~/.claude/agents/ | grep rug
# Should show: rug-orchestrator.md, rug-qa-subagent.md, rug-swe-subagent.md
```

No skills to install — this plugin is agent-only.

## Usage

Invoke via Claude Code by describing your task to the orchestrator:

```
Use the rug-orchestrator agent to implement [feature/task].
```

Or reference it in a Claude Code session:

```
@rug-orchestrator — I need to add JWT authentication to this Express API.
Requirements:
- Protect all /api/* routes
- Use RS256 signing with keys from env vars
- Return 401 with standard error format on invalid tokens
```

The orchestrator will decompose the work, spawn SWE and QA sub-agents via Task,
run validation loops, and return only when everything independently passes.

## MCP Dependencies

None required. This plugin works with base Claude Code tooling:
- `Task` tool — sub-agent spawning (built-in)
- `TodoManager` — progress tracking (built-in)
- `bash` — all file/terminal operations (built-in)

## Claude Code Notes

**Critical behavioural difference from Copilot version:**

In Copilot, `runSubagent` is a first-class tool with its own API. In Claude Code,
the equivalent is the `Task` tool. The semantics are identical (fresh context window,
pass-by-value for all context, read the returned result), but the invocation pattern
differs. The converted agent files reflect this throughout.

**TodoManager vs manage_todo_list:**

Direct equivalent. Claude Code's `TodoManager` has the same create/update/complete
semantics as Copilot's `manage_todo_list`. No behavioural difference.

**Cross-session persistence:**

The orchestrator now includes guidance to mirror TodoManager state to `TODO.md` in
the project root. This is an enhancement over the original — Copilot's `manage_todo_list`
persisted via the Copilot session; Claude Code's TodoManager is in-context only.
