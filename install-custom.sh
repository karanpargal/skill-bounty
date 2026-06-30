#!/bin/bash

# Launch Copilot - Custom Installer
# Full control over installation location and options

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

print_banner() {
    echo ""
    echo -e "${MAGENTA}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║${NC}   ${WHITE}Launch Copilot — Custom Installer${NC}                           ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_help() {
    echo "Launch Copilot - Custom Installer"
    echo ""
    echo "Usage: ./install-custom.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -y, --yes       Use all defaults (non-interactive)"
    echo "  -h, --help      Show this help"
    echo ""
    echo "Interactive prompts let you choose:"
    echo "  - Install location (personal, project, or custom)"
    echo "  - CLAUDE.md placement"
    echo "  - Whether to install agents, commands, and rules"
    echo ""
}

# Defaults
INSTALL_TYPE="personal"
SKILLS_DIR="$HOME/.claude/skills"
AGENTS_DIR="$HOME/.claude/agents"
COMMANDS_DIR="$HOME/.claude/commands"
RULES_DIR="$HOME/.claude/rules"
CLAUDE_MD_PATH="$HOME/.claude/CLAUDE.md"
INSTALL_AGENTS=true
INSTALL_COMMANDS=true
INSTALL_RULES=true
INSTALL_CLAUDE=true
SKIP_CONFIRM=false

# Parse arguments
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
            exit 1
            ;;
    esac
done

print_banner

# Interactive prompts (unless -y)
if [ "$SKIP_CONFIRM" = false ]; then
    echo -e "${WHITE}Installation Location${NC}"
    echo ""
    echo "  1) Personal  — ~/.claude/ (recommended)"
    echo "  2) Project   — ./.claude/ (this project only)"
    echo "  3) Custom    — specify a path"
    echo ""
    read -p "Choose [1/2/3] (default: 1): " LOC_CHOICE
    LOC_CHOICE=${LOC_CHOICE:-1}

    case $LOC_CHOICE in
        1)
            INSTALL_TYPE="personal"
            SKILLS_DIR="$HOME/.claude/skills"
            AGENTS_DIR="$HOME/.claude/agents"
            COMMANDS_DIR="$HOME/.claude/commands"
            RULES_DIR="$HOME/.claude/rules"
            CLAUDE_MD_PATH="$HOME/.claude/CLAUDE.md"
            ;;
        2)
            INSTALL_TYPE="project"
            SKILLS_DIR="$SCRIPT_DIR/.claude/skills"
            AGENTS_DIR="$SCRIPT_DIR/.claude/agents"
            COMMANDS_DIR="$SCRIPT_DIR/.claude/commands"
            RULES_DIR="$SCRIPT_DIR/.claude/rules"
            CLAUDE_MD_PATH="$SCRIPT_DIR/.claude/CLAUDE.md"
            ;;
        3)
            INSTALL_TYPE="custom"
            read -p "Base directory (e.g., /path/to/.claude): " CUSTOM_BASE
            SKILLS_DIR="$CUSTOM_BASE/skills"
            AGENTS_DIR="$CUSTOM_BASE/agents"
            COMMANDS_DIR="$CUSTOM_BASE/commands"
            RULES_DIR="$CUSTOM_BASE/rules"
            CLAUDE_MD_PATH="$CUSTOM_BASE/CLAUDE.md"
            ;;
    esac

    echo ""
    echo -e "${WHITE}Components${NC}"
    echo ""
    read -p "Install agents? [Y/n]: " INSTALL_AGENTS_CHOICE
    [[ $INSTALL_AGENTS_CHOICE =~ ^[Nn]$ ]] && INSTALL_AGENTS=false

    read -p "Install commands? [Y/n]: " INSTALL_COMMANDS_CHOICE
    [[ $INSTALL_COMMANDS_CHOICE =~ ^[Nn]$ ]] && INSTALL_COMMANDS=false

    read -p "Install rules? [Y/n]: " INSTALL_RULES_CHOICE
    [[ $INSTALL_RULES_CHOICE =~ ^[Nn]$ ]] && INSTALL_RULES=false

    echo ""
    echo -e "${WHITE}CLAUDE.md${NC}"
    echo ""
    read -p "Install CLAUDE.md to $CLAUDE_MD_PATH? [Y/n]: " INSTALL_CLAUDE_CHOICE
    INSTALL_CLAUDE=true
    [[ $INSTALL_CLAUDE_CHOICE =~ ^[Nn]$ ]] && INSTALL_CLAUDE=false
fi

SKILL_PATH="$SKILLS_DIR/launch-copilot"

