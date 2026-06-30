# Launch Copilot

An AI operating system for Solana founders — built as a modular Claude Code skill for the Solana AI Kit.

## Problem

Solana founders juggle grants, launches, growth, and strategy — often without a team. Existing AI tools help write code but ignore the founder lifecycle: grant applications, launch planning, build in public, weekly reviews, and strategic prioritization.

## Why This Exists

Every Solana founder should feel like they have a YC partner, PM, DevRel lead, growth lead, and launch manager available inside Claude Code. Launch Copilot provides that through:

- **Progressive loading** — only the relevant module loads per task (not one massive prompt)
- **Shared project context** — persistent `.launch-copilot/context.md` so you never repeat yourself
- **Specialist agents** — grant writer, launch planner, growth lead, strategist, and more
- **Solana-native** — grounded in real ecosystem programs (Foundation, Colosseum, Superteam)

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     launch-copilot (skill)                      │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  SKILL.md (router)                                        │  │
│  │  ├── Intent detection                                     │  │
│  │  ├── Load project context                                 │  │
│  │  └── Route to one domain module                           │  │
│  └───────────────────────────────────────────────────────────┘  │
│                              │                                  │
│              ┌───────────────┼───────────────┐                  │
│              ▼               ▼               ▼                  │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐            │
│  │ grant.md     │ │ launch.md    │ │ ship.md      │  ...       │
│  │ weekly-review│ │ strategy.md  │ │ ecosystem.md │            │
│  └──────────────┘ └──────────────┘ └──────────────┘            │
│                              │                                  │
│              ┌───────────────┼───────────────┐                  │
│              ▼               ▼               ▼                  │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐            │
│  │ Agents (7)   │ │ Commands (6) │ │ Rules (4)    │            │
│  └──────────────┘ └──────────────┘ └──────────────┘            │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  .launch-copilot/context.md (persistent project state)  │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for the full design.

## Installation

### Recommended: Custom Install

```bash
git clone https://github.com/your-org/launch-copilot
cd launch-copilot
./install-custom.sh
```

The custom installer lets you:
- Choose install location (personal `~/.claude/skills/` or project `./.claude/skills/`)
- Choose where to place `CLAUDE.md`

### Standard Install

```bash
./install.sh        # Interactive with defaults
./install.sh -y     # Non-interactive, all defaults
```

Standard defaults:
- Location: `~/.claude/skills/`
- Copies `CLAUDE.md` to `~/.claude/`

## Usage

### 1. Initialize your project

```
/init
```

Collects project info and creates `.launch-copilot/context.md`.

### 2. Get strategic direction

```
/what-next
```

Recommends highest-leverage actions based on your stage and goals.

### 3. Use domain commands as needed

```
/grant          # Write grant applications
/launch         # Generate launch checklists
/ship           # Create build-in-public content
/weekly-review  # Run weekly retrospective
```

### Example Prompts

```
"Help me apply for a Solana Foundation grant"
"Generate a pre-launch checklist for mainnet"
"Write a tweet about shipping our devnet beta"
"What should I focus on this week?"
"Run my weekly founder review"
```

## Command Reference

| Command | Description | Agent |
|---------|-------------|-------|
| `/init` | Initialize project context | founder-agent |
| `/grant` | Generate grant application | grant-agent |
| `/launch` | Generate launch checklists | launch-agent |
| `/ship` | Generate build-in-public content | growth-agent |
| `/weekly-review` | Weekly founder retrospective | founder-agent |
| `/what-next` | Strategic prioritization | strategy-agent |

## Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| founder-agent | opus | Orchestration, context, coaching |
| strategy-agent | opus | Prioritization, "what next" |
| grant-agent | sonnet | Grant applications |
| launch-agent | sonnet | Launch planning |
| growth-agent | sonnet | Build in public |
| product-agent | sonnet | Roadmap, product decisions |
| devrel-agent | sonnet | Docs, community, ecosystem |

## Project Context

All commands read from `.launch-copilot/context.md`:

```yaml
---
project:
  name: "Your Project"
  description: "What it does"
  stage: devnet  # idea | building | devnet | mainnet-beta | launched | scaling
funding:
  status: bootstrapped
goals:
  next_milestone: "Devnet beta with 3 pilot users"
updated: "2026-06-30"
---
```

See [skill/project-context.md](skill/project-context.md) for the full schema.

## Examples

Realistic conversation examples for each command:

- [Init example](docs/examples/init.md)
- [Grant example](docs/examples/grant.md)
- [Launch example](docs/examples/launch.md)
- [Ship example](docs/examples/ship.md)
- [Weekly review example](docs/examples/weekly-review.md)
- [What next example](docs/examples/what-next.md)

## Repository Structure

```
launch-copilot/
├── CLAUDE.md                    # Claude configuration
├── README.md                    # This file
├── LICENSE                      # MIT
├── install.sh                   # Standard installer
├── install-custom.sh            # Custom installer
│
├── skill/                       # Skill modules (progressive loading)
│   ├── SKILL.md                # Entry point router
│   ├── project-context.md      # Context schema
│   ├── grant.md                # Grant writing
│   ├── launch.md               # Launch planning
│   ├── ship.md                 # Build in public
│   ├── weekly-review.md        # Weekly retrospective
│   ├── strategy.md             # Strategic prioritization
│   ├── ecosystem.md            # Solana ecosystem reference
│   └── resources.md            # Curated links
│
├── agents/                      # Specialist agents (7)
├── commands/                    # Workflow commands (6)
├── rules/                       # Quality rules (4)
└── docs/                        # Architecture + examples
```

## Design Principles

1. **Progressive loading** — SKILL.md routes; only one module loads per task
2. **Context-first** — every command reads `.launch-copilot/context.md`
3. **No fabrication** — never invent programs, metrics, or partnerships
4. **Stage-aware** — recommendations match project lifecycle stage
5. **Solana-native** — grounded in real ecosystem (Foundation, Colosseum, Superteam)

## Future Roadmap

- [ ] GitHub commit integration for `/ship` auto-changelogs
- [ ] Fundraising module (pitch decks, investor outreach)
- [ ] Partnerships module (outreach templates, deal structures)
- [ ] Hiring module (job descriptions, interview guides)
- [ ] Metrics module (dashboard templates, KPI tracking)
- [ ] Roadmap module (visual roadmap generation)
- [ ] Integration with solana-dev-skill for technical grant sections

## Related

- [solana-dev-skill](https://github.com/solana-foundation/solana-dev-skill) — On-chain program development (optional)
- [solana-game-skill](https://github.com/solanabr/solana-game-skill) — Reference architecture for this skill

## Contributing

Contributions welcome. Ensure updates reflect current Solana ecosystem best practices.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License — see [LICENSE](LICENSE) for details.

---

Built for Solana founders. Inspired by the Solana AI Kit skill architecture.
