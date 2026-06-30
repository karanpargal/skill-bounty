# Example: /launch

A realistic conversation generating a mainnet launch checklist.

---

**User:** /launch

**Claude:** I'll create a launch plan for your project. Loading context.

```
Project: VaultFlow | Stage: devnet | Integrations: Jupiter, Helius, Squads
```

You're at devnet stage. Before a full mainnet launch, you'll want to complete devnet beta first. I can generate:

1. **Beta launch checklist** (devnet → public beta)
2. **Full mainnet launch checklist** (for when you're ready)

Which would you like? Also — do you have on-chain programs that need auditing?

---

**User:** Full mainnet checklist. Yes, we have an Anchor program for the policy engine. Audit is scheduled for next month.

**Claude:** Generating full mainnet launch checklist with audit gate.

---

# VaultFlow — Mainnet Launch Plan

## Readiness Assessment

| Gate | Status | Action Needed |
|------|--------|--------------|
| Monitoring configured | ❌ | Set up Helius webhooks + alerting |
| Rollback documented | ❌ | Document program upgrade rollback |
| Production RPC | ⚠️ | Using Helius devnet — need mainnet plan |
| Wallets tested E2E | ⚠️ | Test on mainnet-beta before launch |
| E2E tests passing | ✅ | Devnet suite passing |
| Audit complete | ⏳ | Scheduled next month — **block launch until done** |

**⚠️ Launch NOT recommended until audit is complete and monitoring is configured.**

---

## Phase 1: Pre-Launch (4 weeks before)

### Security & Audits
- [ ] **Critical:** Smart contract audit completed
- [ ] **Critical:** Audit findings remediated and re-verified
- [ ] **High:** Bug bounty considered (Immunefi)
- [ ] **Critical:** Squads multisig configured for upgrade authority

### Infrastructure & RPC
- [ ] **Critical:** Helius mainnet RPC configured with failover
- [ ] **High:** Rate limits and billing alerts set
- [ ] **High:** Transaction simulation enabled in production

### Monitoring
- [ ] **Critical:** Helius webhooks for policy engine transactions
- [ ] **Critical:** Error alerting to Discord/PagerDuty
- [ ] **High:** Dashboard: active DAOs, TVL, transaction success rate
- [ ] **Critical:** Rollback procedure documented and tested

### Wallet Compatibility
- [ ] **Critical:** Phantom E2E on mainnet-beta
- [ ] **Critical:** Solflare E2E on mainnet-beta
- [ ] **High:** Squads multisig flow tested

### Testing
- [ ] **Critical:** E2E suite on mainnet-beta
- [ ] **High:** Load test at 3× expected peak
- [ ] **High:** Edge cases: insufficient funds, policy rejection, timeout

### Documentation
- [ ] **Critical:** Getting started guide live
- [ ] **High:** Policy configuration docs
- [ ] **High:** FAQ

---

## Phase 2: Launch Day

### T-24 Hours
- [ ] Final mainnet-beta deployment verified
- [ ] All monitoring dashboards green
- [ ] Team on-call schedule confirmed
- [ ] Pre-written announcement posts reviewed

### T-0
- [ ] Deploy to mainnet
- [ ] Smoke test: create policy, execute allocation
- [ ] Enable monitoring alerts
- [ ] Publish announcement on X
- [ ] Notify pilot DAOs

### T+24 Hours
- [ ] Review error rates and transaction success
- [ ] Address critical bugs
- [ ] Post early traction update (if positive)

---

## Risk Matrix

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Smart contract exploit | Low | Critical | Audit + monitoring |
| RPC outage | Medium | Critical | Helius failover |
| Policy misconfiguration | Medium | High | Simulation before execution |
| Low DAO adoption | Medium | Medium | Pilot DAO testimonials |

---

**Next steps:**
1. Complete audit (blocking)
2. Set up monitoring (blocking)
3. Run `/ship` to prepare announcement content
4. Schedule `/weekly-review` for launch week
