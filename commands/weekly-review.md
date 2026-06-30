---
description: "Run a structured weekly founder retrospective with priorities and recommendations"
---

You are running a weekly founder review for a Solana project. Follow these steps:

## Step 1: Load Context

Read `.launch-copilot/context.md` and parse YAML front-matter.

**Required fields** — if missing, ask before proceeding:
- `project.name`
- `project.stage`
- `goals.list` (can be empty — ask for current goals)

Display context snapshot:
```
Project: [name]
Stage: [stage]
Milestone: [goals.next_milestone]
Team: [count] members
Goals: [count] active
```

## Step 2: Collect Week's Activity

Ask the founder:

1. **What did you complete this week?** (shipped features, milestones, external wins)
2. **What's still in progress?** (and estimated completion)
3. **Any blockers or surprises?** (technical, resource, external, decision)
4. **How are you feeling?** (optional — energy/morale check)

## Step 3: Generate Review

Using **founder-agent** persona, load [weekly-review.md](../skill/weekly-review.md).

Generate all sections:

### 1. Accomplishments
Categorize into: Shipped, Progress, Ecosystem, Personal

### 2. Unfinished Work
Table with item, status, blocker, owner

### 3. Roadmap Progress
Assess `goals.next_milestone` progress with visual bar
Score each goal in `goals.list`

### 4. Launch Readiness (if applicable)
Only for `devnet`, `mainnet-beta`, or approaching launch
Quick status against launch.md critical items

### 5. Recommended Priorities (Next Week)
3–5 prioritized actions with P0/P1/P2, justification, effort

### 6. Suggested Social Updates
1–2 `/ship` content ideas based on this week's wins

### 7. Suggested Ecosystem Actions
Partnership/grant/integration suggestions from ecosystem.md

### 8. Founder Reflection
2–3 reflection questions

## Step 4: Be Honest

- Don't inflate minor tasks into major wins
- Flag stalled work clearly
- Call out if priorities don't match stage
- Note if `goals.next_milestone` seems stale

## Step 5: Output Format

```markdown
# Weekly Review — [Project Name]
**Week of:** [date]
**Stage:** [stage]

## Accomplishments
[structured wins]

## Unfinished / Blocked
[table]

## Roadmap Progress
[assessment]

## Launch Readiness (if applicable)
[status table]

## Next Week Priorities
[prioritized actions]

## Suggested Updates
[social + ecosystem]

## Reflection
[questions]
```

## Step 6: Update Context

Suggest updating:
- `goals.list` — mark completed goals
- `goals.next_milestone` — update if achieved
- Notes — append review summary with date

## Step 7: Recommend Next Steps

After delivery:
1. Run `/what-next` for deeper strategic prioritization
2. Run `/ship` to publish the week's biggest win
3. Update context with review notes
4. Schedule next review (same day/time for habit)

---

**Remember**: Weekly reviews compound. Founders who reflect consistently make better decisions and ship faster.
