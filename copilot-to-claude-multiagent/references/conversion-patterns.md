# Conversion Patterns — Before / After

Concrete transformations for the most common Copilot-specific patterns.

---

## §1 — runSubagent → Task Tool

This is the single most important pattern. RUG and structured-autonomy use it extensively.

**Copilot (before):**
```
MANDATORY: Run #tool:runSubagent tool instructing the agent to work autonomously
following <research_guide> to gather context. Return all findings.
```

**Claude Code (after):**
```
Use the **Task** tool to spawn a sub-agent. Pass a complete, self-contained prompt —
the sub-agent has no memory of the current conversation.

Task prompt structure:
- State the full context (what the parent is doing, what the overall goal is)
- State the specific task for this sub-agent
- Include all relevant file paths, acceptance criteria, and constraints
- Tell the sub-agent exactly what to return

The Task tool gives the sub-agent a fresh context window — this is intentional.
Delegate everything. Never do work you could delegate.
```

**Copilot (runSubagent with prompt template):**
```
Run #tool:runSubagent with:
CONTEXT: The user asked: "[original request]"
YOUR TASK: [specific task]
ACCEPTANCE CRITERIA: ...
```

**Claude Code (after):**
```
Use the Task tool with the following prompt:

---
CONTEXT: The parent orchestrator is working on: [original request]
YOUR TASK: [specific task]
SCOPE: Files to modify: [list]. Files to NOT touch: [list].
ACCEPTANCE CRITERIA:
- [ ] [criterion 1]
- [ ] [criterion 2]
RETURN: List all files changed, summarise what was done, confirm each criterion.
---
```

---

## §2 — #context7 → Context7 MCP

**Copilot (before):**
```
Use #context7 if available to read relevant documentation. ALWAYS READ THE DOCUMENTATION FIRST.
```

**Claude Code (after):**
```
If the Context7 MCP server is configured, use it to fetch up-to-date library documentation:
1. Call `mcp__context7__resolve-library-id` with the library name
2. Call `mcp__context7__get-library-docs` with the resolved ID

Context7 MCP config (~/.claude/settings.json):
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}

If Context7 is not configured, use web_fetch to retrieve official documentation directly
from the library's docs site or GitHub README.
```

---

## §3 — VS Code Tools → Bash

**Copilot (before):**
```yaml
tools: ['vscode', 'edit/editFiles', 'terminalCommand', 'codebase']
```

**Claude Code (after — remove from frontmatter entirely; adapt body):**
```
File reading:   cat, head, tail, grep, or the read_file tool
File editing:   str_replace_based_edit tool, or write_file for new files
Terminal:       bash (direct shell execution — full access)
Codebase nav:  find, rg (ripgrep), grep -r, or Glob tool
VS Code UI:    [USER ACTION REQUIRED] — Claude Code cannot drive VS Code GUI.
               Note any VS Code-specific UX steps as explicit user instructions.
```

---

## §4 — GitHub Issue / PR Workflow

Most Copilot multi-agent plugins reference GitHub Issues and PRs. These translate directly
to `gh` CLI commands.

**Copilot (before):**
```
File GitHub Issues with proper labels and reproduction steps.
Create PR when done: git push origin feature/sprint-N.
Merge PR (regular merge, never squash or rebase).
```

**Claude Code (after) — identical workflow, explicit commands:**
```bash
# File a bug issue
gh issue create \
  --title "Bug: [summary]" \
  --body "[description]\n\n**Steps to reproduce:**\n1. ...\n\n**Expected:** ...\n**Actual:** ..." \
  --label "bug,severity:major"

# Create PR
gh pr create \
  --title "feat: [feature name]" \
  --body "[description]" \
  --base main \
  --head feature/sprint-N

# Merge (regular merge — never squash, never rebase)
gh pr merge <PR-number> --merge --delete-branch

# List open issues (for triage)
gh issue list --label "bug" --state open
```

---

## §5 — manage_todo_list → TodoManager

**Copilot (before):**
```
Use manage_todo_list obsessively:
- Create the full task list BEFORE launching any subagents
- Mark tasks in-progress as you launch subagents
- Mark tasks complete only AFTER validation passes
```

**Claude Code (after):**
```
Use the TodoManager tool the same way:
- Create the full task list BEFORE spawning any sub-agents via Task
- Mark tasks in_progress as you launch each Task call
- Mark tasks completed only AFTER the corresponding validation Task returns PASS

For cross-session persistence (context window resets), also maintain a TODO.md
in the project root that mirrors the TodoManager state. Update it at the start
and end of each session.
```

