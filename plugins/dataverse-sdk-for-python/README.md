# dataverse-sdk-for-python — Claude Code Port

> Ported from `awesome-copilot/plugins/dataverse-sdk-for-python` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive collection for building production-ready Python integrations with Microsoft Dataverse. Includes official documentation, best practices, advanced features, file operations, and code generation prompts.

**Keywords:** `dataverse`, `python`, `integration`, `sdk`

## Skills

- `skills/dataverse-python-advanced-patterns/SKILL.md`
- `skills/dataverse-python-production-code/SKILL.md`
- `skills/dataverse-python-quickstart/SKILL.md`
- `skills/dataverse-python-usecase-builder/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh dataverse-sdk-for-python --skills

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

# Dataverse SDK for Python Plugin

Comprehensive collection for building production-ready Python integrations with Microsoft Dataverse. Includes official documentation, best practices, advanced features, file operations, and code generation prompts.

## Installation

```bash
# Using Copilot CLI
copilot plugin install dataverse-sdk-for-python@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/dataverse-sdk-for-python:dataverse-python-quickstart` | Generate Python SDK setup + CRUD + bulk + paging snippets using official patterns. |
| `/dataverse-sdk-for-python:dataverse-python-advanced-patterns` | Generate production code for Dataverse SDK using advanced patterns, error handling, and optimization techniques. |
| `/dataverse-sdk-for-python:dataverse-python-production-code` | Generate production-ready Python code using Dataverse SDK with error handling, optimization, and best practices |
| `/dataverse-sdk-for-python:dataverse-python-usecase-builder` | Generate complete solutions for specific Dataverse SDK use cases with architecture recommendations |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
