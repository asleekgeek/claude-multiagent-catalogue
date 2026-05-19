# session-logger — Claude Code Hook Bundle

> Ported from `awesome-copilot/hooks/session-logger` per `copilot-to-claude-multiagent/references/conversion-patterns.md` §14

**Events covered (Claude Code):** SessionStart, Stop, UserPromptSubmit

**Upstream events:** sessionEnd, sessionStart, userPromptSubmitted

## Installation

```bash
~/src/claude-multiagent-catalogue/install.sh install-hook session-logger
```

The installer copies the scripts into `.claude/hooks/session-logger/` and **prints** the `claude-settings.json` fragment below for you to merge into your `~/.claude/settings.json` deliberately — it does NOT auto-merge (hook commands execute on session events; silent overwrite is too dangerous).

## Settings fragment to merge

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/session-logger/log-session-start.sh",
            "timeout": 5
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/session-logger/log-session-end.sh",
            "timeout": 5
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/session-logger/log-prompt.sh",
            "timeout": 5
          }
        ]
      }
    ]
  },
  "env": {
    "LOG_LEVEL": "INFO"
  }
}
```

## Files in this bundle

- `log-prompt.sh`
- `log-session-end.sh`
- `log-session-start.sh`
- `claude-settings.json` (printed by installer, not copied)

## Claude Code Notes

Conversion applied (per `references/conversion-patterns.md` §14):

- Upstream `hooks.json` schema → Claude Code `hooks` block in `claude-settings.json`:
  - `bash` field → `command` (Claude reads the shebang inside the script).
  - `cwd` field dropped — Claude Code hooks run from the project root; scripts that     relied on a specific cwd were adapted in place.
  - `env` lifted to top-level `env` in the settings fragment.
  - `timeoutSec` → `timeout` (seconds, same units).
- Event names mapped:
  - `sessionEnd` → `Stop`
  - `sessionStart` → `SessionStart`
  - `userPromptSubmitted` → `UserPromptSubmit`
- Script-internal references to `.github/hooks/<bundle>/` rewritten to   `.claude/hooks/<bundle>/`.

---

## Original upstream README

---
name: 'Session Logger'
description: 'Logs all Copilot coding agent session activity for audit and analysis'
tags: ['logging', 'audit', 'analytics']
---

# Session Logger Hook

Comprehensive logging for GitHub Copilot coding agent sessions, tracking session starts, ends, and user prompts for audit trails and usage analytics.

## Overview

This hook provides detailed logging of Copilot coding agent activity:
- Session start/end times with working directory context
- User prompt submission events
- Configurable log levels

## Features

- **Session Tracking**: Log session start and end events
- **Prompt Logging**: Record when user prompts are submitted
- **Structured Logging**: JSON format for easy parsing
- **Privacy Aware**: Configurable to disable logging entirely

## Installation

1. Copy this hook folder to your repository's `.github/hooks/` directory:
   ```bash
   cp -r hooks/session-logger .github/hooks/
   ```

2. Create the logs directory:
   ```bash
   mkdir -p logs/copilot
   ```

3. Ensure scripts are executable:
   ```bash
   chmod +x .github/hooks/session-logger/*.sh
   ```

4. Commit the hook configuration to your repository's default branch

## Log Format

Session events are written to `logs/copilot/session.log` and prompt events to `logs/copilot/prompts.log` in JSON format:

```json
{"timestamp":"2024-01-15T10:30:00Z","event":"sessionStart","cwd":"/workspace/project"}
{"timestamp":"2024-01-15T10:35:00Z","event":"sessionEnd"}
```

## Privacy & Security

- Add `logs/` to `.gitignore` to avoid committing session data
- Use `LOG_LEVEL=ERROR` to only log errors
- Set `SKIP_LOGGING=true` environment variable to disable
- Logs are stored locally only
