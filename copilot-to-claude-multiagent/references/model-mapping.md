# Copilot → Claude Model Mapping

## Mapping Philosophy

Map by **capability tier**, not by brand feature parity. Claude's tier structure:

| Tier | Model ID | Characteristics | Use for |
|---|---|---|---|
| **Heavy** | `claude-opus-4-6` | Strongest reasoning, complex planning, highest quality | Orchestrators, architects, security reviewers, complex planners, implementers on hard tasks |
| **Balanced** | `claude-sonnet-4-6` | Fast + capable, good for most agentic work | Most implementation, QA, research, documentation, design |
| **Light** | `claude-haiku-4-5-20251001` | Fastest, lowest cost | High-frequency subtasks, simple summaries, formatting, light research |

## General Mappings

| Copilot / OpenAI Model | Claude Equivalent | Reasoning |
|---|---|---|
| `GPT-5` / `GPT-5.4` | `claude-opus-4-6` | Top capability tier match |
| `GPT-5.4` (orchestrator role) | `claude-opus-4-6` | Orchestration demands strong reasoning |
| `GPT-5.4` (implementation role) | `claude-opus-4-6` | Implementer quality needs top tier |
| `Gemini 3.1 Pro` | `claude-sonnet-4-6` | Mid-tier balanced match |
| `Gemini 3.1 Flash` | `claude-haiku-4-5-20251001` | Light/fast tier match |
| `GPT-5.4 Mini` | `claude-haiku-4-5-20251001` | Mini/light tier match |
| `MiniMax M2.7` | `claude-haiku-4-5-20251001` | Light tier |
| `Llama 4 Scout` | `claude-haiku-4-5-20251001` | Light tier |
| `Llama 4 Maverick` | `claude-sonnet-4-6` | Mid tier |
| Not specified | `claude-sonnet-4-6` | Safe balanced default |

## Gem-team Agent-Specific Mappings

gem-team's README recommends specific models per role. Apply these Claude equivalents:

| Gem-team Agent | Copilot Recommendation | Claude Equivalent |
|---|---|---|
| ORCHESTRATOR | Claude Sonnet 4.6 (top) | `claude-opus-4-6` |
| RESEARCHER | Gemini 3.1 Pro, Claude Sonnet 4.6 | `claude-sonnet-4-6` |
| PLANNER | Gemini 3.1 Pro, Claude Sonnet 4.6 | `claude-sonnet-4-6` |
| IMPLEMENTER | Claude Opus 4.6 (top) | `claude-opus-4-6` |
| REVIEWER | Claude Opus 4.6 (top) | `claude-opus-4-6` |
| CRITIC | Claude Sonnet 4.6 | `claude-sonnet-4-6` |
| DEBUGGER | Gemini 3.1 Pro, Claude Opus 4.6 | `claude-opus-4-6` |
| BROWSER TESTER | Claude Sonnet 4.6 | `claude-sonnet-4-6` |
| SIMPLIFIER | Claude Opus 4.6 | `claude-opus-4-6` |
| DEVOPS | Gemini 3.1 Pro | `claude-sonnet-4-6` |
| DOCUMENTATION | Gemini 3.1 Flash | `claude-haiku-4-5-20251001` |
| DESIGNER | Gemini 3.1 Pro | `claude-sonnet-4-6` |
| IMPLEMENTER-MOBILE | Claude Opus 4.6 | `claude-opus-4-6` |
| DESIGNER-MOBILE | Gemini 3.1 Pro | `claude-sonnet-4-6` |
| MOBILE TESTER | Claude Sonnet 4.6 | `claude-sonnet-4-6` |

## RUG Agentic Workflow Mappings

No model specified in the RUG plugin. Apply by role:

| Agent | Assigned Model | Rationale |
|---|---|---|
| RUG (orchestrator) | `claude-opus-4-6` | Pure orchestration, complex decomposition |
| SWE (implementer) | `claude-opus-4-6` | Production code quality demands top tier |
| QA (tester) | `claude-sonnet-4-6` | Test planning and verification — balanced tier |

## Software Engineering Team Mappings

All agents in this plugin specify `model: GPT-5`:

| Agent | Assigned Model | Rationale |
|---|---|---|
| SE: Architect | `claude-opus-4-6` | Architecture decisions, Well-Architected review |
| SE: Security | `claude-opus-4-6` | OWASP, Zero Trust — highest stakes |
| SE: DevOps/CI | `claude-sonnet-4-6` | Pipeline + deployment — balanced |
| SE: Product Manager | `claude-sonnet-4-6` | Planning and coordination |
| SE: Technical Writer | `claude-haiku-4-5-20251001` | Documentation — light tier sufficient |
| SE: UX/UI Designer | `claude-sonnet-4-6` | Design work — balanced |
| SE: Responsible AI | `claude-opus-4-6` | Ethics/compliance — needs careful reasoning |

## AI Team Orchestration Mappings

No model specified. Apply by role:

| Agent | Assigned Model | Rationale |
|---|---|---|
| ai-team-producer (Remy) | `claude-sonnet-4-6` | Sprint planning, coordination — balanced |
| ai-team-dev (Nova/Sage/Milo) | `claude-opus-4-6` | Full-stack implementation — top tier |
| ai-team-qa (Ivy) | `claude-sonnet-4-6` | Testing and QA — balanced |
