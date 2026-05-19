# csharp-dotnet-development — Claude Code Port

> Ported from `awesome-copilot/plugins/csharp-dotnet-development` v1.1.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Essential prompts, instructions, and chat modes for C# and .NET development including testing, documentation, and best practices.

**Keywords:** `csharp`, `dotnet`, `aspnet`, `testing`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/expert-dotnet-software-engineer.md` | `claude-sonnet-4-6` | Provide expert .NET software engineering guidance using modern software design patterns. |

## Skills

- `skills/aspnet-minimal-api-openapi/SKILL.md`
- `skills/csharp-async/SKILL.md`
- `skills/csharp-mstest/SKILL.md`
- `skills/csharp-nunit/SKILL.md`
- `skills/csharp-tunit/SKILL.md`
- `skills/csharp-xunit/SKILL.md`
- `skills/dotnet-best-practices/SKILL.md`
- `skills/dotnet-upgrade/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh csharp-dotnet-development --skills

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

# C# .NET Development Plugin

Essential prompts, instructions, and chat modes for C# and .NET development including testing, documentation, and best practices.

## Installation

```bash
# Using Copilot CLI
copilot plugin install csharp-dotnet-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/csharp-dotnet-development:csharp-async` | Get best practices for C# async programming |
| `/csharp-dotnet-development:aspnet-minimal-api-openapi` | Create ASP.NET Minimal API endpoints with proper OpenAPI documentation |
| `/csharp-dotnet-development:csharp-xunit` | Get best practices for XUnit unit testing, including data-driven tests |
| `/csharp-dotnet-development:csharp-nunit` | Get best practices for NUnit unit testing, including data-driven tests |
| `/csharp-dotnet-development:csharp-mstest` | Get best practices for MSTest 3.x/4.x unit testing, including modern assertion APIs and data-driven tests |
| `/csharp-dotnet-development:csharp-tunit` | Get best practices for TUnit unit testing, including data-driven tests |
| `/csharp-dotnet-development:dotnet-best-practices` | Ensure .NET/C# code meets best practices for the solution/project. |
| `/csharp-dotnet-development:dotnet-upgrade` | Ready-to-use prompts for comprehensive .NET framework upgrade analysis and execution |

### Agents

| Agent | Description |
|-------|-------------|
| `expert-dotnet-software-engineer` | Provide expert .NET software engineering guidance using modern software design patterns. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
