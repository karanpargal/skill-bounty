# Strategy Module — What Next

The flagship prioritization engine. Recommends the highest-leverage next actions based on project context, stage, and goals.

## When to Use

- "What should I work on next?"
- Feeling overwhelmed with options
- After completing a milestone
- Before starting a new sprint
- When deciding between grant, launch, build, or fundraise

## Prerequisites

Load [project-context.md](project-context.md) and verify:

- `project.name`
- `project.description`
- `project.stage`

Optionally enrich with:
- `goals.list` and `goals.next_milestone`
- `funding.status`
- `integrations`
- `token` status
- Notes from previous `/weekly-review`

## Prioritization Framework

### Impact × Effort × Stage Fit

Score each potential action on three axes:

| Axis | Weight | Question |
|------|--------|----------|
| **Impact** | 40% | How much does this move the project toward its next milestone? |
| **Effort** | 30% | How much time/resources does this require? |
| **Stage Fit** | 30% | Is this the right action for the current `project.stage`? |

### Stage-Based Default Priorities

| Stage | Top Priorities | Avoid |
|-------|---------------|-------|
| `idea` | Validate problem, talk to users, scope MVP | Over-engineering, token design, grant writing |
| `building` | Ship MVP, devnet deploy, core integrations | Marketing, token launch, fundraising |
| `devnet` | User testing, iterate on feedback, apply for grants | Mainnet launch without testing, token |
| `mainnet-beta` | Launch prep, monitoring, docs, first users | Premature scaling, complex features |
| `launched` | Growth, retention, grant follow-through | Rebuilding core, token unless planned |
| `scaling` | Team, fundraising, partnerships, infra | Premature optimization, scope creep |

## Recommendation Engine

Generate 5–8 ranked recommendations. Each includes:

```
## [Rank]. [Action Title]

**Priority:** P0 / P1 / P2
**Impact:** High / Medium / Low
**Effort:** Small (hours) / Medium (days) / Large (weeks)
**Stage fit:** ✅ Perfect / ⚠️ Early / ❌ Premature

**Why:** [2-3 sentences justifying this recommendation based on context]

**How to start:** [First concrete step]

**Command:** [/grant | /launch | /ship | /weekly-review | /init]
```

### Recommendation Categories

#### Build & Ship
- Complete MVP feature
- Fix critical bug
- Deploy to devnet/mainnet
- Integrate key Solana tool (Jupiter, Helius, etc.)
- Improve onboarding UX

#### Ecosystem & Funding
- Apply for Solana Foundation grant
- Submit to Colosseum hackathon
- Apply for Superteam grant/bounty
- Join accelerator program
- Engage with relevant Superteam chapter

#### Launch & Growth
- Run launch checklist (`/launch`)
- Publish build-in-public update (`/ship`)
- Write documentation
- Set up monitoring and alerts
- Community building (Discord, X)

#### Strategy & Operations
- Run weekly review (`/weekly-review`)
- Update project context (`/init`)
- Hire key role
- Delay token launch (if premature)
- Pivot or narrow scope

#### Technical Debt
- Smart contract audit
- RPC provider upgrade
- Test coverage improvement
- Security review

## Context-Aware Logic

### If `funding.status` is `bootstrapped` and stage is `building` or `devnet`:
→ Strongly recommend grant applications (Solana Foundation, Superteam)

### If `project.stage` is `devnet` and no users mentioned:
→ Recommend user testing before mainnet

### If `token.has_token` is true and stage is before `launched`:
→ Flag token launch timing — recommend delaying unless strong PMF signals

### If `integrations` is empty and stage is `building`+:
→ Recommend core integrations (RPC provider, wallet adapter)

### If `goals.next_milestone` is stale or vague:
→ Recommend clarifying milestone before other work

### If grant in `funding.grants_applied` but not in `grants_received`:
→ Recommend follow-up on application status

### If `project.stage` is `launched` with no recent `/ship` activity:
→ Recommend build-in-public cadence

## Anti-Patterns to Flag

Call out when the founder may be making a common mistake:

| Anti-Pattern | Signal | Recommendation |
|--------------|--------|----------------|
| **Token before PMF** | `token.has_token: true` at `building` stage | Delay token, focus on product |
| **Grant before MVP** | Grant application at `idea` stage | Build MVP first |
| **Launch without monitoring** | `mainnet-beta` without infra integrations | Set up Helius/monitoring first |
| **Feature creep** | Many goals, none completed | Narrow scope to one milestone |
| **Isolation** | No ecosystem engagement | Join Superteam, attend Colosseum |
| **Perfectionism** | Long time at `building` | Ship devnet version now |

## Output Format

```markdown
# What Next — [Project Name]

**Stage:** [stage] | **Milestone:** [next_milestone] | **Funding:** [status]

## Top Recommendations

### 1. [Highest leverage action]
[full recommendation block]

### 2. [Second priority]
[full recommendation block]

...

## Anti-Patterns Detected
[any warnings based on context]

## This Week's Focus
Based on the above, your single most important action is:
> **[One sentence action]**

Start with: [first concrete step]
```

## Decision Trees

### "Should I apply for a grant?"
```
Is MVP/demo available? 
  No → Build first (P0)
  Yes → Is project stage >= devnet?
    No → Deploy to devnet first
    Yes → Apply for Solana Foundation grant (/grant)
```

### "Should I launch on mainnet?"
```
Is devnet tested with real users?
  No → Get user feedback first
  Yes → Is monitoring set up?
    No → Set up monitoring (P0)
    Yes → Is audit complete (if on-chain)?
      No → Schedule audit
      Yes → Run launch checklist (/launch)
```

### "Should I launch a token?"
```
Is product launched and gaining users?
  No → Delay token (flag anti-pattern)
  Yes → Is legal review done?
    No → Get legal review first
    Yes → Proceed with caution, plan carefully
```

## Quality Rules

1. **Prioritize highest impact** actions for the current stage
2. **Consider current stage** — never recommend mainnet launch at `idea` stage
3. **Avoid unnecessary complexity** — fewer, focused recommendations over long lists
4. **Justify every recommendation** with context-specific reasoning
5. **Never fabricate** metrics or ecosystem opportunities
6. **Be direct** — founders need clarity, not options paralysis

## After Generation

Suggest the founder:
1. Pick the P0 action and start today
2. Run the recommended command (e.g., `/grant` if grant is top priority)
3. Update `goals.next_milestone` if it was flagged as stale
4. Schedule `/weekly-review` to track progress on recommendations
