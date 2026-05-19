# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A **catalogue of multi-agent plugins and skills for Claude Code**, ported from the GitHub Copilot `awesome-copilot` ecosystem. There is no application code — every artefact is a markdown agent definition, a `SKILL.md`, or supporting reference docs. The repo's purpose is twofold:

1. Host fully-converted **plugins** (under [plugins/](plugins/)) ready to install into any project's `.claude/` directory.
2. Document the **conversion process** itself (under [copilot-to-claude-multiagent/](copilot-to-claude-multiagent/)) as a reusable skill, so further plugins can be ported consistently.

## Common commands

There is no build, test, or lint step — everything is markdown. The only executable is the installer.

```bash
# List available plugins and what each contains
./install.sh --list

# Install a plugin's agents into the current project's .claude/agents/
./install.sh <plugin-name>

# Also install the plugin's skills into .claude/skills/
./install.sh <plugin-name> --skills

# Help
./install.sh --help
```

`install.sh` copies from [plugins/&lt;name&gt;/agents/](plugins/) and (with `--skills`) [plugins/&lt;name&gt;/skills/](plugins/) into the caller's working directory `.claude/` tree. It overwrites existing files of the same name and prints a per-file confirmation. It does **not** install from the top-level [agents/](agents/) or [skills/](skills/) directories — only from a named plugin under [plugins/](plugins/).

To verify an install: `ls .claude/agents/` (and `ls .claude/skills/` when `--skills` was passed).

## Repository layout

```
plugins/<plugin-name>/        Installable plugin (agents/ and/or skills/ + README.md)
skills/                       Standalone pool of ~330+ individual skills + STATUS.md
copilot-to-claude-multiagent/ The conversion skill itself (SKILL.md + references/)
install.sh                    Installer (only reads plugins/)
CATALOGUE.md                  Hand-maintained index of converted plugins (must be updated per port)
README.md                     Repo-level README (catalogue overview + quickstart)
```

### Currently converted plugins (see [CATALOGUE.md](CATALOGUE.md))

| Plugin | Pattern | Components |
|---|---|---|
| [rug-agentic-workflow](plugins/rug-agentic-workflow/) | Orchestrator + SWE + QA subagents via `Task` | agents only |
| [ai-team-orchestration](plugins/ai-team-orchestration/) | Producer / Dev / QA across separate Claude Code sessions | agents + skill |
| [software-engineering-team](plugins/software-engineering-team/) | Pool of 7 SDLC specialist reviewers (no orchestration) | agents only |
| [structured-autonomy](plugins/structured-autonomy/) | Plan → Generate → Implement skill pipeline | skills only |
| [quality-playbook](plugins/quality-playbook/) | 7-phase quality audit orchestrator with per-phase Task sub-agents | agents + skill |

## How a new plugin gets added

The full procedure lives in [copilot-to-claude-multiagent/SKILL.md](copilot-to-claude-multiagent/SKILL.md) (phases 1–4 with a quality gate). Invoke it whenever porting a Copilot plugin. Key conventions enforced by the skill:

### Agent file frontmatter — strict

```yaml
---
name: lowercase-hyphenated-name      # no quotes
description: >
  Preserve original intent. Strip Copilot-specific phrasing.
model: claude-opus-4-6                # see model mapping below
---
```

- **Drop** the Copilot `tools:` key — Claude Code agents have full tool access.
- **Drop** the Copilot `agents:` key — express cross-agent references in body text instead.
- Body must end with a `## Claude Code Notes` section documenting every adaptation made.

### Model mapping (see [references/model-mapping.md](copilot-to-claude-multiagent/references/model-mapping.md))

| Tier | Model ID | Use for |
|---|---|---|
| Heavy | `claude-opus-4-6` | Orchestrators, architects, security, complex implementers |
| Balanced (default) | `claude-sonnet-4-6` | Most implementation, QA, research, design, docs |
| Light | `claude-haiku-4-5-20251001` | High-frequency subtasks, formatting, light research |

### Body-level transformations (see [references/conversion-patterns.md](copilot-to-claude-multiagent/references/conversion-patterns.md))

- `#tool:runSubagent` → `Task` tool with a self-contained prompt (parent context, task, scope, acceptance criteria, return contract).
- `#context7` → Context7 MCP note.
- `manage_todo_list` → `TodoManager` tool.
- VS Code UI patterns → bash equivalents or "user action required" notes.
- GitHub Issue/PR workflows → `gh` CLI commands.

### Output location and catalogue update

Converted plugins land at `plugins/<plugin-name>/` with `agents/`, optional `skills/`, and a `README.md`. **Every port must also append an entry to [CATALOGUE.md](CATALOGUE.md)** describing pattern, agent roster with model assignments, and install command — `install.sh --list` and the catalogue are the only discovery surfaces.

## The `skills/` directory vs. plugin skills

The top-level [skills/](skills/) directory holds ~330+ standalone skills lifted from the upstream marketplace. An audit in [skills/STATUS.md](skills/STATUS.md) confirms the pool is structurally Claude-Code compatible — the handful of raw-Copilot entries (`#tool:` directives, duplicate `structured-autonomy-*` skills, `runSubagent` calls) have been removed or converted. The pool is **not** orchestrated and individual skills have not been run-tested, so treat each as a copy-paste candidate rather than installable inventory. Plugin skills (curated, orchestration-aware) live under [plugins/&lt;plugin-name&gt;/skills/&lt;skill-name&gt;/SKILL.md](plugins/) and are what `install.sh --skills` copies. `install.sh` does not read the top-level pool.

## Git conventions

Commit messages observed: `feat: <summary>`, `Update <thing>`. The user's global instruction is to **omit the `Co-Authored-By: Claude` trailer** from commits in this repo.
