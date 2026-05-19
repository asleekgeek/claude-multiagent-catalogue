# react18-upgrade — Claude Code Port

> Ported from `awesome-copilot/plugins/react18-upgrade` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Enterprise React 18 migration toolkit with specialized agents and skills for upgrading React 16/17 class-component codebases to React 18.3.1. Includes auditor, dependency surgeon, class component migration specialist, automatic batching fixer, and test guardian.

**Keywords:** `react18`, `react`, `migration`, `upgrade`, `class-components`, `lifecycle`, `batching`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/react18-auditor.md` | `claude-sonnet-4-6` | Deep-scan specialist for React 16/17 class-component codebases targeting React 18.3.1. Finds unsafe lifecycle methods, l |
| `agents/react18-batching-fixer.md` | `claude-sonnet-4-6` | Automatic batching regression specialist. React 18 batches ALL setState calls including those in Promises, setTimeout, a |
| `agents/react18-class-surgeon.md` | `claude-sonnet-4-6` | Class component migration specialist for React 16/17 → 18.3.1. Migrates all three unsafe lifecycle methods with correct  |
| `agents/react18-commander.md` | `claude-sonnet-4-6` | Master orchestrator for React 16/17 → 18.3.1 migration. Designed for class-component-heavy codebases. Coordinates audit, |
| `agents/react18-dep-surgeon.md` | `claude-sonnet-4-6` | Dependency upgrade specialist for React 16/17 → 18.3.1. Pins to 18.3.1 exactly (not 18.x latest). Upgrades RTL to v14, A |
| `agents/react18-test-guardian.md` | `claude-sonnet-4-6` | Test suite fixer and verifier for React 16/17 → 18.3.1 migration. Handles RTL v14 async act() changes, automatic batchin |

## Skills

- `skills/react-audit-grep-patterns/SKILL.md`
- `skills/react18-batching-patterns/SKILL.md`
- `skills/react18-dep-compatibility/SKILL.md`
- `skills/react18-enzyme-to-rtl/SKILL.md`
- `skills/react18-legacy-context/SKILL.md`
- `skills/react18-lifecycle-patterns/SKILL.md`
- `skills/react18-string-refs/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh react18-upgrade --skills

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

# React 18 Upgrade Plugin

Enterprise toolkit for migrating React 16/17 class-component codebases to React 18.3.1. Includes six specialized agents and seven skills targeting the specific challenges of upgrading legacy class-heavy applications.

## Installation

```bash
copilot plugin install react18-upgrade@awesome-copilot
```

## What's Included

### Agents

1. **react18-commander** - Master orchestrator that coordinates the entire migration pipeline through audit, dependencies, class-component surgery, automatic batching fixes, and test verification phases.

2. **react18-auditor** - Deep-scan specialist that identifies every React 18 breaking change: unsafe lifecycle methods, legacy context, string refs, batching vulnerabilities, and all deprecation patterns.

3. **react18-dep-surgeon** - Dependency upgrade specialist that pins react@18.3.1 exactly, upgrades testing-library to v14+, resolves all peer conflicts, and returns GO/NO-GO confirmation.

4. **react18-class-surgeon** - Lifecycle and API migration specialist that performs semantic migrations for:
   - `componentWillMount` → `componentDidMount` or constructor
   - `componentWillReceiveProps` → `getDerivedStateFromProps` or `componentDidUpdate`
   - `componentWillUpdate` → `getSnapshotBeforeUpdate` or `componentDidUpdate`
   - Legacy Context → `createContext`
   - String refs → `React.createRef()`
   - `findDOMNode` → direct refs
   - `ReactDOM.render` → `createRoot`

5. **react18-batching-fixer** - Automatic batching regression specialist that identifies and fixes the #1 silent runtime breaker in React 18: setState calls in async methods that relied on immediate intermediate re-renders.

6. **react18-test-guardian** - Test suite fixer that handles Enzyme-to-RTL rewrites, RTL v14 API updates, automatic batching test regressions, StrictMode double-invoke changes, and runs tests until zero failures.

### Skills

1. **react-audit-grep-patterns** - Reference grep patterns for auditing React 18 deprecations across class components.

2. **react18-batching-patterns** - Patterns and strategies for identifying and fixing automatic batching regressions.

3. **react18-dep-compatibility** - Dependency compatibility matrix for React 18 with migration paths for testing-library, Apollo, Emotion, react-router.

4. **react18-enzyme-to-rtl** - Complete guide for rewriting Enzyme tests to React Testing Library (RTL v14+).

5. **react18-legacy-context** - Migration patterns for legacy context API → `createContext`.

6. **react18-lifecycle-patterns** - Detailed migration patterns for all three unsafe lifecycle methods.

7. **react18-string-refs** - Reference implementations for migrating string refs to `React.createRef()`.

## Quick Start

```
Ask: "Start implementing React 18 migration for my class-component codebase"
```

The react18-commander will guide you through:

1. Audit → identify all breaking changes
2. Deps → upgrade to react@18.3.1 + compatible libraries
3. Class Surgery → migrate lifecycle methods and APIs
4. Batching Fixes → fix automatic batching regressions
5. Tests → migrate test suite and run to green

## Why React 18.3.1?

React 18.3.1 was released to surface **explicit warnings** for every API that React 19 will remove. A clean 18.3.1 run with zero warnings is the direct prerequisite for the React 19 migration.

## Key Features

- ✅ Targets class-component-heavy codebases (NOT just functional component patterns)
- ✅ Automatic batching issue detection and `flushSync` recommendations
- ✅ Enzyme test detection with full RTL rewrite capability
- ✅ Memory-based resumable pipeline - survive interruptions
- ✅ Zero tolerance for incomplete migrations - run to full success
- ✅ StrictMode-aware test fixes
- ✅ Apollo Client, Emotion, react-router compatibility handling

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot).

## License

MIT
