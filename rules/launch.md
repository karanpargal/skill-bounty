---
globs:
  - ".launch-copilot/**"
  - "**/launch*"
  - "**/deploy*"
  - "**/mainnet*"
exclude:
  - "**/node_modules/**"
  - "**/dist/**"
---

# Launch Planning Rules

These rules apply when generating launch checklists, readiness assessments, or go-live plans for Solana projects.

## Never Recommend Launch Without Monitoring

```markdown
# BAD
"You're ready to launch! Deploy to mainnet tomorrow."

# GOOD
"Before launching, ensure monitoring is configured:
- [ ] Error alerting (PagerDuty, Discord webhook)
- [ ] Transaction success rate dashboard
- [ ] RPC health monitoring
Launch is NOT recommended until these are in place."
```

Monitoring is a **critical gate**. Never skip it.

## Always Verify Rollback Strategy

Every launch plan must include:

- [ ] Rollback procedure documented
- [ ] Rollback tested (not just written)
- [ ] Rollback owner assigned
- [ ] Previous version artifacts preserved

```markdown
# BAD
"Deploy the new version."

# GOOD
"Deploy the new version.
Rollback: Revert to program version [X] via upgrade authority.
Rollback tested: [date].
Owner: [name]."
```

## Always Recommend Testing

Launch checklists must include:

- [ ] E2E test suite passing on target network
- [ ] Load testing at 3× expected peak traffic
- [ ] Wallet compatibility (Phantom + Solflare minimum)
- [ ] Edge case testing (insufficient funds, timeout, congestion)
- [ ] Cross-browser testing (if web)

Never generate a launch plan that skips the testing section.

## Match Checklist to Stage

| Stage | Checklist Scope |
|-------|----------------|
| `idea` | "Not ready for launch planning" |
| `building` | "Deploy to devnet first" |
| `devnet` | Beta launch subset (no audit required unless on-chain) |
| `mainnet-beta` | Full launch checklist |
| `launched` | Scoped feature release checklist |

Don't overwhelm early-stage projects with enterprise requirements.

## Solana-Specific Requirements

Every mainnet launch plan must address:

### RPC
- Dedicated production RPC provider (not public endpoints)
- Failover provider configured
- Rate limits and billing alerts set

### Transactions
- Priority fee strategy documented
- Blockhash expiration handling
- Transaction retry UX
- Explorer links in UI

### Programs (if on-chain)
- Program ID verified on target network
- Upgrade authority secured (multisig recommended)
- IDL matches deployed program

## Token Launch Extra Caution

If `token.has_token` is true:

- Add legal review to checklist
- Flag higher risk in risk matrix
- Recommend delaying if stage < `launched`
- Never recommend token launch without product launch first

## Risk Matrix Required

Every launch plan includes:

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|

Minimum risks to cover: RPC outage, contract exploit, traffic spike, wallet incompatibility, network congestion.

## Launch Day Runbook

Must include time-based checklist:
- T-24 hours
- T-0 (launch)
- T+1 hour
- T+24 hours

With specific owners and verification steps.

## Review Checklist

Before delivering launch content:

- [ ] Monitoring is a critical gate
- [ ] Rollback strategy included
- [ ] Testing section complete
- [ ] Checklist matches project stage
- [ ] Solana-specific items included
- [ ] Risk matrix present
- [ ] Launch day runbook with times
- [ ] Token launch flagged if applicable

---

**Remember**: Users' funds are at stake. A launch without monitoring and rollback is negligence, not speed.
