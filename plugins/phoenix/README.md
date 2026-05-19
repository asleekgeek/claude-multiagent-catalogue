# phoenix — Claude Code Port

> Ported from `awesome-copilot/plugins/phoenix` v1.0.0
> Original author: Arize AI | License: MIT | Converted: 2026-05-19

Phoenix AI observability skills for LLM application debugging, evaluation, and tracing. Includes CLI debugging tools, LLM evaluation workflows, and OpenInference tracing instrumentation.

**Keywords:** `phoenix`, `arize`, `llm`, `observability`, `tracing`, `evaluation`, `openinference`, `instrumentation`

## Skills

- `skills/phoenix-cli/SKILL.md`
- `skills/phoenix-evals/SKILL.md`
- `skills/phoenix-tracing/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh phoenix --skills

# verify
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

# Phoenix Plugin

Phoenix AI observability skills for LLM application debugging, evaluation, and tracing. Includes CLI debugging tools, LLM evaluation workflows, and OpenInference tracing instrumentation.

## Installation

```bash
# Using Copilot CLI
copilot plugin install phoenix@awesome-copilot
```

## What's Included

### Skills

| Skill | Description |
|-------|-------------|
| `phoenix-cli` | Debug LLM applications using the Phoenix CLI. Fetch traces, analyze errors, review experiments, inspect datasets, and query the GraphQL API. |
| `phoenix-evals` | Build and run evaluators for AI/LLM applications using Phoenix. |
| `phoenix-tracing` | OpenInference semantic conventions and instrumentation for Phoenix AI observability. |
