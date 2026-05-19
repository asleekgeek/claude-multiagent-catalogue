# Ralph Loop

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/ralph-loop.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Build autonomous coding loops that iterate until a goal is met, with fresh context per iteration and planning/building modes.

## Approach in Claude Code

Use the Claude Code CLI in `--print` mode inside a shell loop, or the Anthropic Agent SDK for in-process loops. Each iteration calls `claude --print --session-id <fresh>` (CLI) or instantiates a fresh `Anthropic.messages.create()` conversation. Manage backpressure by capping max iterations and checking the loop's output for an exit signal.

## Where to look

https://docs.claude.com/en/api/messages and `claude --help`. See the `structured-autonomy` plugin in this catalogue for a Claude-native equivalent of the Ralph Loop pattern.

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
