# Error Handling

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/error-handling.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Handle SDK errors gracefully: connection failures, timeouts, rate limits, and resource cleanup.

## Approach in Claude Code

Use the typed error hierarchy from `@anthropic-ai/sdk` (`Anthropic.APIError`, `Anthropic.RateLimitError`, `Anthropic.APIConnectionError`, etc.) and the SDK's built-in retry. For CLI use, check the exit code of `claude --print` and inspect stderr.

## Where to look

https://docs.claude.com/en/api/errors — error types and retry semantics.

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
