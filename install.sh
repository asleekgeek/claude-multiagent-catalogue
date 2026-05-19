#!/usr/bin/env bash
# install.sh — Claude Multiagent Catalogue installer
#
# Usage:
#   install.sh <plugin-name> [--skills]   Install agents (+ skills) into current project
#   install.sh --list                     Show available plugins
#   install.sh --help                     Show this help
#
# Agents install to:  .claude/agents/   (project-scoped, picked up by Claude Code)
# Skills install to:  .claude/skills/   (project-scoped)
#
# Example:
#   cd ~/src/my-project
#   ~/src/claude-multiagent-catalogue/install.sh rug-agentic-workflow
#   ~/src/claude-multiagent-catalogue/install.sh ai-team-orchestration --skills

set -euo pipefail

CATALOGUE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGINS_DIR="$CATALOGUE_DIR/plugins"
PROJECT_DIR="$(pwd)"

# ── Colours ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ── Helpers ────────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}ℹ${RESET}  $*"; }
success() { echo -e "${GREEN}✅${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET}  $*"; }
error()   { echo -e "${RED}✖${RESET}  $*" >&2; }
bold()    { echo -e "${BOLD}$*${RESET}"; }

list_plugins() {
  bold "\nAvailable plugins:"
  echo ""
  for dir in "$PLUGINS_DIR"/*/; do
    plugin="$(basename "$dir")"
    has_agents=""
    has_skills=""
    [[ -d "$dir/agents" ]] && has_agents=" agents($(ls "$dir/agents"/*.md 2>/dev/null | wc -l | tr -d ' '))"
    [[ -d "$dir/skills" ]] && has_skills=" skills($(ls -d "$dir/skills"/*/ 2>/dev/null | wc -l | tr -d ' '))"

    # Read status from CATALOGUE.md (crude but avoids a manifest file)
    status="🔄"
    [[ -f "$dir/agents/$(ls "$dir/agents/" 2>/dev/null | head -1)" ]] && status="✅"
    [[ -d "$dir/agents" && -n "$(ls "$dir/agents/"*.md 2>/dev/null)" ]] && status="✅"

    printf "  %-40s %s%s%s\n" "$plugin" "$status" "$has_agents" "$has_skills"
  done
  echo ""
}

# ── Argument parsing ───────────────────────────────────────────────────────────
if [[ $# -eq 0 || "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo ""
  bold "Claude Multiagent Catalogue — install.sh"
  echo ""
  echo "  install.sh <plugin-name> [--skills]"
  echo "  install.sh --list"
  echo ""
  echo "  Installs agents (and optionally skills) from the catalogue into"
  echo "  the current project's .claude/ directory."
  echo ""
  list_plugins
  exit 0
fi

if [[ "${1:-}" == "--list" ]]; then
  list_plugins
  exit 0
fi

PLUGIN_NAME="$1"
INCLUDE_SKILLS="${2:-}"
PLUGIN_DIR="$PLUGINS_DIR/$PLUGIN_NAME"

# ── Validate ───────────────────────────────────────────────────────────────────
if [[ ! -d "$PLUGIN_DIR" ]]; then
  error "Plugin '$PLUGIN_NAME' not found."
  list_plugins
  exit 1
fi

echo ""
bold "Installing: $PLUGIN_NAME"
info "Source:  $PLUGIN_DIR"
info "Target:  $PROJECT_DIR/.claude/"
echo ""

installed_something=false

# ── Install agents ─────────────────────────────────────────────────────────────
if [[ -d "$PLUGIN_DIR/agents" ]] && ls "$PLUGIN_DIR/agents/"*.md &>/dev/null; then
  mkdir -p "$PROJECT_DIR/.claude/agents"
  agent_count=0
  for agent_file in "$PLUGIN_DIR/agents/"*.md; do
    target="$PROJECT_DIR/.claude/agents/$(basename "$agent_file")"
    if [[ -f "$target" ]]; then
      warn "Agent already exists, overwriting: $(basename "$agent_file")"
    fi
    cp "$agent_file" "$target"
    success "Agent: $(basename "$agent_file")"
    ((agent_count++)) || true
  done
  info "$agent_count agent(s) installed → .claude/agents/"
  installed_something=true
else
  info "No agents in this plugin."
fi

# ── Install skills ─────────────────────────────────────────────────────────────
if [[ "$INCLUDE_SKILLS" == "--skills" ]]; then
  if [[ -d "$PLUGIN_DIR/skills" ]] && ls -d "$PLUGIN_DIR/skills"/*/ &>/dev/null; then
    mkdir -p "$PROJECT_DIR/.claude/skills"
    skill_count=0
    for skill_dir in "$PLUGIN_DIR/skills"/*/; do
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

# ── Summary ────────────────────────────────────────────────────────────────────
if $installed_something; then
  echo ""
  bold "Done. Claude Code will pick up the new agents/skills automatically in this project."
  echo ""
  echo "  Verify:  ls .claude/agents/"
  [[ "$INCLUDE_SKILLS" == "--skills" ]] && echo "           ls .claude/skills/"
  echo ""
  echo "  README:  $PLUGIN_DIR/README.md"
else
  warn "Nothing was installed — plugin may be empty or still in progress."
fi
