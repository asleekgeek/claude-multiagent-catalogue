# testing-automation — Claude Code Port

> Ported from `awesome-copilot/plugins/testing-automation` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive collection for writing tests, test automation, and test-driven development including unit tests, integration tests, and end-to-end testing strategies.

**Keywords:** `testing`, `tdd`, `automation`, `unit-tests`, `integration`, `playwright`, `jest`, `nunit`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/playwright-tester.md` | `claude-sonnet-4-6` | Testing mode for Playwright tests |
| `agents/tdd-green.md` | `claude-sonnet-4-6` | Implement minimal code to satisfy GitHub issue requirements and make failing tests pass without over-engineering. |
| `agents/tdd-red.md` | `claude-sonnet-4-6` | Guide test-first development by writing failing tests that describe desired behaviour from GitHub issue context before i |
| `agents/tdd-refactor.md` | `claude-sonnet-4-6` | Improve code quality, apply security best practices, and enhance design whilst maintaining green tests and GitHub issue  |

## Skills

- `skills/ai-prompt-engineering-safety-review/SKILL.md`
- `skills/csharp-nunit/SKILL.md`
- `skills/java-junit/SKILL.md`
- `skills/playwright-explore-website/SKILL.md`
- `skills/playwright-generate-test/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh testing-automation --skills

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

# Testing & Test Automation Plugin

Comprehensive collection for writing tests, test automation, and test-driven development including unit tests, integration tests, and end-to-end testing strategies.

## Installation

```bash
# Using Copilot CLI
copilot plugin install testing-automation@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/testing-automation:playwright-explore-website` | Website exploration for testing using Playwright MCP |
| `/testing-automation:playwright-generate-test` | Generate a Playwright test based on a scenario using Playwright MCP |
| `/testing-automation:csharp-nunit` | Get best practices for NUnit unit testing, including data-driven tests |
| `/testing-automation:java-junit` | Get best practices for JUnit 5 unit testing, including data-driven tests |
| `/testing-automation:ai-prompt-engineering-safety-review` | Comprehensive AI prompt engineering safety review and improvement prompt. Analyzes prompts for safety, bias, security vulnerabilities, and effectiveness while providing detailed improvement recommendations with extensive frameworks, testing methodologies, and educational content. |

### Agents

| Agent | Description |
|-------|-------------|
| `tdd-red` | Guide test-first development by writing failing tests that describe desired behaviour from GitHub issue context before implementation exists. |
| `tdd-green` | Implement minimal code to satisfy GitHub issue requirements and make failing tests pass without over-engineering. |
| `tdd-refactor` | Improve code quality, apply security best practices, and enhance design whilst maintaining green tests and GitHub issue compliance. |
| `playwright-tester` | Testing mode for Playwright tests |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
