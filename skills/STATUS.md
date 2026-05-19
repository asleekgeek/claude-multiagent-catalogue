# skills/ — adaptation status

This directory holds ~330+ standalone, individually-invokable skills lifted from the
upstream [awesome-copilot](https://github.com/github/awesome-copilot) marketplace and
related sources. Each subdirectory is a candidate skill — read its `SKILL.md`, then
copy the whole subdirectory into your project's `.claude/skills/<skill-name>/` to
install it.

## How adapted is the pool?

An audit on 2026-05-19 against the conversion rules in
[../copilot-to-claude-multiagent/SKILL.md](../copilot-to-claude-multiagent/SKILL.md) found:

| Marker | Count |
|---|---|
| Total `SKILL.md` files | 334 |
| Frontmatter contains a real `tools:` key (Copilot-only) | 0 |
| Body references `#tool:` directives | 0 |
| Body references `runSubagent` | 0 |
| Body references `#context7` | 0 |
| Body references `manage_todo_list` | 0 |
| Body has non-Claude `model:` directive (GPT/Gemini/etc.) | 0 |

**Net:** the pool is structurally Claude-Code compatible. The handful of files that
originally tripped the audit were addressed in the commit that introduced this file
(deleted three `structured-autonomy-*` raw duplicates whose canonical adapted versions
live in [../plugins/structured-autonomy/skills/](../plugins/structured-autonomy/skills/),
and rewrote three `#tool:fetch` references to point at the Claude Code `WebFetch` tool).

## Known caveats

- **False positives in code blocks.** Four skills (`github-copilot-starter`,
  `mcp-create-declarative-agent`, `mcp-create-adaptive-cards`, `mcp-deploy-manage-agents`)
  contain `tools: [...]` lines inside fenced code blocks. These are content — the skill
  itself teaches Claude Code how to scaffold Microsoft 365 Copilot agents and shows the
  Copilot config as example output. The skills' own frontmatter is clean.

- **"GitHub Copilot" mentions in body.** ~24 skills mention "GitHub Copilot" by name.
  Most are either (a) attribution / upstream pointer or (b) skills whose subject matter
  is integrating with or scaffolding for Copilot products. Neither pattern requires
  conversion — the skills themselves run under Claude Code.

- **Individual exercise.** Pool skills are not orchestrated together and have not been
  individually run-tested. Treat each as a candidate, read the `SKILL.md` body, and
  exercise it in a scratch project before relying on it for production work. The
  curated, orchestration-aware skills live under [../plugins/&lt;plugin&gt;/skills/](../plugins/).

## Installing a skill from this pool

```bash
# Copy a single skill into the active project's .claude/ tree
mkdir -p .claude/skills
cp -r ~/src/claude-multiagent-catalogue/skills/<skill-name> .claude/skills/
```

`install.sh` does **not** read this pool — only `plugins/&lt;name&gt;/skills/` are
installable through the script. Pool skills are intentionally a copy-paste surface.

## Reporting issues

Open a GitHub issue using the templates in [`../.github/ISSUE_TEMPLATE/`](../.github/ISSUE_TEMPLATE/).

## Re-running the audit

```bash
cd skills
grep -lE "^tools:" */SKILL.md          # expect: only the 4 false positives above
grep -l '#tool:' */SKILL.md             # expect: nothing
grep -l 'runSubagent' */SKILL.md        # expect: nothing
grep -l '#context7' */SKILL.md          # expect: nothing
grep -l 'manage_todo_list' */SKILL.md   # expect: nothing
```
