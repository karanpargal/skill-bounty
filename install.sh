#!/bin/bash

# Launch Copilot - Standard Installer
# Installs with recommended defaults. For custom options, use ./install-custom.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skill"

# Standard defaults
SKILLS_DIR="$HOME/.claude/skills"
SKILL_PATH="$SKILLS_DIR/launch-copilot"
AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
RULES_DIR="$HOME/.claude/rules"
CLAUDE_MD_PATH="$HOME/.claude/CLAUDE.md"

print_banner() {
    echo ""
    echo -e "${MAGENTA}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██╗      ${GREEN} █████╗ ${YELLOW}██╗   ██╗${RED}███╗   ██╗${BLUE} ██████╗██╗  ██╗${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██║      ${GREEN}██╔══██╗${YELLOW}██║   ██║${RED}████╗  ██║${BLUE}██╔════╝██║  ██║${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██║      ${GREEN}███████║${YELLOW}██║   ██║${RED}██╔██╗ ██║${BLUE}██║     ███████║${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}██║      ${GREEN}██╔══██║${YELLOW}██║   ██║${RED}██║╚██╗██║${BLUE}██║     ██╔══██║${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}███████╗${GREEN}██║  ██║${YELLOW}╚██████╔╝${RED}██║ ╚████║${BLUE}╚██████╗██║  ██║${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${CYAN}╚══════╝${GREEN}╚═╝  ╚═╝${YELLOW} ╚═════╝ ${RED}╚═╝  ╚═══╝${BLUE} ╚═════╝╚═╝  ╚═╝${NC}   ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}   ${WHITE}Launch Copilot — AI OS for Solana Founders${NC}                  ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}║${NC}                                                               ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_help() {
    echo "Launch Copilot - Standard Installer"
    echo ""
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Installs with recommended defaults:"
    echo "  - Skill:    ~/.claude/skills/launch-copilot/"
    echo "  - Agents:   ~/.claude/agents/"
    echo "  - Commands: ~/.claude/commands/"
    echo "  - Rules:    ~/.claude/rules/"
    echo "  - Config:   ~/.claude/CLAUDE.md"
    echo ""
    echo "Options:"
    echo "  -y, --yes    Skip confirmation prompt"
    echo "  -h, --help   Show this help"
    echo ""
    echo "For custom installation options, use: ./install-custom.sh"
    echo ""
}

# Parse arguments
SKIP_CONFIRM=false
while [[ $# -gt 0 ]]; do
    case $1 in
        -y|--yes)
            SKIP_CONFIRM=true
            shift
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Main
print_banner

echo -e "${WHITE}Standard Installation${NC}"
echo ""
echo -e "This will install:"
echo -e "  ${BLUE}•${NC} launch-copilot skill  → ${CYAN}$SKILL_PATH${NC}"
echo -e "  ${BLUE}•${NC} agents (7)            → ${CYAN}$AGENTS_DIR${NC}"
echo -e "  ${BLUE}•${NC} commands (6)          → ${CYAN}$COMMANDS_DIR${NC}"
echo -e "  ${BLUE}•${NC} rules (4)             → ${CYAN}$RULES_DIR${NC}"
echo -e "  ${BLUE}•${NC} CLAUDE.md             → ${CYAN}$CLAUDE_MD_PATH${NC}"
echo ""

if [ "$SKIP_CONFIRM" = false ]; then
    read -p "Proceed with installation? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo -e "${YELLOW}Installation cancelled${NC}"
        echo -e "For custom options, run: ${CYAN}./install-custom.sh${NC}"
        exit 0
    fi
fi

echo ""

# Create directories
mkdir -p "$SKILLS_DIR"
mkdir -p "$AGENTS_DIR"
mkdir -p "$COMMANDS_DIR"
mkdir -p "$RULES_DIR"
mkdir -p "$HOME/.claude"

# Install skill
echo -e "${CYAN}[1/5]${NC} Installing launch-copilot skill..."

if [ -d "$SKILL_PATH" ]; then
    echo -e "  ${YELLOW}→${NC} Removing existing installation"
    rm -rf "$SKILL_PATH"
fi

cp -r "$SOURCE_DIR" "$SKILL_PATH"
echo -e "  ${GREEN}✓${NC} Installed to $SKILL_PATH"

# Install agents
echo -e "${CYAN}[2/5]${NC} Installing agents..."

for agent in "$SCRIPT_DIR/agents"/*.md; do
  if [ -f "$agent" ]; then
    cp "$agent" "$AGENTS_DIR/"
    echo -e "  ${GREEN}✓${NC} $(basename "$agent")"
  fi
done

# Install commands
echo -e "${CYAN}[3/5]${NC} Installing commands..."

for cmd in "$SCRIPT_DIR/commands"/*.md; do
  if [ -f "$cmd" ]; then
    cp "$cmd" "$COMMANDS_DIR/"
    echo -e "  ${GREEN}✓${NC} $(basename "$cmd")"
  fi
done

# Install rules
echo -e "${CYAN}[4/5]${NC} Installing rules..."

for rule in "$SCRIPT_DIR/rules"/*.md; do
  if [ -f "$rule" ]; then
    cp "$rule" "$RULES_DIR/"
    echo -e "  ${GREEN}✓${NC} $(basename "$rule")"
  fi
done

# Install CLAUDE.md
echo -e "${CYAN}[5/5]${NC} Installing CLAUDE.md..."

if [ -f "$CLAUDE_MD_PATH" ]; then
    echo -e "  ${YELLOW}→${NC} Backing up existing CLAUDE.md"
    cp "$CLAUDE_MD_PATH" "$CLAUDE_MD_PATH.backup"
fi

cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD_PATH"
echo -e "  ${GREEN}✓${NC} Installed to $CLAUDE_MD_PATH"

# Done
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}   ${WHITE}Installation Complete!${NC}                                      ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${WHITE}Installed:${NC}"
echo -e "  ${GREEN}✓${NC} launch-copilot skill  ${CYAN}$SKILL_PATH${NC}"
echo -e "  ${GREEN}✓${NC} 7 agents              ${CYAN}$AGENTS_DIR${NC}"
echo -e "  ${GREEN}✓${NC} 6 commands            ${CYAN}$COMMANDS_DIR${NC}"
echo -e "  ${GREEN}✓${NC} 4 rules               ${CYAN}$RULES_DIR${NC}"
echo -e "  ${GREEN}✓${NC} CLAUDE.md             ${CYAN}$CLAUDE_MD_PATH${NC}"
echo ""
echo -e "${CYAN}Get started:${NC}"
echo -e "  ${BLUE}1.${NC} cd your-solana-project"
echo -e "  ${BLUE}2.${NC} Run ${WHITE}/init${NC} to set up project context"
echo -e "  ${BLUE}3.${NC} Run ${WHITE}/what-next${NC} for strategic priorities"
echo ""
echo -e "${CYAN}Try asking Claude:${NC}"
echo -e "  ${BLUE}•${NC} \"Help me apply for a Solana Foundation grant\""
echo -e "  ${BLUE}•${NC} \"Generate a pre-launch checklist for mainnet\""
echo -e "  ${BLUE}•${NC} \"What should I focus on this week?\""
echo ""
