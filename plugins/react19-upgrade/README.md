# react19-upgrade — Claude Code Port

> Ported from `awesome-copilot/plugins/react19-upgrade` v1.0.0
> Original author: Awesome Copilot Community | License: MIT | Converted: 2026-05-19

Enterprise React 19 migration toolkit with specialized agents and skills for upgrading React 18 codebases to React 19. Includes auditor, dependency surgeon, source code migrator, and test guardian. Handles removal of deprecated APIs including ReactDOM.render, forwardRef, defaultProps, legacy context, string refs, and more.

**Keywords:** `react19`, `react`, `migration`, `upgrade`, `hooks`, `modern-react`

## Agents

| Agent | Model | Role |
|---|---|---|
| `agents/react19-auditor.md` | `claude-sonnet-4-6` | Deep-scan specialist that identifies every React 19 breaking change and deprecated pattern across the entire codebase. P |
| `agents/react19-commander.md` | `claude-sonnet-4-6` | Master orchestrator for React 19 migration. Invokes specialist subagents in sequence - auditor, dep-surgeon, migrator, t |
| `agents/react19-dep-surgeon.md` | `claude-sonnet-4-6` | Dependency upgrade specialist. Installs React 19, resolves all peer dependency conflicts, upgrades testing-library, Apol |
| `agents/react19-migrator.md` | `claude-sonnet-4-6` | Source code migration engine. Rewrites every deprecated React pattern to React 19 APIs - forwardRef, defaultProps, React |
| `agents/react19-test-guardian.md` | `claude-sonnet-4-6` | Test suite fixer and verification specialist. Migrates all test files to React 19 compatibility and runs the suite until |

## Skills

- `skills/react19-concurrent-patterns/SKILL.md`
- `skills/react19-source-patterns/SKILL.md`
- `skills/react19-test-patterns/SKILL.md`

## Installation

```bash
# from the project where you want it installed:
/path/to/claude-multiagent-catalogue/install.sh react19-upgrade --skills

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

# React 19 Upgrade Plugin

Enterprise toolkit for migrating React 18 codebases to React 19. Includes five specialized agents and three skills targeting the specific challenges of upgrading to React 19's modern API surface.

## Installation

```bash
copilot plugin install react19-upgrade@awesome-copilot
```

## What's Included

### Agents

1. **react19-commander**  Master orchestrator that coordinates the entire migration pipeline through audit, dependencies, source code migration, and test verification phases.

2. **react19-auditor**  Deep-scan specialist that identifies every React 19 breaking change and deprecated pattern:
   - Removed APIs: `ReactDOM.render`, `ReactDOM.hydrate`, `unmountComponentAtNode`, `findDOMNode`, `createFactory`, `react-dom/test-utils` exports
   - Legacy Context API (`contextTypes`, `childContextTypes`, `getChildContext`)
   - String refs (`this.refs.x`)
   - Deprecated patterns: `forwardRef`, `defaultProps` on function components, `useRef()` without initial value
   - Test-specific issues: `act` import location, `Simulate` usage, StrictMode changes

3. **react19-dep-surgeon**  Dependency upgrade specialist that upgrades to react@19, handles @testing-library/react@16+, resolves all peer conflicts, and returns GO/NO-GO confirmation.

4. **react19-migrator**  Source code migration engine that rewrites required React 19 changes and can apply optional modernizations for deprecated patterns:  
   - `ReactDOM.render` → `createRoot`  
   - `ReactDOM.hydrate` → `hydrateRoot`  
   - `unmountComponentAtNode` → `root.unmount()`  
   - `findDOMNode` → direct refs  
   - Optional modernization: `forwardRef` → ref as direct prop  
   - `defaultProps` → ES6 defaults
   - Legacy Context → `createContext`
   - String refs → `createRef`
   - `useRef()` → `useRef(null)`
   - `propTypes` → documentation comments

5. **react19-test-guardian**  Test suite fixer that handles:
   - `act` import fixes (react-dom/test-utils → react)
   - `Simulate` → `fireEvent` migrations
   - StrictMode spy call count deltas (no more double-invoke in React 19)
   - `useRef` shape updates
   - Custom render helper verification
   - Error boundary test updates
   - Runs tests until zero failures

### Skills

1. **react19-concurrent-patterns**  Deep patterns for React 19 concurrent features including Suspense, use() Hook, Server Components integration, and concurrent batching.

2. **react19-source-patterns**  Migration patterns for source API changes including DOM/root APIs, refs, and context updates.

3. **react19-test-patterns**  Comprehensive test migration guide covering `act()` semantics, error boundary testing, and StrictMode behavioral changes.

## Quick Start

```
Ask: "Start implementing React 19 migration for my codebase"
```

The react19-commander will guide you through:

1. Audit → identify all breaking changes
2. Deps → upgrade to react@19 + compatible libraries
3. Migrate → fix all deprecated APIs and patterns
4. Tests → migrate test suite and run to green

## Breaking Changes from React 18

### Removed APIs

- `ReactDOM.render()`  use `createRoot()`
- `ReactDOM.hydrate()`  use `hydrateRoot()`
- `ReactDOM.unmountComponentAtNode()`  use `root.unmount()`
- `ReactDOM.findDOMNode()`  use direct refs
- `React.createFactory()`  use JSX
- `react-dom/test-utils` exports
- Legacy Context API
- String refs

### Deprecated Patterns (Still work but should migrate)

- `forwardRef`  ref is now a direct prop
- `defaultProps` on function components  use ES6 defaults
- `useRef()` without initial value  pass `null`

### Behavioral Changes

- StrictMode no longer double-invokes effects (affects test call count assertions)
- `propTypes` runtime validation removed (keep for documentation, but no runtime checks)

## Key Features

- ✅ Comprehensive removal of 8+ deprecated React APIs
- ✅ Handles complex patterns: legacy context, forwardRef, defaultProps
- ✅ Memory-based resumable pipeline  survive interruptions
- ✅ Zero tolerance for incomplete migrations  run to full success
- ✅ StrictMode-aware test fixes
- ✅ Testing-library v16+ compatibility verification
- ✅ Error boundary and async test pattern updates

## Prerequisite

This plugin assumes you're migrating from **React 18** codebases. If you're on React 16/17, use the **react18-upgrade** plugin first to reach React 18.3.1, then use this plugin for the React 19 final upgrade.

## Source

This plugin is part of [Awesome Copilot](https://github.com/github/awesome-copilot).

## License

MIT
