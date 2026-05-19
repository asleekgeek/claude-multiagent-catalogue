# Cookbook

Recipes for working with the Anthropic / Claude Code SDK — direct analogues of the [`awesome-copilot`](https://github.com/github/awesome-copilot) `cookbook/` directory, which contains GitHub Copilot SDK recipes.

## Status

| Metric | Count |
|---|---|
| Ported (as docs) | **7** |
| Skipped (with reason) | 3 |
| Pending (upstream) | 0 |

Phase E complete. Per §16 these are documentation-only recipes: each `<recipe>/README.md` states the problem, points at the canonical Claude Code / Anthropic SDK approach, and links to live docs. No code is checked in — generating Anthropic SDK code from these prompts is what the `claude-api` skill is for.

## Why this isn't a 1-to-1 port

Upstream cookbook entries target the **GitHub Copilot SDK** — a different API surface from Anthropic's. Each recipe needs rewriting for the Anthropic SDK (`@anthropic-ai/sdk` for Node/TypeScript, `anthropic` for Python, `Anthropic.SDK` for .NET) or for the Claude Code CLI directly.

Recipe themes that translate well:

| Theme | Claude analog |
|---|---|
| Ralph Loop | Autonomous CLI loop with fresh-context-per-iteration via `claude --print` or the Agent SDK |
| Error handling | Anthropic SDK error types, retry/backoff with the official SDK |
| Multiple sessions | Anthropic SDK conversation IDs, or `claude --resume` / `claude --session` |
| Persisting sessions | `claude --session-id` + filesystem snapshots |
| MCP integrations | Direct — Claude Code consumes MCP servers natively |

Recipes that **do not translate** (Copilot-SDK-specific telemetry, marketplace APIs, etc.) are skipped rather than force-ported.

See [/copilot-to-claude-multiagent/references/conversion-patterns.md](../copilot-to-claude-multiagent/references/conversion-patterns.md) §16 for the cookbook decision framework.

## File convention

```
cookbook/<recipe-name>/
├── README.md           ← problem statement + Claude analog summary
├── nodejs/             ← @anthropic-ai/sdk implementation
├── python/             ← anthropic implementation
└── claude-code-cli/    ← pure CLI implementation (when applicable)
```

Not every recipe gets every implementation — start with whichever language the upstream recipe targets and add others on demand.
