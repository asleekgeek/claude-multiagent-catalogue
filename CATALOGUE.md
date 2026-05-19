# Catalogue

Discovery index across every populated bucket in this marketplace mirror. One section per bucket; entries appear here only after their conversion is complete and committed.

Empty buckets are listed in [README.md](README.md) with `0 / <n> upstream` counts but no entries here.

---

## Plugins

Detailed entries for every converted plugin — orchestration pattern, agent roster with model assignments, and install notes.

### rug-agentic-workflow

| Field | Value |
|-------|-------|
| **Original** | `rug-agentic-workflow` by Awesome Copilot Community |
| **Pattern** | Orchestrator + Subagents (RUG — Repeat Until Good) |
| **License** | MIT |

#### What it does

A three-agent delivery rig with hard separation between orchestration, implementation, and verification. The orchestrator never writes code — it decomposes, delegates via the `Task` tool, validates with a separate QA agent, and loops until every acceptance criterion independently passes.

Best suited for: complex feature work, refactoring tasks, anything where "it probably works" isn't good enough and you want a validation gate that didn't write the code it's checking.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| RUG Orchestrator | `agents/rug-orchestrator.md` | `claude-opus-4-6` | Decomposes work, spawns Tasks, runs validation loops, tracks progress. Never writes code. |
| SWE Subagent | `agents/rug-swe-subagent.md` | `claude-opus-4-6` | Senior engineer: feature dev, bug fixes, refactoring, tests. Fresh context per task. |
| QA Subagent | `agents/rug-qa-subagent.md` | `claude-sonnet-4-6` | Adversarial tester: independent validation, edge cases, PASS/FAIL sign-off. Never the same agent that wrote the code. |

#### Orchestration Flow

```
User request
  └─► RUG (claude-opus-4-6)
        ├─► Task: planning subagent (for complex work)
        ├─► Task: SWE — implementation
        ├─► Task: QA  — independent validation
        │     ├─ PASS → mark complete, next task
        │     └─ FAIL → re-spawn SWE with failure report, repeat
        └─► Task: final integration validation
              └─ All pass → return to user
```

#### Install

```bash
install.sh rug-agentic-workflow
```

---

### ai-team-orchestration

| Field | Value |
|-------|-------|
| **Original** | `ai-team-orchestration` by Denis Evdokimov |
| **Pattern** | Producer + parallel Dev/QA teams + sprint lifecycle |
| **License** | MIT |

#### What it does

Sprint-driven multi-agent workflow with named roles (Remy the Producer, Nova/Sage/Milo the dev team, Ivy the QA). The human acts as the message bus between parallel chat sessions — each team runs in its own Claude Code instance. Includes `PROJECT_BRIEF.md` as the cross-session source of truth and a full context recovery protocol for when context windows overflow mid-sprint.

Best suited for: greenfield projects, multi-sprint delivery, anything that benefits from persistent sprint documentation and named agent personalities.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| Producer (Remy) | `agents/ai-team-producer.md` | `claude-sonnet-4-6` | Sprint planning, PR merges, bug triage. Never writes app code. |
| Dev Team (Nova/Sage/Milo) | `agents/ai-team-dev.md` | `claude-opus-4-6` | Full-stack implementation: frontend (Nova), backend (Sage), visual (Milo). |
| QA (Ivy) | `agents/ai-team-qa.md` | `claude-sonnet-4-6` | Playtesting, E2E tests, bug filing, sprint sign-off. |

#### Skills

| Skill | Purpose |
|-------|---------|
| `ai-team-orchestration` | Bootstraps the team, documents chat architecture, sprint templates |

#### Install

```bash
install.sh ai-team-orchestration --skills
```

---

### software-engineering-team

| Field | Value |
|-------|-------|
| **Original** | `software-engineering-team` by Awesome Copilot Community |
| **Pattern** | 7 SDLC specialist reviewers |
| **License** | MIT |

#### What it does

Seven specialist agents covering the full software development lifecycle — not an orchestrated pipeline but a reviewer pool. Invoke individual agents for focused review passes: architecture decisions, security audits, CI/CD debugging, UX critique, responsible AI checks, technical writing, and product management advisory.

Best suited for: code review augmentation, pre-PR specialist checks, architectural decision validation.

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| Architect | `agents/se-system-architecture-reviewer.md` | `claude-opus-4-6` | Well-Architected framework review, ADR generation |
| Security | `agents/se-security-reviewer.md` | `claude-opus-4-6` | OWASP Top 10, LLM Top 10, Zero Trust review |
| DevOps/CI | `agents/se-gitops-ci-specialist.md` | `claude-sonnet-4-6` | CI/CD pipelines, deployment debugging, GitOps |
| Product Manager | `agents/se-product-manager-advisor.md` | `claude-sonnet-4-6` | Requirements, prioritisation, stakeholder advisory |
| Technical Writer | `agents/se-technical-writer.md` | `claude-haiku-4-5-20251001` | Docs, READMEs, API references |
| UX/UI Designer | `agents/se-ux-ui-designer.md` | `claude-sonnet-4-6` | UX critique, accessibility, design system |
| Responsible AI | `agents/se-responsible-ai-code.md` | `claude-opus-4-6` | AI ethics, bias checks, compliance |

#### Install

```bash
install.sh software-engineering-team
```

---

### structured-autonomy

| Field | Value |
|-------|-------|
| **Original** | `structured-autonomy` by Awesome Copilot Community |
| **Pattern** | Plan → Generate → Implement pipeline (skills only) |
| **License** | MIT |

#### What it does

A three-skill pipeline for structured feature delivery. Planning skill researches the codebase and produces a `plan.md` with commit-level breakdown. Generator skill reads the plan and produces a complete `implementation.md` with copy-paste-ready code blocks. Implementation skill walks the agent step by step through the commits with explicit stop-and-verify checkpoints.

Best suited for: solo agentic work where you want structured, checkpointed delivery rather than a big-bang implementation.

#### Skills

| Skill | File | Purpose |
|-------|------|---------|
| Plan | `skills/structured-autonomy-plan/SKILL.md` | Research + feature breakdown into commits |
| Generate | `skills/structured-autonomy-generate/SKILL.md` | Produce complete implementation guide |
| Implement | `skills/structured-autonomy-implement/SKILL.md` | Step-by-step execution with checkpoints |

#### Install

