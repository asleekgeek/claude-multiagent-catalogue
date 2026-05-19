# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A **Claude Code catalogue mirroring the upstream [`awesome-copilot`](https://github.com/github/awesome-copilot) marketplace**. There is no application code — every artefact is markdown (agent definitions, `SKILL.md` files, instruction fragments, hook bundles, workflow prompts, cookbook recipes) plus the conversion skill that defines how upstream artefacts become Claude Code-native.

### Scope note: repo name is legacy

The directory is called `claude-multiagent-catalogue` for historical reasons — the original conversion was scoped only to multi-agent orchestration rigs (5 of 67 upstream plugins). The current scope is the **full marketplace**: all seven upstream artefact buckets. Do not let the repo name narrow how you reason about scope.

## Common commands

There is no build, test, or lint step — everything is markdown. The only executable is the installer.

```bash
# List everything available across all buckets
./install.sh --list

# Bucket-specific listings
./install.sh --list-agents
./install.sh --list-instructions
./install.sh --list-hooks

# Install a plugin's agents into the current project's .claude/agents/
./install.sh <plugin-name>

# Also install the plugin's skills into .claude/skills/
./install.sh <plugin-name> --skills

# Install a single standalone agent / instruction / hook
./install.sh install-agent <name>
./install.sh install-instruction <name>
./install.sh install-hook <name>

# Help
./install.sh --help
```

`install.sh` copies from the corresponding top-level directory into the caller's working directory `.claude/` tree. It overwrites existing files of the same name and prints a per-file confirmation. Hooks copy scripts into `.claude/hooks/<bundle>/` and **print** the `claude-settings.json` fragment rather than auto-merging — hook configs execute commands on session events and silent merge is too dangerous.

To verify an install: `ls .claude/agents/`, `ls .claude/skills/`, `ls .claude/instructions/`, `ls .claude/hooks/`.

## Repository layout

```
agents/                       Standalone Claude Code agent files (0 / 211 upstream)
instructions/                 Coding-standard fragments with applyTo metadata (0 / 183 upstream)
plugins/<plugin-name>/        Installable plugins — agents/ and/or skills/ + README.md (5 / 67 upstream)
skills/                       Standalone skill pool — ~330+ entries + STATUS.md (335 / 338 upstream)
hooks/<bundle-name>/          Hook bundles — scripts + claude-settings.json fragment (0 / 6 upstream)
workflows/                    Agentic GH Actions — <name>.md prompts + .github-action.yml runners (0 / 8 upstream)
cookbook/                     Anthropic-SDK recipes (0 / 3 upstream)
copilot-to-claude-multiagent/ The conversion skill itself (SKILL.md + references/)
install.sh                    Installer (handles every bucket above)
CATALOGUE.md                  Hand-maintained discovery index — one section per populated bucket
README.md                     Repo-level README (catalogue overview + quickstart)
```

### Currently populated buckets

| Bucket | Ported | Upstream | Phase |
|---|---|---|---|
| Agents | **211** | 211 | Phase B (complete) |
| Instructions | **183** | 183 | Phase D (complete) |
| Plugins | **67** | 67 | Phase C (complete) |
| Skills | 335 | 338 | (already complete) |
| Hooks | **6** | 6 | Phase E (complete) |
| Workflows | **8** | 8 | Phase E (complete) |
| Cookbook | **7** | 10 | Phase E (complete; 3 skipped per §16) |

**Full marketplace mirror complete.** Every upstream artefact type has a corresponding Claude Code-native home. The 3 skipped cookbook recipes (`community-samples`, `copilot-sdk-web-app`, `nodejs-agentic-issue-resolver`) are intentionally not ported per §16's case-by-case framework — they target the Copilot SDK with no clean Anthropic SDK analog.

### Plugins currently in `plugins/`

| Plugin | Pattern | Components |
|---|---|---|
| [rug-agentic-workflow](plugins/rug-agentic-workflow/) | Orchestrator + SWE + QA subagents via `Task` | agents only |
| [ai-team-orchestration](plugins/ai-team-orchestration/) | Producer / Dev / QA across separate Claude Code sessions | agents + skill |
| [software-engineering-team](plugins/software-engineering-team/) | Pool of 7 SDLC specialist reviewers (no orchestration) | agents only |
| [structured-autonomy](plugins/structured-autonomy/) | Plan → Generate → Implement skill pipeline | skills only |
| [quality-playbook](plugins/quality-playbook/) | 7-phase quality audit orchestrator with per-phase Task sub-agents | agents + skill |

