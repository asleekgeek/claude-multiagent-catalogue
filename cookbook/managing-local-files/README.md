# Managing Local Files

> Ported from `awesome-copilot/cookbook/copilot-sdk/<lang>/recipe/managing-local-files.*` (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §16)

## Problem

Organise files by metadata using AI-powered grouping strategies.

## Approach in Claude Code

Claude Code is filesystem-native — `Read`, `Write`, `Edit`, `Glob`, `Grep`, and `Bash` are first-class tools. For programmatic use, run `claude --print --allowed-tools Read,Write,Glob` and let Claude operate on the cwd. For SDK use, wire Anthropic's tool-use loop with `bash`/`str_replace_based_edit` tools.

## Where to look

https://docs.claude.com/en/docs/build-with-claude/tool-use

## Why no code in this recipe

The upstream cookbook targets the **GitHub Copilot SDK** — a different API surface from Anthropic's. A mechanical code port would produce untested, unmaintained snippets that drift from both ecosystems. Per §16, recipes are documentation-only: the problem statement and the canonical Claude analog. Generate working code on demand using the `claude-api` skill (in this catalogue's `skills/` pool) which understands the current Anthropic SDK.