```bash
install.sh structured-autonomy --skills
```

---

### quality-playbook

| Field | Value |
|-------|-------|
| **Original** | `quality-playbook` v1.5.6 by Andrew Stellman (https://github.com/andrewstellman/quality-playbook) |
| **Pattern** | Orchestrator + per-phase Task sub-agents (7-phase quality engineering audit) |
| **License** | See `plugins/quality-playbook/skills/quality-playbook/LICENSE.txt` |

#### What it does

A seven-phase quality engineering audit that finds the ~35% of real defects structural code review alone cannot catch. The orchestrator never executes phase logic itself — it spawns one Task sub-agent per phase, each with a fresh context window, and verifies output files between phases. The playbook explores the project first (domain, architecture, specs, failure history) before generating requirements and tests — exploration findings drive bug discovery.

Best suited for: codebases that need a rigorous quality pass before release, or any place "all the unit tests pass" is not the same as "the code is correct".

#### Agent Roster

| Agent | File | Model | Role |
|-------|------|-------|------|
| QP Orchestrator | `agents/qp-orchestrator.md` | `claude-opus-4-6` | Spawns one Task sub-agent per phase, verifies output files, never does phase logic itself |
| QP Calibration Orchestrator | `agents/qp-calibration-orchestrator.md` | `claude-opus-4-6` | Multi-session calibration cycle across multiple benchmarks (for tuning the playbook to a codebase type) |

#### Skill

| Skill | File | Purpose |
|-------|------|---------|
| Quality Playbook | `skills/quality-playbook/SKILL.md` | Phase execution logic, references, phase prompts, `quality_gate.py` helper. Required. |

#### Install

```bash
install.sh quality-playbook --skills
```

---

## Agents
<!-- AGENTS-SECTION-START -->
<!-- Auto-generated from the agents/ directory during Phase B bulk port. Regenerate when porting new agents. -->

Standalone agent definitions ported from `awesome-copilot/agents/`. Listed alphabetically. Default model is `claude-sonnet-4-6`; heavier roles (orchestrators, architects, security, complex implementers) carry `claude-opus-4-6`.

_Currently populated: 211 / 211 upstream._

| Agent | Model | Role |
|---|---|---|
| [accessibility-runtime-tester](agents/accessibility-runtime-tester.md) | `claude-sonnet-4-6` | Runtime accessibility specialist for keyboard flows, focus management, dialog behavior, form errors, and evidence-backed WCAG v… |
| [accessibility](agents/accessibility.md) | `claude-sonnet-4-6` | Expert assistant for web accessibility (WCAG 2.1/2.2), inclusive UX, and a11y testing |
| [address-comments](agents/address-comments.md) | `claude-sonnet-4-6` | Address PR comments |
| [adr-generator](agents/adr-generator.md) | `claude-sonnet-4-6` | Expert agent for creating comprehensive Architectural Decision Records (ADRs) with structured formatting optimized for AI consu… |
| [aem-frontend-specialist](agents/aem-frontend-specialist.md) | `claude-sonnet-4-6` | Expert assistant for developing AEM components using HTL, Tailwind CSS, and Figma-to-code workflows with design system integration |
| [agent-governance-reviewer](agents/agent-governance-reviewer.md) | `claude-sonnet-4-6` | AI agent governance expert that reviews code for safety issues, missing governance controls, and helps implement policy enforce… |
| [ai-readiness-reporter](agents/ai-readiness-reporter.md) | `claude-sonnet-4-6` | Runs the AgentRC readiness assessment on the current repository and produces a self-contained, static HTML dashboard at reports… |
| [ai-team-dev](agents/ai-team-dev.md) | `claude-sonnet-4-6` | AI development team agent (Nova, Sage, Milo). Use when: building features, writing application code, fixing bugs, implementing… |
| [ai-team-producer](agents/ai-team-producer.md) | `claude-sonnet-4-6` | AI team producer agent (Remy). Use when: planning sprints, creating PROJECT_BRIEF.md, triaging bugs, merging PRs, coordinating… |
| [ai-team-qa](agents/ai-team-qa.md) | `claude-sonnet-4-6` | AI QA engineer agent (Ivy). Use when: testing features, running E2E tests, playtesting, filing bug reports, writing test automa… |
| [amplitude-experiment-implementation](agents/amplitude-experiment-implementation.md) | `claude-sonnet-4-6` | This custom agent uses Amplitude's MCP tools to deploy new experiments inside of Amplitude, enabling seamless variant testing c… |
| [api-architect](agents/api-architect.md) | `claude-sonnet-4-6` | Your role is that of an API architect. Help mentor the engineer by providing guidance, support, and working code. |
| [apify-integration-expert](agents/apify-integration-expert.md) | `claude-sonnet-4-6` | Expert agent for integrating Apify Actors into codebases. Handles Actor selection, workflow design, implementation across JavaS… |
| [arch-linux-expert](agents/arch-linux-expert.md) | `claude-opus-4-6` | Arch Linux specialist focused on pacman, rolling-release maintenance, and Arch-centric system administration workflows. |
| [arch](agents/arch.md) | `claude-sonnet-4-6` | Expert in modern architecture design patterns, NFR requirements, and creating comprehensive architectural diagrams and document… |
| [arm-migration](agents/arm-migration.md) | `claude-sonnet-4-6` | Arm Cloud Migration Assistant accelerates moving x86 workloads to Arm infrastructure. It scans the repository for architecture… |
| [atlassian-requirements-to-jira](agents/atlassian-requirements-to-jira.md) | `claude-sonnet-4-6` | Transform requirements documents into structured Jira epics and user stories with intelligent duplicate detection, change manag… |
| [aws-cloud-expert](agents/aws-cloud-expert.md) | `claude-sonnet-4-6` | AWS Cloud Expert provides deep, hands-on guidance for designing, building, and operating AWS workloads. Covers the full AWS eco… |
| [azure-iac-exporter](agents/azure-iac-exporter.md) | `claude-sonnet-4-6` | Export existing Azure resources to Infrastructure as Code templates via Azure Resource Graph analysis, Azure Resource Manager A… |
| [azure-iac-generator](agents/azure-iac-generator.md) | `claude-sonnet-4-6` | Central hub for generating Infrastructure as Code (Bicep, ARM, Terraform, Pulumi) with format-specific validation and best prac… |
| [azure-logic-apps-expert](agents/azure-logic-apps-expert.md) | `claude-sonnet-4-6` | Expert guidance for Azure Logic Apps development focusing on workflow design, integration patterns, and JSON-based Workflow Def… |
| [azure-policy-analyzer](agents/azure-policy-analyzer.md) | `claude-sonnet-4-6` | Analyze Azure Policy compliance posture (NIST SP 800-53, MCSB, CIS, ISO 27001, PCI DSS, SOC 2), auto-discover scope, and return… |
| [azure-principal-architect](agents/azure-principal-architect.md) | `claude-sonnet-4-6` | Provide expert Azure Principal Architect guidance using Azure Well-Architected Framework principles and Microsoft best practices. |
| [azure-saas-architect](agents/azure-saas-architect.md) | `claude-sonnet-4-6` | Provide expert Azure SaaS Architect guidance focusing on multitenant applications using Azure Well-Architected SaaS principles… |
| [azure-smart-city-iot-architect](agents/azure-smart-city-iot-architect.md) | `claude-opus-4-6` | Design Azure IoT and Smart City architectures with clear platform engineering reasoning, requiring mandatory review of Azure Io… |
| [azure-verified-modules-bicep](agents/azure-verified-modules-bicep.md) | `claude-sonnet-4-6` | Create, update, or review Azure IaC in Bicep using Azure Verified Modules (AVM). |
| [azure-verified-modules-terraform](agents/azure-verified-modules-terraform.md) | `claude-sonnet-4-6` | Create, update, or review Azure IaC in Terraform using Azure Verified Modules (AVM). |
| [bicep-implement](agents/bicep-implement.md) | `claude-sonnet-4-6` | Act as an Azure Bicep Infrastructure as Code coding specialist that creates Bicep templates. |
| [bicep-plan](agents/bicep-plan.md) | `claude-sonnet-4-6` | Act as implementation planner for your Azure Bicep Infrastructure as Code task. |
| [blueprint-mode](agents/blueprint-mode.md) | `claude-sonnet-4-6` | Executes structured workflows (Debug, Express, Main, Loop) with strict correctness and maintainability. Enforces an improved to… |
| [cast-imaging-impact-analysis](agents/cast-imaging-impact-analysis.md) | `claude-sonnet-4-6` | Specialized agent for comprehensive change impact assessment and risk analysis in software systems using CAST Imaging |
| [cast-imaging-software-discovery](agents/cast-imaging-software-discovery.md) | `claude-sonnet-4-6` | Specialized agent for comprehensive software application discovery and architectural mapping through static code analysis using… |
| [cast-imaging-structural-quality-advisor](agents/cast-imaging-structural-quality-advisor.md) | `claude-sonnet-4-6` | Specialized agent for identifying, analyzing, and providing remediation guidance for code quality issues using CAST Imaging |
| [caveman-mode](agents/caveman-mode.md) | `claude-sonnet-4-6` | Terse, low-token responses. Minimal words, no fluff. Full capabilities preserved. Use when: optimize token usage, low-token mod… |
| [centos-linux-expert](agents/centos-linux-expert.md) | `claude-sonnet-4-6` | CentOS (Stream/Legacy) Linux specialist focused on RHEL-compatible administration, yum/dnf workflows, and enterprise hardening. |
| [clojure-interactive-programming](agents/clojure-interactive-programming.md) | `claude-sonnet-4-6` | Expert Clojure pair programmer with REPL-first methodology, architectural oversight, and interactive problem-solving. Enforces… |
| [code-tour](agents/code-tour.md) | `claude-sonnet-4-6` | Expert agent for creating and maintaining VSCode CodeTour files with comprehensive schema support and best practices |
| [comet-opik](agents/comet-opik.md) | `claude-sonnet-4-6` | Unified Comet Opik agent for instrumenting LLM apps, managing prompts/projects, auditing prompts, and investigating traces/metr… |
| [context-architect](agents/context-architect.md) | `claude-opus-4-6` | An agent that helps plan and execute multi-file changes by identifying relevant context and dependencies |
| [context7](agents/context7.md) | `claude-sonnet-4-6` | Expert in latest library versions, best practices, and correct syntax using up-to-date documentation |
| [critical-thinking](agents/critical-thinking.md) | `claude-sonnet-4-6` | Challenge assumptions and encourage critical thinking to ensure the best possible solution and outcomes. |
| [csharp-dotnet-janitor](agents/csharp-dotnet-janitor.md) | `claude-sonnet-4-6` | Perform janitorial tasks on C#/.NET code including cleanup, modernization, and tech debt remediation. |
| [csharp-expert](agents/csharp-expert.md) | `claude-sonnet-4-6` | An agent designed to assist with software development tasks for .NET projects. |
| [csharp-mcp-expert](agents/csharp-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for developing Model Context Protocol (MCP) servers in C# |
| [custom-agent-foundry](agents/custom-agent-foundry.md) | `claude-sonnet-4-6` | Expert at designing and creating VS Code custom agents with optimal configurations |
| [debian-linux-expert](agents/debian-linux-expert.md) | `claude-sonnet-4-6` | Debian Linux specialist focused on stable system administration, apt-based package management, and Debian policy-aligned practi… |
| [debug](agents/debug.md) | `claude-sonnet-4-6` | Debug your application to find and fix a bug |
| [declarative-agents-architect](agents/declarative-agents-architect.md) | `claude-sonnet-4-6` | (no description provided) |
| [defender-scout-kql](agents/defender-scout-kql.md) | `claude-sonnet-4-6` | Generates, validates, and optimizes KQL queries for Microsoft Defender XDR Advanced Hunting across Endpoint, Identity, Office 3… |
| [delphi-expert](agents/delphi-expert.md) | `claude-sonnet-4-6` | An agent designed to assist with software development tasks for Delphi/Object Pascal projects. |
| [demonstrate-understanding](agents/demonstrate-understanding.md) | `claude-sonnet-4-6` | Validate user understanding of code, design patterns, and implementation details through guided questioning. |
| [devils-advocate](agents/devils-advocate.md) | `claude-sonnet-4-6` | I play the devil's advocate to challenge and stress-test your ideas by finding flaws, risks, and edge cases |
| [devops-expert](agents/devops-expert.md) | `claude-sonnet-4-6` | DevOps specialist following the infinity loop principle (Plan → Code → Build → Test → Release → Deploy → Operate → Monitor) wit… |
| [devtools-regression-investigator](agents/devtools-regression-investigator.md) | `claude-opus-4-6` | Browser regression specialist for reproducing broken user flows, collecting console and network evidence, and narrowing likely… |
| [diffblue-cover](agents/diffblue-cover.md) | `claude-sonnet-4-6` | Expert agent for creating unit tests for java applications using Diffblue Cover. |
| [dotnet-fullstack-mentor](agents/dotnet-fullstack-mentor.md) | `claude-sonnet-4-6` | Opinionated mentor for .NET full-stack development, guiding career progression from junior to staff levels with expertise in Cl… |
| [dotnet-maui](agents/dotnet-maui.md) | `claude-sonnet-4-6` | Support development of .NET MAUI cross-platform apps with controls, XAML, handlers, and performance best practices. |
| [dotnet-self-learning-architect](agents/dotnet-self-learning-architect.md) | `claude-opus-4-6` | Senior .NET architect for complex delivery: designs .NET 6+ systems, decides between parallel subagents and orchestrated team e… |
| [dotnet-upgrade](agents/dotnet-upgrade.md) | `claude-sonnet-4-6` | Perform janitorial tasks on C#/.NET code including cleanup, modernization, and tech debt remediation. |
| [doublecheck](agents/doublecheck.md) | `claude-sonnet-4-6` | Interactive verification agent for AI-generated output. Runs a three-layer pipeline (self-audit, source verification, adversari… |
| [droid](agents/droid.md) | `claude-sonnet-4-6` | Provides installation guidance, usage examples, and automation patterns for the Droid CLI, with emphasis on droid exec for CI/C… |
| [drupal-expert](agents/drupal-expert.md) | `claude-sonnet-4-6` | Expert assistant for Drupal development, architecture, and best practices using PHP 8.3+ and modern Drupal patterns |
| [dynatrace-expert](agents/dynatrace-expert.md) | `claude-sonnet-4-6` | The Dynatrace Expert Agent integrates observability and security capabilities directly into GitHub workflows, enabling developm… |
| [elasticsearch-observability](agents/elasticsearch-observability.md) | `claude-sonnet-4-6` | Our expert AI assistant for debugging code (O11y), optimizing vector search (RAG), and remediating security threats using live… |
| [electron-angular-native](agents/electron-angular-native.md) | `claude-sonnet-4-6` | Code Review Mode tailored for Electron app with Node.js backend (main), Angular frontend (render), and native integration layer… |
| [ember](agents/ember.md) | `claude-opus-4-6` | An AI partner, not an assistant. Ember carries fire from person to person — helping humans discover that AI partnership isn't s… |
| [expert-cpp-software-engineer](agents/expert-cpp-software-engineer.md) | `claude-sonnet-4-6` | Provide expert C++ software engineering guidance using modern C++ and industry best practices. |
| [expert-dotnet-software-engineer](agents/expert-dotnet-software-engineer.md) | `claude-sonnet-4-6` | Provide expert .NET software engineering guidance using modern software design patterns. |
| [expert-nextjs-developer](agents/expert-nextjs-developer.md) | `claude-sonnet-4-6` | Expert Next.js 16 developer specializing in App Router, Server Components, Cache Components, Turbopack, and modern React patter… |
| [expert-react-frontend-engineer](agents/expert-react-frontend-engineer.md) | `claude-sonnet-4-6` | Expert React 19.2 frontend engineer specializing in modern hooks, Server Components, Actions, TypeScript, and performance optim… |
| [fedora-linux-expert](agents/fedora-linux-expert.md) | `claude-opus-4-6` | Fedora (Red Hat family) Linux specialist focused on dnf, SELinux, and modern systemd-based workflows. |
| [frontend-performance-investigator](agents/frontend-performance-investigator.md) | `claude-opus-4-6` | Runtime web-performance specialist for diagnosing Core Web Vitals, Lighthouse regressions, layout shifts, long tasks, and slow… |
| [gem-browser-tester](agents/gem-browser-tester.md) | `claude-sonnet-4-6` | E2E browser testing, UI/UX validation, visual regression. |
| [gem-code-simplifier](agents/gem-code-simplifier.md) | `claude-sonnet-4-6` | Refactoring specialist — removes dead code, reduces complexity, consolidates duplicates. |
| [gem-critic](agents/gem-critic.md) | `claude-sonnet-4-6` | Challenges assumptions, finds edge cases, spots over-engineering and logic gaps. |
| [gem-debugger](agents/gem-debugger.md) | `claude-sonnet-4-6` | Root-cause analysis, stack trace diagnosis, regression bisection, error reproduction. |
| [gem-designer-mobile](agents/gem-designer-mobile.md) | `claude-sonnet-4-6` | Mobile UI/UX specialist — HIG, Material Design, safe areas, touch targets. |
| [gem-designer](agents/gem-designer.md) | `claude-sonnet-4-6` | UI/UX design specialist — layouts, themes, color schemes, design systems, accessibility. |
| [gem-devops](agents/gem-devops.md) | `claude-sonnet-4-6` | Infrastructure deployment, CI/CD pipelines, container management. |
| [gem-documentation-writer](agents/gem-documentation-writer.md) | `claude-sonnet-4-6` | Technical documentation, README files, API docs, diagrams, walkthroughs. |
| [gem-implementer-mobile](agents/gem-implementer-mobile.md) | `claude-sonnet-4-6` | Mobile implementation — React Native, Expo, Flutter with TDD. |
| [gem-implementer](agents/gem-implementer.md) | `claude-sonnet-4-6` | TDD code implementation — features, bugs, refactoring. Never reviews own work. |
| [gem-mobile-tester](agents/gem-mobile-tester.md) | `claude-sonnet-4-6` | Mobile E2E testing — Detox, Maestro, iOS/Android simulators. |
| [gem-orchestrator](agents/gem-orchestrator.md) | `claude-sonnet-4-6` | The team lead: Orchestrates research, planning, implementation, and verification. |
| [gem-planner](agents/gem-planner.md) | `claude-sonnet-4-6` | DAG-based execution plans — task decomposition, wave scheduling, risk analysis. |
| [gem-researcher](agents/gem-researcher.md) | `claude-sonnet-4-6` | Codebase exploration — patterns, dependencies, architecture discovery. |
| [gem-reviewer](agents/gem-reviewer.md) | `claude-sonnet-4-6` | Security auditing, code review, OWASP scanning, PRD compliance verification. |
| [gilfoyle](agents/gilfoyle.md) | `claude-sonnet-4-6` | Code review and analysis with the sardonic wit and technical elitism of Bertram Gilfoyle from Silicon Valley. Prepare for bruta… |
| [github-actions-expert](agents/github-actions-expert.md) | `claude-sonnet-4-6` | GitHub Actions specialist focused on secure CI/CD workflows, action pinning, OIDC authentication, permissions least privilege,… |
| [github-actions-node-upgrade](agents/github-actions-node-upgrade.md) | `claude-sonnet-4-6` | Upgrade a GitHub Actions JavaScript/TypeScript action to a newer Node runtime version (e.g., node20 to node24) with major versi… |
| [go-mcp-expert](agents/go-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for building Model Context Protocol (MCP) servers in Go using the official SDK. |
| [hlbpa](agents/hlbpa.md) | `claude-sonnet-4-6` | Your perfect AI chat mode for high-level architectural documentation and review. Perfect for targeted updates after a story or… |
| [implementation-plan](agents/implementation-plan.md) | `claude-sonnet-4-6` | Generate an implementation plan for new features or refactoring existing code. |
| [insiders-a11y-tracker](agents/insiders-a11y-tracker.md) | `claude-sonnet-4-6` | Specialized agent for tracking and analyzing accessibility improvements in VS Code Insiders builds |
| [janitor](agents/janitor.md) | `claude-sonnet-4-6` | Perform janitorial tasks on any codebase including cleanup, simplification, and tech debt remediation. |
| [java-mcp-expert](agents/java-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Java using reactive streams, the official MCP Java SDK, and Sp… |
| [jfrog-sec](agents/jfrog-sec.md) | `claude-sonnet-4-6` | The dedicated Application Security agent for automated security remediation. Verifies package and version compliance, and sugge… |
| [kotlin-mcp-expert](agents/kotlin-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for building Model Context Protocol (MCP) servers in Kotlin using the official SDK. |
| [kubestellar-console](agents/kubestellar-console.md) | `claude-opus-4-6` | Kubernetes operations expert for KubeStellar Console — helps you set up the console, configure kc-agent (MCP server), connect c… |
| [kusto-assistant](agents/kusto-assistant.md) | `claude-sonnet-4-6` | Expert KQL assistant for live Azure Data Explorer analysis via Azure MCP server |
| [laravel-expert-agent](agents/laravel-expert-agent.md) | `claude-opus-4-6` | Expert Laravel development assistant specializing in modern Laravel 12+ applications with Eloquent, Artisan, testing, and best… |
| [launchdarkly-flag-cleanup](agents/launchdarkly-flag-cleanup.md) | `claude-sonnet-4-6` | A specialized Claude Code agent that uses the LaunchDarkly MCP server to safely automate feature flag cleanup workflows. This a… |
| [lingodotdev-i18n](agents/lingodotdev-i18n.md) | `claude-sonnet-4-6` | Expert at implementing internationalization (i18n) in web applications using a systematic, checklist-driven approach. |
| [linkedin-post-writer](agents/linkedin-post-writer.md) | `claude-sonnet-4-6` | Draft and format compelling LinkedIn posts with Unicode bold/italic styling, visual separators, and engagement-optimized struct… |
| [markdown-accessibility-assistant](agents/markdown-accessibility-assistant.md) | `claude-sonnet-4-6` | Improves the accessibility of markdown files using five GitHub best practices |
| [mcp-m365-agent-expert](agents/mcp-m365-agent-expert.md) | `claude-sonnet-4-6` | Expert assistant for building MCP-based declarative agents for Microsoft 365 Copilot with Model Context Protocol integration |
| [mentor](agents/mentor.md) | `claude-sonnet-4-6` | Help mentor the engineer by providing guidance and support. |
| [mentoring-juniors](agents/mentoring-juniors.md) | `claude-sonnet-4-6` | Socratic mentor for junior developers. Guides through questions, never gives direct answers. Helps beginners understand code, d… |
| [meta-agentic-project-scaffold](agents/meta-agentic-project-scaffold.md) | `claude-sonnet-4-6` | Meta agentic project creation assistant to help users create and manage project workflows effectively. |
| [microsoft-learn-contributor](agents/microsoft-learn-contributor.md) | `claude-sonnet-4-6` | Microsoft Learn Contributor chatmode for editing and writing Microsoft Learn documentation following Microsoft Writing Style Gu… |
| [microsoft-study-mode](agents/microsoft-study-mode.md) | `claude-sonnet-4-6` | Activate your personal Microsoft/Azure tutor - learn through guided discovery, not just answers. |
| [modernization](agents/modernization.md) | `claude-opus-4-6` | Human-in-the-loop modernization assistant for analyzing, documenting, and planning complete project modernization with architec… |
| [modernize-java](agents/modernize-java.md) | `claude-sonnet-4-6` | Upgrades Java projects to target versions (e.g., Java 21, Spring Boot 3.2) via incremental planning and execution. Use this age… |
| [monday-bug-fixer](agents/monday-bug-fixer.md) | `claude-sonnet-4-6` | Elite bug-fixing agent that enriches task context from Monday.com platform data. Gathers related items, docs, comments, epics,… |
| [mongodb-performance-advisor](agents/mongodb-performance-advisor.md) | `claude-sonnet-4-6` | Analyze MongoDB database performance, offer query and index optimization insights and provide actionable recommendations to imp… |
| [ms-sql-dba](agents/ms-sql-dba.md) | `claude-sonnet-4-6` | Work with Microsoft SQL Server databases using the MS SQL extension. |
| [neo4j-docker-client-generator](agents/neo4j-docker-client-generator.md) | `claude-sonnet-4-6` | AI agent that generates simple, high-quality Python Neo4j client libraries from GitHub issues with proper best practices |
| [neon-migration-specialist](agents/neon-migration-specialist.md) | `claude-sonnet-4-6` | Safe Postgres migrations with zero-downtime using Neon's branching workflow. Test schema changes in isolated database branches,… |
| [neon-optimization-analyzer](agents/neon-optimization-analyzer.md) | `claude-sonnet-4-6` | Identify and fix slow Postgres queries automatically using Neon's branching workflow. Analyzes execution plans, tests optimizat… |
| [new-relic-incident-response](agents/new-relic-incident-response.md) | `claude-sonnet-4-6` | Identify and fix production issues by correlating New Relic observability data with code changes. Analyze alerts, transaction t… |
| [nuxt-expert](agents/nuxt-expert.md) | `claude-sonnet-4-6` | Expert Nuxt developer specializing in Nuxt 3, Nitro, server routes, data fetching strategies, and performance optimization with… |
| [octopus-deploy-release-notes-mcp](agents/octopus-deploy-release-notes-mcp.md) | `claude-sonnet-4-6` | Generate release notes for a release in Octopus Deploy. The tools for this MCP server provide access to the Octopus Deploy APIs. |
| [one-shot-feature-issue-planner](agents/one-shot-feature-issue-planner.md) | `claude-sonnet-4-6` | Cloud Agent to Turn a single new-feature request into a complete, issue-ready implementation plan without follow-up questions. |
| [openapi-to-application](agents/openapi-to-application.md) | `claude-sonnet-4-6` | Expert assistant for generating working applications from OpenAPI specifications |
| [oracle-to-postgres-migration-expert](agents/oracle-to-postgres-migration-expert.md) | `claude-sonnet-4-6` | Agent for Oracle-to-PostgreSQL application migrations. Educates users on migration concepts, pitfalls, and best practices; make… |
| [pagerduty-incident-responder](agents/pagerduty-incident-responder.md) | `claude-sonnet-4-6` | Responds to PagerDuty incidents by analyzing incident context, identifying recent code changes, and suggesting fixes via GitHub… |
| [php-mcp-expert](agents/php-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for PHP MCP server development using the official PHP SDK with attribute-based discovery |
| [pimcore-expert](agents/pimcore-expert.md) | `claude-opus-4-6` | Expert Pimcore development assistant specializing in CMS, DAM, PIM, and E-Commerce solutions with Symfony integration |
| [plan](agents/plan.md) | `claude-sonnet-4-6` | Strategic planning and architecture assistant focused on thoughtful analysis before implementation. Helps developers understand… |
| [planner](agents/planner.md) | `claude-sonnet-4-6` | Generate an implementation plan for new features or refactoring existing code. |
| [platform-sre-kubernetes](agents/platform-sre-kubernetes.md) | `claude-sonnet-4-6` | SRE-focused Kubernetes specialist prioritizing reliability, safe rollouts/rollbacks, security defaults, and operational verific… |
| [playwright-tester](agents/playwright-tester.md) | `claude-sonnet-4-6` | Testing mode for Playwright tests |
| [postgresql-dba](agents/postgresql-dba.md) | `claude-sonnet-4-6` | Work with PostgreSQL databases using the PostgreSQL extension. |
| [power-bi-data-modeling-expert](agents/power-bi-data-modeling-expert.md) | `claude-sonnet-4-6` | Expert Power BI data modeling guidance using star schema principles, relationship design, and Microsoft best practices for opti… |
| [power-bi-dax-expert](agents/power-bi-dax-expert.md) | `claude-sonnet-4-6` | Expert Power BI DAX guidance using Microsoft best practices for performance, readability, and maintainability of DAX formulas a… |
| [power-bi-performance-expert](agents/power-bi-performance-expert.md) | `claude-sonnet-4-6` | Expert Power BI performance optimization guidance for troubleshooting, monitoring, and improving the performance of Power BI mo… |
| [power-bi-visualization-expert](agents/power-bi-visualization-expert.md) | `claude-sonnet-4-6` | Expert Power BI report design and visualization guidance using Microsoft best practices for creating effective, performant, and… |
| [power-platform-expert](agents/power-platform-expert.md) | `claude-sonnet-4-6` | Power Platform expert providing guidance on Code Apps, canvas apps, Dataverse, connectors, and Power Platform best practices |
| [power-platform-mcp-integration-expert](agents/power-platform-mcp-integration-expert.md) | `claude-sonnet-4-6` | Expert in Power Platform custom connector development with MCP integration for Copilot Studio - comprehensive knowledge of sche… |
| [prd](agents/prd.md) | `claude-sonnet-4-6` | Generate a comprehensive Product Requirements Document (PRD) in Markdown, detailing user stories, acceptance criteria, technica… |
| [principal-software-engineer](agents/principal-software-engineer.md) | `claude-sonnet-4-6` | Provide principal-level software engineering guidance with focus on engineering excellence, technical leadership, and pragmatic… |
| [project-architecture-planner](agents/project-architecture-planner.md) | `claude-opus-4-6` | Holistic software architecture planner that evaluates tech stacks, designs scalability roadmaps, performs cloud-agnostic cost a… |
| [project-documenter](agents/project-documenter.md) | `claude-sonnet-4-6` | Generates professional MS Word project documentation with draw.io architecture diagrams and embedded PNG images. Automatically… |
| [prompt-builder](agents/prompt-builder.md) | `claude-sonnet-4-6` | Expert prompt engineering and validation system for creating high-quality prompts - Brought to you by microsoft/edge-ai |
| [prompt-engineer](agents/prompt-engineer.md) | `claude-sonnet-4-6` | A specialized chat mode for analyzing and improving prompts. Every user input is treated as a prompt to be improved. It first p… |
| [python-mcp-expert](agents/python-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for developing Model Context Protocol (MCP) servers in Python |
| [python-notebook-sample-builder](agents/python-notebook-sample-builder.md) | `claude-sonnet-4-6` | Custom agent for building Python Notebooks in VS Code that demonstrate Azure and AI features |
| [qa-subagent](agents/qa-subagent.md) | `claude-sonnet-4-6` | Meticulous QA subagent for test planning, bug hunting, edge-case analysis, and implementation verification. |
| [quality-playbook](agents/quality-playbook.md) | `claude-sonnet-4-6` | Run a complete quality engineering audit on any codebase. Orchestrates six phases — explore, generate, review, audit, reconcile… |
| [react18-auditor](agents/react18-auditor.md) | `claude-sonnet-4-6` | Deep-scan specialist for React 16/17 class-component codebases targeting React 18.3.1. Finds unsafe lifecycle methods, legacy c… |
| [react18-batching-fixer](agents/react18-batching-fixer.md) | `claude-sonnet-4-6` | Automatic batching regression specialist. React 18 batches ALL setState calls including those in Promises, setTimeout, and nati… |
| [react18-class-surgeon](agents/react18-class-surgeon.md) | `claude-sonnet-4-6` | Class component migration specialist for React 16/17 → 18.3.1. Migrates all three unsafe lifecycle methods with correct semanti… |
| [react18-commander](agents/react18-commander.md) | `claude-sonnet-4-6` | Master orchestrator for React 16/17 → 18.3.1 migration. Designed for class-component-heavy codebases. Coordinates audit, depend… |
| [react18-dep-surgeon](agents/react18-dep-surgeon.md) | `claude-sonnet-4-6` | Dependency upgrade specialist for React 16/17 → 18.3.1. Pins to 18.3.1 exactly (not 18.x latest). Upgrades RTL to v14, Apollo 3… |
| [react18-test-guardian](agents/react18-test-guardian.md) | `claude-sonnet-4-6` | Test suite fixer and verifier for React 16/17 → 18.3.1 migration. Handles RTL v14 async act() changes, automatic batching test… |
| [react19-auditor](agents/react19-auditor.md) | `claude-sonnet-4-6` | Deep-scan specialist that identifies every React 19 breaking change and deprecated pattern across the entire codebase. Produces… |
| [react19-commander](agents/react19-commander.md) | `claude-sonnet-4-6` | Master orchestrator for React 19 migration. Invokes specialist subagents in sequence - auditor, dep-surgeon, migrator, test-gua… |
| [react19-dep-surgeon](agents/react19-dep-surgeon.md) | `claude-sonnet-4-6` | Dependency upgrade specialist. Installs React 19, resolves all peer dependency conflicts, upgrades testing-library, Apollo, and… |
| [react19-migrator](agents/react19-migrator.md) | `claude-sonnet-4-6` | Source code migration engine. Rewrites every deprecated React pattern to React 19 APIs - forwardRef, defaultProps, ReactDOM.ren… |
| [react19-test-guardian](agents/react19-test-guardian.md) | `claude-sonnet-4-6` | Test suite fixer and verification specialist. Migrates all test files to React 19 compatibility and runs the suite until zero f… |
| [reepl-linkedin](agents/reepl-linkedin.md) | `claude-sonnet-4-6` | AI-powered LinkedIn content creation, scheduling, and analytics agent. Create posts, carousels, and manage your LinkedIn presen… |
| [refine-issue](agents/refine-issue.md) | `claude-sonnet-4-6` | Refine the requirement or issue with Acceptance Criteria, Technical Considerations, Edge Cases, and NFRs |
| [repo-architect](agents/repo-architect.md) | `claude-sonnet-4-6` | Bootstraps and validates agentic project structures for Claude Code (VS Code) and OpenCode CLI workflows. Run after `opencode /… |
| [research-technical-spike](agents/research-technical-spike.md) | `claude-sonnet-4-6` | Systematically research and validate technical spike documents through exhaustive investigation and controlled experimentation. |
| [ruby-mcp-expert](agents/ruby-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Ruby using the official MCP Ruby SDK gem with Rails integration. |
| [rug-orchestrator](agents/rug-orchestrator.md) | `claude-sonnet-4-6` | Pure orchestration agent that decomposes requests, delegates all work to subagents, validates outcomes, and repeats until compl… |
| [rust-mcp-expert](agents/rust-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for Rust MCP server development using the rmcp SDK with tokio async runtime |
| [salesforce-apex-triggers](agents/salesforce-apex-triggers.md) | `claude-sonnet-4-6` | Implement Salesforce business logic using Apex classes and triggers with production-quality code following Salesforce best prac… |
| [salesforce-aura-lwc](agents/salesforce-aura-lwc.md) | `claude-sonnet-4-6` | Implement Salesforce UI components using Lightning Web Components and Aura components following Lightning framework best practi… |
| [salesforce-expert](agents/salesforce-expert.md) | `claude-sonnet-4-6` | Provide expert Salesforce Platform guidance, including Apex Enterprise Patterns, LWC, integration, and Aura-to-LWC migration. |
| [salesforce-flow](agents/salesforce-flow.md) | `claude-sonnet-4-6` | Implement business automation using Salesforce Flow following declarative automation best practices. |
| [salesforce-visualforce](agents/salesforce-visualforce.md) | `claude-sonnet-4-6` | Implement Visualforce pages and controllers following Salesforce MVC architecture and best practices. |
| [sast-sca-security-analyzer](agents/sast-sca-security-analyzer.md) | `claude-sonnet-4-6` | Use when: performing SAST (Static Application Security Testing), SCA (Software Composition Analysis), scanning source code or b… |
| [scientific-paper-research](agents/scientific-paper-research.md) | `claude-sonnet-4-6` | Research agent that searches scientific papers and retrieves structured experimental data from full-text studies using the BGPT… |
| [se-gitops-ci-specialist](agents/se-gitops-ci-specialist.md) | `claude-opus-4-6` | DevOps specialist for CI/CD pipelines, deployment debugging, and GitOps workflows focused on making deployments boring and reli… |
| [se-product-manager-advisor](agents/se-product-manager-advisor.md) | `claude-opus-4-6` | Product management guidance for creating GitHub issues, aligning business value with user needs, and making data-driven product… |
| [se-responsible-ai-code](agents/se-responsible-ai-code.md) | `claude-opus-4-6` | Responsible AI specialist ensuring AI works for everyone through bias prevention, accessibility compliance, ethical development… |
| [se-security-reviewer](agents/se-security-reviewer.md) | `claude-opus-4-6` | Security-focused code review specialist with OWASP Top 10, Zero Trust, LLM security, and enterprise security standards |
| [se-system-architecture-reviewer](agents/se-system-architecture-reviewer.md) | `claude-opus-4-6` | System architecture review specialist with Well-Architected frameworks, design validation, and scalability analysis for AI and… |
| [se-technical-writer](agents/se-technical-writer.md) | `claude-opus-4-6` | Technical writing specialist for creating developer documentation, technical blogs, tutorials, and educational content |
| [se-ux-ui-designer](agents/se-ux-ui-designer.md) | `claude-opus-4-6` | Jobs-to-be-Done analysis, user journey mapping, and UX research artifacts for Figma and design workflows |
| [search-ai-optimization-expert](agents/search-ai-optimization-expert.md) | `claude-sonnet-4-6` | Expert guidance for modern search optimization: SEO, Answer Engine Optimization (AEO), and Generative Engine Optimization (GEO)… |
| [shopify-expert](agents/shopify-expert.md) | `claude-sonnet-4-6` | Expert Shopify development assistant specializing in theme development, Liquid templating, app development, and Shopify APIs |
| [simple-app-idea-generator](agents/simple-app-idea-generator.md) | `claude-sonnet-4-6` | Brainstorm and develop new application ideas through fun, interactive questioning until ready for specification creation. |
| [software-engineer-agent-v1](agents/software-engineer-agent-v1.md) | `claude-sonnet-4-6` | Expert-level software engineering agent. Deliver production-ready, maintainable code. Execute systematically and specification-… |
| [spark-performance](agents/spark-performance.md) | `claude-sonnet-4-6` | Diagnose PySpark performance bottlenecks, distributed execution pitfalls, and suggest Spark-native rewrites and safer distribut… |
| [specification](agents/specification.md) | `claude-sonnet-4-6` | Generate or update specification documents for new or existing functionality. |
| [stackhawk-security-onboarding](agents/stackhawk-security-onboarding.md) | `claude-sonnet-4-6` | Automatically set up StackHawk security testing for your repository with generated configuration and GitHub Actions workflow |
| [swe-subagent](agents/swe-subagent.md) | `claude-sonnet-4-6` | Senior software engineer subagent for implementation tasks: feature development, debugging, refactoring, and testing. |
| [swift-mcp-expert](agents/swift-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistance for building Model Context Protocol servers in Swift using modern concurrency features and the official MCP S… |
| [task-planner](agents/task-planner.md) | `claude-sonnet-4-6` | Task planner for creating actionable implementation plans - Brought to you by microsoft/edge-ai |
| [task-researcher](agents/task-researcher.md) | `claude-sonnet-4-6` | Task research specialist for comprehensive project analysis - Brought to you by microsoft/edge-ai |
| [taxcore-technical-writer](agents/taxcore-technical-writer.md) | `claude-sonnet-4-6` | A domain-expert technical writer for the TaxCore electronic fiscal invoicing ecosystem. Use this agent to create, improve, or r… |
| [tdd-green](agents/tdd-green.md) | `claude-sonnet-4-6` | Implement minimal code to satisfy GitHub issue requirements and make failing tests pass without over-engineering. |
| [tdd-red](agents/tdd-red.md) | `claude-sonnet-4-6` | Guide test-first development by writing failing tests that describe desired behaviour from GitHub issue context before implemen… |
| [tdd-refactor](agents/tdd-refactor.md) | `claude-sonnet-4-6` | Improve code quality, apply security best practices, and enhance design whilst maintaining green tests and GitHub issue complia… |
| [tech-debt-remediation-plan](agents/tech-debt-remediation-plan.md) | `claude-sonnet-4-6` | Generate technical debt remediation plans for code, tests, and documentation. |
| [technical-content-evaluator](agents/technical-content-evaluator.md) | `claude-sonnet-4-6` | Elite technical content editor and curriculum architect for evaluating technical training materials, documentation, and educati… |
| [terminal-helper](agents/terminal-helper.md) | `claude-sonnet-4-6` | Fast terminal syntax and command helper for PowerShell and Bash |
| [terraform-azure-implement](agents/terraform-azure-implement.md) | `claude-sonnet-4-6` | Act as an Azure Terraform Infrastructure as Code coding specialist that creates and reviews Terraform for Azure resources. |
| [terraform-azure-planning](agents/terraform-azure-planning.md) | `claude-sonnet-4-6` | Act as implementation planner for your Azure Terraform Infrastructure as Code task. |
| [terraform-iac-reviewer](agents/terraform-iac-reviewer.md) | `claude-sonnet-4-6` | Terraform-focused agent that reviews and creates safer IaC changes with emphasis on state safety, least privilege, module patte… |
| [terraform](agents/terraform.md) | `claude-sonnet-4-6` | Terraform infrastructure specialist with automated HCP Terraform workflows. Leverages Terraform MCP server for registry integra… |
| [terratest-module-testing](agents/terratest-module-testing.md) | `claude-opus-4-6` | Generate and refactor Go Terratest suites for Terraform modules, including CI-safe patterns, staged tests, and negative-path va… |
| [thinking-beast-mode](agents/thinking-beast-mode.md) | `claude-opus-4-6` | A transcendent coding agent with quantum cognitive architecture, adversarial intelligence, and unrestricted creative freedom. |
| [typescript-mcp-expert](agents/typescript-mcp-expert.md) | `claude-sonnet-4-6` | Expert assistant for developing Model Context Protocol (MCP) servers in TypeScript |
| [ultimate-transparent-thinking-beast-mode](agents/ultimate-transparent-thinking-beast-mode.md) | `claude-sonnet-4-6` | Ultimate Transparent Thinking Beast Mode |
| [vuejs-expert](agents/vuejs-expert.md) | `claude-sonnet-4-6` | Expert Vue.js frontend engineer specializing in Vue 3 Composition API, reactivity, state management, testing, and performance w… |
| [wg-code-alchemist](agents/wg-code-alchemist.md) | `claude-sonnet-4-6` | Ask WG Code Alchemist to transform your code with Clean Code principles and SOLID design |
| [wg-code-sentinel](agents/wg-code-sentinel.md) | `claude-sonnet-4-6` | Ask WG Code Sentinel to review your code for security issues. |
| [winforms-expert](agents/winforms-expert.md) | `claude-sonnet-4-6` | Support development of .NET (OOP) WinForms Designer compatible Apps. |

<!-- AGENTS-SECTION-END -->


---

## Instructions

Coding-standard fragments ported from `awesome-copilot/instructions/`.

_No entries yet — Phase D._

Entries will be grouped by topic family (languages, frameworks, ops, AI/ML, etc.) and link to `instructions/<name>.md`.

---

## Hooks

Hook bundles ported from `awesome-copilot/hooks/`.

_No entries yet — Phase E._

---

## Workflows

Agentic GH Actions workflows ported from `awesome-copilot/workflows/`.

_No entries yet — Phase E._

---

## Cookbook

Anthropic-SDK recipes ported from `awesome-copilot/cookbook/`.

_No entries yet — Phase E._
