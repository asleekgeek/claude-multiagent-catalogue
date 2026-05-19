---
name: copilot-to-claude-multiagent
description: >
  Convert GitHub Copilot multi-agent plugins and orchestration rigs into Claude Code-compatible
  sub-agents and skills. Use this skill whenever the user wants to port, convert, adapt, or import
  a Copilot plugin for use in Claude Code — especially multi-agent orchestration workflows,
  agent teams, agentic pipelines, and sprint-driven development rigs. Triggers on: "convert
  Copilot plugin", "port this agent to Claude Code", "import from awesome-copilot", "add this
  team to Claude Code", or when browsing the awesome-copilot marketplace and selecting a plugin
  to use. Also triggers for batch catalogue builds. Handles local repo sources and external
  GitHub repos. Produces ready-to-install agent .md files, adapted SKILL.md files, a README
  with installation steps, and a running CATALOGUE.md entry.
compatibility: Claude Code (bash, filesystem); optional web_fetch for external GitHub repos
---

# Copilot → Claude Code Multiagent Converter

Converts GitHub Copilot multi-agent plugins into Claude Code-compatible sub-agents and skills.
Primary focus: orchestration rigs, agent teams, sprint workflows, and agentic pipelines.

## Assumed Local Context

```
~/src/awesome-copilot/          ← awesome-copilot repo root
  .github/plugin/marketplace.json
  plugins/<name>/
    .github/plugin/plugin.json  ← plugin manifest
    agents/*.md                 ← Copilot agent definitions
    skills/*/SKILL.md           ← already close to Claude format
    README.md
```

Output lands at:
```
~/.claude/converted-plugins/<plugin-name>/
  README.md
  agents/*.md      → cp to ~/.claude/agents/
  skills/*/        → cp to your Claude Code skill path
```

Running catalogue: `~/.claude/converted-plugins/CATALOGUE.md`

---

## Phase 1 — Discover and Classify

```bash
PLUGIN=$1   # plugin name, e.g. rug-agentic-workflow
ROOT=~/src/awesome-copilot/plugins/$PLUGIN

# Read manifest
cat $ROOT/.github/plugin/plugin.json

# Map directory contents
ls $ROOT/agents/ 2>/dev/null && echo "→ has agents"
ls $ROOT/skills/ 2>/dev/null && echo "→ has skills"
cat $ROOT/README.md 2>/dev/null | head -60
```

**Classify into one of four archetypes:**

| Archetype | Indicators | Conversion path |
|---|---|---|
| **Agents-only** | `agents/*.md`, no `skills/` | Full agent conversion |
| **Skills-only** | `skills/*/SKILL.md`, no `agents/` | Light skill adaptation |
| **Hybrid** | Both present | Full agent conversion + light skill adaptation |
| **External repo** | `plugin.json` has `source.source === "github"` and no local `agents/` | web_fetch from GitHub or APM note |

Read **all source files** fully before converting. Never convert blind.

---

## Phase 2 — Convert

> **Before writing any output**, read all three reference files:
> - `references/tool-mapping.md`
> - `references/model-mapping.md`
> - `references/conversion-patterns.md`

### 2a. Agent File Conversion

**Input (Copilot frontmatter):**
```yaml
---
name: 'AGENT-NAME'
description: 'When to use this agent...'
tools: ['vscode', 'execute', 'read', 'agent', 'edit', 'search', 'web', 'todo']
model: GPT-5
agents: ['SWE', 'QA']
---
```

**Output (Claude Code frontmatter):**
```yaml
---
name: agent-name
description: >
  When to use this agent... (keep intent verbatim; replace "GitHub Copilot"
  with "Claude Code"; remove tool-list language)
model: claude-opus-4-6   # see references/model-mapping.md
---
```

**Frontmatter rules (strict):**
- `name` → lowercase, hyphenated, no quotes
- `description` → preserve original intent; strip Copilot-specific phrasing
- `tools` → **DROP** — Claude Code agents have full tool access by default
- `model` → **MAP** using `references/model-mapping.md`; default to `claude-sonnet-4-6`
- `agents` → **DROP** — cross-agent references move into body text

**Body adaptation — key rules:**
1. `#tool:runSubagent` → `Task` tool pattern (see `references/conversion-patterns.md §1`)
2. `#context7` → Context7 MCP note (see `§2`)
3. `vscode` / VS Code UI patterns → bash equivalents or "user action required" note (see `§3`)
4. `manage_todo_list` → Claude Code `TodoManager` tool (see `§5`)
5. Cross-agent references (`@SWE`, `@QA`, etc.) → sub-agent names with `Task` call example
6. GitHub Issue/PR workflows → `gh` CLI commands (see `§4`)
7. Preserve all role constraints, workflows, and communication style verbatim — this is the IP
8. Add `## Claude Code Notes` section at the end listing every adaptation decision made

