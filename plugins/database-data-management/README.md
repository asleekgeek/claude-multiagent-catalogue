# database-data-management — Claude Code Port

> Ported from `awesome-copilot/plugins/database-data-management` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Database administration, SQL optimization, and data management tools for PostgreSQL, SQL Server, and general database development best practices.

**Keywords:** `database`, `sql`, `postgresql`, `sql-server`, `dba`, `optimization`, `queries`, `data-management`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/ms-sql-dba.md` | `claude-sonnet-4-6` | Work with Microsoft SQL Server databases using the MS SQL extension. |
| `agents/postgresql-dba.md` | `claude-sonnet-4-6` | Work with PostgreSQL databases using the PostgreSQL extension. |

## Skills

- `skills/postgresql-code-review/SKILL.md`
- `skills/postgresql-optimization/SKILL.md`
- `skills/sql-code-review/SKILL.md`
- `skills/sql-optimization/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh database-data-management --skills

# verify
ls .claude/agents/
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

# Database & Data Management Plugin

Database administration, SQL optimization, and data management tools for PostgreSQL, SQL Server, and general database development best practices.

## Installation

```bash
# Using Copilot CLI
copilot plugin install database-data-management@awesome-copilot
```

## What's Included

### Commands (Slash Commands)

| Command | Description |
|---------|-------------|
| `/database-data-management:sql-optimization` | Universal SQL performance optimization assistant for comprehensive query tuning, indexing strategies, and database performance analysis across all SQL databases (MySQL, PostgreSQL, SQL Server, Oracle). Provides execution plan analysis, pagination optimization, batch operations, and performance monitoring guidance. |
| `/database-data-management:sql-code-review` | Universal SQL code review assistant that performs comprehensive security, maintainability, and code quality analysis across all SQL databases (MySQL, PostgreSQL, SQL Server, Oracle). Focuses on SQL injection prevention, access control, code standards, and anti-pattern detection. Complements SQL optimization prompt for complete development coverage. |
| `/database-data-management:postgresql-optimization` | PostgreSQL-specific development assistant focusing on unique PostgreSQL features, advanced data types, and PostgreSQL-exclusive capabilities. Covers JSONB operations, array types, custom types, range/geometric types, full-text search, window functions, and PostgreSQL extensions ecosystem. |
| `/database-data-management:postgresql-code-review` | PostgreSQL-specific code review assistant focusing on PostgreSQL best practices, anti-patterns, and unique quality standards. Covers JSONB operations, array usage, custom types, schema design, function optimization, and PostgreSQL-exclusive security features like Row Level Security (RLS). |

### Agents

| Agent | Description |
|-------|-------------|
| `postgresql-dba` | Work with PostgreSQL databases using the PostgreSQL extension. |
| `ms-sql-dba` | Work with Microsoft SQL Server databases using the MS SQL extension. |

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot), a community-driven collection of GitHub Copilot extensions.

## License

MIT