Detailed catalogue entries — agent rosters, models, orchestration patterns — live in [CATALOGUE.md](CATALOGUE.md).

## How a new artefact gets ported

The full procedure lives in [copilot-to-claude-multiagent/SKILL.md](copilot-to-claude-multiagent/SKILL.md) (Phase 0 dispatcher → bucket-specific conversion → output → catalogue). Invoke it whenever porting from upstream. The skill handles all seven bucket types.

### Agent file frontmatter — strict

Whether the agent comes from `awesome-copilot/agents/` (standalone) or `awesome-copilot/plugins/*/agents/` (plugin-embedded), the output frontmatter is the same:

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
- Standalone-agent filename `CSharpExpert.agent.md` → `csharp-expert.md` (lowercase, hyphenated, no `.agent` suffix).
- Body ends with a `## Claude Code Notes` section documenting every adaptation made (skip if no adaptations were needed beyond filename and frontmatter normalisation).
- First line of body is an attribution comment: `> Ported from awesome-copilot/<upstream-path>`.

### Instructions file frontmatter

Preserve the upstream `applyTo:` glob in frontmatter as documentation. Claude Code does not enforce it natively, but it captures the upstream intent.

```yaml
---
applyTo: '**/*.ts,**/*.tsx'
description: >
  Short one-line summary.
---
```

### Model mapping (see [references/model-mapping.md](copilot-to-claude-multiagent/references/model-mapping.md))

| Tier | Model ID | Use for |
|---|---|---|
| Heavy | `claude-opus-4-6` | Orchestrators, architects, security, complex implementers |
| Balanced (default) | `claude-sonnet-4-6` | Most implementation, QA, research, design, docs |
| Light | `claude-haiku-4-5-20251001` | High-frequency subtasks, formatting, light research |

### Body-level transformations (see [references/conversion-patterns.md](copilot-to-claude-multiagent/references/conversion-patterns.md))

- `#tool:runSubagent` → `Task` tool with a self-contained prompt.
- `#context7` → Context7 MCP note.
- `manage_todo_list` → `TodoManager` tool.
- VS Code UI patterns → bash equivalents or "user action required" notes.
- GitHub Issue/PR workflows → `gh` CLI commands.
- Hook events (`sessionStart`, `preToolCall`, …) → Claude Code hook events (`SessionStart`, `PreToolUse`, …).

### Output location and catalogue update

Converted artefacts land at:

- `agents/<name>.md` for standalone agents
- `instructions/<name>.md` for instructions
- `plugins/<plugin-name>/` for plugins (agents/, optional skills/, optional instructions/, README.md, plugin.json)
- `skills/<skill-name>/SKILL.md` for skills
- `hooks/<bundle-name>/` for hook bundles
- `workflows/<name>.md` (+ optional `<name>.github-action.yml`) for workflows
- `cookbook/<recipe-name>/` for cookbook recipes

**Every port must also update the relevant bucket's `README.md` status table** and, for plugins, append an entry to [CATALOGUE.md](CATALOGUE.md). `install.sh --list` and the catalogue are the only discovery surfaces.

## The `skills/` directory vs. plugin skills

The top-level [skills/](skills/) directory holds ~330+ standalone skills lifted from the upstream marketplace. An audit in [skills/STATUS.md](skills/STATUS.md) confirms the pool is structurally Claude-Code compatible — the handful of raw-Copilot entries (`#tool:` directives, duplicate `structured-autonomy-*` skills, `runSubagent` calls) have been removed or converted. The pool is **not** orchestrated and individual skills have not been run-tested, so treat each as a copy-paste candidate rather than installable inventory. Plugin skills (curated, orchestration-aware) live under [plugins/&lt;plugin-name&gt;/skills/&lt;skill-name&gt;/SKILL.md](plugins/) and are what `install.sh <plugin> --skills` copies. The top-level skill pool is reachable through the installer via `install-skill <name>` if needed, but `install.sh --list` does not enumerate it.

## Git conventions

Commit messages observed: `feat: <summary>`, `Update <thing>`. The user's global instruction is to **omit the `Co-Authored-By: Claude` trailer** from commits in this repo.

Branch naming for marketplace mirror work: `feat/full-marketplace-mirror-phase-<letter>`.
