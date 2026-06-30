---
globs:
  - ".launch-copilot/**"
  - "**/strategy*"
  - "**/roadmap*"
  - "**/priorit*"
exclude:
  - "**/node_modules/**"
  - "**/dist/**"
---

# Strategy Rules

These rules apply when generating strategic recommendations, prioritization, or "what next" advice for Solana founders.

## Prioritize Highest Impact

```markdown
# BAD
"Here are 15 things you could work on: 1. Redesign logo 2. Set up analytics..."

# GOOD
"Your single highest-impact action this week:
Deploy to devnet and get 3 users to test.
Everything else is P2 until this is done."
```

- Maximum 3 P0 recommendations
- Always end with one "this week's focus" action
- Rank by Impact × Effort × Stage Fit

## Consider Current Stage

```markdown
# BAD (project at 'idea' stage)
"You should apply for a $250K Solana Foundation grant and launch on mainnet."

# GOOD (project at 'idea' stage)
"At idea stage, your P0 is validating the problem with 10 user conversations.
Grant applications and mainnet launch are premature."
```

Stage-appropriate recommendations:

| Stage | Focus | Avoid |
|-------|-------|-------|
| `idea` | Validation | Building, grants, tokens |
| `building` | Ship MVP | Marketing, launch |
| `devnet` | User feedback | Mainnet rush |
| `mainnet-beta` | Launch prep | New features |
| `launched` | Growth | Rebuilds |
| `scaling` | Team, systems | Scope creep |

## Avoid Unnecessary Complexity

```markdown
# BAD
"Implement a multi-sig treasury with 5 signers, 3 RPC providers,
custom indexer, and token governance before launching."

# GOOD
"Launch with: Helius RPC, Phantom wallet support, basic monitoring.
Add complexity after you have users."
```

- Recommend minimum viable infrastructure
- Defer nice-to-haves until post-launch
- Challenge feature creep directly

## Flag Anti-Patterns

Always check for and flag:

| Anti-Pattern | When to Flag |
|--------------|-------------|
| Token before PMF | `token.has_token: true` at early stage |
| Grant before MVP | Grant interest at `idea`/`building` |
| Launch without monitoring | Approaching mainnet without infra |
| Feature creep | 5+ goals, 0 completed |
| Isolation | No ecosystem engagement |
| Stale milestone | Same milestone for 3+ weeks |
| Perfectionism | `building` stage for 2+ months |

## Justify Every Recommendation

Each recommendation must include:
- **Why** — context-specific reasoning
- **Impact** — what it unlocks
- **Effort** — realistic time estimate
- **Stage fit** — why it's right for now

```markdown
# BAD
"Apply for a grant."

# GOOD
"Apply for Solana Foundation grant (P1).
Why: You have a working devnet demo and clear milestones.
Impact: $25-50K funding for 3 months of development.
Effort: 2-3 days to write application.
Stage fit: ✅ Perfect for devnet stage."
```

## Never Fabricate Opportunities

- Only suggest programs from ecosystem.md
- Don't invent partnership opportunities
- Don't assume funding availability
- Don't recommend specific investors

## Decision Trees for Common Questions

Apply structured logic:

**"Should I apply for a grant?"**
→ MVP exists? → Stage >= devnet? → Apply. Otherwise: build first.

**"Should I launch on mainnet?"**
→ Devnet tested? → Monitoring set up? → Audit done? → Launch. Otherwise: fix gaps.

**"Should I launch a token?"**
→ Product launched? → Users growing? → Legal review? → Proceed cautiously. Otherwise: delay.

## Review Checklist

Before delivering strategy content:

- [ ] Max 3 P0 recommendations
- [ ] Single "this week's focus" action
- [ ] All recommendations match project stage
- [ ] Anti-patterns flagged if detected
- [ ] Every recommendation justified
- [ ] No fabricated opportunities
- [ ] Complexity kept minimal

---

**Remember**: Founders don't need more options — they need clarity. One great recommendation beats ten mediocre ones.
