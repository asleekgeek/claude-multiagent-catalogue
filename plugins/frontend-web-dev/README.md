# frontend-web-dev — Claude Code Port

> Ported from `awesome-copilot/plugins/frontend-web-dev` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Essential prompts, instructions, and chat modes for modern frontend web development including React, Angular, Vue, TypeScript, and CSS frameworks.

**Keywords:** `frontend`, `web`, `react`, `typescript`, `javascript`, `css`, `html`, `angular`, `vue`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/electron-angular-native.md` | `claude-sonnet-4-6` | Code Review Mode tailored for Electron app with Node.js backend (main), Angular frontend (render), and native integratio |
| `agents/expert-react-frontend-engineer.md` | `claude-sonnet-4-6` | Expert React 19.2 frontend engineer specializing in modern hooks, Server Components, Actions, TypeScript, and performanc |

## Skills

- `skills/playwright-explore-website/SKILL.md`
- `skills/playwright-generate-test/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh frontend-web-dev --skills

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

# Frontend Web Development Plugin

Essential prompts, instructions, and chat modes for modern frontend web development including React, Angular, Vue, TypeScript, and CSS frameworks.

## Installation

```bash
# Using Copilot CLI
copilot plugin install frontend-web-dev@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/frontend-web-dev:playwright-explore-website` | Website exploration for testing using Playwright MCP |
| `/frontend-web-dev:playwright-generate-test` | Generate a Playwright test based on a scenario using Playwright MCP |

### Agents

| Agent | Description |
|-------|-------------|
| `expert-react-frontend-engineer` | Expert React 19.2 frontend engineer specializing in modern hooks, Server Components, Actions, TypeScript, and performance optimization |
| `electron-angular-native` | Code Review Mode tailored for Electron app with Node.js backend (main), Angular frontend (render), and native integration layer (e.g., AppleScript, shell, or native tooling). Services in other repos are not reviewed here. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
