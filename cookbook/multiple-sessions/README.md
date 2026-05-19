# Multiple Sessions

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/multiple-sessions.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Manage multiple independent conversations simultaneously without state bleed.

## Approach in Claude Code

Anthropic SDK: each `messages.create()` call is stateless — pass the full conversation history per request. For long-running sessions, store the message history per conversation key. CLI: use `claude --session-id <name>` to maintain separate persisted sessions on disk.

## Where to look

https://docs.claude.com/en/api/messages (conversation history) and `claude --help` (`--session-id`, `--resume`).

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
