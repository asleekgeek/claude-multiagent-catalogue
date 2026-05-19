# java-development — Claude Code Port

> Ported from `awesome-copilot/plugins/java-development` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Comprehensive collection of prompts and instructions for Java development including Spring Boot, Quarkus, testing, documentation, and best practices.

**Keywords:** `java`, `springboot`, `quarkus`, `jpa`, `junit`, `javadoc`

## Skills

- `skills/create-spring-boot-java-project/SKILL.md`
- `skills/java-docs/SKILL.md`
- `skills/java-junit/SKILL.md`
- `skills/java-springboot/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh java-development --skills

# verify
ls .claude/skills/
```

## Claude Code Notes

Plugin frontmatter normalised per `copilot-to-claude-multiagent/SKILL.md` §12:

- Each agent's `tools:` and `agents:` keys dropped — Claude Code agents have full tool access by default.
- Each agent's `model:` mapped to a Claude tier (see `references/model-mapping.md`).
- Body-level Copilot tool references (where present) rewritten under §3/§5; agents that needed body changes carry their own `## Claude Code Notes` section.
- Skills bundled verbatim from upstream — see the top-level `skills/STATUS.md` for the catalogue-wide audit.

---

## Original upstream README

# Java Development Plugin

Comprehensive collection of prompts and instructions for Java development including Spring Boot, Quarkus, testing, documentation, and best practices.

## Installation

```bash
# Using Copilot CLI
copilot plugin install java-development@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/java-development:java-docs` | Ensure that Java types are documented with Javadoc comments and follow best practices for documentation. |
| `/java-development:java-junit` | Get best practices for JUnit 5 unit testing, including data-driven tests |
| `/java-development:java-springboot` | Get best practices for developing applications with Spring Boot. |
| `/java-development:create-spring-boot-java-project` | Create Spring Boot Java Project Skeleton |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
