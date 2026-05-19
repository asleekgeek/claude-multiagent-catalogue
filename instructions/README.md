# Instructions

Coding-standard fragments ported from the [`awesome-copilot`](https://github.com/github/awesome-copilot) `instructions/` directory. Each file documents conventions, anti-patterns, and best practices for a language, framework, or topic — accessibility, TypeScript, Bicep, Kubernetes, Spring Boot, etc.

## Status

| Metric | Count |
|---|---|
| Ported | 0 |
| Pending (upstream) | 183 |

Bulk port is **Phase D** of the marketplace mirror.

## File convention

Files are markdown with a thin frontmatter block. The upstream `applyTo:` glob is preserved as documentation — Claude Code does not enforce it natively, but tools and users can read it to decide where the instruction should be loaded.

```yaml
---
applyTo: '**/*.ts,**/*.tsx'
description: >
  Short one-line summary.
---

# <Topic> Standards

<body>
```

See [/copilot-to-claude-multiagent/references/conversion-patterns.md](../copilot-to-claude-multiagent/references/conversion-patterns.md) §13 for the instructions pattern.

## How users consume an instruction

There is no automatic `applyTo:` mechanism in Claude Code. Pick one of:

1. **Hand-include** in your project `CLAUDE.md`:
   ```markdown
   ## Coding standards
   @./.claude/instructions/typescript.md
   ```
2. **Pull into a subject-matter agent** definition — paste the body of the instruction into a focused agent file under `.claude/agents/`.
3. **Reference on demand** — keep instructions in `.claude/instructions/` and ask Claude to read the relevant one when needed.

## Install one

```bash
~/src/claude-multiagent-catalogue/install.sh install-instruction <name>

# or by hand:
mkdir -p .claude/instructions
cp ~/src/claude-multiagent-catalogue/instructions/<name>.md .claude/instructions/
```
