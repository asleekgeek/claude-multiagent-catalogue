# Claude Multiagent Catalogue

A Claude Code catalogue mirroring the [`awesome-copilot`](https://github.com/github/awesome-copilot) marketplace — agents, instructions, skills, plugins, hooks, workflows, and cookbook recipes, ported into Claude Code-native form.

> The repo name is legacy. Scope is **not** limited to multi-agent rigs — it covers every artefact type upstream publishes. The "multiagent" portion of the name reflects the original (narrower) intent; see [CLAUDE.md](CLAUDE.md) for the full scope correction.

Every artefact is a markdown agent definition, `SKILL.md`, instructions file, hook bundle, workflow prompt, or cookbook recipe — no application code.

## What's in this repo

| Bucket | Path | Status | Upstream |
|---|---|---|---|
| 🤖 [Agents](agents/) | `agents/` | **211 / 211** | `awesome-copilot/agents/` |
| 📋 [Instructions](instructions/) | `instructions/` | **183 / 183** | `awesome-copilot/instructions/` |
| 🎯 [Skills](skills/) | `skills/` | 335 / 338 | `awesome-copilot/skills/` |
| 🔌 [Plugins](plugins/) | `plugins/` | **67 / 67** | `awesome-copilot/plugins/` |
| 🪝 [Hooks](hooks/) | `hooks/` | 0 / 6 | `awesome-copilot/hooks/` |
| ⚡ [Workflows](workflows/) | `workflows/` | 0 / 8 | `awesome-copilot/workflows/` |
| 🍳 [Cookbook](cookbook/) | `cookbook/` | 0 / 3 | `awesome-copilot/cookbook/` |
| 🛠️ [Conversion skill](copilot-to-claude-multiagent/) | `copilot-to-claude-multiagent/` | — | (this repo) |

The conversion procedure for every bucket lives in [copilot-to-claude-multiagent/SKILL.md](copilot-to-claude-multiagent/SKILL.md).

## Quickstart

```bash
# See what's available across every bucket
./install.sh --list

# Install a plugin's agents into the current project
cd ~/src/my-project
~/src/claude-multiagent-catalogue/install.sh rug-agentic-workflow

# Install a plugin + its skills
~/src/claude-multiagent-catalogue/install.sh ai-team-orchestration --skills

# Install a single standalone agent (Phase B+)
~/src/claude-multiagent-catalogue/install.sh install-agent csharp-expert

# Install a single instruction (Phase D+)
~/src/claude-multiagent-catalogue/install.sh install-instruction typescript

# Install a hook bundle (Phase E+)
~/src/claude-multiagent-catalogue/install.sh install-hook secrets-scanner

# Verify
ls .claude/agents/
ls .claude/skills/
ls .claude/instructions/
```

Agents land in `.claude/agents/`, skills in `.claude/skills/`, instructions in `.claude/instructions/`, hook scripts in `.claude/hooks/<bundle>/`. Claude Code discovers agents and skills automatically; instructions and hooks require explicit wiring (see each bucket's README for details).

## Plugins

All 67 upstream plugins are mirrored — 5 multi-agent orchestration rigs (full detailed entries in [CATALOGUE.md](CATALOGUE.md)) plus 62 topic bundles (languages, clouds, SaaS platforms, tools).

The 5 multi-agent rigs:

| Plugin | Pattern | Components |
|---|---|---|
| [rug-agentic-workflow](plugins/rug-agentic-workflow/) | Orchestrator + SWE + QA subagents via the `Task` tool (RUG — Repeat Until Good) | agents |
| [ai-team-orchestration](plugins/ai-team-orchestration/) | Producer / Dev / QA across parallel Claude Code sessions, human as message bus | agents + skill |
| [software-engineering-team](plugins/software-engineering-team/) | Pool of 7 SDLC reviewer specialists (architect, security, devops, PM, tech writer, UX, responsible-AI) | agents |
| [structured-autonomy](plugins/structured-autonomy/) | Plan → Generate → Implement skill pipeline with checkpoints between commits | skills |
| [quality-playbook](plugins/quality-playbook/) | 7-phase quality engineering audit; orchestrator spawns one Task sub-agent per phase | agents + skill |

The 62 topic bundles cover languages (.NET, TypeScript, Python, JVM, Rust, Go, Swift, etc.), clouds (Azure, AWS), SaaS platforms (Salesforce, Power Platform, Sitecore, Drupal), database admin, CI/CD, testing, security, and AI/ML tooling. See [CATALOGUE.md → Topic bundles](CATALOGUE.md#topic-bundles) for the full table or `./install.sh --list` for a live listing.

Full plugin entries — orchestration flow, agent rosters with model assignments, install notes — live in [CATALOGUE.md](CATALOGUE.md).

## Repository layout

```
agents/                       Standalone agents (Phase B target — 0/211)
instructions/                 Coding-standard fragments (Phase D target — 0/183)
plugins/<plugin-name>/        Installable plugin (agents/ and/or skills/ + README.md)
skills/                       Standalone skill pool — see skills/STATUS.md
hooks/<bundle-name>/          Hook bundles + claude-settings.json fragments (Phase E target — 0/6)
workflows/                    Agentic GH Actions workflows (Phase E target — 0/8)
cookbook/                     Anthropic-SDK recipes (Phase E target — 0/3)
copilot-to-claude-multiagent/ Conversion skill (SKILL.md + references/)
install.sh                    Installer (handles every bucket above)
CATALOGUE.md                  Discovery index — every populated bucket gets a section
CLAUDE.md                     Repo-level instructions for Claude Code sessions
```

## Conversion procedure

Every upstream artefact is ported through [copilot-to-claude-multiagent/SKILL.md](copilot-to-claude-multiagent/SKILL.md). The skill handles all seven bucket types via a Phase 0 dispatcher that branches on the upstream path. In short:

1. **Identify** the artefact type from its upstream path.
2. **Apply** the matching pattern from [copilot-to-claude-multiagent/references/conversion-patterns.md](copilot-to-claude-multiagent/references/conversion-patterns.md).
3. **Output** to the corresponding top-level directory here.
4. **Catalogue** — update [CATALOGUE.md](CATALOGUE.md) and the bucket README's status table.

Common transformations applied across buckets: drop the Copilot `tools:` key, drop the `agents:` key, map the Copilot/OpenAI model to a Claude tier, rewrite `runSubagent` → `Task`, `#context7` → Context7 MCP, VS Code UI → bash equivalents.

## Skill pool

[skills/](skills/) is a copy-paste surface, not part of the installer. See [skills/STATUS.md](skills/STATUS.md) for the adaptation audit. To use one:

```bash
mkdir -p .claude/skills
cp -r ~/src/claude-multiagent-catalogue/skills/<skill-name> .claude/skills/
```

## License and attribution

Each artefact retains its upstream licence — see the per-plugin `README.md` and any `LICENSE.txt` shipped alongside the skill. Where a port involved non-trivial adaptation, the file's `## Claude Code Notes` section documents what was changed and why.

## Issues and contributions

Bug reports and contribution proposals: see the templates in [.github/ISSUE_TEMPLATE/](.github/ISSUE_TEMPLATE/).
