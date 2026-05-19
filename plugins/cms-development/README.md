# cms-development — Claude Code Port

> Ported from `awesome-copilot/plugins/cms-development` v1.1.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Skills for CMS development across themes, plugins, admin tooling, media workflows, markdown rendering, and static export pipelines.

**Keywords:** `cms`, `content-management-system`, `wordpress`, `shopify`, `drupal`, `theme`, `plugin`, `media`, `static-site`

## Skills

- `skills/content-management-systems/SKILL.md`
- `skills/markdown-to-html/SKILL.md`
- `skills/quasi-coder/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh cms-development --skills

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

# CMS Development Plugin

Toolkit for content management system development across themes, plugins, admin tooling, media workflows, markdown rendering, and static export pipelines.

## Installation

```bash
# Using Copilot CLI
copilot plugin install cms-development@awesome-copilot
```

## What's Included

### Skills

| Skill | Description |
|-------|-------------|
| `content-management-systems` | CMS-specific workflows across platforms such as WordPress, Shopify, Drupal, Webflow, and AEM. Covers themes, plugins, admin panels, content models, media pipelines, and static export. |
| `markdown-to-html` | Markdown rendering, conversion, and HTML output workflows. |
| `quasi-coder` | Interpreting web page design descriptions, and implementing code from shorthand, quasi-code, and natural language descriptions. |
| `web-coder` | Frontend, browser, and HTTP work that CMS tasks commonly rely on. |

## When to Use

Install this plugin when the work centers on any of the following:

- Developing or customizing themes and templates on any CMS platform
- Building or modifying plugins, apps, modules, or extensions
- Working on admin or editor interfaces, content forms, or publishing flows
- Handling media uploads, asset pipelines, or authored file storage
- Implementing or debugging markdown rendering and content transformation
- Building static export, deploy, or server-rendered output pipelines
- Modeling content types, taxonomy, slugs, metadata, or migration schemas

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