---

## §6 — Cross-Agent References

**Copilot (before — frontmatter):**
```yaml
agents: ['SWE', 'QA']
```

**Copilot (before — body reference):**
```
Launch a subagent to [task]. The SWE agent should handle implementation.
After SWE completes, launch QA for validation.
```

**Claude Code (after — drop frontmatter key; adapt body):**
```
Use the Task tool to invoke the `swe-subagent` agent. The agent definition is at
`~/.claude/agents/swe-subagent.md` — Claude Code will load it automatically when
you spawn a Task whose system prompt matches that agent's role description.

After SWE completes, spawn a new Task for the `qa-subagent` role:
- Pass the full context of what was built
- Pass the original acceptance criteria
- Instruct it to validate and return PASS or FAIL with evidence
```

---

## §7 — Sprint / Progress Document Patterns

The ai-team-orchestration plugin references `docs/sprint-N/progress.md`,
`PROJECT_BRIEF.md`, etc. These are plain markdown files — no adaptation needed.

**Verify only:**
- File paths are relative (not VS Code workspace-specific)
- No hardcoded Windows paths (`C:\...`)
- Git commands use standard CLI (not VS Code Git UI)

---

## §8 — Validation Loop Pattern (RUG Protocol)

The RUG orchestrator's "never trust self-reported completion — validate with a
separate agent" pattern is directly portable.

**Copilot (before):**
```
After each work subagent completes, launch a SEPARATE validation subagent.
Never trust a work subagent's self-assessment.
```

**Claude Code (after) — identical pattern, different tool name:**
```
After each implementation Task completes, spawn a second validation Task:
- Give it the original acceptance criteria
- Give it the list of files that were supposedly modified
- Instruct it to verify each criterion independently, not trust the prior Task's report
- If FAIL: spawn a new implementation Task with the failure report appended as context
- Only mark the todo item complete after a validation Task returns PASS
```

---

## §9 — Model Directives in Body Text

Some agent files (software-engineering-team) embed model recommendations in the body.
These are Copilot-specific and should be removed or rewritten.

**Copilot (before):**
```yaml
model: GPT-5
```
```
For complex tasks, consider switching to GPT-5 for better reasoning.
```

**Claude Code (after):**
```yaml
model: claude-opus-4-6
```
```
[Remove inline model recommendations — the frontmatter model declaration
handles this. The orchestrator decides model routing at the Task level.]
```

---

## §10 — Structured-Autonomy runSubagent Inline Pattern

Structured-autonomy uses a specific inline pattern that needs special handling.

**Copilot (before):**
```
MANDATORY: Run #tool:runSubagent tool instructing the agent to work autonomously
following <research_guide> to gather context. Return all findings.

DO NOT do any other tool calls after #tool:runSubagent returns!
```

**Claude Code (after):**
```
Use the Task tool to run the research phase as a sub-agent. Pass the full
<research_guide> content as part of the Task prompt.

After the Task returns with research findings, proceed to the next step in the
workflow. Do not take additional action between spawning the Task and receiving
its results — wait for the Task to complete fully before proceeding.
```

---

## §11 — Gem-team: APM Installation (Special Case)

gem-team already supports Claude Code via APM. Do NOT manually convert its agents.
Instead, document installation:

```bash
# Install APM if needed
npm install -g @microsoft/apm

# Install gem-team (supports Claude Code natively)
apm install mubaidr/gem-team

# Or via Claude Code plugin system
/plugin marketplace add mubaidr/gem-team
/plugin install gem-team@gem-team

# Verify
claude /agents
```

