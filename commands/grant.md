---
description: "Generate grant application content for Solana Foundation, Colosseum, Superteam, or hackathons"
---

You are generating a grant application for a Solana project. Follow these steps:

## Step 1: Load Context

Read `.launch-copilot/context.md` and parse YAML front-matter.

**Required fields** — if missing, ask before proceeding:
- `project.name`
- `project.description`
- `project.stage`
- `goals.next_milestone`

Display context summary:
```
Project: [name] | Stage: [stage] | Milestone: [next_milestone]
```

## Step 2: Select Grant Program

Ask the user which program they're applying to (if not specified):

```
Which grant program?
1. Solana Foundation Grants
2. Colosseum (hackathon/accelerator)
3. Superteam (grant/bounty)
4. General hackathon
5. Other (specify)
```

Load [ecosystem.md](../skill/ecosystem.md) for program details.
Load [grant.md](../skill/grant.md) for output structure.
Apply [rules/grant.md](../rules/grant.md) for quality standards.

## Step 3: Validate Readiness

Check if project is ready for the selected program:

| Program | Minimum Stage | Has Demo? |
|---------|--------------|-----------|
| Solana Foundation | `devnet` | Recommended |
| Colosseum | `building` | Required |
| Superteam | `building` | Recommended |
| Hackathon | `building` | Required |

If stage is too early, warn the user:
> "Your project is at `[stage]` stage. [Program] typically requires [requirement]. Consider [alternative] first."

Proceed if user confirms they want to continue anyway.

## Step 4: Collect Additional Info

Ask only for information not in context:

- Specific grant amount requested (if known)
- Timeline/deadline (if known)
- Any recent accomplishments to highlight
- Technical details not captured in description
- Team bios if `team` is empty

## Step 5: Generate Application

Using **grant-agent** persona, generate all sections from [grant.md](../skill/grant.md):

1. Executive Summary
2. Problem & Opportunity
3. Solution & Architecture
4. Milestones & Timeline
5. KPIs & Metrics
6. Budget
7. Roadmap (3–6 months)
8. Team
9. FAQ
10. Appendix Checklist

**Critical rules:**
- Mark missing data as `[NEEDS INPUT: description]`
- Prefix future metrics with "Target:"
- Never fabricate traction, users, or revenue
- Only reference programs from ecosystem.md

## Step 6: Program-Specific Tailoring

Adjust emphasis based on selected program:

**Solana Foundation**: Ecosystem benefit, open source, technical depth
**Colosseum**: Speed, demo quality, team velocity
**Superteam**: Regional connection, deliverable clarity
**Hackathon**: Demo-first, concise, visual

## Step 7: Review Checklist

Before delivering, verify:
- [ ] All facts from context (not invented)
- [ ] Assumptions labeled
- [ ] `[NEEDS INPUT]` markers for gaps
- [ ] Milestones align with `goals.next_milestone`
- [ ] Budget realistic for stage
- [ ] No fabricated metrics

## Step 8: Update Context

Suggest updating context:
```yaml
funding:
  grants_applied:
    - "[Program Name] — [date applied]"
```

## Step 9: Recommend Next Steps

After delivery:
1. Review all `[NEEDS INPUT]` sections
2. Add verified metrics
3. Run `/what-next` for post-submission priorities
4. Run `/ship` to announce application (optional)

---

**Remember**: Grant reviewers value honesty and specificity. A clear application with acknowledged gaps beats a polished one with fabricated metrics.
