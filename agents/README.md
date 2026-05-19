# Agents

Standalone Claude Code agent definitions, ported one-for-one from the [`awesome-copilot`](https://github.com/github/awesome-copilot) `agents/` directory.

Each file in this directory is a single agent — drop it into a project's `.claude/agents/` and Claude Code picks it up automatically the next time it starts in that project.

## Status

| Metric | Count |
|---|---|
| Ported | **211** |
| Pending (upstream) | 0 |

Phase B bulk port complete. The conversion procedure is in [/copilot-to-claude-multiagent/SKILL.md](../copilot-to-claude-multiagent/SKILL.md) — invoke it for any new arrivals upstream. 22 of the 211 ports carry a `## Claude Code Notes` section documenting body-level adaptations (mostly Copilot tool-name swaps per §3/§5).

The 3 manually ported agents preserved verbatim from Phase A:
- `csharp-expert.md`
- `accessibility-runtime-tester.md`
- `thinking-beast-mode.md`

The remaining 208 were generated mechanically by a port script that applied §12 (frontmatter normalisation, kebab-case filename, attribution) plus §3/§5 body substitutions where applicable.

## File convention

Files use Claude Code's standard agent frontmatter — see [/copilot-to-claude-multiagent/references/conversion-patterns.md](../copilot-to-claude-multiagent/references/conversion-patterns.md) §12 for the standalone-agent pattern.

```yaml
---
name: lowercase-hyphenated-name
description: >
  When to use this agent. Verbatim from upstream where possible,
  with "GitHub Copilot" → "Claude Code".
model: claude-sonnet-4-6   # default; orchestrators bump to opus, formatters drop to haiku
---
```

- No `tools:` key (Claude Code agents have full tool access).
- No `agents:` key (cross-references go in body text).
- First line after frontmatter is an attribution comment pointing back to the upstream file.

## Install one

```bash
# from the project where you want the agent:
~/src/claude-multiagent-catalogue/install.sh install-agent <name>

# or by hand:
mkdir -p .claude/agents
cp ~/src/claude-multiagent-catalogue/agents/<name>.md .claude/agents/
```

## Attribution

Every agent file retains upstream attribution and licence. Bulk-licence: MIT (upstream `awesome-copilot`); per-file licence overrides documented in the file itself when present.
