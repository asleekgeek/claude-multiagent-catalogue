# ospo-sponsorship — Claude Code Port

> Ported from `awesome-copilot/plugins/ospo-sponsorship` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Tools and resources for Open Source Program Offices (OSPOs) to identify, evaluate, and manage sponsorship of open source dependencies through GitHub Sponsors, Open Collective, and other funding platforms.

## Skills

- `skills/sponsor-finder/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh ospo-sponsorship --skills

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

# Open Source Sponsorship Plugin

Tools and resources for Open Source Program Offices (OSPOs) to identify, evaluate, and manage sponsorship of open source dependencies through GitHub Sponsors, Open Collective, and other funding platforms.

## Installation

```bash
# Using Copilot CLI
copilot plugin install ospo-sponsorship@awesome-copilot
```

## What's Included

### Skills

| Skill | Description |
|-------|-------------|
| `SKILL.md` | Find which of a GitHub repository's dependencies are sponsorable via GitHub Sponsors. Uses deps.dev API for dependency resolution across npm, PyPI, Cargo, Go, RubyGems, Maven, and NuGet. Checks npm funding metadata, FUNDING.yml files, and web search. Verifies every link. Shows direct and transitive dependencies with OSSF Scorecard health data. Invoke by providing a GitHub owner/repo (e.g. "find sponsorable dependencies in expressjs/express"). |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