Generate a README that covers:
1. APM installation command
2. Agent team table (from gem-team's README)
3. Model recommendations (from references/model-mapping.md gem-team section)
4. Key workflow: Orchestrator → Researcher → Planner → Implementer → Reviewer loop

---

## §12 — Standalone Agent (`awesome-copilot/agents/*.agent.md`)

Standalone agents are the simplest port: one upstream file → one output file. The frontmatter rules from §3, §6, §9 still apply, but the filename and attribution conventions differ from plugin-embedded agents (which inherit their filename from the plugin's own naming).

**Copilot (upstream `agents/CSharpExpert.agent.md`):**
```yaml
---
name: "C# Expert"
description: An agent designed to assist with software development tasks for .NET projects.
# version: 2026-01-20a
---

You are an expert C#/.NET developer. ...
```

**Claude Code (output `agents/csharp-expert.md`):**
```yaml
---
name: csharp-expert
description: >
  An agent designed to assist with software development tasks for .NET projects.
model: claude-sonnet-4-6
---

> Ported from awesome-copilot/agents/CSharpExpert.agent.md

You are an expert C#/.NET developer. ...
```

**Mechanical steps:**

1. **Filename**: `CSharpExpert.agent.md` → `csharp-expert.md`
   - Lowercase the whole name.
   - Insert hyphens at camelCase boundaries (`CSharpExpert` → `c-sharp-expert` is wrong; treat `CSharp` as a single token → `csharp-expert`). Use judgment for acronym-prefixed names.
   - Drop the `.agent` suffix; keep `.md`.

2. **Frontmatter normalisation**:
   - `name` → lowercase-hyphenated, **unquoted**.
   - `description` → preserve verbatim; convert single-line to folded scalar (`>`) if it grows past ~80 chars.
   - Add `model:` per `references/model-mapping.md`. Default `claude-sonnet-4-6`. Bump to `opus` only if the upstream description signals heavy reasoning (architect, security, complex implementer). Drop to `haiku` only for formatters, summarisers, light research.
   - **Drop** `# version:` comments and any `tools:`, `agents:` keys.

3. **Attribution line**: prepend as the first body paragraph (after frontmatter):
   ```markdown
   > Ported from awesome-copilot/agents/CSharpExpert.agent.md
   ```

4. **Body**: leave intact unless it contains a `#tool:` directive, VS Code GUI step, or other Copilot-specific pattern from §1–§5.

5. **`## Claude Code Notes` section**: add only if step 4 required body changes. Skip otherwise — most standalone agents are clean prose.

6. **Output location**: `agents/<name>.md` at the repo root. **Not** under `plugins/`.

7. **Update**:
   - `agents/README.md` status table count.
   - `CATALOGUE.md` `## Agents` section (one-line entry: `[<name>](agents/<name>.md) · <model> · <one-line role>`).

---

## §13 — Instructions (`awesome-copilot/instructions/*.instructions.md`)

Instructions are coding-standard fragments. Claude Code has no native `applyTo:` enforcement — preserve the glob as documentation only.

**Copilot (upstream `instructions/a11y.instructions.md`):**
```yaml
---
applyTo: '**'
description: 'Comprehensive web accessibility standards based on WCAG 2.2 AA, with 38+ anti-patterns...'
---

# Accessibility Standards

Comprehensive accessibility rules for web application development. ...
```

**Claude Code (output `instructions/a11y.md`):**
```yaml
---
applyTo: '**'
description: >
  Comprehensive web accessibility standards based on WCAG 2.2 AA, with 38+ anti-patterns,
  legal enforcement context (EAA, ADA Title II), WAI-ARIA patterns, and framework-specific
  fixes for modern web frameworks and libraries.
---

> Ported from awesome-copilot/instructions/a11y.instructions.md

# Accessibility Standards

Comprehensive accessibility rules for web application development. ...
```

**Mechanical steps:**

1. **Filename**: `a11y.instructions.md` → `a11y.md`. Drop the `.instructions` suffix; preserve the rest of the name (most upstream instructions files are already kebab-case).

2. **Frontmatter**:
   - Keep `applyTo:` **verbatim** — it is the most useful piece of metadata to retain even if not enforced.
   - Keep `description:` verbatim. Convert to folded scalar if long.
   - Drop any other keys.

3. **Attribution line**: prepend
   ```markdown
   > Ported from awesome-copilot/instructions/<original-filename>
   ```

4. **Body**: leave intact. Only rewrite if the body contains `#tool:` directives or VS Code-only references (per §1–§5).

5. **Consumer wiring**: instructions are not auto-loaded by Claude Code. The expected consumer pattern (documented in `instructions/README.md`) is one of:
   - `@./.claude/instructions/<name>.md` reference in the project `CLAUDE.md`
   - Inline paste into a subject-matter agent definition
   - Manual reference on demand

6. **Output location**: `instructions/<name>.md` at the repo root.

7. **Update**:
   - `instructions/README.md` status table count.
   - `CATALOGUE.md` `## Instructions` section. Group by topic family (languages → frameworks → ops → AI/ML → meta) for browsability.

---

## §14 — Hook Bundle (`awesome-copilot/hooks/<bundle>/`)

Copilot hooks ship as a folder with `hooks.json` + scripts. Claude Code hooks live in `~/.claude/settings.json` with a different shape and different event names.

### Event name mapping

| Copilot event | Claude Code event | Trigger semantics |
|---|---|---|
| `sessionStart` | `SessionStart` | New Claude Code session begins |
| `sessionEnd` | `Stop` | Main agent finishes responding (rough analog) |
| `preToolCall` | `PreToolUse` | Before any tool invocation |
| `postToolCall` | `PostToolUse` | After any tool invocation |
| `userPrompt` | `UserPromptSubmit` | User submits a new message |
| `preNotification` | `Notification` | Claude Code emits a notification |
| `subagentStop` | `SubagentStop` | A spawned Task subagent finishes |

`Stop` and `sessionEnd` are not exact equivalents — `Stop` fires after each main-agent response, not at "session end" (Claude Code has no formal session-end event). Document the semantic difference in the bundle README if the hook's intent assumes a single fire-per-session.

### Schema mapping

**Copilot (upstream `hooks.json`):**
```json
{
  "version": 1,
  "hooks": {
    "sessionEnd": [
      {
        "type": "command",
        "bash": ".github/hooks/dependency-license-checker/check-licenses.sh",
        "cwd": ".",
        "env": { "LICENSE_MODE": "warn" },
        "timeoutSec": 60
      }
    ]
  }
}
```

**Claude Code (output `claude-settings.json` fragment):**
```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/dependency-license-checker/check-licenses.sh",
            "timeout": 60
          }
        ]
      }
    ]
  },
  "env": {
    "LICENSE_MODE": "warn"
  }
}
```

Field-by-field:
- `bash` → `command` (Claude Code uses `command:` regardless of interpreter; the shebang inside the script controls execution).
- `cwd` → drop. Claude Code hooks run from the project root by default. Adjust the script if it relied on a specific cwd.
- `env` → lift to top-level `env` in `settings.json`. (Per-hook env vars need to be set inside the script itself.)
- `timeoutSec` → `timeout` (seconds, same units).
- Path `.github/hooks/<bundle>/<script>` → `.claude/hooks/<bundle>/<script>`.

### Output bundle structure

```
hooks/<bundle-name>/
├── README.md            ← events, env vars, dependencies, security notes
├── claude-settings.json ← fragment for the user to merge into ~/.claude/settings.json
├── <script-1>           ← original scripts, with internal paths rewritten
└── <script-N>
```

### Script-internal path rewrites

Any script that references the upstream `.github/hooks/<bundle>/` directory needs its paths rewritten to `.claude/hooks/<bundle>/`. Use `grep -rn '.github/hooks' .` in the converted bundle to catch missed references.

### Installation philosophy

The installer **copies scripts** into `.claude/hooks/<bundle>/` and **prints** the `claude-settings.json` fragment for the user to merge deliberately. It does NOT auto-merge `settings.json`. Justification:
- Hook configs execute arbitrary commands on session events — silent overwrite is too dangerous.
- Users typically have their own hooks already configured.
- Merging JSON config correctly across schema variants is fragile; surfacing the fragment lets the user diff and merge knowingly.

### Update

- `hooks/README.md` status table count.
- `CATALOGUE.md` `## Hooks` section with: bundle name, events covered, dependencies, install line.

---

## §15 — Agentic Workflow (`awesome-copilot/workflows/*.md`)

Upstream workflows are single markdown files combining the agent prompt and YAML frontmatter declaring schedule, permissions, and outputs. Execution is GitHub Actions → Copilot CLI.

**Copilot (upstream `workflows/daily-issues-report.md`):**
```yaml
---
name: "Daily Issues Report"
description: "Generates a daily summary of open issues and recent activity as a GitHub issue"
on:
  schedule: daily on weekdays
permissions:
  contents: read
  issues: read
safe-outputs:
  create-issue:
    title-prefix: "[daily-report] "
    labels: [report]
---

## Daily Issues Report

Create a daily summary of open issues for the team. ...
```

**Output 1 — the prompt** (`workflows/daily-issues-report.md`):

Keep the markdown body verbatim. Adjust the frontmatter into a "documentation" shape — Claude Code doesn't interpret it, but it preserves intent for the consumer's `.github/workflows/<name>.yml`:

```yaml
---
name: "Daily Issues Report"
description: >
  Generates a daily summary of open issues and recent activity as a GitHub issue.
upstream-schedule: "daily on weekdays"
upstream-permissions:
  contents: read
  issues: read
upstream-outputs:
  - kind: create-issue
    title-prefix: "[daily-report] "
    labels: [report]
---

> Ported from awesome-copilot/workflows/daily-issues-report.md

## Daily Issues Report

Create a daily summary of open issues for the team. ...
```

The `upstream-*` keys are documentation only — the actual schedule and permissions live in the YAML runner file (Output 2). Rename to make this distinction obvious so no consumer assumes Claude Code is interpreting them.

**Output 2 — the runner** (`workflows/daily-issues-report.github-action.yml`):

```yaml
# Companion GitHub Actions runner for workflows/daily-issues-report.md
# Copy to .github/workflows/daily-issues-report.yml in the consumer's repo and
# adapt schedule / secrets / permissions as needed.

name: Daily Issues Report

on:
  schedule:
    - cron: "0 9 * * 1-5"   # 9am UTC, Mon-Fri (translates "daily on weekdays")
  workflow_dispatch:

permissions:
  contents: read
  issues: write   # write needed because the workflow creates issues

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Run Claude Code agent
        uses: anthropics/claude-code-action@v1
        with:
          anthropic-api-key: ${{ secrets.ANTHROPIC_API_KEY }}
          prompt-file: workflows/daily-issues-report.md
          allowed-tools: bash,gh
          model: claude-sonnet-4-6
```

The `anthropics/claude-code-action` invocation is the canonical pattern — adjust if upstream guidance changes.

### Update

- `workflows/README.md` status table count.
- `CATALOGUE.md` `## Workflows` section: `[<name>](workflows/<name>.md) · <schedule> · <one-line purpose>`.

---

## §16 — Cookbook Recipe (`awesome-copilot/cookbook/<recipe>/`)

The upstream cookbook is **Copilot-SDK-specific**. Recipes are not mechanically convertible — each needs evaluation against the Anthropic SDK surface.

### Decision framework

| Upstream theme | Claude analog | Action |
|---|---|---|
| Ralph Loop (autonomous loops) | `claude --print` loop OR Agent SDK | Rewrite |
| Error handling | `@anthropic-ai/sdk` error types + retry/backoff | Rewrite |
| Multiple sessions | Anthropic SDK conversation IDs OR `claude --session-id` | Rewrite |
| Persisting sessions | `claude --session-id` + filesystem snapshots | Rewrite |
| Managing local files | Direct — Claude Code has filesystem-first tools | Rewrite as CLI-driven recipe |
| PR visualisation | `gh` CLI + Claude Code | Rewrite |
| MCP integrations | Direct — Claude Code consumes MCP natively | Rewrite |
| Copilot-CLI-specific telemetry / marketplace APIs | (no analog) | **Skip** — do not stub |
| Accessibility report | Playwright MCP server | Rewrite |

### Output shape

```
cookbook/<recipe-name>/
├── README.md            ← problem statement + Claude analog summary
├── nodejs/              ← @anthropic-ai/sdk implementation
│   ├── README.md
│   └── <code-files>
├── python/              ← anthropic implementation
│   ├── README.md
│   └── <code-files>
└── claude-code-cli/     ← pure CLI implementation (when applicable)
    ├── README.md
    └── <script-files>
```

Not every recipe gets every language. Start with whichever language the upstream recipe targets and add others on demand.

### Per-recipe README template

```markdown
# <Recipe Name>

> Ported from awesome-copilot/cookbook/copilot-sdk/<lang>/<name>.md

## Problem

[One paragraph from upstream — the "what are we trying to do".]

## Approach in Claude Code

[How the Anthropic SDK / Claude Code CLI handles this. Differences from the
Copilot SDK approach, called out explicitly.]

## Implementations

- [Node.js / TypeScript](nodejs/) — `@anthropic-ai/sdk`
- [Python](python/) — `anthropic`
- [CLI](claude-code-cli/) — `claude --print` and friends

## Out of scope

[If upstream covered Copilot-CLI-only APIs, list what was skipped and why.]
```

### Hard rule

If a recipe's core mechanism is Copilot-CLI-specific (e.g. Copilot's marketplace API, Copilot telemetry endpoints, Copilot Workspace integration), **do not stub-port**. Mark it skipped in the bucket README. Half-implementations rot fast.

### Update

- `cookbook/README.md` status table count.
- `CATALOGUE.md` `## Cookbook` section: one-line per recipe with languages covered.
