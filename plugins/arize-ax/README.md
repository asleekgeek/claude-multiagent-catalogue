# arize-ax — Claude Code Port

> Ported from `awesome-copilot/plugins/arize-ax` v1.0.0
> Original author: Arize AI | License: MIT | Converted: 2026-05-19

Arize AX platform skills for LLM observability, evaluation, and optimization. Includes trace export, instrumentation, datasets, experiments, evaluators, AI provider integrations, annotations, prompt optimization, and deep linking to the Arize UI.

**Keywords:** `arize`, `llm`, `observability`, `tracing`, `evaluation`, `instrumentation`, `datasets`, `experiments`, `prompt-optimization`

## Skills

- `skills/arize-ai-provider-integration/SKILL.md`
- `skills/arize-annotation/SKILL.md`
- `skills/arize-dataset/SKILL.md`
- `skills/arize-evaluator/SKILL.md`
- `skills/arize-experiment/SKILL.md`
- `skills/arize-instrumentation/SKILL.md`
- `skills/arize-link/SKILL.md`
- `skills/arize-prompt-optimization/SKILL.md`
- `skills/arize-trace/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh arize-ax --skills

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

# Arize AX Plugin

Arize AX platform skills for LLM observability, evaluation, and optimization. Includes trace export, instrumentation, datasets, experiments, evaluators, AI provider integrations, annotations, prompt optimization, and deep linking to the Arize UI.

## Installation

```bash
# Using Copilot CLI
copilot plugin install arize-ax@awesome-copilot
```

## What's Included

### Skills

| Skill | Description |
|-------|-------------|
| `arize-trace` | Export and analyze Arize traces and spans for debugging LLM applications using the ax CLI. |
| `arize-instrumentation` | Add Arize AX tracing to applications using a two-phase agent-assisted workflow. |
| `arize-dataset` | Create, manage, and query versioned evaluation datasets using the ax CLI. |
| `arize-experiment` | Run experiments against datasets and compare results using the ax CLI. |
| `arize-evaluator` | Create and run LLM-as-judge evaluators for automated scoring of spans and experiments. |
| `arize-ai-provider-integration` | Store and manage LLM provider credentials for use with evaluators. |
| `arize-annotation` | Create annotation configs and bulk-apply human feedback labels to spans. |
| `arize-prompt-optimization` | Optimize LLM prompts using production trace data, evaluations, and annotations. |
| `arize-link` | Generate deep links to the Arize UI for traces, spans, sessions, datasets, and more. |
