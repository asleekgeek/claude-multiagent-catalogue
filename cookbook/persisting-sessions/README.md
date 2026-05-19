# Persisting Sessions

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/persisting-sessions.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Save and resume conversation sessions across restarts.

## Approach in Claude Code

CLI: `claude --session-id <name>` writes session state to disk and `claude --resume <name>` restores it. SDK: serialise the message history to JSON between requests and re-pass on the next `messages.create()` call.

## Where to look

https://docs.claude.com/en/api/messages (statelessness) and `claude --help` (`--session-id`/`--resume`).

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
