# Example: /grant

A realistic conversation generating a Solana Foundation grant application.

---

**User:** /grant

**Claude:** I'll help you write a grant application. Let me load your project context.

```
Project: VaultFlow | Stage: devnet | Milestone: Devnet beta with 3 pilot DAOs
```

Which grant program are you applying to?

1. Solana Foundation Grants
2. Colosseum (hackathon/accelerator)
3. Superteam (grant/bounty)
4. General hackathon
5. Other

---

**User:** Solana Foundation. We're looking for around $50K to fund 3 months of development.

**Claude:** Good fit for devnet stage. A few questions not in your context:

- Any traction to highlight? (pilot DAOs, test transactions, etc.)
- Audit plans for your on-chain components?
- Open source commitment?

---

**User:** We have 1 pilot DAO testing on devnet. No audit yet but planned before mainnet. We'll open source the policy engine.

**Claude:** Generating your Solana Foundation grant application.

---

# VaultFlow — Solana Foundation Grant Application

## Executive Summary

DAO treasuries on Solana collectively hold over $500M in idle assets earning minimal yield. VaultFlow enables non-custodial yield routing with on-chain policy controls, letting treasury managers allocate across vetted strategies while maintaining granular permissions via Squads multisig.

We're requesting $50,000 to complete our devnet beta (3 pilot DAOs), conduct a smart contract audit, and launch on mainnet-beta within 3 months.

**Stage:** Devnet with working prototype and 1 pilot DAO.

## Problem & Opportunity

DAO treasury managers lack tooling to safely deploy idle assets into yield strategies. Current options require custodial trust or manual multisig transactions per allocation. VaultFlow automates policy-enforced routing across Jupiter-integrated strategies.

**Target users:** DAO treasury managers with $100K+ idle SOL/USDC.

## Solution & Architecture

VaultFlow uses a hybrid architecture:
- **On-chain:** Policy engine program (allocation rules, limits, allowed strategies)
- **Off-chain:** Strategy monitoring, yield calculation, rebalancing logic
- **Integrations:** Jupiter (routing), Helius (indexing), Squads (multisig)

## Milestones

| Milestone | Deliverable | Timeline | Success Criteria |
|-----------|-------------|----------|------------------|
| M1 | 3 pilot DAOs on devnet | Weeks 1–4 | 3 DAOs actively using platform |
| M2 | Smart contract audit | Weeks 5–8 | Audit complete, findings remediated |
| M3 | Mainnet-beta launch | Weeks 9–12 | Public launch with monitoring |

## KPIs

- **Target:** 10 DAOs onboarded within 3 months of mainnet
- **Target:** $1M+ TVL within 6 months
- **Target:** 99.9% uptime post-launch

## Budget

| Category | Amount | Justification |
|----------|--------|---------------|
| Engineering (2 FTE × 3 months) | $30,000 | Core development |
| Smart contract audit | $12,000 | Security before mainnet |
| Infrastructure (Helius, hosting) | $3,000 | Production RPC and monitoring |
| Documentation & DevRel | $2,000 | User docs, onboarding |
| Operations | $3,000 | Legal, misc |
| **Total** | **$50,000** | |

## FAQ

**Why Solana?** Sub-second finality and low fees make frequent rebalancing economical. Jupiter composability enables multi-protocol routing in single transactions.

**Open source?** Policy engine will be open sourced. Strategy connectors remain proprietary.

**Token plans?** No token planned. Revenue from management fees at scale.

---

**Sections marked `[NEEDS INPUT]`:** None — all provided.

**Next steps:**
1. Review and personalize team bios
2. Add architecture diagram
3. Update context: `funding.grants_applied: ["Solana Foundation — 2026-06-30"]`
4. Run `/what-next` for post-submission priorities
