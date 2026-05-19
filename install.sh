#!/usr/bin/env bash
# install.sh — Claude Multiagent Catalogue installer
#
# Usage:
#   install.sh <plugin-name> [--skills]        Install a plugin's agents (+ skills)
#   install.sh install-agent <name>            Install a single standalone agent
#   install.sh install-instruction <name>      Install a single instruction
#   install.sh install-hook <name>             Install a hook bundle (scripts only;
#                                              prints settings.json fragment)
#   install.sh install-skill <name>            Install a single standalone skill
#   install.sh --list                          Summary across all buckets
#   install.sh --list-agents                   List standalone agents
#   install.sh --list-instructions             List instructions
#   install.sh --list-hooks                    List hook bundles
#   install.sh --list-workflows                List workflows
#   install.sh --help                          Show this help
#
# Agents       → .claude/agents/
# Skills       → .claude/skills/
# Instructions → .claude/instructions/
# Hooks        → .claude/hooks/<bundle>/ (settings.json fragment printed, not merged)
#
# Examples:
#   cd ~/src/my-project
#   ~/src/claude-multiagent-catalogue/install.sh rug-agentic-workflow
#   ~/src/claude-multiagent-catalogue/install.sh ai-team-orchestration --skills
#   ~/src/claude-multiagent-catalogue/install.sh install-agent csharp-expert
#   ~/src/claude-multiagent-catalogue/install.sh install-instruction typescript
#   ~/src/claude-multiagent-catalogue/install.sh install-hook secrets-scanner

set -euo pipefail

CATALOGUE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGINS_DIR="$CATALOGUE_DIR/plugins"
AGENTS_DIR="$CATALOGUE_DIR/agents"
INSTRUCTIONS_DIR="$CATALOGUE_DIR/instructions"
HOOKS_DIR="$CATALOGUE_DIR/hooks"
WORKFLOWS_DIR="$CATALOGUE_DIR/workflows"
SKILLS_DIR="$CATALOGUE_DIR/skills"
PROJECT_DIR="$(pwd)"

# ── Colours ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# ── Helpers ────────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}ℹ${RESET}  $*"; }
success() { echo -e "${GREEN}✅${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET}  $*"; }
error()   { echo -e "${RED}✖${RESET}  $*" >&2; }
bold()    { echo -e "${BOLD}$*${RESET}"; }
dim()     { echo -e "${DIM}$*${RESET}"; }

count_files() {
  local dir="$1"
  local pattern="${2:-*.md}"
  shopt -s nullglob
  local files=( "$dir"/$pattern )
  shopt -u nullglob
  echo "${#files[@]}"
}

