# Quality Playbook — Claude Code Port

> Ported from GitHub Copilot plugin `quality-playbook` v1.5.6
> Original author: Andrew Stellman | https://github.com/andrewstellman/quality-playbook
> License: See skills/quality-playbook/LICENSE.txt
> Converted: 2026-05-19

## What it does

A seven-phase quality engineering system that finds the **35% of real defects that
structural code review alone cannot catch**. Works on any language and any codebase.

Unlike test stub generators that mechanically scan source code, the playbook explores
the project first — understanding domain, architecture, specs, and failure history —
then generates a quality system grounded in what it finds.

**Phase sequence:**

```
Phase 1: Explore      → EXPLORATION.md (domain knowledge, risk analysis)
Phase 2: Generate     → Requirements, functional tests, review protocol
Phase 3: Code Review  → Three-pass review, regression tests, patches
Phase 4: Spec Audit   → Council of Three (3 independent AI auditors)
Phase 5: Reconcile    → TDD red-green cycle, completeness report
Phase 6: Verify       → Self-check benchmarks, consistency validation
Phase 7: Present      → Interactive: drill down, iterate, improve
```

The critical insight: **exploration findings → requirements → bug discovery**.
A shallow Phase 1 produces abstract requirements. Abstract requirements miss bugs.

## Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| **QP Orchestrator** | `agents/qp-orchestrator.md` | `claude-opus-4-6` | Spawns one Task sub-agent per phase, verifies output files, never does phase logic itself |
| **QP Calibration Orchestrator** | `agents/qp-calibration-orchestrator.md` | `claude-opus-4-6` | Multi-session calibration cycle driver across multiple benchmarks — for tuning the playbook to a specific codebase type |

## Skill

The phase-execution logic lives in `skills/quality-playbook/SKILL.md`. The orchestrator
agent loads it and passes it to each phase sub-agent via Task.

## Installation

```bash
# Navigate to your project
cd ~/my-project

# Install agents
mkdir -p .claude/agents
cp /path/to/claude-multiagent-catalogue/plugins/quality-playbook/agents/*.md .claude/agents/

# Install the skill (required — orchestrator reads it for phase sub-agents)
mkdir -p .claude/skills
cp -r /path/to/claude-multiagent-catalogue/plugins/quality-playbook/skills/quality-playbook \
       .claude/skills/

# Or use the install script
/path/to/claude-multiagent-catalogue/install.sh quality-playbook --skills

# Verify
ls .claude/agents/ | grep qp
ls .claude/skills/quality-playbook/
```

## Usage

From a Claude Code session in your project directory:

```
Run the quality playbook on this codebase.
```

Or target a specific directory:

```
@qp-orchestrator — run the quality playbook on src/payments/
```

For phase-by-phase execution (default — pauses between phases for review):

```
Start the quality playbook. Run phase by phase.
```

For a full automated run:

```
@qp-orchestrator — run the full playbook, all phases, on this repo.
```

## Calibration (advanced)

The calibration orchestrator tunes the playbook configuration for your codebase type
by running it against multiple benchmarks and applying lever adjustments:

```
@qp-calibration-orchestrator — start a calibration cycle on these benchmarks:
- src/payments/
- src/auth/
- src/api/
```

Full calibration takes ~4 hours for 8 benchmarks. The orchestrator spans multiple
Claude Code sessions — if it's interrupted, restart and it resumes from
`run_state.jsonl`.

## External dependency for calibration

The calibration cycle uses `bin/run_playbook.py` from the upstream repo. If you need
it:

```bash
git clone https://github.com/andrewstellman/quality-playbook /tmp/qpb
cp -r /tmp/qpb/bin ./bin
cp -r /tmp/qpb/phase_prompts ./phase_prompts
cp -r /tmp/qpb/references ./references
```

The quality audit (phases 1-6) works without the runner. Only calibration needs it.

## MCP Dependencies

None. Uses Claude Code's built-in Task tool, bash, and file tools.

## Claude Code Notes

**What's different from the Copilot version:**

The `quality-playbook-claude.agent.md` file in the upstream repo was already written
explicitly for Claude Code — the author documented the exact failure patterns from
production use (the "casbin run"). The adaptation here is therefore minimal:

- `tools` frontmatter dropped (not applicable in Claude Code agent format)
- `model: inherit` → `model: claude-opus-4-6`
- "Agent tool" → "Task tool" (direct semantic equivalent)
- Skill path lookup updated to Claude Code's `.claude/skills/` convention
- `calibration_orchestrator.md` (a raw prompt template) converted to a proper agent
  definition with Claude Code-specific guidance on Task vs bash subprocess selection

All anti-rationalization guards, phase logic, and the casbin failure documentation are
preserved verbatim. This is intentional — the original is excellent engineering.
