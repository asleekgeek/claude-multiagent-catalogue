# Copilot → Claude Code Tool Mapping

## Direct Equivalents

| Copilot Tool | Claude Code Equivalent | Implementation |
|---|---|---|
| `read` | bash + file tools | `cat`, `head`, `grep`, or `read_file` |
| `edit` / `editFiles` | bash + file tools | `sed`, `awk`, `tee`, or `write_file` / `str_replace_based_edit` |
| `execute` / `terminalCommand` | bash | Full shell, no restrictions |
| `search` | bash | `grep -r`, `fd`, `rg` (ripgrep) |
| `web` / `web/fetch` | `web_fetch` or bash | `curl` or Claude Code's web_fetch tool |
| `agent` / `runSubagent` | `Task` tool | Spawns a fresh Claude Code sub-agent instance |
| `todo` / `manage_todo_list` | `TodoManager` | Claude Code built-in; identical semantics |
| `codebase` | bash | `find`, `grep`, `cat`, `rg`; or configured semantic search MCP |
| `problems` | bash | Run linter/type-checker directly: `npm run lint`, `tsc --noEmit`, etc. |
| `githubRepo` | bash (`gh` CLI) or `web_fetch` | `gh issue list`, `gh pr create`, GitHub API via curl |

## No Direct Equivalent — Adaptation Required

| Copilot Tool | Adaptation Strategy |
|---|---|
| `vscode` | **Remove.** Claude Code is terminal-native. Replace VS Code GUI actions with bash equivalents. Actions that are truly UI-only (e.g. "open in editor") become "user action required" notes. |
| `manage_todo_list` | Use Claude Code's built-in `TodoManager` tool — same create/update/complete semantics. For cross-session persistence, also write to `TODO.md` in the project root. |

## MCP-Backed Tools

Some Copilot tools map cleanly to Claude Code MCP servers. Mention these in the plugin's
`README.md` under "MCP Dependencies". Config goes in `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": { "GITHUB_TOKEN": "${GITHUB_TOKEN}" }
    },
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    },
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

| Copilot Tool | MCP Server Package | When to include |
|---|---|---|
| `githubRepo` (advanced) | `@modelcontextprotocol/server-github` | Plugin makes heavy use of GitHub API |
| `web` (advanced) | `@modelcontextprotocol/server-fetch` | Plugin fetches many external URLs |
| `#context7` | `@upstash/context7-mcp` | Plugin uses Context7 for library docs |

## Tool Reference: Claude Code Built-in Tools

When adapting body text, use these canonical Claude Code tool names:

- **bash** — Execute shell commands
- **read_file** — Read file contents
- **write_file** — Write/create files
- **str_replace_based_edit** — Make targeted edits to files
- **web_fetch** — Fetch URL content
- **Task** — Spawn a Claude Code sub-agent (the runSubagent equivalent)
- **TodoManager** — Create, update, complete todo items
- **Glob** — Pattern-match file paths
- **Grep** — Search file contents

Note: In Claude Code agent `.md` files, you don't declare tools — all are available by default.
Only mention specific tools in the body when guiding the agent on *how* to use them.