### 2b. SKILL.md Adaptation

Copilot `SKILL.md` files are structurally compatible. Changes needed:

- Ensure frontmatter has `name`, `description`, and add `compatibility: Claude Code`
- Remove or rewrite any `#tool:` references
- Replace `runSubagent` with `Task` tool pattern
- Replace `#context7` with MCP note
- Add `## Claude Code Notes` if adaptations are significant (skip if minimal changes)

**Do not rewrite** content that has no Copilot-specific dependencies — preserve the original
workflow logic, templates, and domain knowledge intact.

### 2c. External Repo Plugins (gem-team, etc.)

```bash
# Check if the plugin has its own Claude Code support
cat ~/src/awesome-copilot/plugins/<name>/.github/plugin/plugin.json | jq '.repository'
# Then web_fetch the README from GitHub
```

**gem-team special case:** Already Claude Code-capable via APM. Do not manually convert.
Instead, generate a README with APM installation instructions and catalogue the available agents
from its README. No file conversion needed.

For other external plugins: web_fetch the GitHub repo, discover the agent/skill structure,
then follow Phase 2a/2b normally.

---

## Phase 3 — Output

### Directory structure
```
~/.claude/converted-plugins/<plugin-name>/
├── README.md
├── agents/
│   ├── <agent-name>.md
│   └── ...
└── skills/
    └── <skill-name>/
        └── SKILL.md
```

### README.md template

```markdown
# <Plugin Name> — Claude Code Port

> Ported from GitHub Copilot plugin `<original-name>` v<version>
> Original author: <author> | License: <license>
> Converted: <date>

## Agent Team

| Agent | File | Model | Role |
|-------|------|-------|------|
| Name  | `agents/<name>.md` | `claude-*` | One-line role |

## Orchestration Pattern

[Describe how agents coordinate: who orchestrates whom, what the handoff protocol is,
how context survives across invocations]

## Installation

```bash
# Install agents
cp agents/*.md ~/.claude/agents/

# Install skills (if any)
cp -r skills/* /path/to/your/claude-skills/

# Verify
claude /agents
```

## Usage

[Key invocation patterns — what to say to Claude Code to activate each agent]

## MCP Dependencies (if any)

[List any MCP servers needed, with config snippets for ~/.claude/settings.json]

## Claude Code Notes

[Key differences from the original Copilot plugin. What was adapted and why.
Any known limitations or behaviours that differ from the Copilot version.]
```

---

## Phase 4 — Catalogue Entry

Create `~/.claude/converted-plugins/CATALOGUE.md` if it doesn't exist. Append:

```markdown
---

## <plugin-name>

| Field | Value |
|-------|-------|
| **Original** | `<copilot-plugin-name>` by <author> |
| **Pattern** | Orchestrator+Subagents / Team / Pipeline / Parallel |
| **Agents** | `agent-1`, `agent-2`, ... |
| **Skills** | `skill-1`, ... |
| **Best for** | One-line use case description |
| **Install** | `cp ~/.claude/converted-plugins/<name>/agents/* ~/.claude/agents/` |
| **Notes** | Any caveats or dependencies |
```

---

## Batch Mode

To discover all multi-agent candidates in the marketplace:

```bash
cat ~/src/awesome-copilot/.github/plugin/marketplace.json \
  | jq -r '.plugins[] | select(.description | test("agent|orchestrat|team|subagent|workflow"; "i")) | .name'
```

For batch conversion: run the full Phase 1–4 workflow for each plugin in sequence.
After the batch, generate a summary report grouping plugins by orchestration pattern.

---

## Quality Gate

Before finalising each converted agent, verify:

- [ ] Frontmatter: only `name`, `description`, `model` — no `tools` or `agents` keys
- [ ] All `#tool:` references removed or adapted
- [ ] All Copilot/OpenAI model names replaced with Claude equivalents
- [ ] `runSubagent` → `Task` tool pattern applied everywhere
- [ ] VS Code-specific patterns removed or replaced with bash
- [ ] `## Claude Code Notes` section present if any adaptations were made
- [ ] README.md installation instructions accurate (paths exist, commands work)
- [ ] Catalogue entry appended to `CATALOGUE.md`

---

## Reference Files

Read these before converting — they contain the full lookup tables:

| File | Contents |
|---|---|
| `references/tool-mapping.md` | Complete Copilot tool → Claude Code tool mapping |
| `references/model-mapping.md` | Copilot/OpenAI model → Claude model tier mapping |
| `references/conversion-patterns.md` | Pattern-by-pattern transformation guide with before/after |
