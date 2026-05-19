# fastah-ip-geo-tools — Claude Code Port

> Ported from `awesome-copilot/plugins/fastah-ip-geo-tools` v0.0.9
> Original author: Fastah Inc. | License: Apache-2.0 | Converted: 2026-05-19

This plugin is for network operations engineers who wish to tune and publish IP geolocation feeds in RFC 8805 format. It consists of an AI Skill and an associated MCP server that geocodes geolocation place names to real cities for accuracy.

**Keywords:** `geofeed`, `ip-geolocation`, `rfc-8805`, `rfc-9632`, `network-operations`, `isp`, `cloud`, `hosting`, `ixp`

## Skills

- `skills/geofeed-tuner/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
~/src/claude-multiagent-catalogue/install.sh fastah-ip-geo-tools --skills

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

# IP Geolocation Tools by Fastah Inc.

This plugin is for network operations engineers who wish to tune and publish IP geolocation feeds in RFC 8805 format. It consists of an AI Skill and an associated MCP server that geocodes geolocation place names to real cities for accuracy.

## Installation

```sh
# Using Copilot CLI
copilot plugin install fastah-ip-geo-tools@awesome-copilot
```

## What's Included

### Skills

| Skill | Description |
|-------|-------------|
| `geofeed-tuner` | Validates, tunes, and improves IP geolocation feeds in CSV format following RFC 8805 with opinionated best practices from real-world deployments. Uses Fastah MCP for tuning data lookup. |

## Prerequisites

- **Python 3** is required for running generated validation and tuning scripts.

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

Originally developed at [fastah/ip-geofeed-skills](https://github.com/fastah/ip-geofeed-skills).

## License

Apache-2.0
