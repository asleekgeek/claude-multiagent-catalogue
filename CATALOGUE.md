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

### Topic bundles

The 5 detailed entries above are the multi-agent orchestration rigs ported in Phase A. The 62 entries below are domain bundles (languages, clouds, SaaS platforms, tools) ported in Phase C — each pairs upstream-curated agents with their related skills around a topic. Browse the per-plugin `README.md` for orchestration notes if any.

_Currently populated: 67 / 67 upstream (60 local Phase C + 2 external + 5 Phase A)._

| Plugin | Agents | Skills | Description |
|---|---|---|---|
| [acreadiness-cockpit](plugins/acreadiness-cockpit/) | 1 | 3 | Drive Microsoft AgentRC from Copilot chat: assess AI readiness, generate Copilot instructions (fl… |
| [arize-ax](plugins/arize-ax/) | 0 | 9 | Arize AX platform skills for LLM observability, evaluation, and optimization. Includes trace expo… |
| [automate-this](plugins/automate-this/) | 0 | 1 | Record your screen doing a manual process, drop the video on your Desktop, and let Copilot CLI an… |
| [awesome-copilot](plugins/awesome-copilot/) | 1 | 3 | Meta prompts that help you discover and generate curated GitHub Copilot agents, instructions, pro… |
| [azure-cloud-development](plugins/azure-cloud-development/) | 7 | 4 | Comprehensive Azure cloud development tools including Infrastructure as Code, serverless function… |
| [cast-imaging](plugins/cast-imaging/) | 3 | 0 | A comprehensive collection of specialized agents for software analysis, impact assessment, struct… |
| [clojure-interactive-programming](plugins/clojure-interactive-programming/) | 1 | 1 | Tools for REPL-first Clojure workflows featuring Clojure instructions, the interactive programmin… |
| [cms-development](plugins/cms-development/) | 0 | 3 | Skills for CMS development across themes, plugins, admin tooling, media workflows, markdown rende… |
| [context-engineering](plugins/context-engineering/) | 1 | 3 | Tools and techniques for maximizing GitHub Copilot effectiveness through better context managemen… |
| [context-matic](plugins/context-matic/) | 0 | 2 | Coding agents hallucinate APIs. ContextMatic gives them curated, versioned API and SDK docs. Ask… |
| [copilot-sdk](plugins/copilot-sdk/) | 0 | 1 | Build applications with the GitHub Copilot SDK across multiple programming languages. Includes co… |
| [csharp-dotnet-development](plugins/csharp-dotnet-development/) | 1 | 8 | Essential prompts, instructions, and chat modes for C# and .NET development including testing, do… |
| [database-data-management](plugins/database-data-management/) | 2 | 4 | Database administration, SQL optimization, and data management tools for PostgreSQL, SQL Server,… |
| [dataverse-sdk-for-python](plugins/dataverse-sdk-for-python/) | 0 | 4 | Comprehensive collection for building production-ready Python integrations with Microsoft Dataver… |
| [devops-oncall](plugins/devops-oncall/) | 1 | 2 | A focused set of prompts, instructions, and a chat mode to help triage incidents and respond quic… |
| [doublecheck](plugins/doublecheck/) | 1 | 1 | Three-layer verification pipeline for AI output. Extracts claims, finds sources, and flags halluc… |
| [edge-ai-tasks](plugins/edge-ai-tasks/) | 2 | 0 | Task Researcher and Task Planner for intermediate to expert users and large codebases - Brought t… |
| [ember](plugins/ember/) | 1 | 1 | An AI partner, not a tool. Ember carries fire from person to person — helping humans discover tha… |
| [eyeball](plugins/eyeball/) | 0 | 1 | Document analysis with inline source screenshots. When you ask Copilot to analyze a document, Eye… |
| [fastah-ip-geo-tools](plugins/fastah-ip-geo-tools/) | 0 | 1 | This plugin is for network operations engineers who wish to tune and publish IP geolocation feeds… |
| [flowstudio-power-automate](plugins/flowstudio-power-automate/) | 0 | 5 | Give your AI agent full visibility into Power Automate cloud flows via the FlowStudio MCP server.… |
| [frontend-web-dev](plugins/frontend-web-dev/) | 2 | 2 | Essential prompts, instructions, and chat modes for modern frontend web development including Rea… |
| [go-mcp-development](plugins/go-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol (MCP) servers in Go using the official githu… |
| [java-development](plugins/java-development/) | 0 | 4 | Comprehensive collection of prompts and instructions for Java development including Spring Boot,… |
| [java-mcp-development](plugins/java-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol servers in Java using the official MCP Java… |
| [kotlin-mcp-development](plugins/kotlin-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol (MCP) servers in Kotlin using the official i… |
| [mcp-m365-copilot](plugins/mcp-m365-copilot/) | 1 | 3 | Comprehensive collection for building declarative agents with Model Context Protocol integration… |
| [modernize-java](plugins/modernize-java/) | 1 | 0 | AI-powered Java modernization and upgrade assistant. Helps upgrade Java and Spring Boot applicati… |
| [napkin](plugins/napkin/) | 0 | 1 | Visual whiteboard collaboration for Copilot CLI. Opens an interactive whiteboard in your browser… |
| [noob-mode](plugins/noob-mode/) | 0 | 1 | Plain-English translation layer for non-technical Copilot CLI users. Translates every approval pr… |
| [openapi-to-application-csharp-dotnet](plugins/openapi-to-application-csharp-dotnet/) | 1 | 1 | Generate production-ready .NET applications from OpenAPI specifications. Includes ASP.NET Core pr… |
| [openapi-to-application-go](plugins/openapi-to-application-go/) | 1 | 1 | Generate production-ready Go applications from OpenAPI specifications. Includes project scaffoldi… |
| [openapi-to-application-java-spring-boot](plugins/openapi-to-application-java-spring-boot/) | 1 | 1 | Generate production-ready Spring Boot applications from OpenAPI specifications. Includes project… |
| [openapi-to-application-nodejs-nestjs](plugins/openapi-to-application-nodejs-nestjs/) | 1 | 1 | Generate production-ready NestJS applications from OpenAPI specifications. Includes project scaff… |
| [openapi-to-application-python-fastapi](plugins/openapi-to-application-python-fastapi/) | 1 | 1 | Generate production-ready FastAPI applications from OpenAPI specifications. Includes project scaf… |
| [oracle-to-postgres-migration-expert](plugins/oracle-to-postgres-migration-expert/) | 1 | 7 | Expert agent for Oracle-to-PostgreSQL application migrations in .NET solutions. Performs code edi… |
| [ospo-sponsorship](plugins/ospo-sponsorship/) | 0 | 1 | Tools and resources for Open Source Program Offices (OSPOs) to identify, evaluate, and manage spo… |
| [partners](plugins/partners/) | 20 | 0 | Custom agents that have been created by GitHub partners |
| [phoenix](plugins/phoenix/) | 0 | 3 | Phoenix AI observability skills for LLM application debugging, evaluation, and tracing. Includes… |
| [php-mcp-development](plugins/php-mcp-development/) | 1 | 1 | Comprehensive resources for building Model Context Protocol servers using the official PHP SDK wi… |
| [power-apps-code-apps](plugins/power-apps-code-apps/) | 1 | 1 | Complete toolkit for Power Apps Code Apps development including project scaffolding, development… |
| [power-bi-development](plugins/power-bi-development/) | 4 | 4 | Comprehensive Power BI development resources including data modeling, DAX optimization, performan… |
| [power-platform-architect](plugins/power-platform-architect/) | 0 | 1 | Solution Architect for the Microsoft Power Platform, turning business requirements into functioni… |
| [power-platform-mcp-connector-development](plugins/power-platform-mcp-connector-development/) | 1 | 2 | Complete toolkit for developing Power Platform custom connectors with Model Context Protocol inte… |
| [project-documenter](plugins/project-documenter/) | 1 | 2 | Generate professional project documentation with draw.io architecture diagrams and Word (.docx) o… |
| [project-planning](plugins/project-planning/) | 7 | 8 | Tools and guidance for software project planning, feature breakdown, epic management, implementat… |
| [python-mcp-development](plugins/python-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol (MCP) servers in Python using the official S… |
| [react18-upgrade](plugins/react18-upgrade/) | 6 | 7 | Enterprise React 18 migration toolkit with specialized agents and skills for upgrading React 16/1… |
| [react19-upgrade](plugins/react19-upgrade/) | 5 | 3 | Enterprise React 19 migration toolkit with specialized agents and skills for upgrading React 18 c… |
| [roundup](plugins/roundup/) | 0 | 2 | Self-configuring status briefing generator. Learns your communication style from examples, discov… |
| [ruby-mcp-development](plugins/ruby-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol servers in Ruby using the official MCP Ruby… |
| [rust-mcp-development](plugins/rust-mcp-development/) | 1 | 1 | Build high-performance Model Context Protocol servers in Rust using the official rmcp SDK with as… |
| [salesforce-development](plugins/salesforce-development/) | 4 | 3 | Complete Salesforce agentic development environment covering Apex & Triggers, Flow automation, Li… |
| [security-best-practices](plugins/security-best-practices/) | 0 | 1 | Security frameworks, accessibility guidelines, performance optimization, and code quality best pr… |
| [skill-image-gen](plugins/skill-image-gen/) | 0 | 1 | Generate images using AI directly from your coding workflow. Supports OpenAI (gpt-image-2) and Go… |
| [swift-mcp-development](plugins/swift-mcp-development/) | 1 | 1 | Comprehensive collection for building Model Context Protocol servers in Swift using the official… |
| [technical-spike](plugins/technical-spike/) | 1 | 1 | Tools for creation, management and research of technical spikes to reduce unknowns and assumption… |
| [testing-automation](plugins/testing-automation/) | 4 | 5 | Comprehensive collection for writing tests, test automation, and test-driven development includin… |
| [typescript-mcp-development](plugins/typescript-mcp-development/) | 1 | 1 | Complete toolkit for building Model Context Protocol (MCP) servers in TypeScript/Node.js using th… |
| [typespec-m365-copilot](plugins/typespec-m365-copilot/) | 0 | 3 | Comprehensive collection of prompts, instructions, and resources for building declarative agents… |

#### External-source plugins

These plugins live in their own repositories — only the manifest is mirrored here so they appear in `install.sh --list` and `CATALOGUE.md`. Install via APM or the Claude Code plugin marketplace per the per-plugin README.

| Plugin | Source | Description |
|---|---|---|
| [gem-team](plugins/gem-team/) | https://github.com/mubaidr/gem-team | Self-Learning Multi-agent orchestration harness for spec-driven development and automated verific… |
| [pcf-development](plugins/pcf-development/) | https://github.com/github/awesome-copilot | Complete toolkit for developing custom code components using Power Apps Component Framework for m… |


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
<!-- INSTRUCTIONS-SECTION-START -->
<!-- Auto-generated from the instructions/ directory during Phase D bulk port. Regenerate when porting new instructions. -->

Coding-standard fragments ported from `awesome-copilot/instructions/`. Grouped by topic family. The `applyTo:` glob is preserved for documentation only — Claude Code does not enforce it natively; consumers wire instructions in via their project `CLAUDE.md` or paste into a subject-matter agent.

_Currently populated: 183 / 183 upstream._

### Languages — .NET/C#

| Instruction | applyTo | Description |
|---|---|---|
| [aspnet-rest-apis](instructions/aspnet-rest-apis.md) | `**/*.cs, **/*.json` | Guidelines for building REST APIs with ASP.NET |
| [azure-durable-functions-csharp](instructions/azure-durable-functions-csharp.md) | `**/*.cs, **/host.json, **/local.settings.json, …` | Guidelines and best practices for building Azure Durable Functions in C# using the isolated worker model |
| [azure-functions-csharp](instructions/azure-functions-csharp.md) | `**/*.cs, **/host.json, **/local.settings.json, …` | Guidelines and best practices for building Azure Functions in C# using the isolated worker model |
| [blazor](instructions/blazor.md) | `**/*.razor, **/*.razor.cs, **/*.razor.css` | Blazor component and application patterns |
| [copilot-sdk-csharp](instructions/copilot-sdk-csharp.md) | `**.cs, **.csproj` | This file provides guidance on building C# applications using Claude Code SDK. |
| [csharp](instructions/csharp.md) | `**/*.cs` | Guidelines for building C# applications |
| [csharp-ja](instructions/csharp-ja.md) | `**/*.cs` | C# アプリケーション構築指針 by @tsubakimoto |
| [csharp-ko](instructions/csharp-ko.md) | `**/*.cs` | C# 애플리케이션 개발을 위한 코드 작성 규칙 by @jgkim999 |
| [csharp-mcp-server](instructions/csharp-mcp-server.md) | `**/*.cs, **/*.csproj` | Instructions for building Model Context Protocol (MCP) servers using the C# SDK |
| [csharp-razorpages](instructions/csharp-razorpages.md) | `**/*.cshtml, **/*.cshtml.cs` | Razor Pages component and application patterns |
| [dotnet-architecture-good-practices](instructions/dotnet-architecture-good-practices.md) | `**/*.cs,**/*.csproj,**/Program.cs,**/*.razor` | DDD and .NET architecture guidelines |
| [dotnet-framework](instructions/dotnet-framework.md) | `**/*.csproj, **/*.cs` | Guidance for working with .NET Framework projects. Includes project structure, C# language version, NuGet management,… |
| [dotnet-maui](instructions/dotnet-maui.md) | `**/*.xaml, **/*.cs` | .NET MAUI component and application patterns |
| [dotnet-maui-9-to-dotnet-maui-10-upgrade](instructions/dotnet-maui-9-to-dotnet-maui-10-upgrade.md) | `**/*.csproj, **/*.cs, **/*.xaml` | Instructions for upgrading .NET MAUI applications from version 9 to version 10, including breaking changes, deprecate… |
| [dotnet-upgrade](instructions/dotnet-upgrade.md) | `**` | Specialized agent for comprehensive .NET framework upgrades with progressive tracking and validation |
| [dotnet-wpf](instructions/dotnet-wpf.md) | `**/*.xaml, **/*.cs` | .NET WPF component and application patterns |
| [playwright-dotnet](instructions/playwright-dotnet.md) | `**` | Playwright .NET test generation instructions |
| [powershell](instructions/powershell.md) | `**/*.ps1,**/*.psm1` | PowerShell cmdlet and scripting best practices based on Microsoft guidelines |
| [powershell-pester-5](instructions/powershell-pester-5.md) | `**/*.Tests.ps1` | PowerShell Pester testing best practices based on Pester v5 conventions |

### Languages — JavaScript/TypeScript

| Instruction | applyTo | Description |
|---|---|---|
| [astro](instructions/astro.md) | `**/*.astro, **/*.ts, **/*.js, **/*.md, **/*.mdx` | Astro development standards and best practices for content-driven websites |
| [azure-functions-typescript](instructions/azure-functions-typescript.md) | `**/*.ts, **/*.js, **/*.json` | TypeScript patterns for Azure Functions |
| [copilot-sdk-nodejs](instructions/copilot-sdk-nodejs.md) | `**.ts, **.js, package.json` | This file provides guidance on building Node.js/TypeScript applications using Claude Code SDK. |
| [html-css-style-color-guide](instructions/html-css-style-color-guide.md) | `**/*.html, **/*.css, **/*.js` | Color usage guidelines and styling rules for HTML elements to ensure accessible, professional designs. |
| [joyride-user-project](instructions/joyride-user-project.md) | `**` | Expert assistance for Joyride User Script projects - REPL-driven ClojureScript and user space automation of VS Code |
| [joyride-workspace-automation](instructions/joyride-workspace-automation.md) | `**/.joyride/**` | Expert assistance for Joyride Workspace automation - REPL-driven and user space ClojureScript automation within speci… |
| [lwc](instructions/lwc.md) | `force-app/main/default/lwc/**` | Guidelines and best practices for developing Lightning Web Components (LWC) on Salesforce Platform. |
| [markdown-accessibility](instructions/markdown-accessibility.md) | `**/*.md` | Markdown accessibility guidelines based on GitHub''s 5 best practices for inclusive documentation |
| [nestjs](instructions/nestjs.md) | `**/*.ts, **/*.js, **/*.json, **/*.spec.ts, **/*…` | NestJS development standards and best practices for building scalable Node.js server-side applications |
| [nextjs](instructions/nextjs.md) | `**/*.tsx, **/*.ts, **/*.jsx, **/*.js, **/*.css` | Best practices for building Next.js (App Router) apps with modern caching, tooling, and server/client boundaries (ali… |
| [nextjs-tailwind](instructions/nextjs-tailwind.md) | `**/*.tsx, **/*.ts, **/*.jsx, **/*.js, **/*.css` | Next.js + Tailwind development standards and instructions |
| [nodejs-javascript-vitest](instructions/nodejs-javascript-vitest.md) | `**/*.js, **/*.mjs, **/*.cjs` | Guidelines for writing Node.js and JavaScript code with Vitest testing |
| [pcf-react-platform-libraries](instructions/pcf-react-platform-libraries.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | React controls and platform libraries for PCF components |
| [playwright-python](instructions/playwright-python.md) | `**` | Playwright Python AI test generation instructions based on official documentation. |
| [playwright-typescript](instructions/playwright-typescript.md) | `**` | Playwright test generation instructions |
| [svelte](instructions/svelte.md) | `**/*.svelte, **/*.ts, **/*.js, **/*.css, **/*.s…` | Svelte 5 and SvelteKit development standards and best practices for component-based user interfaces and full-stack ap… |
| [tailwind-v4-vite](instructions/tailwind-v4-vite.md) | `vite.config.ts, vite.config.js, **/*.css, **/*.…` | Tailwind CSS v4+ installation and configuration for Vite projects using the official @tailwindcss/vite plugin |
| [tanstack-start-shadcn-tailwind](instructions/tanstack-start-shadcn-tailwind.md) | `**/*.ts, **/*.tsx, **/*.js, **/*.jsx, **/*.css,…` | Guidelines for building TanStack Start applications |
| [typescript-mcp-server](instructions/typescript-mcp-server.md) | `**/*.ts, **/*.js, **/package.json` | Instructions for building Model Context Protocol (MCP) servers using the TypeScript SDK |

### Languages — Python

| Instruction | applyTo | Description |
|---|---|---|
| [copilot-sdk-python](instructions/copilot-sdk-python.md) | `**.py, pyproject.toml, setup.py` | This file provides guidance on building Python applications using Claude Code SDK. |
| [dataverse-python](instructions/dataverse-python.md) | `**` | Dataverse SDK for Python — Getting Started |
| [dataverse-python-advanced-features](instructions/dataverse-python-advanced-features.md) | `**` | Dataverse SDK for Python - Advanced Features Guide |
| [dataverse-python-agentic-workflows](instructions/dataverse-python-agentic-workflows.md) | `**` | Dataverse SDK for Python - Agentic Workflows Guide |
| [dataverse-python-api-reference](instructions/dataverse-python-api-reference.md) | `**` | Dataverse SDK for Python — API Reference Guide |
| [dataverse-python-authentication-security](instructions/dataverse-python-authentication-security.md) | `**` | Dataverse SDK for Python — Authentication & Security Patterns |
| [dataverse-python-best-practices](instructions/dataverse-python-best-practices.md) | `**` | Dataverse SDK for Python - Best Practices Guide |
| [dataverse-python-error-handling](instructions/dataverse-python-error-handling.md) | `**` | Dataverse SDK for Python — Error Handling & Troubleshooting Guide |
| [dataverse-python-file-operations](instructions/dataverse-python-file-operations.md) | `**` | Dataverse SDK for Python - File Operations & Practical Examples |
| [dataverse-python-modules](instructions/dataverse-python-modules.md) | `**` | Dataverse SDK for Python — Complete Module Reference |
| [dataverse-python-pandas-integration](instructions/dataverse-python-pandas-integration.md) | `**` | Dataverse SDK for Python - Pandas Integration Guide |
| [dataverse-python-performance-optimization](instructions/dataverse-python-performance-optimization.md) | `**` | Dataverse SDK for Python — Performance & Optimization Guide |
| [dataverse-python-real-world-usecases](instructions/dataverse-python-real-world-usecases.md) | `**` | Dataverse SDK for Python — Real-World Use Cases & Templates |
| [dataverse-python-sdk](instructions/dataverse-python-sdk.md) | `**` | Dataverse SDK for Python — Official Quickstart |
| [dataverse-python-testing-debugging](instructions/dataverse-python-testing-debugging.md) | `**` | Dataverse SDK for Python — Testing & Debugging Strategies |
| [langchain-python](instructions/langchain-python.md) | `**/*.py` | Instructions for using LangChain with Python |
| [python-mcp-server](instructions/python-mcp-server.md) | `**/*.py, **/pyproject.toml, **/requirements.txt` | Instructions for building Model Context Protocol (MCP) servers using the Python SDK |

### Languages — JVM

| Instruction | applyTo | Description |
|---|---|---|
| [convert-cassandra-to-spring-data-cosmos](instructions/convert-cassandra-to-spring-data-cosmos.md) | `**/*.java,**/pom.xml,**/build.gradle,**/applica…` | Step-by-step guide for converting Spring Boot Cassandra applications to use Azure Cosmos DB with Spring Data Cosmos |
| [convert-jpa-to-spring-data-cosmos](instructions/convert-jpa-to-spring-data-cosmos.md) | `**/*.java,**/pom.xml,**/build.gradle,**/applica…` | Step-by-step guide for converting Spring Boot JPA applications to use Azure Cosmos DB with Spring Data Cosmos |
| [java-11-to-java-17-upgrade](instructions/java-11-to-java-17-upgrade.md) | `["*"]` | Comprehensive best practices for adopting new Java 17 features since the release of Java 11. |
| [java-17-to-java-21-upgrade](instructions/java-17-to-java-21-upgrade.md) | `['*']` | Comprehensive best practices for adopting new Java 21 features since the release of Java 17. |
| [java-21-to-java-25-upgrade](instructions/java-21-to-java-25-upgrade.md) | `['*']` | Comprehensive best practices for adopting new Java 25 features since the release of Java 21. |
| [java-mcp-server](instructions/java-mcp-server.md) | `**/*.java, **/pom.xml, **/build.gradle, **/buil…` | Best practices and patterns for building Model Context Protocol (MCP) servers in Java using the official MCP Java SDK… |
| [kotlin-mcp-server](instructions/kotlin-mcp-server.md) | `**/*.kt, **/*.kts, **/build.gradle.kts, **/sett…` | Best practices and patterns for building Model Context Protocol (MCP) servers in Kotlin using the official io.modelco… |
| [quarkus](instructions/quarkus.md) | `*` | Quarkus development standards and instructions |
| [quarkus-mcp-server-sse](instructions/quarkus-mcp-server-sse.md) | `*` | Quarkus and MCP Server with HTTP SSE transport development standards and instructions |
| [scala2](instructions/scala2.md) | `**/*.scala, **/build.sbt, **/build.sc` | Scala 2.12/2.13 programming language coding conventions and best practices following Databricks style guide for funct… |
| [springboot](instructions/springboot.md) | `**/*.java, **/*.kt` | Guidelines for building Spring Boot base applications |
| [springboot-4-migration](instructions/springboot-4-migration.md) | `**/*.java, **/*.kt, **/build.gradle.kts, **/bui…` | Comprehensive guide for migrating Spring Boot applications from 3.x to 4.0, focusing on Gradle Kotlin DSL and version… |

### Languages — Other

| Instruction | applyTo | Description |
|---|---|---|
| [clojure](instructions/clojure.md) | `**/*.{clj,cljs,cljc,bb,edn.mdx?}` | Clojure-specific coding patterns, inline def usage, code block templates, and namespace handling for Clojure developm… |
| [coldfusion-cfc](instructions/coldfusion-cfc.md) | `**/*.cfc` | ColdFusion Coding Standards for CFC component and application patterns |
| [coldfusion-cfm](instructions/coldfusion-cfm.md) | `**/*.cfm` | ColdFusion cfm files and application patterns |
| [cpp-language-service-tools](instructions/cpp-language-service-tools.md) | `**/*.cpp, **/*.h, **/*.hpp, **/*.cc, **/*.cxx, …` | You are an expert at using C++ language service tools (GetSymbolReferences_CppTools, GetSymbolInfo_CppTools, GetSymbo… |
| [dart-n-flutter](instructions/dart-n-flutter.md) | `**/*.dart` | Instructions for writing Dart and Flutter code following the official recommendations. |
| [go](instructions/go.md) | `**/*.go,**/go.mod,**/go.sum` | Instructions for writing Go code following idiomatic Go practices and community standards |
| [php-mcp-server](instructions/php-mcp-server.md) | `**/*.php` | Best practices for building Model Context Protocol servers in PHP using the official PHP SDK with attribute-based dis… |
| [php-symfony](instructions/php-symfony.md) | `**/*.php, **/*.yaml, **/*.yml, **/*.xml, **/*.twig` | Symfony development standards aligned with official Symfony Best Practices |
| [r](instructions/r.md) | `**/*.R, **/*.r, **/*.Rmd, **/*.rmd, **/*.qmd` | R language and document formats (R, Rmd, Quarto): coding standards and Copilot guidance for idiomatic, safe, and cons… |
| [ruby-mcp-server](instructions/ruby-mcp-server.md) | `**/*.rb, **/Gemfile, **/*.gemspec, **/Rakefile` | Best practices and patterns for building Model Context Protocol (MCP) servers in Ruby using the official MCP Ruby SDK… |
| [ruby-on-rails](instructions/ruby-on-rails.md) | `**/*.rb` | Ruby on Rails coding conventions and guidelines |
| [rust](instructions/rust.md) | `**/*.rs` | Rust programming language coding conventions and best practices |
| [rust-mcp-server](instructions/rust-mcp-server.md) | `**/*.rs` | Best practices for building Model Context Protocol servers in Rust using the official rmcp SDK with async/await patterns |
| [swift-mcp-server](instructions/swift-mcp-server.md) | `**/*.swift, **/Package.swift, **/Package.resolved` | Best practices and patterns for building Model Context Protocol (MCP) servers in Swift using the official MCP Swift S… |

### Operating Systems / Linux

| Instruction | applyTo | Description |
|---|---|---|
| [arch-linux](instructions/arch-linux.md) | `**` | Guidance for Arch Linux administration, pacman workflows, and rolling-release best practices. |
| [centos-linux](instructions/centos-linux.md) | `**` | Guidance for CentOS administration, RHEL-compatible tooling, and SELinux-aware operations. |
| [debian-linux](instructions/debian-linux.md) | `**` | Guidance for Debian-based Linux administration, apt workflows, and Debian policy conventions. |
| [fedora-linux](instructions/fedora-linux.md) | `**` | Guidance for Fedora (Red Hat family) systems, dnf workflows, SELinux, and modern systemd practices. |

### Build / Native Tooling

| Instruction | applyTo | Description |
|---|---|---|
| [cmake-vcpkg](instructions/cmake-vcpkg.md) | `**/*.cmake, **/CMakeLists.txt, **/*.cpp, **/*.h…` | C++ project configuration and package management |
| [makefile](instructions/makefile.md) | `**/Makefile, **/makefile, **/*.mk, **/GNUmakefile` | Best practices for authoring GNU Make Makefiles |
| [no-heredoc](instructions/no-heredoc.md) | `**` | Prevents terminal heredoc file corruption in VS Code Copilot by enforcing use of file editing tools instead of shell… |

### Design Patterns & Architecture Principles

| Instruction | applyTo | Description |
|---|---|---|
| [mvvm-toolkit](instructions/mvvm-toolkit.md) | `**/*.cs, **/*.xaml, **/*.csproj` | CommunityToolkit.Mvvm (MVVM Toolkit) coding conventions for ViewModels, commands, messaging, validation, and DI acros… |
| [object-calisthenics](instructions/object-calisthenics.md) | `**/*.{cs,ts,java}` | Enforces Object Calisthenics principles for business domain code to ensure clean, maintainable, and robust code |
| [oop-design-patterns](instructions/oop-design-patterns.md) | `**/*.py, **/*.java, **/*.ts, **/*.js, **/*.cs` | Best practices for applying Object-Oriented Programming (OOP) design patterns, including Gang of Four (GoF) patterns… |

### Cloud & Infrastructure — Azure

| Instruction | applyTo | Description |
|---|---|---|
| [azure-devops-pipelines](instructions/azure-devops-pipelines.md) | `**/azure-pipelines.yml, **/azure-pipelines*.yml…` | Best practices for Azure DevOps Pipeline YAML files |
| [azure-iot-edge-architecture](instructions/azure-iot-edge-architecture.md) | `**/*.bicep,**/*.tf,**/*iot*.md,**/*smart-city*.…` | Require Azure IoT Edge documentation review before proposing edge IoT architectures or Azure implementation guidance. |
| [azure-logic-apps-power-automate](instructions/azure-logic-apps-power-automate.md) | `**/*.json,**/*.logicapp.json,**/workflow.json,*…` | Guidelines for developing Azure Logic Apps and Power Automate workflows with best practices for Workflow Definition L… |
| [azure-naming](instructions/azure-naming.md) | `**/*.bicep,**/*.tf,**/*.tfvars,**/*.bicepparam,…` | Azure resource naming conventions based on Microsoft CAF (Cloud Adoption Framework). Use when creating, reviewing, or… |
| [azure-verified-modules-bicep](instructions/azure-verified-modules-bicep.md) | `**/*.bicep, **/*.bicepparam` | Azure Verified Modules (AVM) and Bicep |
| [azure-verified-modules-terraform](instructions/azure-verified-modules-terraform.md) | `**/*.terraform, **/*.tf, **/*.tfvars, **/*.tfst…` | Azure Verified Modules (AVM) and Terraform |
| [bicep-code-best-practices](instructions/bicep-code-best-practices.md) | `**/*.bicep` | Infrastructure as Code with Bicep |
| [generate-modern-terraform-code-for-azure](instructions/generate-modern-terraform-code-for-azure.md) | `**/*.tf` | Guidelines for generating modern Terraform code for Azure |
| [terraform-azure](instructions/terraform-azure.md) | `**/*.terraform, **/*.tf, **/*.tfvars, **/*.tfli…` | Create or modify solutions built using Terraform on Azure. |

### Cloud & Infrastructure — AWS

| Instruction | applyTo | Description |
|---|---|---|
| [aws-appsync](instructions/aws-appsync.md) | `**/*.{graphql,gql,vtl,ts,js,mjs,cjs,json,yml,yaml}` | Production-grade guidance for AWS AppSync Event API handlers using APPSYNC_JS runtime restrictions, utilities, module… |

### Infrastructure as Code

| Instruction | applyTo | Description |
|---|---|---|
| [ansible](instructions/ansible.md) | `**/*.yaml, **/*.yml` | Ansible conventions and best practices |
| [terraform](instructions/terraform.md) | `**/*.tf` | Terraform Conventions and Guidelines |
| [terraform-sap-btp](instructions/terraform-sap-btp.md) | `**/*.tf, **/*.tfvars, **/*.tflint.hcl, **/*.tf.…` | Terraform conventions and guidelines for SAP Business Technology Platform (SAP BTP). |

### Containers & Orchestration

| Instruction | applyTo | Description |
|---|---|---|
| [containerization-docker-best-practices](instructions/containerization-docker-best-practices.md) | `**/Dockerfile,**/Dockerfile.*,**/*.dockerfile,*…` | Comprehensive best practices for creating optimized, secure, and efficient Docker images and managing containers. Cov… |
| [kubernetes-deployment-best-practices](instructions/kubernetes-deployment-best-practices.md) | `*` | Comprehensive best practices for deploying and managing applications on Kubernetes. Covers Pods, Deployments, Service… |
| [kubernetes-manifests](instructions/kubernetes-manifests.md) | `k8s/**/*.yaml,k8s/**/*.yml,manifests/**/*.yaml,…` | Best practices for Kubernetes YAML manifests including labeling conventions, security contexts, pod security, resourc… |

### CI/CD & DevOps

| Instruction | applyTo | Description |
|---|---|---|
| [devops-core-principles](instructions/devops-core-principles.md) | `*` | Foundational instructions covering core DevOps principles, culture (CALMS), and key metrics (DORA) to guide Claude Co… |
| [github-actions-ci-cd-best-practices](instructions/github-actions-ci-cd-best-practices.md) | `.github/workflows/*.yml,.github/workflows/*.yaml` | Comprehensive guide for building robust, secure, and efficient CI/CD pipelines using GitHub Actions. Covers workflow… |
| [power-bi-devops-alm-best-practices](instructions/power-bi-devops-alm-best-practices.md) | `**/*.{yml,yaml,ps1,json,pbix,pbir}` | Comprehensive guide for Power BI DevOps, Application Lifecycle Management (ALM), CI/CD pipelines, deployment automati… |

### Databases

| Instruction | applyTo | Description |
|---|---|---|
| [mongo-dba](instructions/mongo-dba.md) | `**` | Instructions for customizing Claude Code behavior for MONGODB DBA chat mode. |
| [ms-sql-dba](instructions/ms-sql-dba.md) | `**` | Instructions for customizing Claude Code behavior for MS-SQL DBA chat mode. |
| [sql-sp-generation](instructions/sql-sp-generation.md) | `**/*.sql` | Guidelines for generating SQL statements and stored procedures |

### CMS / SaaS

| Instruction | applyTo | Description |
|---|---|---|
| [apex](instructions/apex.md) | `**/*.cls, **/*.trigger` | Guidelines and best practices for Apex development on the Salesforce Platform |
| [moodle](instructions/moodle.md) | `**/*.php, **/*.js, **/*.mustache, **/*.xml, **/…` | Instructions for Claude Code to generate code in a Moodle project context. |
| [oqtane](instructions/oqtane.md) | `**/*.razor, **/*.razor.cs, **/*.razor.css` | Oqtane Module patterns |
| [pcf-alm](instructions/pcf-alm.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj,sln}` | Application lifecycle management (ALM) for PCF code components |
| [pcf-api-reference](instructions/pcf-api-reference.md) | `**/*.{ts,tsx,js}` | Complete PCF API reference with all interfaces and their availability in model-driven and canvas apps |
| [pcf-best-practices](instructions/pcf-best-practices.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj,css,html}` | Best practices and guidance for developing PCF code components |
| [pcf-canvas-apps](instructions/pcf-canvas-apps.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Code components for canvas apps implementation, security, and configuration |
| [pcf-code-components](instructions/pcf-code-components.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Understanding code components structure and implementation |
| [pcf-community-resources](instructions/pcf-community-resources.md) | `**` | PCF community resources including gallery, videos, blogs, and development tools |
| [pcf-dependent-libraries](instructions/pcf-dependent-libraries.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Using dependent libraries in PCF components |
| [pcf-events](instructions/pcf-events.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Define and handle custom events in PCF components |
| [pcf-fluent-modern-theming](instructions/pcf-fluent-modern-theming.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Style components with modern theming using Fluent UI |
| [pcf-limitations](instructions/pcf-limitations.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Limitations and restrictions of Power Apps Component Framework |
| [pcf-manifest-schema](instructions/pcf-manifest-schema.md) | `**/*.xml` | Complete manifest schema reference for PCF components with all available XML elements |
| [pcf-model-driven-apps](instructions/pcf-model-driven-apps.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Code components for model-driven apps implementation and configuration |
| [pcf-overview](instructions/pcf-overview.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Power Apps Component Framework overview and fundamentals |
| [pcf-power-pages](instructions/pcf-power-pages.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Using code components in Power Pages sites |
| [pcf-sample-components](instructions/pcf-sample-components.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | How to use and run PCF sample components from the PowerApps-Samples repository |
| [pcf-tooling](instructions/pcf-tooling.md) | `**/*.{ts,tsx,js,json,xml,pcfproj,csproj}` | Get Microsoft Power Platform CLI tooling for Power Apps Component Framework |
| [power-apps-canvas-yaml](instructions/power-apps-canvas-yaml.md) | `**/*.{yaml,yml,md,pa.yaml}` | Comprehensive guide for working with Power Apps Canvas Apps YAML structure based on Microsoft Power Apps YAML schema… |
| [power-apps-code-apps](instructions/power-apps-code-apps.md) | `**/*.{ts,tsx,js,jsx}, **/vite.config.*, **/pack…` | Power Apps Code Apps development standards and best practices for TypeScript, React, and Power Platform integration |
| [power-bi-custom-visuals-development](instructions/power-bi-custom-visuals-development.md) | `**/*.{ts,tsx,js,jsx,json,less,css}` | Comprehensive Power BI custom visuals development guide covering React, D3.js integration, TypeScript patterns, testi… |
| [power-bi-data-modeling-best-practices](instructions/power-bi-data-modeling-best-practices.md) | `**/*.{pbix,md,json,txt}` | Comprehensive Power BI data modeling best practices based on Microsoft guidance for creating efficient, scalable, and… |
| [power-bi-dax-best-practices](instructions/power-bi-dax-best-practices.md) | `**/*.{pbix,dax,md,txt}` | Comprehensive Power BI DAX best practices and patterns based on Microsoft guidance for creating efficient, maintainab… |
| [power-bi-report-design-best-practices](instructions/power-bi-report-design-best-practices.md) | `**/*.{pbix,md,json,txt}` | Comprehensive Power BI report design and visualization best practices based on Microsoft guidance for creating effect… |
| [power-bi-security-rls-best-practices](instructions/power-bi-security-rls-best-practices.md) | `**/*.{pbix,dax,md,txt,json,csharp,powershell}` | Comprehensive Power BI Row-Level Security (RLS) and advanced security patterns implementation guide with dynamic secu… |
| [power-platform-connector](instructions/power-platform-connector.md) | `**/*.{json,md}` | Comprehensive development guidelines for Power Platform Custom Connectors using JSON Schema definitions. Covers API d… |
| [power-platform-mcp-development](instructions/power-platform-mcp-development.md) | `**/*.{json,csx,md}` | Instructions for developing Power Platform custom connectors with Model Context Protocol (MCP) integration for Micros… |
| [wordpress](instructions/wordpress.md) | `wp-content/plugins/**,wp-content/themes/**,**/*…` | Coding, security, and testing rules for WordPress plugins and themes |

### AI / ML / Agents

| Instruction | applyTo | Description |
|---|---|---|
| [agent-safety](instructions/agent-safety.md) | `**` | Guidelines for building safe, governed AI agent systems. Apply when writing code that uses agent frameworks, tool-cal… |
| [agent-skills](instructions/agent-skills.md) | `**/skills/**/SKILL.md` | Guidelines for creating high-quality Agent Skills for Claude Code |
| [agents](instructions/agents.md) | `**/*.agent.md` | Guidelines for creating custom agent files for Claude Code |
| [ai-prompt-engineering-safety-best-practices](instructions/ai-prompt-engineering-safety-best-practices.md) | `['*']` | Comprehensive best practices for AI prompt engineering, safety frameworks, bias mitigation, and responsible AI usage… |
| [codexer](instructions/codexer.md) | `**` | Advanced Python research assistant with Context 7 MCP integration, focusing on speed, reliability, and 10+ years of s… |
| [context-engineering](instructions/context-engineering.md) | `**` | Guidelines for structuring code and projects to maximize Claude Code effectiveness through better context management |
| [context7](instructions/context7.md) | `**` | Use Context7 for authoritative external docs and API references when local context is insufficient |
| [copilot-sdk-go](instructions/copilot-sdk-go.md) | `**.go, go.mod` | This file provides guidance on building Go applications using Claude Code SDK. |
| [copilot-thought-logging](instructions/copilot-thought-logging.md) | `**` | See process Copilot is following where you can edit this to reshape the interaction or save when follow up may be needed |
| [declarative-agents-microsoft365](instructions/declarative-agents-microsoft365.md) | `**.json, **.ts, **.tsp, **manifest.json, **agen…` | Comprehensive development guidelines for Microsoft 365 Copilot declarative agents with schema v1.5, TypeSpec integrat… |
| [genaiscript](instructions/genaiscript.md) | `**/*.genai.*` | AI-powered script generation guidelines |
| [go-mcp-server](instructions/go-mcp-server.md) | `**/*.go, **/go.mod, **/go.sum` | Best practices and patterns for building Model Context Protocol (MCP) servers in Go using the official github.com/mod… |
| [hooks](instructions/hooks.md) | `.github/hooks/**, hooks/**` | Portable guidance for authoring safe, fast, and clear hooks and reusable hook examples |
| [mcp-m365-copilot](instructions/mcp-m365-copilot.md) | `**/{*mcp*,*agent*,*plugin*,declarativeAgent.jso…` | Best practices for building MCP-based declarative agents and API plugins for Microsoft 365 Copilot with Model Context… |
| [memory-bank](instructions/memory-bank.md) | `**` | Memory Bank |
| [prompt](instructions/prompt.md) | `**/*.prompt.md` | Guidelines for creating high-quality prompt files for Claude Code |
| [taming-copilot](instructions/taming-copilot.md) | `**` | Prevent Copilot from wreaking havoc across your codebase, keeping it under control. |
| [tasksync](instructions/tasksync.md) | `**` | TaskSync V5 - Allows you to give the agent new instructions or feedback after completing a task using terminal while… |
| [typespec-m365-copilot](instructions/typespec-m365-copilot.md) | `**/*.tsp` | Guidelines and best practices for building TypeSpec-based declarative agents and API plugins for Microsoft 365 Copilot |

### Accessibility & UX

| Instruction | applyTo | Description |
|---|---|---|
| [a11y](instructions/a11y.md) | `**` | Comprehensive web accessibility standards based on WCAG 2.2 AA, with 38+ anti-patterns, legal enforcement context (EA… |

### Security

| Instruction | applyTo | Description |
|---|---|---|
| [security-and-owasp](instructions/security-and-owasp.md) | `**` | Comprehensive secure coding standards based on OWASP Top 10 2025, with 55+ anti-patterns, detection regex, framework-… |

### Documentation & Process

| Instruction | applyTo | Description |
|---|---|---|
| [code-review-generic](instructions/code-review-generic.md) | `**` | Generic code review instructions that can be customized for any project using Claude Code |
| [draw-io](instructions/draw-io.md) | `**/*.drawio,**/*.drawio.svg,**/*.drawio.png` | Use when creating, editing, or reviewing draw.io diagrams and mxGraph XML in .drawio, .drawio.svg, or .drawio.png files. |
| [gilfoyle-code-review](instructions/gilfoyle-code-review.md) | `**` | Gilfoyle-style code review instructions that channel the sardonic technical supremacy of Silicon Valley''s most arrog… |
| [instructions](instructions/instructions.md) | `**/*.instructions.md` | Guidelines for creating high-quality custom instruction files for Claude Code |
| [localization](instructions/localization.md) | `**/*.md` | Guidelines for localizing markdown documents |
| [markdown](instructions/markdown.md) | `**/*.md` | Markdown formatting aligned to the CommonMark specification (0.31.2) |
| [markdown-content-creation](instructions/markdown-content-creation.md) | `**/*.md` | Markdown guidelines and content creation standards for blog posts |
| [markdown-gfm](instructions/markdown-gfm.md) | `**/*.md` | Markdown formatting for GitHub-flavored markdown (GFM) files |
| [performance-optimization](instructions/performance-optimization.md) | `**` | Comprehensive web performance standards based on Core Web Vitals (LCP, INP, CLS), with 50+ anti-patterns, detection r… |
| [self-explanatory-code-commenting](instructions/self-explanatory-code-commenting.md) | `**` | Guidelines for Claude Code to write comments to achieve self-explanatory code with less comments. Examples are in Jav… |
| [spec-driven-workflow-v1](instructions/spec-driven-workflow-v1.md) | `**` | Specification-Driven Workflow v1 provides a structured approach to software development, ensuring that requirements a… |
| [task-implementation](instructions/task-implementation.md) | `**/.copilot-tracking/changes/*.md` | Instructions for implementing task plans with progressive tracking and change record - Brought to you by microsoft/ed… |
| [update-code-from-shorthand](instructions/update-code-from-shorthand.md) | `**/${input:file}` | Shorthand code will be in the file provided from the prompt or raw data in the prompt, and will be used to update the… |
| [update-docs-on-code-change](instructions/update-docs-on-code-change.md) | `**/*.{md,js,mjs,cjs,ts,tsx,jsx,py,java,cs,go,rb…` | Automatically update README.md and documentation files when application code changes require documentation updates |
| [use-cliche-data-in-docs](instructions/use-cliche-data-in-docs.md) | `**/*.{md,js,mjs,cjs,ts,tsx,jsx,py,json}` | Ensure documentation and examples use only generic, cliche placeholder data — never real or sensitive data sourced fr… |

### Tooling / IDE / CLI

| Instruction | applyTo | Description |
|---|---|---|
| [caveman-mode](instructions/caveman-mode.md) | `**` | Terse, low-token responses. Minimal words, no fluff. Full capabilities preserved. Use when: optimize token usage, low… |
| [devbox-image-definition](instructions/devbox-image-definition.md) | `**/*.yaml` | Authoring recommendations for creating YAML based image definition files for use with Microsoft Dev Box Team Customiz… |
| [shell](instructions/shell.md) | `**/*.sh` | Shell scripting best practices and conventions for bash, sh, zsh, and other shells |
| [vsixtoolkit](instructions/vsixtoolkit.md) | `**/*.cs, **/*.vsct, **/*.xaml, **/source.extens…` | Guidelines for Visual Studio extension (VSIX) development using Community.VisualStudio.Toolkit |
| [winui3](instructions/winui3.md) | `**/*.xaml, **/*.cs, **/*.csproj` | WinUI 3 and Windows App SDK coding guidelines. Prevents common UWP API misuse, enforces correct XAML namespaces, thre… |


<!-- INSTRUCTIONS-SECTION-END -->


---

## Hooks

Lifecycle hook bundles ported from `awesome-copilot/hooks/`. Each bundle ships with its scripts, a `claude-settings.json` fragment to merge into `~/.claude/settings.json`, and a per-bundle README documenting events and security notes.

_Currently populated: 6 / 6 upstream._

| Bundle | Events | Install |
|---|---|---|
| [dependency-license-checker](hooks/dependency-license-checker/) | `Stop` | `./install.sh install-hook dependency-license-checker` |
| [governance-audit](hooks/governance-audit/) | `SessionStart`, `Stop`, `UserPromptSubmit` | `./install.sh install-hook governance-audit` |
| [secrets-scanner](hooks/secrets-scanner/) | `Stop` | `./install.sh install-hook secrets-scanner` |
| [session-auto-commit](hooks/session-auto-commit/) | `Stop` | `./install.sh install-hook session-auto-commit` |
| [session-logger](hooks/session-logger/) | `SessionStart`, `Stop`, `UserPromptSubmit` | `./install.sh install-hook session-logger` |
| [tool-guardian](hooks/tool-guardian/) | `PreToolUse` | `./install.sh install-hook tool-guardian` |

---

## Workflows

Agentic GitHub Actions workflows ported from `awesome-copilot/workflows/`. Each entry is a markdown agent prompt paired with a `<name>.github-action.yml` runner template that invokes `anthropics/claude-code-action` on the upstream schedule.

_Currently populated: 8 / 8 upstream._

| Workflow | Schedule (cron) | Purpose |
|---|---|---|
| [daily-issues-report](workflows/daily-issues-report.md) | `0 9 * * 1-5` | Generates a daily summary of open issues and recent activity as a GitHub issue |
| [ospo-contributors-report](workflows/ospo-contributors-report.md) | `3 2 1 * *` | Monthly contributor activity metrics across an organization''s repositories. |
| [ospo-org-health](workflows/ospo-org-health.md) | `0 10 * * 1` | Comprehensive weekly health report for a GitHub organization. Surfaces stale issues/PRs, merge time analysis, contrib… |
| [ospo-release-compliance-checker](workflows/ospo-release-compliance-checker.md) | `0 9 * * *` | Analyzes a target repository against open source release requirements and posts a detailed compliance report as an is… |
| [ospo-stale-repos](workflows/ospo-stale-repos.md) | `3 2 1 * *` | Identifies inactive repositories in your organization and generates an archival recommendation report. |
| [relevance-check](workflows/relevance-check.md) | `0 9 * * *` | Slash command to evaluate whether an issue or pull request is still relevant to the project |
| [relevance-summary](workflows/relevance-summary.md) | `0 9 * * *` | Manually triggered workflow that summarizes all open issues and PRs with a /relevance-check response into a single issue |
| [weekly-comment-sync](workflows/weekly-comment-sync.md) | `0 9 * * 1` | Weekly workflow that finds stale code comments or README snippets, makes text-only synchronization updates, and opens… |

---

## Cookbook

Translation guides for upstream `awesome-copilot/cookbook/copilot-sdk/` recipes. These are documentation-only entries per `references/conversion-patterns.md` §16 — the upstream targets the GitHub Copilot SDK and a mechanical code port would produce untested snippets. Each recipe maps the original problem to the canonical Claude Code / Anthropic SDK approach with pointers to live docs.

_Currently populated: 7 ported + 3 skipped-with-reason / 10 upstream entries._

### Translation guides

| Recipe | Topic | Anthropic analog |
|---|---|---|
| [Accessibility Report](cookbook/accessibility-report/) | Generate WCAG accessibility reports for a web app using the Playwright MCP server. | see recipe README |
| [Error Handling](cookbook/error-handling/) | Handle SDK errors gracefully: connection failures, timeouts, rate limits, and resource cleanup. | see recipe README |
| [Managing Local Files](cookbook/managing-local-files/) | Organise files by metadata using AI-powered grouping strategies. | see recipe README |
| [Multiple Sessions](cookbook/multiple-sessions/) | Manage multiple independent conversations simultaneously without state bleed. | see recipe README |
| [Persisting Sessions](cookbook/persisting-sessions/) | Save and resume conversation sessions across restarts. | see recipe README |
| [PR Visualization](cookbook/pr-visualization/) | Generate interactive PR age charts using the GitHub MCP server. | see recipe README |
| [Ralph Loop](cookbook/ralph-loop/) | Build autonomous coding loops that iterate until a goal is met, with fresh context per iteration and planning/buildin… | see recipe README |

### Skipped recipes

| Recipe | Why skipped |
|---|---|
| [Community Samples](cookbook/community-samples/) | Copilot-SDK-specific; see recipe README for the Claude analog pointer |
| [Copilot SDK Web App](cookbook/copilot-sdk-web-app/) | Copilot-SDK-specific; see recipe README for the Claude analog pointer |
| [Node.js Agentic Issue Resolver](cookbook/nodejs-agentic-issue-resolver/) | Copilot-SDK-specific; see recipe README for the Claude analog pointer |
