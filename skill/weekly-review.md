# Weekly Founder Review Module

Structured weekly retrospective for Solana founders. Reviews progress, identifies blockers, and recommends priorities.

## When to Use

- End of week reflection
- Before planning next sprint
- After a major milestone or launch
- When feeling stuck or overwhelmed

## Prerequisites

Load [project-context.md](project-context.md) and verify:

- `project.name`
- `project.stage`
- `goals.list` (can be empty, but ask for current goals)

Collect from user:
- What was completed this week
- What's still in progress
- Any blockers or surprises

## Review Framework

### 1. Context Snapshot

Display current project state from context:

```
Project: [name]
Stage: [stage]
Next Milestone: [goals.next_milestone]
Team: [team count and roles]
Funding: [funding.status]
Integrations: [integrations list]
```

### 2. Accomplishments

Structure user's input into categorized wins:

**Shipped**
- Features, fixes, or deliverables completed
- External milestones (deployments, partnerships, applications)

**Progress**
- Work advanced but not yet complete
- Research, design, or planning completed

**Ecosystem**
- Community growth, grant applications, event participation
- Superteam/Colosseum engagement

**Personal**
- Team growth, skill development, founder health

Celebrate real wins. Don't inflate minor tasks.

### 3. Unfinished Work

| Item | Status | Blocker | Owner |
|------|--------|---------|-------|
| [task] | [X% done / stalled] | [why] | [who] |

Categorize blockers:

- **Technical**: bugs, architecture decisions, dependency issues
- **Resource**: funding, hiring, tooling costs
- **External**: partner delays, grant timelines, audit queue
- **Decision**: unclear priorities, scope creep, founder bandwidth

### 4. Roadmap Progress

Assess progress toward `goals.next_milestone`:

```
Milestone: [goals.next_milestone]
Progress: [████░░░░░░] ~40%
On track: [Yes / At risk / Behind]
Reason: [explanation]
```

If `goals.list` exists, score each goal:

| Goal | Progress | Status |
|------|----------|--------|
| [goal 1] | [done/partial/not started] | 🟢/🟡/🔴 |

### 5. Launch Readiness (if applicable)

If `project.stage` is `devnet`, `mainnet-beta`, or approaching launch:

Quick assessment against [launch.md](launch.md) critical items:

| Area | Status | Notes |
|------|--------|-------|
| Security/Audit | 🟢/🟡/🔴 | |
| RPC/Infra | 🟢/🟡/🔴 | |
| Monitoring | 🟢/🟡/🔴 | |
| Wallet Testing | 🟢/🟡/🔴 | |
| Documentation | 🟢/🟡/🔴 | |

Skip this section for `idea` or `building` stages.

### 6. Recommended Priorities (Next Week)

Generate 3–5 prioritized actions using impact × urgency:

| Priority | Action | Why | Effort |
|----------|--------|-----|--------|
| P0 | [action] | [justification] | [S/M/L] |
| P1 | [action] | [justification] | [S/M/L] |
| P2 | [action] | [justification] | [S/M/L] |

Priority rules:
- P0: Blocking milestone or launch-critical
- P1: High impact, should do this week
- P2: Important but can slip one week

Reference [strategy.md](strategy.md) logic for justification.

### 7. Suggested Social Updates

Based on this week's accomplishments, suggest 1–2 `/ship` content ideas:

```
💡 Suggested post: "[draft hook based on biggest win]"
💡 Suggested post: "[draft hook based on learning/blocker overcome]"
```

Only suggest posts about real accomplishments. Never fabricate content.

### 8. Suggested Partnerships & Ecosystem Actions

Based on `project.stage`, `integrations`, and `goals`:

| Action | Program/Partner | Why Now |
|--------|----------------|---------|
| Apply for [grant] | Solana Foundation | [reason from context] |
| Join [program] | Colosseum/Superteam | [reason] |
| Integrate [tool] | [Jupiter/Helius/etc.] | [reason] |

Reference [ecosystem.md](ecosystem.md). Never invent programs.

### 9. Founder Reflection Prompts

End with 2–3 reflection questions:

- What took longer than expected? Why?
- What would you do differently?
- What's the one thing that would make next week a success?
- Are you working on the right things? (link to `/what-next`)

## Output Format

```markdown
# Weekly Review — [Project Name]
**Week of:** [date]
**Stage:** [stage]

## Accomplishments
[structured wins]

## Unfinished / Blocked
[table with blockers]

## Roadmap Progress
[milestone assessment]

## Launch Readiness (if applicable)
[status table]

## Next Week Priorities
[prioritized actions]

## Suggested Updates
[social + ecosystem suggestions]

## Reflection
[questions for founder]
```

## Cadence Recommendations

| Stage | Review Frequency | Focus |
|-------|-----------------|-------|
| `idea` | Bi-weekly | Validation, scope |
| `building` | Weekly | Shipping velocity |
| `devnet` | Weekly | Beta feedback, launch prep |
| `mainnet-beta` | Weekly | Stability, growth |
| `launched` | Weekly | Metrics, iteration |
| `scaling` | Weekly | Team, systems, fundraising |

## Quality Rules

1. **Be honest** about progress — don't sugarcoat stalled work
2. **Never fabricate** accomplishments or metrics
3. **Match priorities** to `project.stage` and `goals`
4. **Keep it actionable** — every section should inform next week's work
5. **Update context** — suggest writing review notes to `.launch-copilot/context.md`

## After Generation

Suggest the founder:
1. Run `/what-next` for deeper strategic prioritization
2. Run `/ship` to publish the week's biggest win
3. Update `goals.list` and `goals.next_milestone` in context
4. Schedule next weekly review (same day/time for habit)
