# clojure-interactive-programming — Claude Code Port

> Ported from `awesome-copilot/plugins/clojure-interactive-programming` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Tools for REPL-first Clojure workflows featuring Clojure instructions, the interactive programming chat mode and supporting guidance.

**Keywords:** `clojure`, `repl`, `interactive-programming`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/clojure-interactive-programming.md` | `claude-sonnet-4-6` | Expert Clojure pair programmer with REPL-first methodology, architectural oversight, and interactive problem-solving. En |

## Skills

- `skills/remember-interactive-programming/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh clojure-interactive-programming --skills

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

# Clojure Interactive Programming Plugin

Tools for REPL-first Clojure workflows featuring Clojure instructions, the interactive programming chat mode and supporting guidance.

## Installation

```bash
# Using Copilot CLI
copilot plugin install clojure-interactive-programming@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/clojure-interactive-programming:remember-interactive-programming` | A micro-prompt that reminds the agent that it is an interactive programmer. Works great in Clojure when Copilot has access to the REPL (probably via Backseat Driver). Will work with any system that has a live REPL that the agent can use. Adapt the prompt with any specific reminders in your workflow and/or workspace. |

### Agents

| Agent | Description |
|-------|-------------|
| `clojure-interactive-programming` | Expert Clojure pair programmer with REPL-first methodology, architectural oversight, and interactive problem-solving. Enforces quality standards, prevents workarounds, and develops solutions incrementally through live REPL evaluation before file modifications. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
