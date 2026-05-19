---
name: "Daily Issues Report"
description: "Generates a daily summary of open issues and recent activity as a GitHub issue"
upstream-schedule: "daily on weekdays"
upstream-permissions:
  contents: read
  issues: read
upstream-outputs:
  create-issue:
    title-prefix: "[daily-report] "
    labels: "[report]"
---

> Ported from awesome-copilot/workflows/daily-issues-report.md (per `copilot-to-claude-multiagent/references/conversion-patterns.md` §15)

## Daily Issues Report

Create a daily summary of open issues for the team.

## What to Include

- New issues opened in the last 24 hours
- Issues closed or resolved
- Stale issues that need attention