# Summary
echo ""
echo -e "${WHITE}Installation Summary${NC}"
echo ""
echo -e "  Location:  ${CYAN}$INSTALL_TYPE${NC}"
echo -e "  Skill:     ${CYAN}$SKILL_PATH${NC}"
[ "$INSTALL_AGENTS" = true ] && echo -e "  Agents:    ${CYAN}$AGENTS_DIR${NC}"
[ "$INSTALL_COMMANDS" = true ] && echo -e "  Commands:  ${CYAN}$COMMANDS_DIR${NC}"
[ "$INSTALL_RULES" = true ] && echo -e "  Rules:     ${CYAN}$RULES_DIR${NC}"
[ "$INSTALL_CLAUDE" = true ] && echo -e "  CLAUDE.md: ${CYAN}$CLAUDE_MD_PATH${NC}"
echo ""

if [ "$SKIP_CONFIRM" = false ]; then
    read -p "Proceed? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo -e "${YELLOW}Installation cancelled${NC}"
        exit 0
    fi
fi

echo ""

# Create directories
mkdir -p "$SKILLS_DIR"
[ "$INSTALL_AGENTS" = true ] && mkdir -p "$AGENTS_DIR"
[ "$INSTALL_COMMANDS" = true ] && mkdir -p "$COMMANDS_DIR"
[ "$INSTALL_RULES" = true ] && mkdir -p "$RULES_DIR"
[ "$INSTALL_CLAUDE" = true ] && mkdir -p "$(dirname "$CLAUDE_MD_PATH")"

STEP=1
TOTAL=1
[ "$INSTALL_AGENTS" = true ] && TOTAL=$((TOTAL + 1))
[ "$INSTALL_COMMANDS" = true ] && TOTAL=$((TOTAL + 1))
[ "$INSTALL_RULES" = true ] && TOTAL=$((TOTAL + 1))
[ "$INSTALL_CLAUDE" = true ] && TOTAL=$((TOTAL + 1))

# Install skill
echo -e "${CYAN}[$STEP/$TOTAL]${NC} Installing launch-copilot skill..."
STEP=$((STEP + 1))

if [ -d "$SKILL_PATH" ]; then
    echo -e "  ${YELLOW}→${NC} Removing existing installation"
    rm -rf "$SKILL_PATH"
fi

cp -r "$SCRIPT_DIR/skill" "$SKILL_PATH"
echo -e "  ${GREEN}✓${NC} Installed to $SKILL_PATH"

# Install agents
if [ "$INSTALL_AGENTS" = true ]; then
    echo -e "${CYAN}[$STEP/$TOTAL]${NC} Installing agents..."
    STEP=$((STEP + 1))
    for agent in "$SCRIPT_DIR/agents"/*.md; do
        if [ -f "$agent" ]; then
            cp "$agent" "$AGENTS_DIR/"
        fi
    done
    echo -e "  ${GREEN}✓${NC} 7 agents installed"
fi

# Install commands
if [ "$INSTALL_COMMANDS" = true ]; then
    echo -e "${CYAN}[$STEP/$TOTAL]${NC} Installing commands..."
    STEP=$((STEP + 1))
    for cmd in "$SCRIPT_DIR/commands"/*.md; do
        if [ -f "$cmd" ]; then
            cp "$cmd" "$COMMANDS_DIR/"
        fi
    done
    echo -e "  ${GREEN}✓${NC} 6 commands installed"
fi

# Install rules
if [ "$INSTALL_RULES" = true ]; then
    echo -e "${CYAN}[$STEP/$TOTAL]${NC} Installing rules..."
    STEP=$((STEP + 1))
    for rule in "$SCRIPT_DIR/rules"/*.md; do
        if [ -f "$rule" ]; then
            cp "$rule" "$RULES_DIR/"
        fi
    done
    echo -e "  ${GREEN}✓${NC} 4 rules installed"
fi

# Install CLAUDE.md
if [ "$INSTALL_CLAUDE" = true ]; then
    echo -e "${CYAN}[$STEP/$TOTAL]${NC} Installing CLAUDE.md..."
    if [ -f "$CLAUDE_MD_PATH" ]; then
        echo -e "  ${YELLOW}→${NC} Backing up existing CLAUDE.md"
        cp "$CLAUDE_MD_PATH" "$CLAUDE_MD_PATH.backup"
    fi
    cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_MD_PATH"
    echo -e "  ${GREEN}✓${NC} Installed to $CLAUDE_MD_PATH"
fi

# Done
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}   ${WHITE}Installation Complete!${NC}                                      ${GREEN}║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Get started:${NC}"
echo -e "  ${BLUE}1.${NC} cd your-solana-project"
echo -e "  ${BLUE}2.${NC} Run ${WHITE}/init${NC} to set up project context"
echo -e "  ${BLUE}3.${NC} Run ${WHITE}/what-next${NC} for strategic priorities"
echo ""
