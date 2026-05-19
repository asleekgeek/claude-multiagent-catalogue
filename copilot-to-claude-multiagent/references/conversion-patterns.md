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