count_dirs() {
  local dir="$1"
  shopt -s nullglob
  local dirs=( "$dir"/*/ )
  shopt -u nullglob
  echo "${#dirs[@]}"
}

# ── Listing ────────────────────────────────────────────────────────────────────
list_plugins() {
  bold "\nPlugins:"
  echo ""
  for dir in "$PLUGINS_DIR"/*/; do
    plugin="$(basename "$dir")"
    has_agents=""
    has_skills=""
    [[ -d "$dir/agents" ]] && has_agents=" agents($(ls "$dir/agents"/*.md 2>/dev/null | wc -l | tr -d ' '))"
    [[ -d "$dir/skills" ]] && has_skills=" skills($(ls -d "$dir/skills"/*/ 2>/dev/null | wc -l | tr -d ' '))"

    status="🔄"
    [[ -d "$dir/agents" && -n "$(ls "$dir/agents/"*.md 2>/dev/null)" ]] && status="✅"

    printf "  %-40s %s%s%s\n" "$plugin" "$status" "$has_agents" "$has_skills"
  done
  echo ""
}

# Extract the frontmatter description value, handling both inline and folded-scalar (`>`) forms.
extract_description() {
  local f="$1"
  awk '
    /^---$/ { fm++; if (fm == 2) exit; next }
    fm != 1 { next }
    /^description:/ {
      sub(/^description:[[:space:]]*/, "")
      if ($0 == ">" || $0 == "" || $0 == "|") { folded=1; next }
      sub(/^"/, ""); sub(/"$/, "")
      print
      exit
    }
    folded {
      if (/^[a-zA-Z_-]+:/) exit
      sub(/^[[:space:]]+/, "")
      if ($0 == "") next
      collected = (collected ? collected " " : "") $0
    }
    END { if (folded && collected) print collected }
  ' "$f"
}

list_agents() {
  bold "\nStandalone agents:"
  echo ""
  shopt -s nullglob
  local agents=( "$AGENTS_DIR"/*.md )
  shopt -u nullglob
  if [[ ${#agents[@]} -eq 0 || ( ${#agents[@]} -eq 1 && "$(basename "${agents[0]}")" == "README.md" ) ]]; then
    dim "  (none yet — see agents/README.md for Phase B status)"
  else
    for f in "${agents[@]}"; do
      name="$(basename "$f" .md)"
      [[ "$name" == "README" ]] && continue
      desc="$(extract_description "$f" | head -c 70)"
      printf "  %-40s %s\n" "$name" "$desc"
    done
  fi
  echo ""
}

list_instructions() {
  bold "\nInstructions:"
  echo ""
  shopt -s nullglob
  local files=( "$INSTRUCTIONS_DIR"/*.md )
  shopt -u nullglob
  if [[ ${#files[@]} -eq 0 || ( ${#files[@]} -eq 1 && "$(basename "${files[0]}")" == "README.md" ) ]]; then
    dim "  (none yet — see instructions/README.md for Phase D status)"
  else
    for f in "${files[@]}"; do
      name="$(basename "$f" .md)"
      [[ "$name" == "README" ]] && continue
      applies="$(grep -m1 '^applyTo:' "$f" 2>/dev/null | sed -E "s/^applyTo:[[:space:]]*//" | head -c 30)"
      printf "  %-40s applyTo: %s\n" "$name" "$applies"
    done
  fi
  echo ""
}

list_hooks() {
  bold "\nHook bundles:"
  echo ""
  shopt -s nullglob
  local bundles=( "$HOOKS_DIR"/*/ )
  shopt -u nullglob
  if [[ ${#bundles[@]} -eq 0 ]]; then
    dim "  (none yet — see hooks/README.md for Phase E status)"
  else
    for d in "${bundles[@]}"; do
      name="$(basename "$d")"
      events="$(grep -oE '"(SessionStart|Stop|PreToolUse|PostToolUse|UserPromptSubmit|Notification|SubagentStop)"' "$d/claude-settings.json" 2>/dev/null | sort -u | tr '\n' ',' | sed 's/,$//; s/"//g')"
      printf "  %-40s events: %s\n" "$name" "$events"
    done
  fi
  echo ""
}

list_workflows() {
  bold "\nWorkflows:"
  echo ""
  shopt -s nullglob
  local files=( "$WORKFLOWS_DIR"/*.md )
  shopt -u nullglob
  if [[ ${#files[@]} -eq 0 || ( ${#files[@]} -eq 1 && "$(basename "${files[0]}")" == "README.md" ) ]]; then
    dim "  (none yet — see workflows/README.md for Phase E status)"
  else
    for f in "${files[@]}"; do
      name="$(basename "$f" .md)"
      [[ "$name" == "README" ]] && continue
      desc="$(extract_description "$f" | head -c 70)"
      printf "  %-40s %s\n" "$name" "$desc"
    done
  fi
  echo ""
}

list_summary() {
  bold "\nClaude Multiagent Catalogue — bucket summary"
  echo ""
  printf "  %-15s %5s entries\n" "Plugins:"      "$(count_dirs "$PLUGINS_DIR")"
  # Subtract README.md from each markdown count
  local n_agents=$(count_files "$AGENTS_DIR" "*.md")
  local n_instr=$(count_files "$INSTRUCTIONS_DIR" "*.md")
  local n_workflows=$(count_files "$WORKFLOWS_DIR" "*.md")
  printf "  %-15s %5s entries\n" "Agents:"       "$((n_agents > 0 ? n_agents - 1 : 0))"
  printf "  %-15s %5s entries\n" "Instructions:" "$((n_instr > 0 ? n_instr - 1 : 0))"
  printf "  %-15s %5s entries\n" "Skills:"       "$(count_dirs "$SKILLS_DIR")"
  printf "  %-15s %5s entries\n" "Hooks:"        "$(count_dirs "$HOOKS_DIR")"
  printf "  %-15s %5s entries\n" "Workflows:"    "$((n_workflows > 0 ? n_workflows - 1 : 0))"
  echo ""
  list_plugins
  echo ""
  dim "  Per-bucket lists:  --list-agents | --list-instructions | --list-hooks | --list-workflows"
  echo ""
}

show_help() {
  echo ""
  bold "Claude Multiagent Catalogue — install.sh"
  echo ""
  echo "  install.sh <plugin-name> [--skills]      Install a plugin's agents (+ skills)"
  echo "  install.sh install-agent <name>          Install one standalone agent"
  echo "  install.sh install-instruction <name>    Install one instruction"
  echo "  install.sh install-hook <name>           Install a hook bundle"
  echo "  install.sh install-skill <name>          Install one standalone skill"
  echo ""
  echo "  install.sh --list                        Summary + plugin list"
  echo "  install.sh --list-agents"
  echo "  install.sh --list-instructions"
  echo "  install.sh --list-hooks"
  echo "  install.sh --list-workflows"
  echo ""
  echo "  Targets:"
  echo "    Agents       → .claude/agents/"
  echo "    Skills       → .claude/skills/"
  echo "    Instructions → .claude/instructions/"
  echo "    Hooks        → .claude/hooks/<bundle>/  (settings fragment printed, not merged)"
  echo ""
}

# ── Per-bucket install handlers ────────────────────────────────────────────────

install_one_agent() {
  local name="$1"
  local src="$AGENTS_DIR/$name.md"
  if [[ ! -f "$src" ]]; then
    error "Agent '$name' not found at $src"
    list_agents
    exit 1
  fi
  mkdir -p "$PROJECT_DIR/.claude/agents"
  local target="$PROJECT_DIR/.claude/agents/$name.md"
  [[ -f "$target" ]] && warn "Agent already exists, overwriting: $name.md"
  cp "$src" "$target"
  success "Agent: $name.md → .claude/agents/"
}

install_one_instruction() {
  local name="$1"
  local src="$INSTRUCTIONS_DIR/$name.md"
  if [[ ! -f "$src" ]]; then
    error "Instruction '$name' not found at $src"
    list_instructions
    exit 1
  fi
  mkdir -p "$PROJECT_DIR/.claude/instructions"
  local target="$PROJECT_DIR/.claude/instructions/$name.md"
  [[ -f "$target" ]] && warn "Instruction already exists, overwriting: $name.md"
  cp "$src" "$target"
  success "Instruction: $name.md → .claude/instructions/"
  info "Reminder: Claude Code does not auto-load instructions."
  info "Wire it in by adding to your project CLAUDE.md:"
  echo ""
  echo "    @./.claude/instructions/$name.md"
  echo ""
}

install_one_hook() {
  local name="$1"
  local src_dir="$HOOKS_DIR/$name"
  if [[ ! -d "$src_dir" ]]; then
    error "Hook bundle '$name' not found at $src_dir"
    list_hooks
    exit 1
  fi
  mkdir -p "$PROJECT_DIR/.claude/hooks/$name"
  local copied=0
  for f in "$src_dir"/*; do
    fname="$(basename "$f")"
    # claude-settings.json is printed, not copied
    [[ "$fname" == "claude-settings.json" ]] && continue
    [[ "$fname" == "README.md" ]] && continue
    cp -r "$f" "$PROJECT_DIR/.claude/hooks/$name/"
    success "Hook file: $fname → .claude/hooks/$name/"
    ((copied++)) || true
  done
  info "$copied file(s) installed."
  echo ""
  if [[ -f "$src_dir/claude-settings.json" ]]; then
    bold "Settings fragment — merge into your ~/.claude/settings.json:"
    echo ""
    cat "$src_dir/claude-settings.json"
    echo ""
    warn "This fragment is printed, not merged. Review it, then merge by hand."
  fi
  if [[ -f "$src_dir/README.md" ]]; then
    echo ""
    info "Bundle README: $src_dir/README.md"
  fi
}

install_one_skill() {
  local name="$1"
  local src_dir="$SKILLS_DIR/$name"
  if [[ ! -d "$src_dir" ]]; then
    error "Skill '$name' not found at $src_dir"
    exit 1
  fi
  mkdir -p "$PROJECT_DIR/.claude/skills"
  local target="$PROJECT_DIR/.claude/skills/$name"
  if [[ -d "$target" ]]; then
    warn "Skill already exists, overwriting: $name"
    rm -rf "$target"
  fi
  cp -r "$src_dir" "$target"
  success "Skill: $name → .claude/skills/"
}

# ── Plugin installer (preserved from original) ─────────────────────────────────

install_plugin() {
  local plugin_name="$1"
  local include_skills="${2:-}"
  local plugin_dir="$PLUGINS_DIR/$plugin_name"

  if [[ ! -d "$plugin_dir" ]]; then
    error "Plugin '$plugin_name' not found."
    list_plugins
    exit 1
  fi

  echo ""
  bold "Installing: $plugin_name"
  info "Source:  $plugin_dir"
  info "Target:  $PROJECT_DIR/.claude/"
  echo ""

  local installed_something=false

  # Agents
  if [[ -d "$plugin_dir/agents" ]] && ls "$plugin_dir/agents/"*.md &>/dev/null; then
    mkdir -p "$PROJECT_DIR/.claude/agents"
    local agent_count=0
    for agent_file in "$plugin_dir/agents/"*.md; do
      target="$PROJECT_DIR/.claude/agents/$(basename "$agent_file")"
      [[ -f "$target" ]] && warn "Agent already exists, overwriting: $(basename "$agent_file")"
      cp "$agent_file" "$target"
      success "Agent: $(basename "$agent_file")"
      ((agent_count++)) || true
    done
    info "$agent_count agent(s) installed → .claude/agents/"
    installed_something=true
  else
    info "No agents in this plugin."
  fi

  # Skills
  if [[ "$include_skills" == "--skills" ]]; then
    if [[ -d "$plugin_dir/skills" ]] && ls -d "$plugin_dir/skills"/*/ &>/dev/null; then
      mkdir -p "$PROJECT_DIR/.claude/skills"
      local skill_count=0
      for skill_dir in "$plugin_dir/skills"/*/; do
        skill_name="$(basename "$skill_dir")"
        target="$PROJECT_DIR/.claude/skills/$skill_name"
        if [[ -d "$target" ]]; then
          warn "Skill already exists, overwriting: $skill_name"
          rm -rf "$target"
        fi
        cp -r "$skill_dir" "$target"
        success "Skill:  $skill_name"
        ((skill_count++)) || true
      done
      info "$skill_count skill(s) installed → .claude/skills/"
      installed_something=true
    else
      warn "No skills in this plugin. (Skills require --skills flag and a skills/ directory.)"
    fi
  fi

  # Instructions (if a plugin packages instructions/)
  if [[ -d "$plugin_dir/instructions" ]] && ls "$plugin_dir/instructions/"*.md &>/dev/null; then
    mkdir -p "$PROJECT_DIR/.claude/instructions"
    local instr_count=0
    for instr_file in "$plugin_dir/instructions/"*.md; do
      target="$PROJECT_DIR/.claude/instructions/$(basename "$instr_file")"
      [[ -f "$target" ]] && warn "Instruction already exists, overwriting: $(basename "$instr_file")"
      cp "$instr_file" "$target"
      success "Instruction: $(basename "$instr_file")"
      ((instr_count++)) || true
    done
    info "$instr_count instruction(s) installed → .claude/instructions/"
    installed_something=true
  fi

  echo ""
  if $installed_something; then
    bold "Done. Claude Code will pick up the new agents/skills automatically."
    echo ""
    echo "  Verify:  ls .claude/agents/"
    [[ "$include_skills" == "--skills" ]] && echo "           ls .claude/skills/"
    [[ -d "$PROJECT_DIR/.claude/instructions" ]] && echo "           ls .claude/instructions/"
    echo ""
    echo "  README:  $plugin_dir/README.md"
  else
    warn "Nothing was installed — plugin may be empty or still in progress."
  fi
}

# ── Argument dispatch ──────────────────────────────────────────────────────────

if [[ $# -eq 0 || "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  show_help
  list_summary
  exit 0
fi

case "${1:-}" in
  --list)               list_summary;       exit 0 ;;
  --list-agents)        list_agents;        exit 0 ;;
  --list-instructions)  list_instructions;  exit 0 ;;
  --list-hooks)         list_hooks;         exit 0 ;;
  --list-workflows)     list_workflows;     exit 0 ;;
  install-agent)
    [[ $# -lt 2 ]] && { error "install-agent requires a name"; list_agents; exit 1; }
    install_one_agent "$2"; exit 0 ;;
  install-instruction)
    [[ $# -lt 2 ]] && { error "install-instruction requires a name"; list_instructions; exit 1; }
    install_one_instruction "$2"; exit 0 ;;
  install-hook)
    [[ $# -lt 2 ]] && { error "install-hook requires a name"; list_hooks; exit 1; }
    install_one_hook "$2"; exit 0 ;;
  install-skill)
    [[ $# -lt 2 ]] && { error "install-skill requires a name"; exit 1; }
    install_one_skill "$2"; exit 0 ;;
esac

# Fallthrough: treat first arg as plugin name (preserves the original calling convention)
install_plugin "$1" "${2:-}"
