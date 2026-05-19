# Hooks

Lifecycle automations ported from the [`awesome-copilot`](https://github.com/github/awesome-copilot) `hooks/` directory.

Each bundle here is a folder containing: scripts, a `claude-settings.json` fragment to merge into the consumer's `.claude/settings.json`, and a `README.md` documenting events and installation.

## Status

| Metric | Count |
|---|---|
| Ported | **6** |
| Pending (upstream) | 0 |

Phase E complete. Each bundle directory contains the upstream scripts (with `.github/hooks/` paths rewritten to `.claude/hooks/`), a `claude-settings.json` fragment to merge into `~/.claude/settings.json`, and a README documenting events, dependencies, and the conversion.

## Event mapping (Copilot → Claude Code)

Claude Code's hook events differ from Copilot's. The conversion preserves intent — see [/copilot-to-claude-multiagent/references/conversion-patterns.md](../copilot-to-claude-multiagent/references/conversion-patterns.md) §14 for the full mapping table.

Brief sketch:

| Copilot event | Claude Code analog |
|---|---|
| `sessionStart` | `SessionStart` |
| `sessionEnd` | `Stop` (subagent or main) |
| `preToolCall` | `PreToolUse` |
| `postToolCall` | `PostToolUse` |
| `userPrompt` | `UserPromptSubmit` |

## File convention

```
hooks/<bundle-name>/
├── README.md
├── claude-settings.json   ← merge into ~/.claude/settings.json
└── <script-files>         ← the actual hook commands
```

## Install one

```bash
~/src/claude-multiagent-catalogue/install.sh install-hook <name>
```

The installer copies scripts into `.claude/hooks/<bundle-name>/` and prints the `claude-settings.json` fragment so the user can merge it deliberately — it never blind-overwrites `settings.json`.
