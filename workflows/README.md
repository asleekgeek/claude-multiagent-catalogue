# Workflows

Agentic GitHub Actions workflows ported from the [`awesome-copilot`](https://github.com/github/awesome-copilot) `workflows/` directory. Each workflow is a markdown agent prompt paired with a `.github/workflows/<name>.yml` runner that invokes Claude Code in CI.

## Status

| Metric | Count |
|---|---|
| Ported | **8** |
| Pending (upstream) | 0 |

Phase E complete. Each workflow ships as a `.md` prompt + a companion `.github-action.yml` runner template invoking `anthropics/claude-code-action` on the upstream schedule. The runners are templates — copy to your repo's `.github/workflows/` and adapt secrets / permissions.

## How an agentic workflow is structured

Upstream uses a markdown file with frontmatter describing the schedule, permissions, and outputs:

```yaml
---
name: "Daily Issues Report"
description: "Generates a daily summary of open issues..."
on:
  schedule: daily on weekdays
permissions:
  contents: read
  issues: read
safe-outputs:
  create-issue:
    title-prefix: "[daily-report] "
    labels: [report]
---

<the agent's task prompt>
```

In Claude Code, the markdown is the prompt and the YAML companion under `.github/workflows/` invokes `claude --agent` (or the `anthropic/claude-code-action` Action) to run it.

See [/copilot-to-claude-multiagent/references/conversion-patterns.md](../copilot-to-claude-multiagent/references/conversion-patterns.md) §15 for the full conversion pattern.

## File convention

```
workflows/<name>.md                ← the agent prompt + metadata
workflows/<name>.github-action.yml ← the CI runner template
workflows/README.md                ← this file
```

The `.github-action.yml` template is documented but **not** auto-installed — users copy it into their own repo's `.github/workflows/` and adapt the secrets/permissions.

## Install one

There is no `install.sh` shortcut. Workflows are project-specific; copy by hand:

```bash
cp /path/to/claude-multiagent-catalogue/workflows/<name>.md ./.github/workflows/<name>.prompt.md
cp /path/to/claude-multiagent-catalogue/workflows/<name>.github-action.yml ./.github/workflows/<name>.yml
```

Then edit the YAML to match your secrets, schedule, and target repo.
