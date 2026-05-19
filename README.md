# Claude Multiagent Catalogue

A curated catalogue of multi-agent plugins and skills for Claude Code, ported from the GitHub Copilot [`awesome-copilot`](https://github.com/github/awesome-copilot) ecosystem. Every artefact is a markdown agent definition or `SKILL.md` — no application code. The repo provides three things:

1. **Installable plugins** ([plugins/](plugins/)) — full multi-agent rigs and skill pipelines, ready to drop into any project's `.claude/` directory.
2. **A skill pool** ([skills/](skills/)) — 330+ standalone skills sourced from upstream, audited for Claude Code compatibility (see [skills/STATUS.md](skills/STATUS.md)).
3. **A documented porting process** ([copilot-to-claude-multiagent/](copilot-to-claude-multiagent/)) — the conversion skill that defines how Copilot artefacts become Claude Code artefacts. Reusable for any future port.

## Quickstart

```bash
# See what's available
./install.sh --list

# Install a plugin's agents into the current project
cd ~/src/my-project
~/src/claude-multiagent-catalogue/install.sh rug-agentic-workflow

# Install agents + the plugin's skills
~/src/claude-multiagent-catalogue/install.sh ai-team-orchestration --skills

# Verify
ls .claude/agents/
ls .claude/skills/
```

Agents land in `.claude/agents/`; skills land in `.claude/skills/`. Claude Code discovers both automatically the next time it starts in the project.

## Plugins

| Plugin | Pattern | Components |
|---|---|---|
| [rug-agentic-workflow](plugins/rug-agentic-workflow/) | Orchestrator + SWE + QA subagents via the `Task` tool (RUG — Repeat Until Good) | agents |
| [ai-team-orchestration](plugins/ai-team-orchestration/) | Producer / Dev / QA across parallel Claude Code sessions, human as message bus | agents + skill |
| [software-engineering-team](plugins/software-engineering-team/) | Pool of 7 SDLC reviewer specialists (architect, security, devops, PM, tech writer, UX, responsible-AI) | agents |
| [structured-autonomy](plugins/structured-autonomy/) | Plan → Generate → Implement skill pipeline with checkpoints between commits | skills |
| [quality-playbook](plugins/quality-playbook/) | 7-phase quality engineering audit; orchestrator spawns one Task sub-agent per phase | agents + skill |

Full entries — orchestration flow, agent rosters with model assignments, install notes — live in [CATALOGUE.md](CATALOGUE.md).

## Repository layout

```
plugins/<plugin-name>/        Installable plugin (agents/ and/or skills/ + README.md)
skills/                       Standalone skill pool — see skills/STATUS.md
copilot-to-claude-multiagent/ The conversion skill (SKILL.md + references/)
install.sh                    Installer (reads plugins/ only)
CATALOGUE.md                  Discovery index — one entry per converted plugin
CLAUDE.md                     Repo-level instructions for Claude Code sessions
```

## Adding a new plugin

The full procedure is in [copilot-to-claude-multiagent/SKILL.md](copilot-to-claude-multiagent/SKILL.md) (phases 1–4 + a quality gate). In short:

1. **Discover and classify** the upstream Copilot plugin (agents-only / skills-only / hybrid / external).
2. **Convert** following the reference files in [copilot-to-claude-multiagent/references/](copilot-to-claude-multiagent/references/) — drop the Copilot `tools:` and `agents:` frontmatter keys, map the model to a Claude tier (`claude-opus-4-6` / `claude-sonnet-4-6` / `claude-haiku-4-5-20251001`), rewrite `runSubagent` → `Task`, `#context7` → Context7 MCP, VS Code UI → bash equivalents.
3. **Output** under `plugins/<plugin-name>/` with `agents/`, optional `skills/`, and a per-plugin `README.md`.
4. **Catalogue** — append an entry to [CATALOGUE.md](CATALOGUE.md). The installer lists plugins from disk but new arrivals are otherwise undiscoverable.

[CLAUDE.md](CLAUDE.md) documents the strict frontmatter rules a converter must obey.

## Skill pool

[skills/](skills/) is a copy-paste surface, not part of the installer. See [skills/STATUS.md](skills/STATUS.md) for the adaptation audit. To use one:

```bash
mkdir -p .claude/skills
cp -r ~/src/claude-multiagent-catalogue/skills/<skill-name> .claude/skills/
```

## License and attribution

Each plugin and skill retains its upstream license — see the per-plugin `README.md` and any `LICENSE.txt` shipped alongside the skill. Where a port involved non-trivial adaptation, the file's `## Claude Code Notes` section documents what was changed and why.

## Issues and contributions

Bug reports and contribution proposals: see the templates in [.github/ISSUE_TEMPLATE/](.github/ISSUE_TEMPLATE/).
