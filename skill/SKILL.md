---
name: launch-copilot
description: AI operating system for Solana founders. Helps with grant writing, launch planning, build in public, weekly reviews, and strategic prioritization. Routes founder requests to specialized experts via progressive loading. For on-chain program development, optionally references solana-dev-skill.
user-invocable: true
---

# Launch Copilot

> **Standalone skill** for Solana founders. For program development (Anchor, testing, security), optionally see [solana-dev-skill](https://github.com/solana-foundation/solana-dev-skill).

## What This Skill Is For

Use this skill when the user asks for:

### Project Setup
- Initializing founder project context (`/init`)
- Establishing persistent project metadata for AI-assisted workflows

### Grant Writing
- Solana Foundation grant applications
- Colosseum hackathon/accelerator submissions
- Superteam bounty and grant proposals
- Executive summaries, architecture docs, milestones, KPIs, budgets

### Launch Planning
- Pre-launch, launch-day, and post-launch checklists
- Audit readiness, RPC/monitoring setup, wallet compatibility
- Documentation, announcements, community preparation

### Build in Public
- X posts, LinkedIn updates, changelogs
- Weekly shipping updates and release notes
- Authentic founder storytelling (Shiplog-inspired)

### Founder Operations
- Weekly founder reviews (accomplishments, blockers, priorities)
- Strategic prioritization (`/what-next`)
- Roadmap progress and launch readiness assessment

## Operating Procedure

### 1. Load Project Context First

Before any task, check for `.launch-copilot/context.md` in the project root.

- **Exists**: Parse YAML front-matter, use populated fields
- **Missing**: Run `/init` or collect minimal required fields inline
- **Incomplete**: Ask only for fields missing for the current task

See [project-context.md](project-context.md) for the full schema.

### 2. Classify the Task

| Layer | Examples | Skill File | Command |
|-------|----------|------------|---------|
| Context setup | New project, update metadata | [project-context.md](project-context.md) | `/init` |
| Grants | SF grant, Colosseum, hackathon | [grant.md](grant.md) | `/grant` |
| Launch | Checklists, readiness, go-live | [launch.md](launch.md) | `/launch` |
| Growth | X posts, changelog, updates | [ship.md](ship.md) | `/ship` |
| Review | Weekly retrospective | [weekly-review.md](weekly-review.md) | `/weekly-review` |
| Strategy | What to do next, prioritization | [strategy.md](strategy.md) | `/what-next` |
| Ecosystem | Programs, platforms, integrations | [ecosystem.md](ecosystem.md) | — |

### 3. Pick the Right Agent

| Task Type | Agent | Model |
|-----------|-------|-------|
| Orchestration, context, routing | founder-agent | opus |
| Strategic prioritization | strategy-agent | opus |
| Grant applications | grant-agent | sonnet |
| Launch readiness | launch-agent | sonnet |
| Build in public, distribution | growth-agent | sonnet |
| Product/roadmap decisions | product-agent | sonnet |
| Docs, community, ecosystem | devrel-agent | sonnet |

### 4. Apply Rules

- Grant tasks → [rules/grant.md](../rules/grant.md)
- Launch tasks → [rules/launch.md](../rules/launch.md)
- Strategy tasks → [rules/strategy.md](../rules/strategy.md)
- Build in public → [rules/voice.md](../rules/voice.md)

### 5. Progressive Loading

**Load only what you need:**

1. Always: this file + [project-context.md](project-context.md)
2. For the task: one domain module (e.g., `grant.md`)
3. If needed: [ecosystem.md](ecosystem.md) for program references
4. Never load all modules at once

### 6. Deliverables

When completing a task, provide:
- Actionable output formatted for the specific task
- Clear labeling of assumptions vs. facts
- Suggested context updates for `.launch-copilot/context.md`
- Next recommended command if applicable

---

## Progressive Disclosure (Read When Needed)

### Core
- [project-context.md](project-context.md) — Context schema and read/write conventions

### Domain Modules
- [grant.md](grant.md) — Grant writing for Solana Foundation, Colosseum, hackathons
- [launch.md](launch.md) — Pre/launch-day/post launch checklists
- [ship.md](ship.md) — Build in public content generation
- [weekly-review.md](weekly-review.md) — Weekly founder retrospective
- [strategy.md](strategy.md) — Strategic prioritization engine

### Reference
- [ecosystem.md](ecosystem.md) — Solana ecosystem programs and platforms
- [resources.md](resources.md) — Curated links and references

---

## Task Routing Guide

| User asks about... | Primary skill file | Command |
|--------------------|-------------------|---------|
| Set up project / initialize | project-context.md | `/init` |
| Write a grant application | grant.md | `/grant` |
| Solana Foundation grant | grant.md + ecosystem.md | `/grant` |
| Colosseum hackathon submission | grant.md + ecosystem.md | `/grant` |
| Superteam grant/bounty | grant.md + ecosystem.md | `/grant` |
| Launch checklist / go-live plan | launch.md | `/launch` |
| Pre-launch readiness | launch.md | `/launch` |
| X post / tweet about shipping | ship.md | `/ship` |
| Changelog / release notes | ship.md | `/ship` |
| Weekly shipping update / build in public | ship.md | `/ship` |
| Weekly founder review | weekly-review.md | `/weekly-review` |
| What should I do next | strategy.md | `/what-next` |
| Prioritize my roadmap | strategy.md | `/what-next` |
| Ecosystem programs / where to apply | ecosystem.md | — |
| On-chain program development | solana-dev-skill (external) | — |

---

## Commands

| Command | Description |
|---------|-------------|
| `/init` | Collect project info and establish persistent context |
| `/grant` | Generate grant application content |
| `/launch` | Generate launch checklists and readiness plan |
| `/ship` | Generate build-in-public content |
| `/weekly-review` | Run weekly founder retrospective |
| `/what-next` | Recommend highest-leverage next actions |

## Agents

| Agent | Purpose |
|-------|---------|
| **founder-agent** | Orchestration, context management, founder coaching |
| **strategy-agent** | Strategic prioritization, "what next" decisions |
| **grant-agent** | Grant applications for SF, Colosseum, Superteam |
| **launch-agent** | Launch planning, readiness, go-live |
| **growth-agent** | Build in public, distribution, social content |
| **product-agent** | Roadmap, product decisions, milestone planning |
| **devrel-agent** | Documentation, community, ecosystem relations |

---

## Anti-Fabrication Policy

1. **Never invent** ecosystem programs, grant names, partners, or traction metrics
2. **Only reference** programs listed in [ecosystem.md](ecosystem.md) or provided by the user
3. **Label assumptions** clearly when information is missing
4. **Ask for facts** instead of guessing user metrics, team size, or funding status
