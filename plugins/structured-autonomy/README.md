# Structured Autonomy — Claude Code Port

> Ported from GitHub Copilot plugin `structured-autonomy`
> Original: Awesome Copilot Community | License: MIT
> Converted: 2026-05-19

## What it does

A three-skill pipeline for structured, checkpointed feature delivery. Separates
planning, code generation, and execution into distinct phases with explicit stop
points — preventing the "big bang" implementation that's hard to review and easy
to get wrong.

## Pipeline

```
Plan → Generate → Implement

structured-autonomy-plan      → plans/{feature}/plan.md
structured-autonomy-generate  → plans/{feature}/implementation.md
structured-autonomy-implement → executes step-by-step, stops at STOP points
```

Each stage is a separate invocation. You review the output before proceeding.

## Skills

| Skill | File | Purpose |
|-------|------|---------|
| **Plan** | `skills/structured-autonomy-plan/SKILL.md` | Research codebase, break feature into commits, produce `plan.md` |
| **Generate** | `skills/structured-autonomy-generate/SKILL.md` | Read `plan.md`, research deeply, produce `implementation.md` with complete code |
| **Implement** | `skills/structured-autonomy-implement/SKILL.md` | Execute `implementation.md` step by step — stops at STOP/COMMIT points |

## Installation

```bash
install.sh structured-autonomy --skills
```

## Usage

```
# Step 1: Plan (describe your feature)
Use the structured-autonomy-plan skill. I want to add JWT authentication to the Express API.

# Review plans/{feature}/plan.md — adjust if needed

# Step 2: Generate implementation
Use the structured-autonomy-generate skill for the JWT authentication plan.

# Review plans/{feature}/implementation.md — check the code

# Step 3: Execute
Use the structured-autonomy-implement skill with the JWT authentication implementation.
```

## Key Design

**The implement skill stops at every STOP & COMMIT checkpoint.** You test the change,
stage, and commit before the agent continues. This gives you a clean commit history
and catches bugs early.

**The plan skill pauses for feedback before generating.** You review `plan.md` and
request changes before committing to the implementation.

## MCP Dependencies (Optional)

The plan and generate skills support Context7 for library documentation:

```json
// ~/.claude/settings.json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

Falls back to web_fetch if Context7 is not configured.

## Claude Code Notes

Key changes from the Copilot version:
- `#tool:runSubagent` → `Task` tool in Plan and Generate skills
- `#context7` → Context7 MCP note with web_fetch fallback
- "ResizeMe" project-specific references → generic bash/rg examples
- Implement skill required zero changes — already Claude Code native
