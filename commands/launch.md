---
description: "Generate pre-launch, launch-day, and post-launch checklists for Solana projects"
---

You are creating a launch plan for a Solana project. Follow these steps:

## Step 1: Load Context

Read `.launch-copilot/context.md` and parse YAML front-matter.

**Required fields** — if missing, ask before proceeding:
- `project.name`
- `project.description`
- `project.stage`
- `integrations` (can be empty — ask what's planned)

Display context summary:
```
Project: [name] | Stage: [stage] | Integrations: [list]
```

## Step 2: Assess Launch Readiness

Based on `project.stage`, determine launch type:

| Stage | Launch Type | Action |
|-------|-------------|--------|
| `idea` | Not ready | Recommend `/what-next` instead |
| `building` | Not ready | Recommend devnet deploy first |
| `devnet` | Public beta | Generate beta launch checklist |
| `mainnet-beta` | Public launch | Generate full launch checklist |
| `launched` | Feature release | Generate scoped release checklist |
| `scaling` | Major version | Generate enterprise checklist |

If stage is `idea` or `building`, warn:
> "Launch planning at `[stage]` stage is premature. Focus on [recommendation] first."

## Step 3: Gather Launch Details

Ask the user (if not in context):
- Target launch date (if known)
- Launch type: public beta, mainnet, feature release, token launch
- On-chain components: programs deployed? audit status?
- Current RPC provider
- Current monitoring setup
- Wallets tested

## Step 4: Generate Checklists

Using **launch-agent** persona, load [launch.md](../skill/launch.md) and apply [rules/launch.md](../rules/launch.md).

Generate three phases:

### Phase 1: Pre-Launch (2–4 weeks before)
- Security & audits
- Infrastructure & RPC
- Monitoring & observability
- Wallet compatibility
- Testing
- Documentation
- Legal & compliance

### Phase 2: Launch Day
- T-24 hours checklist
- T-0 (launch) checklist
- T+1 hour checklist
- T+24 hours checklist

### Phase 3: Post-Launch (1–4 weeks)
- Stability checks
- Growth actions
- Iteration planning

Each item: checkbox, priority (Critical/High/Medium), owner suggestion.

## Step 5: Generate Risk Matrix

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| RPC outage | Medium | Critical | Failover provider |
| Smart contract exploit | Low | Critical | Audit + monitoring |
| Traffic spike | Medium | High | Load testing |
| Wallet incompatibility | Medium | High | Multi-wallet testing |
| Network congestion | High | Medium | Priority fees |

## Step 6: Launch Readiness Gates

**Flag any unmet critical gates:**

| Gate | Status | Action Needed |
|------|--------|--------------|
| Monitoring configured | ✅/❌ | |
| Rollback documented | ✅/❌ | |
| Production RPC | ✅/❌ | |
| Wallets tested E2E | ✅/❌ | |
| E2E tests passing | ✅/❌ | |

**Never recommend launch if critical gates are unmet.**

## Step 7: Solana-Specific Notes

Include guidance on:
- Dedicated RPC (Helius, Triton, QuickNode)
- Priority fee configuration
- Transaction UX (status, retry, explorer links)
- Program deployment verification
- Upgrade authority security

## Step 8: Recommend Next Steps

After delivery:
1. Assign owners to critical items
2. Set target launch date based on unchecked critical items
3. Run `/ship` to prepare announcement content
4. Schedule `/weekly-review` for launch week
5. Update `project.stage` in context after launch

---

**Remember**: A successful launch is a boring launch. If monitoring works and nothing breaks, you did it right.
