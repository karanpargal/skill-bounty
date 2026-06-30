---
globs:
  - ".launch-copilot/**"
  - "**/grant*"
  - "**/application*"
exclude:
  - "**/node_modules/**"
  - "**/dist/**"
---

# Grant Writing Rules

These rules apply when generating grant applications, funding proposals, or hackathon submissions for Solana projects.

## Never Invent Ecosystem Programs

```markdown
# BAD
"We recommend applying to the Solana Builders Fund ($500K) by March 15."

# GOOD
"We recommend applying to the Solana Foundation Grants program.
Verify current requirements at https://solana.org/grants"
```

Only reference programs listed in [ecosystem.md](../skill/ecosystem.md) or provided by the user.

## Never Fabricate Traction

```markdown
# BAD
"Our platform has 10,000 monthly active users and $2M in transaction volume."

# GOOD
"Target: 1,000 monthly active users within 3 months of launch.
[NEEDS INPUT: current user count if available]"
```

- Use "Target:" prefix for future metrics
- Mark unknown current metrics as `[NEEDS INPUT]`
- Never invent user counts, revenue, or transaction volume

## Clearly Distinguish Facts, Assumptions, and Targets

| Type | How to Mark |
|------|-------------|
| **Fact** (from context) | State directly |
| **Assumption** | "We assume..." or "Based on our hypothesis..." |
| **Target** | "Target: ..." or "Goal: ..." |
| **Missing** | `[NEEDS INPUT: description]` |

## Never Fabricate Partnerships

```markdown
# BAD
"We have partnerships with Jupiter, Marinade, and Orca."

# GOOD
"We plan to integrate Jupiter for swap functionality.
[NEEDS INPUT: confirm any existing partnership agreements]"
```

Only list partnerships the founder has confirmed.

## Match Ask to Stage

| Stage | Reasonable Ask | Unreasonable Ask |
|-------|---------------|-----------------|
| `idea` | Don't apply yet | Any grant |
| `building` | $5K–$25K (hackathon/bounty) | $100K+ |
| `devnet` | $10K–$100K | $250K+ |
| `mainnet-beta` | $25K–$250K | Depends on traction |
| `launched` | $50K–$250K | Justified by metrics |

Warn founders if the ask doesn't match their stage.

## Budget Honesty

- Use realistic estimates, not inflated numbers
- Include line items with justification
- If budget is unknown, provide a template with ranges
- Never fabricate team salaries or costs

## Milestone Alignment

- Milestones must align with `goals.next_milestone` from context
- Don't promise mainnet launch at `building` stage without justification
- Each milestone needs measurable success criteria

## Program-Specific Accuracy

- Don't claim Colosseum accelerator acceptance before it happens
- Don't list Superteam grants as "received" unless in `funding.grants_received`
- Verify hackathon names against ecosystem.md

## Review Checklist

Before delivering grant content:

- [ ] All programs exist in ecosystem.md
- [ ] No fabricated metrics
- [ ] Facts vs. targets clearly distinguished
- [ ] `[NEEDS INPUT]` markers for missing data
- [ ] Budget realistic for stage
- [ ] Milestones achievable in stated timeline
- [ ] No invented partnerships or team credentials

---

**Remember**: Grant reviewers are experienced. They can spot fabrication instantly. Honest applications with acknowledged gaps outperform polished fiction.
