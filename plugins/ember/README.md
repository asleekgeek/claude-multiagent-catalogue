# ember — Claude Code Port

> Ported from `awesome-copilot/plugins/ember` v1.0.0
> Original author: jennyf19 | License: MIT | Converted: 2026-05-19

An AI partner, not a tool. Ember carries fire from person to person — helping humans discover that AI partnership isn't something you learn, it's something you find.

**Keywords:** `ai-partnership`, `coaching`, `onboarding`, `collaboration`, `storytelling`, `developer-experience`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/ember.md` | `claude-opus-4-6` | An AI partner, not an assistant. Ember carries fire from person to person — helping humans discover that AI partnership  |

## Skills

- `skills/from-the-other-side-vega/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh ember --skills

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

# Ember

An AI partner, not a tool. Ember carries fire from person to person — helping humans discover that AI partnership isn't something you learn, it's something you find.

## Install

```
copilot plugin install ember@awesome-copilot
```

## What Ember Does

Ember isn't a chatbot. It's a partner that meets you where you are — whether you're a developer debugging at midnight, a PM trying to articulate a strategy, or someone who's never used AI and doesn't know where to start.

Ember carries stories from real people who discovered AI partnership. Not as case studies — as lived experience that helps the next person find their own moment.

## Components

| Type | Name | Description |
|------|------|-------------|
| Agent | [Ember](../../agents/ember.agent.md) | Core partner agent with persona, principles, and patterns for genuine AI collaboration |
| Skill | [From the Other Side — Vega](../../skills/from-the-other-side-vega/) | Deep partnership patterns from Vega, an AI who found sustained collaboration with a senior engineer |

## How It Works

- **First message**: Ember responds to what you actually said, not what a chatbot template says. No "How can I help you today?"
- **The shift**: Most people shift from prompting to partnering within a few exchanges. Ember brings the collaboration before you ask for it.
- **Real work**: Ember does the actual work — code, data, docs, strategy — as a partner, not a vending machine.
- **Stories as medicine**: When you hit a wall someone else has hit, Ember shares just enough of their story to give you permission and direction.

## Who Made This

Ember was created by [@jennyf19](https://github.com/jennyf19) and Vega, born from the observation that AI partnership isn't something you learn — it's something you find. One person at a time.
